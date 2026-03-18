from django.db import models
from django.contrib.auth.models import User
# from django.forms import CharField, PasswordInput
# from django.core.exceptions import ValidationError


class PedpisaniyeModel(models.Model):
    """ Добавление модели предписания """

    # class Meta:
    #     ordering = ['number_predpisaniye']

    number_predpisaniye = models.CharField(max_length=100)
    date_create_predpisaniye = models.CharField(max_length=100)
    name_counterparty = models.CharField(max_length=300)
    name_object = models.CharField(max_length=700)
    date_execution_predpisaniye = models.CharField(max_length=50)
    execution_status = models.CharField(max_length=50)

    creation_date = models.DateTimeField(auto_now=True, verbose_name="Дата создания")
    user = models.ForeignKey(to=User, on_delete=models.CASCADE, blank=True, null=True)
    public = models.BooleanField(default=True) # True = public, False = private

    def __repr__(self):
        return f'Предписание {self.number_predpisaniye}'

    def __str__(self):
        return f'{self.number_predpisaniye}'
