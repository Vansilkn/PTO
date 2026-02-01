from django.db import models
from django.contrib.auth.models import User
# from django.forms import CharField, PasswordInput
# from django.core.exceptions import ValidationError


class CounterpartyModel(models.Model):
    """ Добавление модели контрагента """
    class Meta:
        ordering = ['name_sokr', 'name_poln']

    type_of_counterparty = models.CharField(max_length=100)
    name_sokr = models.CharField(max_length=100)
    name_poln = models.CharField(max_length=100)
    ur_adres = models.TextField(max_length=300)
    pocht_adres = models.TextField(max_length=300)
    inn = models.CharField(max_length=100)
    kpp = models.CharField(max_length=100)
    ogrn = models.CharField(max_length=100)
    # BANK
    name_bank = models.CharField(max_length=100)
    rs = models.CharField(max_length=100)
    ks = models.CharField(max_length=100)
    bik = models.CharField(max_length=100)
    phone = models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    website = models.CharField(max_length=100, blank=True)


    # User
    creation_date = models.DateTimeField(auto_now=True, verbose_name="Дата создания")
    user = models.ForeignKey(to=User, on_delete=models.CASCADE, blank=True, null=True)
    public = models.BooleanField(default=True) # True = public, False = private

    def __repr__(self):
        return f'Контрагент {self.name_sokr}, {self.name_poln}'

    def __str__(self):
        return f'{self.name_sokr}'




class SROModel(models.Model):
    """ Добавление модели СРО контрагента """

    name_poln_sro = models.CharField(max_length=100)
    name_sokr_sro = models.CharField(max_length=100)
    type_of_counterparty_sro = models.CharField(max_length=100)
    ur_adres = models.TextField(max_length=300)

    reg_nymber_in_grsro = models.CharField(max_length=100)


# 2. Сведения о членстве индивидуального предпринимателя или юридического лица 
# в саморегулируемой организации:
    reg_nymber_in_rhsro = models.CharField(max_length=100)
    date_reg_in_rhsro = models.DateField(auto_now=True, verbose_name="Дата регистрации")

# 3.Сведения о наличии у члена саморегулируемой организации права выполнения 
# работ и обеспечении имущественной ответственности:
## 3.1.
    stroitelstvo = models.CharField(max_length=100)
    reconsrukcya = models.CharField(max_length=100)
    kap_remont = models.CharField(max_length=100)
    demontaj_kap_stroitelstva = models.CharField(max_length=100)
    inj_iziscanya = models.CharField(max_length=100)
    psd = models.CharField(max_length=100)

    date_1 = models.DateTimeField(auto_now=True, verbose_name="Дата")
    date_2 = models.DateTimeField(auto_now=True, verbose_name="Дата")
    date_3 = models.DateTimeField(auto_now=True, verbose_name="Дата")

## 3.2.
    a_2 = models.CharField(max_length=100)
    pred_summ_a_2 = models.FloatField(max_length=100)
    b_2 = models.CharField(max_length=100)
    pred_summ_b_2 = models.FloatField(max_length=100)
    v_2 = models.CharField(max_length=100)
    pred_summ_v_2 = models.FloatField(max_length=100)
    g_2 = models.CharField(max_length=100)
    pred_summ_g_2 = models.FloatField(max_length=100)
    d_2 = models.CharField(max_length=100)
    pred_summ_d_2 = models.FloatField(max_length=100)
    e_2 = models.CharField(max_length=100)
    pred_summ_e_2 = models.FloatField(max_length=100)
## 3.3.
    a_3 = models.CharField(max_length=100)
    pred_summ_a_3 = models.FloatField(max_length=100)
    b_3 = models.CharField(max_length=100)
    pred_summ_b_3 = models.FloatField(max_length=100)
    v_3 = models.CharField(max_length=100)
    pred_summ_v_3 = models.FloatField(max_length=100)
    g_3 = models.CharField(max_length=100)
    pred_summ_g_3 = models.FloatField(max_length=100)
    d_3 = models.CharField(max_length=100)
    pred_summ_d_3 = models.FloatField(max_length=100)

    status_sro = models.CharField(max_length=100)

    # User
    creation_date = models.DateTimeField(auto_now=True, verbose_name="Дата создания")
    user = models.ForeignKey(to=User, on_delete=models.CASCADE, blank=True, null=True)
    public = models.BooleanField(default=True) # True = public, False = private

    def __repr__(self):
        return f'Контрагент {self.name_sokr_sro_on_smr}, {self.name_poln_sro_on_smr}'

    def __str__(self):
        return f'{self.name_sokr_sro_on_smr}'



# class SROonPSDModel (models.Model):
#     """ Добавление модели СРО контрагента на проектные роаботы """

#     name_sokr = models.CharField(max_length=100)
#     inn = models.CharField(max_length=100)
#     ogrn = models.CharField(max_length=100)


#     # SRO
#     name_poln_sro_on_psd = models.CharField(max_length=100)
#     name_sokr_sro_on_psd = models.CharField(max_length=100)
#     adres_sro_on_psd = models.TextField(max_length=300)

#     reg_nymber_in_gsro = models.CharField(max_length=100)

# # 2. Сведения о членстве индивидуального предпринимателя или юридического лица 
# # в саморегулируемой организации:
#     reg_nymber_in_sro = models.CharField(max_length=100)
#     date_sro = models.DateTimeField(auto_now=True, verbose_name="Дата регистрации")

# # 3.Сведения о наличии у члена саморегулируемой организации права выполнения 
# # работ и обеспечении имущественной ответственности:
# ## 3.1.
#     sr_1 = models.CharField(max_length=100)
#     sr_2 = models.CharField(max_length=100)
#     sr_3 = models.CharField(max_length=100)
#     status_sr = models.CharField(max_length=100)
# ## 3.2.
#     a_2 = models.CharField(max_length=100)
#     b_2 = models.CharField(max_length=100)
#     v_2 = models.CharField(max_length=100)
#     g_2 = models.CharField(max_length=100)
#     d_2 = models.CharField(max_length=100)
#     e_2 = models.CharField(max_length=100)
# ## 3.3.
#     a_3 = models.CharField(max_length=100)
#     b_3 = models.CharField(max_length=100)
#     v_3 = models.CharField(max_length=100)
#     g_3 = models.CharField(max_length=100)
#     d_3 = models.CharField(max_length=100)

#     # User
#     creation_date = models.DateTimeField(auto_now=True, verbose_name="Дата создания")
#     user = models.ForeignKey(to=User, on_delete=models.CASCADE, blank=True, null=True)
#     public = models.BooleanField(default=True) # True = public, False = private

#     def __repr__(self):
#         return f'Контрагент {self.name_sokr_sro_on_psd}, {self.name_poln_sro_on_psd}'

#     def __str__(self):
#         return f'{self.name_sokr_sro_on_psd}'