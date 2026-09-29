from django.forms import ModelForm, TextInput, Textarea, ValidationError, CheckboxInput
from JurnalsApp.models import JurnalsModel
from JurnalsApp.models import Category
from django.core.exceptions import ValidationError



from django import forms
from .models import Article


class ArticleForm(forms.ModelForm):
    class Meta:
        model = Article
        fields = ["title", "categories", "public1"]
        widgets = {
            "title": forms.TextInput(attrs={
                "class": "form-control",
                "placeholder": "Введите заголовок",
            }),
            "categories": forms.CheckboxSelectMultiple(attrs={
                "class": "form-check-input",
            }),
            "public1": forms.CheckboxInput(attrs={
                "class": "form-check-input",
            }),
        }







class JurnalsForm(ModelForm):
    class Meta:
        model = JurnalsModel
        # Описываем поля, которые будем заполнять в форме
        fields = ['name_jurnals', ]    
        # исключение поля или полей через команду
        #    exclude = ['creation_date']

        labels = {"name_jurnals": "", 
                    "public": "Public(checked) / Private(unchecked)", }
        widgets = {
            "name_jurnals": TextInput(attrs={
                "class": "form-control",
                "placeholder": "Наименование журнала:",
                "style": "max-width: 700px"
            }),
            "public1": CheckboxInput(attrs={"value": "True"
            }),
        }
    
#     # Валидация формы (проверка правельности заполнения поля - 
#     # на пустое поле и количество символов)
#     # def clean_name_project(self):
#     #     """ Метод для проверки длины поля """
#     #     name_project = self.cleaned_data.get("name_project")
#     #     if name_project is not None and len(name_project) > 3:
#     #         return name_project
#     #     raise ValidationError("Имя слишком короткое.")
