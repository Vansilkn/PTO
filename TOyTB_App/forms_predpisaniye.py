from django.forms import ModelForm, TextInput, Textarea, ValidationError, CheckboxInput
from TOyTB_App.models import PedpisaniyeModel
from django.core.exceptions import ValidationError


class PredpisaniyeForm(ModelForm):
    class Meta:
        model = PedpisaniyeModel
        # Описываем поля, которые будем заполнять в форме
        fields = ['number_predpisaniye', 'date_create_predpisaniye', 'name_counterparty',
                  'name_object', 'date_execution_predpisaniye', 'execution_status', 
                  ]    
        # исключение поля или полей через команду
        #    exclude = ['creation_date']

        labels = {"number_predpisaniye": "Номер предписания",
                  "date_create_predpisaniye": "Дата составления предписания", 
                  "name_counterparty": "Юридическое лицо", 
                  "name_object": "Объект",
                  "date_execution_predpisaniye": "Дата исполнения предписания", 
                  "execution_status": "Статус", 
                  "public": "Public(checked) / Private(unchecked)",}

        widgets = {
            "number_predpisaniye": TextInput(attrs={
                "class": "form-control",
                "placeholder": "___/ОТ/___",
                "style": "max-width: 300px"
            }),
            "date_create_predpisaniye": TextInput(attrs={
                "class": "form-control",
                "placeholder": "Дата составления предписания",
                "style": "max-width: 300px"
            }),
            "name_counterparty": TextInput(attrs={
                "class": "form-control",
                "placeholder": "Наименование юридического лица",
                "style": "max-width: 700px"
            }),
            "name_object": TextInput(attrs={
                "class": "form-control",
                "placeholder": "Объект:",
                "style": "max-width: 700px"
            }),
            "date_execution_predpisaniye": TextInput(attrs={
                "class": "form-control",
                "placeholder": "Дата исполнения предписания",
                "style": "max-width: 300px"
            }),
            "execution_status": TextInput(attrs={
                "class": "form-control",
                "placeholder": "Статус",
                "style": "max-width: 300px"
            }),
            "public": CheckboxInput(attrs={"value": "True"
            }),
        }
    
    # Валидация формы (проверка правельности заполнения поля - 
    # на пустое поле и количество символов)
    # def clean_name_project(self):
    #     """ Метод для проверки длины поля """
    #     name_project = self.cleaned_data.get("name_project")
    #     if name_project is not None and len(name_project) > 3:
    #         return name_project
    #     raise ValidationError("Имя слишком короткое.")


