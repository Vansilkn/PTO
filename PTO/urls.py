"""
URL configuration for PTO project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf.urls.static import static
from django.conf import settings
from AuthApp import views as auth_app_views
from MainApp import views as main_app_views
from ProjectsApp import views as projects_app_views
from CounterpartyApp import views as counterparty_app_views

urlpatterns = [
    #=======================================================================
    # **********  Админ ****************************************************
    #=======================================================================
    path('admin/', admin.site.urls),
    #=======================================================================
    #///////////////////////////////////////////////////////////////////////


    #///////////////////////////////////////////////////////////////////////
    #=======================================================================
    # **********  Аутентификация и авторизация  ****************************
    #=======================================================================
    path('login', auth_app_views.login, name='login'),
    path('logout', auth_app_views.logout, name='logout'),
    path('register', auth_app_views.create_user, name='register'),
    #=======================================================================
    #///////////////////////////////////////////////////////////////////////


    #///////////////////////////////////////////////////////////////////////
    #=======================================================================
    # **********  ПРОЕКТЫ  ****************************
    #=======================================================================
    path('projects/add', projects_app_views.add_project_page, name="add-project"),
    path('projects/list', projects_app_views.projects_page, name="projects-list"),
    path('projects/<int:project_id>/', projects_app_views.get_project, name="project-detail"),
    path('projects/<int:project_id>/delete', projects_app_views.cproject_delete, name="project-delete"),
    path('projects/<int:project_id>/edit', projects_app_views.cproject_edit, name="project-edit"),
    #=======================================================================
    #///////////////////////////////////////////////////////////////////////


    path('', main_app_views.index_page, name="home"),

    path('folder', main_app_views.add_folder, name="add-folder"),



    #///////////////////////////////////////////////////////////////////////
    #=======================================================================
    # Контрагенты - добавление, удаление, поиск
    #=======================================================================
    path('counterparties/add', counterparty_app_views.add_counterparty_page, name="add-counterparty"),
    path('counterparties/list', counterparty_app_views.counterparty_page, name="counterparty-list"),
    path('counterparties/<int:counterparty_id>/', counterparty_app_views.get_counterparty, name="counterparty-detail"),
    path('counterparties/<int:counterparty_id>/delete', counterparty_app_views.counterparty_delete, name="counterparty-delete"),
    path('counterparties/<int:counterparty_id>/edit', counterparty_app_views.counterparty_edit, name="counterparty-edit"),
    #=======================================================================
    #///////////////////////////////////////////////////////////////////////


] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

