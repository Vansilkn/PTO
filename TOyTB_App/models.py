from django.db import models
# from django.contrib.auth.models import User
# # from django.forms import CharField, PasswordInput
# # from django.core.exceptions import ValidationError

# # Create your models here.
# class ProjectModel(models.Model):
#     """ Добавление модели проекта """
#     class Meta:
#         ordering = ['name_project', 'projects_adres']

#     name_project = models.CharField(max_length=100)
#     projects_adres = models.TextField(max_length=300)
#     zakazchik_name = models.CharField(max_length=100)
#     zastroschik_name = models.CharField(max_length=100)
#     genpodryadchyk_name = models.CharField(max_length=100)
#     creation_date = models.DateTimeField(auto_now=True, verbose_name="Дата создания")
#     user = models.ForeignKey(to=User, on_delete=models.CASCADE, blank=True, null=True)
#     public = models.BooleanField(default=True) # True = public, False = private

#     def __repr__(self):
#         return f'Проект {self.name_project}, {self.projects_adres}'

#     def __str__(self):
#         return f'{self.name_project}'


# class ContractModel(models.Model):
#     """" Добавление модели контрака """
#     pass
 
# # Create your models here.
