from django.db import models
from django.contrib.auth.models import User


class Category(models.Model):
    name = models.CharField(max_length=100, verbose_name="Название")

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Категория"
        verbose_name_plural = "Категории"


class Article(models.Model):
    title = models.CharField(max_length=200, verbose_name="Заголовок")
    categories = models.ManyToManyField(Category, verbose_name="Категории", blank=True)
    public1 = models.BooleanField(default=True, verbose_name="Опубликовано")

    def __str__(self):
        return self.title





# Create your models here.
class JurnalsModel(models.Model):
    """ Добавление модели журналов """
    class Meta:
        ordering = ['name_jurnals', ]

    name_jurnals = models.CharField(max_length=100, default='Журнал') 
    creation_date = models.DateTimeField(auto_now=True, verbose_name="Дата создания")
    user = models.ForeignKey(to=User, on_delete=models.CASCADE, blank=True, null=True)
    public = models.BooleanField(default=True) # True = public, False = private

    def __repr__(self):
        return f'Журнал {self.name_jurnals}'

    def __str__(self):
        return f'{self.name_jurnals}'
