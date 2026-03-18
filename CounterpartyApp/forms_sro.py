from django.forms import ModelForm, TextInput, Textarea, CheckboxInput, DateInput, EmailInput, NumberInput, Select, FileInput, ValidationError
from CounterpartyApp.models import SROModel


class SROForm(ModelForm):
    pass
    class Meta:
        model = SROModel
        # Описываем поля, которые будем заполнять в форме
        fields = ['nymber_vipiski_sro', 'date_vipiski_sro',
                  #--------------------------
                  'name_poln_sro', 'name_sokr_sro', 'ur_adres',
                  #--------------------------
                  'name_poln_counter', 'reg_nymber_in_grsro', 'reg_nymber_in_rhsro', 'date_reg_in_rhsro',
                  #--------------------------
                'stroitelstvo', 'reconsrukcya', 'kap_remont', 'demontaj_kap_stroitelstva',
                'inj_iziscanya', 'psd',  
                # # 'date_1', 'date_2', 'date_3',
                # '', '', '', '', '', '', '', '', '', '', '', '', '', 
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

        labels = {"nymber_vipiski_sro":"Регистрационный номер выписки:",
                  "date_vipiski_sro":"Дата формирования выписки:",
                  #--------------------------
                  "name_poln_sro": "",
                  "name_sokr_sro": "", 
                  "ur_adres": "",
                  #--------------------------
                  "name_poln_counter":"",
                  "reg_nymber_in_grsro": "", 
                  "reg_nymber_in_rhsro": "",
                  "date_reg_in_rhsro": "",
                  #--------------------------
                  "stroitelstvo": "",
                  "reconsrukcya": "",
                  "kap_remont": "",
                  "demontaj_kap_stroitelstva": "",
                  "inj_iziscanya": "",
                  "psd": "",
                  "date_1": "",
                  "date_2": "",
                  "date_3": "",
                #   "":"",
                  


                  "public": "Public(checked) / Private(unchecked)",
                  }


        widgets = {
            "nymber_vipiski_sro": TextInput(attrs={
                "class": "form-control",
                "placeholder": "000000000000-00000000-0000",
                "style": "max-width: 300px"
            }),
            "date_vipiski_sro": TextInput(attrs={
                "class": "form-control",
                "placeholder": "01.01.2026",
                "style": "max-width: 200px"
            }),
            #-----------------------------------------------------
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
            "ur_adres": Textarea(attrs={
                "placeholder": "Адрес места нахождения саморегулируемой организации:",
                "rows": 3,
                "class": "input-large",
                "style": "width: 50% !important; resize: vertical !important;"
            }),
            #-----------------------------------------------------
            "name_poln_counter": TextInput(attrs={
                "class": "form-control",
                "placeholder": "Полное наименование юридического лица:",
                "style": "max-width: 700px"
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
            #-----------------------------------------------------
            "date_reg_in_rhsro": TextInput(attrs={
                "class": "form-control",
                "placeholder": "Дата регистрации юридического лица или индивидуального предпринимателя в реестре:",
                "style": "max-width: 300px"
            }),
            "stroitelstvo": CheckboxInput(attrs={
                "class": "form-control",
                "placeholder": "Строительство",
                "style": "max-width: 300px",
            }),



                #   "stroitelstvo": "",
                #   "reconsrukcya": "",
                #   "kap_remont": "",
                #   "demontaj_kap_stroitelstva": "",
                #   "inj_iziscanya": "",
                #   "psd": "",




            "date_1": DateInput(attrs={
                "class": "form-control",
                "placeholder": "Дата регистрации юридического лица или индивидуального предпринимателя в реестре:",
                "style": "max-width: 300px"
            }),
            "date_2": DateInput(attrs={
                "class": "form-control",
                "placeholder": "Дата регистрации юридического лица или индивидуального предпринимателя в реестре:",
                "style": "max-width: 300px"
            }),
            "date_3": DateInput(attrs={
                "class": "form-control",
                "placeholder": "Дата регистрации юридического лица или индивидуального предпринимателя в реестре:",
                "style": "max-width: 300px"
            }),







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

