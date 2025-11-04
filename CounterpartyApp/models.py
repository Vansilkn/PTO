from django.db import models
from django.contrib.auth.models import User
# from django.forms import CharField, PasswordInput
# from django.core.exceptions import ValidationError

# Create your models here.
class CounterpartyModel(models.Model):
    """ Добавление модели контрагента """
    class Meta:
        ordering = ['name_sokr', 'name_poln']

    name_sokr = models.CharField(max_length=100)
    name_poln = models.CharField(max_length=100)
    ur_adres = models.TextField(max_length=300)
    pocht_adres = models.TextField(max_length=300)
    inn = models.CharField(max_length=100)
    kpp = models.CharField(max_length=100)
    ogrn = models.CharField(max_length=100)
    name_bank = models.CharField(max_length=100)
    rs = models.CharField(max_length=100)
    ks = models.CharField(max_length=100)
    bik = models.CharField(max_length=100)
    phone = models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    creation_date = models.DateTimeField(auto_now=True, verbose_name="Дата создания")
    user = models.ForeignKey(to=User, on_delete=models.CASCADE, blank=True, null=True)
    public = models.BooleanField(default=True) # True = public, False = private

    def __repr__(self):
        return f'Контрагент {self.name_sokr}, {self.name_poln}'

    def __str__(self):
        return f'{self.name_sokr}'
