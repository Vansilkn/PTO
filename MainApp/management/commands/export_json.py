import json
from pathlib import Path
from django.core.management.base import BaseCommand, CommandError
from django.db.models import Model
from django.apps import apps


from ProjectsApp.models import ProjectModel
from CounterpartyApp.models import CounterpartyModel
from JurnalsApp.models import JurnalsModel




# Укажите модели для выгрузки: 'app_label.ModelName'
EXPORT_MODELS = [
    'ProjectsApp.ProjectModel',
    'CounterpartyApp.CounterpartyModel',
    'JurnalsApp.JurnalsModel',
]

# Каталог для JSON-файлов (по умолчанию — /exports внутри BASE_DIR)
OUTPUT_DIR = Path('exports')


class Command(BaseCommand):
    help = 'Выгружает данные указанных моделей в JSON-файлы'

    def add_arguments(self, parser):
        parser.add_argument(
            '--output', '-o',
            type=str,
            default=str(OUTPUT_DIR),
            help='Каталог для сохранения файлов (по умолчанию: exports/)',
        )
        parser.add_argument(
            '--models', '-m',
            nargs='+',
            default=EXPORT_MODELS,
            help='Список моделей в формате app.Model (по умолчанию: из настроек)',
        )

    def handle(self, *args, **options):
        output_dir = Path(options['output'])
        output_dir.mkdir(parents=True, exist_ok=True)

        for model_label in options['models']:
            try:
                model = apps.get_model(model_label)
            except LookupError:
                raise CommandError(f'Модель "{model_label}" не найдена')

            filename = f'{model._meta.model_name}.json'
            filepath = output_dir / filename

            # Выбираем поля автоматически: только сериализуемые
            fields = self._get_serializable_fields(model)
            queryset = model.objects.values(*fields)

            records = list(queryset)
            with open(filepath, 'w', encoding='utf-8') as f:
                json.dump(records, f, ensure_ascii=False, indent=2, default=str)

            self.stdout.write(self.style.SUCCESS(
                f'✓ {model_label}: {len(records)} записей → {filepath}'
            ))

    @staticmethod
    def _get_serializable_fields(model):
        """Возвращает имена полей, которые сериализуются в JSON без проблем."""
        serializable_types = (
            'AutoField', 'BigAutoField', 'CharField', 'TextField',
            'IntegerField', 'BigIntegerField', 'SmallIntegerField',
            'FloatField', 'DecimalField', 'BooleanField',
            'DateField', 'DateTimeField', 'TimeField',
            'EmailField', 'URLField', 'UUIDField', 'SlugField',
            'PositiveIntegerField', 'PositiveSmallIntegerField',
            'JSONField',
        )
        fields = []
        for field in model._meta.get_fields():
            # пропускаем обратные связи (reverse relations)
            if not getattr(field, 'concrete', False):
                continue
            # пропускаем ForeignKey — берём *_id
            if field.is_relation and field.many_to_one:
                fields.append(f'{field.name}_id')
            elif field.get_internal_type() in serializable_types:
                fields.append(field.name)
        return fields
