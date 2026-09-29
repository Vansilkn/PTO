# MainApp/management/commands/dump_fixtures.py
from django.apps import apps
from django.conf import settings
from django.core.management import call_command
from django.core.management.base import BaseCommand
from pathlib import Path


# Системные приложения Django — их выгружать не нужно
DJANGO_BUILTIN_APPS = {
    'contenttypes', 'auth', 'sessions', 'admin',
    'messages', 'staticfiles', 'django.contrib',
}

# Что исключить из выгрузки
EXCLUDE = [
    'contenttypes',
    'auth.permission',
    'sessions',
]


# Каталог для хранения всех фикстур
FIXTURES_DIR = Path('exports/fixtures_2')


### Вариант 2: Динамический список приложений (без хардкода)
# Если не хочется вручную вести список — берём все приложения из INSTALLED_APPS автоматически:

# Системные приложения Django — их выгружать не нужно
DJANGO_BUILTIN_APPS = {
    'contenttypes', 'auth', 'sessions', 'admin',
    'messages', 'staticfiles', 'django.contrib',
}

def get_project_apps():
    """Возвращает приложения проекта, исключая встроенные Django."""
    result = []
    for app_config in apps.get_app_configs():
        # Проверяем, что приложение не из django.contrib и не системное
        if app_config.name.split('.')[0] == 'django':
            continue
        if app_config.label in DJANGO_BUILTIN_APPS:
            continue
        result.append(app_config.label)
    return result


class Command(BaseCommand):
    help = 'Выгружает фикстуры для всех приложений проекта автоматически'

    def handle(self, *args, **options):
        FIXTURES_DIR.mkdir(parents=True, exist_ok=True)

        app_list = get_project_apps()
        self.stdout.write(f'Найдено приложений: {len(app_list)}')
        self.stdout.write(', '.join(app_list) + '\n')

        # Отдельный файл для каждого приложения
        for app in app_list:
            filepath = FIXTURES_DIR / f'{app}.json'
            self.stdout.write(f'  {app} → {filepath}')

            call_command(
                'dumpdata',
                app,
                exclude=EXCLUDE,
                indent=4,
                output=str(filepath),
            )
            self.stdout.write(self.style.SUCCESS(f'  ✓ {app}'))

        # Общий файл
        combined_path = FIXTURES_DIR / 'all_fixtures.json'
        call_command(
            'dumpdata',
            *app_list,
            exclude=EXCLUDE,
            indent=4,
            output=str(combined_path),
        )
        self.stdout.write(self.style.SUCCESS(f'\n✓ all_fixtures.json'))
        self.stdout.write(self.style.SUCCESS('\nВыгрузка завершена!'))


# Запуск:
# Полная выгрузка: по приложениям + общий файл
''' python manage.py dump_fixtures_2 '''
# Только общий файл
''' python manage.py dump_fixtures_2 --combined-only '''


# Структура после выгрузки
# project/
#   fixtures/
#     MainApp.json
#     CatalogApp.json
#     OrdersApp.json
#     all_fixtures.json


### Загрузка обратно
# Всё сразу
''' python manage.py loaddata all_fixtures.json '''

# По отдельности (важен порядок: сначала без зависимостей)
''' python manage.py loaddata MainApp.json CatalogApp.json OrdersApp.json '''

## Порядок загрузки при связях
# Если OrdersApp ссылается на MainApp через ForeignKey — загружайте MainApp первым:
''' python manage.py loaddata MainApp.json CatalogApp.json OrdersApp.json '''

# Или используйте --natural-foreign при выгрузке, чтобы связи строились по естественным ключам, а не по ID:
''' python manage.py dumpdata MainApp CatalogApp OrdersApp \
  --natural-foreign \
  --indent 4 \
  --output all_fixtures.json '''

