# MainApp/management/commands/dump_fixtures.py
from django.core.management import call_command
from django.core.management.base import BaseCommand
from pathlib import Path


### 1. Автоматическая команда для всех приложений

# Перечислите все приложения проекта
APPS = [
    'MainApp',
    'AuthApp',
    'CounterpartyApp',
    'JurnalsApp',
    'ProjectsApp',
    'TOyTB_App',
]

# Что исключить из выгрузки
EXCLUDE = [
    'contenttypes',
    'auth.permission',
    'sessions',
]

# Каталог для хранения всех фикстур
FIXTURES_DIR = Path('exports/fixtures_1')


class Command(BaseCommand):
    """ Создаёт отдельный JSON-файл для каждого приложения + один общий файл """

    help = 'Выгружает фикстуры для всех приложений проекта'

    def add_arguments(self, parser):
        parser.add_argument(
            '--combined-only',
            action='store_true',
            help='Только один общий файл, без отдельных по приложениям',
        )

    def handle(self, *args, **options):
        FIXTURES_DIR.mkdir(parents=True, exist_ok=True)

        # 1. Отдельный файл для каждого приложения
        if not options['combined_only']:
            self.stdout.write('\n=== Выгрузка по приложениям ===\n')
            for app in APPS:
                filepath = FIXTURES_DIR / f'{app}.json'
                self.stdout.write(f'  {app} → {filepath}')

                call_command(
                    'dumpdata',
                    app,
                    exclude=EXCLUDE,
                    indent=4,
                    output=str(filepath),
                )
                self.stdout.write(self.style.SUCCESS(f'  ✓ {app} готов'))

        # 2. Общий файл со всеми приложениями
        self.stdout.write('\n=== Общая выгрузка ===\n')
        combined_path = FIXTURES_DIR / 'all_fixtures.json'
        self.stdout.write(f'  Все приложения → {combined_path}')

        call_command(
            'dumpdata',
            *APPS,
            exclude=EXCLUDE,
            indent=4,
            output=str(combined_path),
        )
        self.stdout.write(self.style.SUCCESS(f'  ✓ all_fixtures.json готов'))

        self.stdout.write(self.style.SUCCESS('\nВыгрузка завершена!\n'))


        # 3. Сводка
        self.stdout.write('\nСводка:')
        if not options['combined_only']:
            for app in APPS:
                fp = FIXTURES_DIR / f'{app}.json'
                size = fp.stat().st_size / 1024
                self.stdout.write(f'  {fp}  ({size:.1f} КБ)')
        cp = FIXTURES_DIR / 'all_fixtures.json'
        size = cp.stat().st_size / 1024
        self.stdout.write(f'  {cp}  ({size:.1f} КБ)')


# Запуск:
# Полная выгрузка: по приложениям + общий файл
''' python manage.py dump_fixtures_1 '''
# Только общий файл
''' python manage.py dump_fixtures_1 --combined-only '''


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

