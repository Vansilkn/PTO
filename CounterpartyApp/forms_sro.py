from django.forms import ModelForm, TextInput, Textarea, ValidationError, CheckboxInput
from CounterpartyApp.models import SROModel


class SROForm(ModelForm):
    pass
    class Meta:
        model = SROModel
        # Описываем поля, которые будем заполнять в форме
        fields = ['name_poln_sro', 'name_sokr_sro', 'type_of_counterparty_sro', 'ur_adres',
                  'reg_nymber_in_grsro', 'reg_nymber_in_rhsro', 
                #   'date_reg_in_rhsro', 
                  ]

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

        labels = {"name_poln_sro": "",
                  "name_sokr_sro": "", 
                  "type_of_counterparty_sro": "", 
                  "ur_adres": "",
                  "reg_nymber_in_grsro": "", 
                  "reg_nymber_in_rhsro": "",
                #   "date_reg_in_rhsro": "",

                  "public": "Public(checked) / Private(unchecked)",
                  }
        widgets = {
            "name_poln_sro": TextInput(attrs={
                "class": "form-control",
                "placeholder": "Наименование саморегулируемой организации (полное):",
                "style": "max-width: 700px"
            }),
            "name_sokr_sro": TextInput(attrs={
                "class": "form-control",
                "placeholder": "Наименование саморегулируемой организации (сокращенно):",
                "style": "max-width: 700px"
            }),
            "type_of_counterparty_sro": TextInput(attrs={
                "class": "form-control",
                "placeholder": "Вид саморегулируемой организации:",
                "style": "max-width: 700px"
            }),
            "ur_adres": Textarea(attrs={
                "placeholder": "Адрес места нахождения саморегулируемой организации:",
                "rows": 3,
                "class": "input-large",
                "style": "width: 50% !important; resize: vertical !important;"
            }),
            "reg_nymber_in_grsro": TextInput(attrs={
                "class": "form-control",
                "placeholder": "Регистрационный номер записи в государственном реестре саморегулируемых организаций:",
                "style": "max-width: 300px"
            }),
            "reg_nymber_in_rhsro": TextInput(attrs={
                "class": "form-control",
                "placeholder": "Регистрационный номер члена в реестре членов саморегулируемой организации:",
                "style": "max-width: 300px"
            }),
            # "date_reg_in_rhsro": TextInput(attrs={
            #     "class": "form-control",
            #     "placeholder": "Дата регистрации юридического лица или индивидуального предпринимателя в реестре:",
            #     "style": "max-width: 300px"
            # }),
            "public": CheckboxInput(attrs={"value": "True"
            }),
        }
    
    # Валидация формы (проверка правельности заполнения поля - 
    # на пустое поле и количество символов)
    # def clean_name_sokr_sro(self):
    #     """ Метод для проверки длины поля <name_sokr_sro> """
    #     name_sokr_sro = self.cleaned_data.get("name_sokr_sro")
    #     if name_sokr_sro is not None and len(name_sokr_sro) > 3:
    #         return name_sokr_sro
    #     raise ValidationError("Наименование саморегулируемой организации слишком короткое.")
    
    # def clean_name_poln(self):
    #     """ Метод для проверки длины поля <name_poln> """
    #     name_poln = self.cleaned_data.get("name_poln")
    #     if name_poln is not None and len(name_poln) > 3:
    #         return name_poln
    #     raise ValidationError("name_poln имя слишком короткое.")

