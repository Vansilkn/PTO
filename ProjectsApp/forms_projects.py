from django.forms import ModelForm, TextInput, Textarea, ValidationError, CheckboxInput
from ProjectsApp.models import ProjectModel
from django.core.exceptions import ValidationError


class ProjectForm(ModelForm):
    class Meta:
        model = ProjectModel
        # Описываем поля, которые будем заполнять в форме
        fields = ['name_project', 'projects_adres', 'zakazchik_name',
                  'zastroschik_name', 'genpodryadchyk_name', ]    
        # исключение поля или полей через команду
        #    exclude = ['creation_date']

        labels = {"name_project": "",
                  "projects_adres": "", 
                  "zakazchik_name": "", 
                  "zastroschik_name": "",
                  "genpodryadchyk_name": "", 
                  "public": "Public(checked) / Private(unchecked)",}
        widgets = {
            "name_project": TextInput(attrs={
                "class": "form-control",
                "placeholder": "Наименование проекта:",
                "style": "max-width: 700px"
            }),
            "projects_adres": Textarea(attrs={
                "placeholder": "Адрес объекта: ",
                "rows": 3,
                "class": "input-large",
                "style": "width: 50% !important; resize: vertical !important;"
            }),
            "zakazchik_name": TextInput(attrs={
                "class": "form-control",
                "placeholder": "Заказчик:",
                "style": "max-width: 300px"
            }),
            "zastroschik_name": TextInput(attrs={
                "class": "form-control",
                "placeholder": "Застройщик:",
                "style": "max-width: 300px"
            }),
            "genpodryadchyk_name": TextInput(attrs={
                "class": "form-control",
                "placeholder": "Генподрядчик:",
                "style": "max-width: 300px"
            }),
            "public": CheckboxInput(attrs={"value": "True"
            }),
        }
    
    # Валидация формы (проверка правельности заполнения поля - 
    # на пустое поле и количество символов)
    def clean_name_project(self):
        """ Метод для проверки длины поля """
        name_project = self.cleaned_data.get("name_project")
        if name_project is not None and len(name_project) > 3:
            return name_project
        raise ValidationError("Имя слишком короткое.")
