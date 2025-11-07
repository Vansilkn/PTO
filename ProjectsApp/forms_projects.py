from django.forms import ModelForm, TextInput, Textarea, ValidationError, CheckboxInput
from ProjectsApp.models import ProjectModel
from django.core.exceptions import ValidationError


class ProjectForm(ModelForm):
    class Meta:
        model = ProjectModel
        # Описываем поля, которые будем заполнять в форме
        fields = ['name_sokr', 'name_poln', 'ur_adres', 'pocht_adres', 'inn', 'kpp', 'ogrn', 
                  'name_bank', 'rs', 'ks', 'bik', 'phone', 'email']    
        # исключение поля или полей через команду
        #    exclude = ['creation_date']

        # labels = {"name_sokr": "Сокращенное наименование организации", 
        #           "name_poln": "Полное наименование организации", 
        #           "ur_adres": "Юридический адрес", 
        #           "pocht_adres": "Почтовый адрес", 
        #           "inn": "ИНН", 
        #           "kpp": "КПП", 
        #           "ogrn": "ОГРН",
        #           "name_bank": "Наименование банка", 
        #           "rs": "р/с", 
        #           "ks": "к/с", 
        #           "bik": "БИК", 
        #           "phone": "Номер телефона", 
        #           "email": "e-mail", }
        #    "public": "Public(checked) / Private(unchecked)",}

        labels = {"name_sokr": "",
                  "name_poln": "", 
                  "ur_adres": "", 
                  "pocht_adres": "",
                  "inn": "", 
                  "kpp": "",
                  "ogrn": "",
                  "name_bank": "",
                  "rs": "", 
                  "ks": "", 
                  "bik": "",
                  "phone": "",
                  "email": "",
                  "public": "Public(checked) / Private(unchecked)",}
        widgets = {
            "name_sokr": TextInput(attrs={
                "class": "form-control",
                "placeholder": "Название организации (сокращенно):",
                "style": "max-width: 700px"
            }),
            "name_poln": TextInput(attrs={
                "class": "form-control",
                "placeholder": "Название организации (полное):",
                "style": "max-width: 700px"
            }),
            "ur_adres": Textarea(attrs={
                "placeholder": "Юридический адрес:",
                "rows": 3,
                "class": "input-large",
                "style": "width: 50% !important; resize: vertical !important;"
            }),
            "pocht_adres": Textarea(attrs={
                "placeholder": "Почтовый адрес:",
                "rows": 3,
                "class": "input-large",
                "style": "width: 50% !important; resize: vertical !important;"
            }),
            "inn": TextInput(attrs={
                "class": "form-control",
                "placeholder": "ИНН:",
                "style": "max-width: 300px"
            }),
            "kpp": TextInput(attrs={
                "class": "form-control",
                "placeholder": "КПП:",
                "style": "max-width: 300px"
            }),
            "ogrn": TextInput(attrs={
                "class": "form-control",
                "placeholder": "ОГРН:",
                "style": "max-width: 300px"
            }),
            "name_bank": TextInput(attrs={
                "class": "form-control",
                "placeholder": "Наименование банка:",
                "style": "max-width: 300px"
            }),
            "rs": TextInput(attrs={
                "class": "form-control",
                "placeholder": "р/с:",
                "style": "max-width: 300px"
            }),
            "ks": TextInput(attrs={
                "class": "form-control",
                "placeholder": "к/с:",
                "style": "max-width: 300px"
            }),
            "bik": TextInput(attrs={
                "class": "form-control",
                "placeholder": "БИК:",
                "style": "max-width: 300px"
            }),
            "phone": TextInput(attrs={
                "class": "form-control",
                "placeholder": "телефон:",
                "style": "max-width: 300px"
            }),
            "email": TextInput(attrs={
                "class": "form-control",
                "placeholder": "email:",
                "style": "max-width: 300px"
            }),
            "public": CheckboxInput(attrs={"value": "True"
            }),
        }
    
    # Валидация формы (проверка правельности заполнения поля - 
    # на пустое поле и количество символов)
    def clean_name_sokr(self):
        """ Метод для проверки длины поля <name_sokr> """
        name_sokr = self.cleaned_data.get("name_sokr")
        if name_sokr is not None and len(name_sokr) > 3:
            return name_sokr
        raise ValidationError("name_sokr имя слишком короткое.")
    
    def clean_name_poln(self):
        """ Метод для проверки длины поля <name_poln> """
        name_poln = self.cleaned_data.get("name_poln")
        if name_poln is not None and len(name_poln) > 3:
            return name_poln
        raise ValidationError("name_poln имя слишком короткое.")
