# PTO
<!-- Описать приложение -->


# ************ Инструкция по развертыванию проекта ***************************************
## 1. Создайте новое окружение:
```python3 -m venv django_venv```

## 2. Активируем виртуальное окружение:
```source django_venv/bin/activate```

## 3. Установка модулей виртуальное окружение:
``` pip install -r requirements.txt ```
### 3.1. Загрузка списка модулей в requirements.txt
  ``` python -m pip freeze > requirements.txt ```





## 4. Применить миграции
``` python manage.py migrate ```
### 4.1. Если нам нужно сбросить миграцию до какой-то определенной, например с миграции 0005 до миграции 0003, то выполним следующую команду:
``` python manage.py migrate AppName 0003 ```
### --- ИЛИ ---
```python manage.py migrate AppName 0003_migration_name```
### 4.2. В случае, когда нам нужно сбросить все миграции определенного приложения Джанго, мы можем использовать команду:
```python manage.py migrate AppName zero```


## 5. Создаем суперпользователя
``` python manage.py createsuperuser ```

## 6. Запуск сервера
``` python manage.py runserver ```
# ****************************************************************************************




# ****************************************************************************************
# Для создания нового приложения в текущем проекте:
``` python manage.py startapp <Наименование проекта> ```

# ****************************************************************************************


# *********** Работа с БД ****************************************************************
## Выгрузка и загрузка данных при работе с БД
# Всё приложение
``` python manage.py dumpdata MainApp --indent 4 --output MainApp/fixtures/MainApp.json ```
# Конкретная модель
``` python manage.py dumpdata MainApp.Product --indent 4 --output MainApp/fixtures/products.json ```
# Несколько моделей через пробел
``` python manage.py dumpdata MainApp.Product MainApp.Order --indent 4 --output MainApp/fixtures/products_orders.json ```
## Флаг --output надёжнее, чем перенаправление > — корректно обрабатывает кодировку UTF-8.

## Исключение лишних данных
## Часто не нужны сессии, логи, права доступа или контент-тайпы:




# Выгрузка всех моделей из EXPORT_MODELS
``` python manage.py export_json ```

# Свои модели и каталог
``` python manage.py export_json -m MainApp.Product MainApp.Order -o /tmp/json_export ```

# Справка
``` python manage.py help export_json ```




<!--

Полезные флаги dumpdata
Флаг	Что делает
--indent 4	Человекочитаемый отступ
-e sessions	Исключить модель (--exclude)
--natural-foreign	Использовать natural_key вместо ID для связей
--natural-primary	Не включать первичный ключ
MainApp.Product	Выгрузить конкретную модель, а не всё приложение
--format yaml	Не только JSON, но и XML/YAML











python manage.py dumpdata MainApp \
  --exclude contenttypes \
  --exclude auth.permission \
  --exclude sessions \
  --indent 4 \
  --output MainApp/fixtures/MainApp.json 
  
Естественные ключи (natural keys)
Если между моделями есть связи и вы хотите, чтобы фикстуры были переносимы между базами (где ID могут отличаться):

bash
python manage.py dumpdata MainApp --natural-foreign --natural-primary --indent 4 --output MainApp/fixtures/MainApp.json
Для этого в моделях нужно определить методы natural_key() и get_by_natural_key():

python
class Product(models.Model):
    name = models.CharField(max_length=200, unique=True)
    slug = models.SlugField(unique=True)

    def natural_key(self):
        return (self.slug,)

    class Meta:
        unique_together = [['slug']]


Загрузка обратно
bash
python manage.py loaddata MainApp/fixtures/MainApp.json 

Загрузка обратно
bash
python manage.py loaddata MainApp/fixtures/MainApp.json
Перед загрузкой полезно выполнить миграции:

bash
python manage.py migrate
python manage.py loaddata MainApp/fixtures/MainApp.json
Автоматизация: management command для бэкапа
Если вы хотите запускать выгрузку одним действием с заданным набором приложений и исключений:


# MainApp/management/commands/dump_fixtures.py

from django.core.management import call_command
from django.core.management.base import BaseCommand
from pathlib import Path

FIXTURES_DIR = Path('MainApp/fixtures')
APPS = ['MainApp']
EXCLUDE = ['contenttypes', 'auth.permission', 'sessions']


class Command(BaseCommand):
    help = 'Выгружает фикстуры для указанных приложений'

    def handle(self, *args, **options):
        FIXTURES_DIR.mkdir(parents=True, exist_ok=True)

        for app in APPS:
            filepath = FIXTURES_DIR / f'{app}.json'
            self.stdout.write(f'Выгрузка {app} → {filepath} ...')

            call_command(
                'dumpdata',
                app,
                exclude=EXCLUDE,
                indent=4,
                output=str(filepath),
            )
            self.stdout.write(self.style.SUCCESS(f'✓ {filepath}'))


Запуск:

bash
python manage.py dump_fixtures
Структура каталога
text
MainApp/
  fixtures/
    MainApp.json
    products.json
    orders.json
Каталог fixtures/ Django ищет автоматически при loaddata, так что загружать можно просто по имени файла:

bash
python manage.py loaddata MainApp.json
Какой объём данных выгружаете? Если таблицы большие (от десятков тысяч строк), есть нюанс — dumpdata грузит всё в память. В этом случае можно выгружать по моделям отдельно.

-->






### Выгрузить данные из БД
``` python manage.py dumpdata MainApp --indent 4 --output MainApp/fixtures/mainapp.json ```
``` python manage.py dumpdata AuthApp --indent 4 --output AuthApp/fixtures/auth.json ```
``` python manage.py dumpdata CounterpartyApp --indent 4 --output CounterpartyApp/fixtures/counterparty.json ```
``` python manage.py dumpdata JurnalsApp --indent 4 --output JurnalsApp/fixtures/jurnals.json ```
``` python manage.py dumpdata ProjectsApp --indent 4 --output ProjectsApp/fixtures/projects.json ```

### Загрузить данные в БД
## Перед загрузкой полезно выполнить миграции:
``` python manage.py migrate ``

``` python manage.py loaddata MainApp/fixtures/MainApp.json ``
``` python manage.py loaddata AuthApp/fixtures/auth.json ```
``` python manage.py loaddata CounterpartyApp/fixtures/counterparty.json ```
``` python manage.py loaddata JurnalsApp/fixtures/jurnals.json ```
``` python manage.py loaddata ProjectsApp/fixtures/projects.json ```

## ***************************************************************************************


# ********** Работа с интепритаторами ****************************************************
## Интепритатор `sqlite3`
### 1. Установка интепритатора `sqlite3`
``` sudo apt install sqlite3 ```

## Установка пакета `django-extensions` для подключения улучшеного интепритатор `ipython`
``` python -m pip install django-extensions ```

## Улучшенный интепритатор `ipython`
### 1. Установка интепритатора `ipython`
``` python -m pip install django-extensions ipython```
### 2. Запуск `ipython` в контексте `django` приложений
``` python manage.py shell_plus --ipython ```
### Добавление `--print-sql` для отображение sql-кода 
``` python manage.py shell_plus --ipython --print-sql```

# ****************************************************************************************



### Работа с GIT
# Вся работа производится в консоли. 
# Выполняя команды вы всегда должны находиться в папке с проектом.

# 1. Инициализация(создание) репозитория
```git init```

# 2. Создаем .gitignore - прописывая в него файлы и папки, которые не должны попасть в репозиторий.

# 3. Минимальные настройки git’а: 
```git config --global user.name "username"```
```git config --global user.email "you@mail.ru"```

# 4. Добавляем все файлы проекта(кроме тех, что в .gitignore). 
# Подготавливаем файлы к коммиту(сохранению)
```git add .```
# 5. Делаем коммит(сохраняем текущее состояние файлов в репозитории)
```git commit -m “комментарий к коммиту”```
# Каждый раз, когда вам нужно сохранить изменения в локальном репозитории выполните:
```$ git add .```
```git commit -m “комментарий к коммиту"```

# Клонирование репозитория:
# Вы клонировали репозиторий, выполнив команду:
```git remote clone <path-to-repo>```
# , где <path-to-repo> путь до клонируемого репозитория
# Теперь вам нужно создать копию этого репозитория на своем github’е
# 1. Удаляем ссылку на репозиторий с которого клонировали
```git remote rm origin```
# 2. Заходим на github.com и создаем новый(свой) репозиторий
# 4. Добавляем ssh-ключ, см инструкцию “Добавление SSH-ключа на github”
# 5. Отправляем проект на свой github:
```git push -u origin master```
# 6. Обновляем страницу репозитория в браузере, видим код проекта



## ****************************************************************************************


## Установка и настройка Django
# 1. Установить Django.
``` pip install django ```

## 2. Настройка VsCode
# Нажать "Ctrl" + "," попадаем в кладку настройки, в правом верхнем углу нажимаем на иконку файла "Setting.json"
# Добавляем строки:
<!-- 
{
    "files.autoSave": "afterDelay",
    "emmet.triggerExpansionOnTab": true, 
    "files.associations": {
        "*.html": "django-html",
        "*.njk": "html"
    },
    "emmet.useInlineCompletions": true,
    "emmet.includeLanguages": {
        "django-html": "html", 
        "javascript": "javascriptreact",
        "typescript": "typescriptreact",
        "vue-html": "html",
        "vue": "html",
        "razor": "html",
        "plaintext": "pug",
    },
    "emmet.showSuggestionsAsSnippets": true,
    "emmet.showExpandedAbbreviation": "always",
    "workbench.iconTheme": "material-icon-theme"
} 
-->

## Обновляется только конфигурация для вашего текущего проекта
# Если вы хотите обновить конфигурацию Emmet только для текущего 
# рабочего пространства (проекта), а не глобально, используйте 
# локальный файл .vscode/settings.json .

# 1. В корневом каталоге вашего проекта создайте папку .vscode.
# 2. Создайте файл settings.json в папке .vscode .
# 3. Добавьте следующий код в свой файл settings.json
<!-- 
{
  "emmet.triggerExpansionOnTab": true,
  "files.associations": {
    "*html": "html",
    "*njk": "html"
  },
  "emmet.useInlineCompletions": true,
  "emmet.includeLanguages": {
    "javascript": "javascriptreact",
    "typescript": "typescriptreact",
    "vue-html": "html",
    "vue": "html",
    "razor": "html",
    "plaintext": "pug",
    "django-html": "html"
  },
  "emmet.showSuggestionsAsSnippets": true,
  "emmet.showExpandedAbbreviation": "always"
}
-->

## Убедитесь, что расширение Emmet установлено и включено
# Ещё одна вещь, которую вам следует проверить, — это установка 
# и включение расширения Emmet.
# Нажмите Расширения на левой боковой панели.
# Вы также можете открыть меню Расширения, нажав:
# Ctrl + Shift + X в Windows или Linux.
# Command + Shift + X в macOS.
# Введите 
```@builtin emmet```


# установка FTP
```sudo apt install vsftpd```






## Плагины для VS Code
# 1. Auto Complete Tag
# 2. HTMLHint
# 3. indent-rainbow
# 4. Path Intellisense
# 5. Material Icon Theme
# 6. Live Server



#### Ход выполнения работ



### ЖУРНАЛЫ
## Вывести список журналов на страницу с сылками на переключения на страницу журнала
## Общий журнал работ






