# PTO

## Инструкция по развертыванию проекта

# 1. Создайте новое окружение:
```python3 -m venv django_venv```

# 2. Активируем виртуальное окружение:
```source django_venv/bin/activate```

# 3. 
``` pip install -r requirements.txt ```

``` python -m pip freeze > requirements.txt ```


# 4. Применить миграции
``` python manage.py migrate ```

# 5. Запуск сервера
``` python manage.py runserver ```


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








## Выгрузка и загрузка данных при работе с БД
### Выгрузить данные из БД
```
python manage.py dumpdata MainApp --indent 4 > MainApp/fixtures/save_all.json
```
### Загрузить данные в БД
```
python manage.py loaddata MainApp/fixtures/save_all.json
```


# Установка и настройка Django
1. Установить Django.
2. Настройка VsCode
Нажать "Ctrl" + "," попадаем в кладку настройки, в правом верхнем углу нажимаем на иконку файла "Setting.json"
Добавляем строки:
    "files.autoSave": "afterDelay",

    "emmet.includeLanguages": {
        "djando-html": "html"
    },
    "files.associations": {
        "*.html": "django-html"
    }