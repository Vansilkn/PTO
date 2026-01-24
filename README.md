### PTO

## Инструкция по развертыванию проекта
# 1. Создайте новое окружение:
```python3 -m venv django_venv```

# 2. Активируем виртуальное окружение:
```source django_venv/bin/activate```

# 3. Установка модулей виртуальное окружение:
``` pip install -r requirements.txt ```

# 4. Загрузка списка модулей в requirements.txt
``` python -m pip freeze > requirements.txt ```

# 5. Применить миграции
``` python manage.py migrate ```

# 6. Запуск сервера
``` python manage.py runserver ```


## Выгрузка и загрузка данных при работе с БД
# Выгрузить данные из БД
```python manage.py dumpdata MainApp --indent 4 > MainApp/fixtures/MainApp.json```
```python manage.py dumpdata AuthApp --indent 4 > AuthApp/fixtures/auth.json```
```python manage.py dumpdata CounterpartyApp --indent 4 > CounterpartyApp/fixtures/counterparty.json```
```python manage.py dumpdata JurnalsApp --indent 4 > JurnalsApp/fixtures/jurnals.json```
```python manage.py dumpdata ProjectsApp --indent 4 > ProjectsApp/fixtures/projects.json```

# Загрузить данные в БД
```python manage.py loaddata MainApp/fixtures/MainApp.json```
```python manage.py loaddata AuthApp/fixtures/auth.json```
```python manage.py loaddata CounterpartyApp/fixtures/counterparty.json```
```python manage.py loaddata JurnalsApp/fixtures/jurnals.json```
```python manage.py loaddata ProjectsApp/fixtures/projects.json```

## ****************************************************************************************

# Для создания нового приложения в текущем проекте:
``` python manage.py startapp <Наименование проекта> ```


## ****************************************************************************************


## Запуск `ipython` в контексте `django` приложений
``` python manage.py shell_plus --ipython ```





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

