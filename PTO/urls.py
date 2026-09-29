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
from ProjectsApp import views as projects_app
from JurnalsApp import views as jurnals_app
from CounterpartyApp import views as counterparty_app
from TOyTB_App import views as toytb_app_views




urlpatterns = [
    #=======================================================================
    # **********  Админ  ***************************************************
    #=======================================================================
    path('admin/', admin.site.urls),

    #=======================================================================
    #///////////////////////////////////////////////////////////////////////


    #///////////////////////////////////////////////////////////////////////
    #=======================================================================
    # **********  Аутентификация и авторизация  ****************************
    #=======================================================================
    path('', main_app_views.auth_page, name="auth-page"),
    path('auth_user', auth_app_views.auth_user, name="auth-user"),
    path('login', auth_app_views.login, name='login'),
    path('logout', auth_app_views.logout, name='logout'),
    path('register', auth_app_views.create_user, name='register'),
    #=======================================================================
    #///////////////////////////////////////////////////////////////////////


    #///////////////////////////////////////////////////////////////////////
    #=======================================================================
    # **********  Главная  *************************************************
    #=======================================================================
    path('index', main_app_views.index_page, name="home"),
    path('folder', main_app_views.add_folder, name="add-folder"),
    path('test', main_app_views.test, name="test"),
    path('test_2', main_app_views.test_2, name="test-2"),
    #=======================================================================
    #///////////////////////////////////////////////////////////////////////





    #///////////////////////////////////////////////////////////////////////
    #=======================================================================
    # **********  ПРОЕКТЫ  *************************************************
    #=======================================================================
    path('projects/list', projects_app.projects_page, name="projects-list"),
    path('projects/add', projects_app.project_add_page, name="project-add"),
    path('projects/save', projects_app.export_projects_to_excel, name="project-save"),
    path('projects/<int:project_id>/', projects_app.get_project, name="project-detail"),
    path('projects/<int:project_id>/ird', projects_app.project_ird, name="project-ird"),
    path('projects/<int:project_id>/psd', projects_app.project_psd, name="project-psd"),
    path('projects/<int:project_id>/ppr', projects_app.project_ppr, name="project-ppr"),
    path('projects/<int:project_id>/stroyka', projects_app.project_stroyka, name="project-stroyka"),
    path('projects/<int:project_id>/priyomka_rabot', projects_app.project_priyomka_rabot, name="project-priyomka-rabot"),
    path('projects/<int:project_id>/doc', projects_app.project_doc, name="project-doc"),
    path('projects/<int:project_id>/delete', projects_app.project_delete, name="project-delete"),
    path('projects/<int:project_id>/edit', projects_app.project_edit, name="project-edit"),
    #=======================================================================
    # ****** Журналы *******************************************************
    #=======================================================================
    path('jurnals/list', jurnals_app.jurnals_page, name="jurnals-list"),
    path('jurnals/add', jurnals_app.jurnals_add, name="jurnals-add"),
    # path('jurnals/<int:project_id>/add', jurnals_app.jurnals_add, name="jurnals-add"),
    path('jurnals/<int:jurnal_id>/', jurnals_app.get_jurnal, name="jurnal-detail"),
    # path('counterparties/<int:counterparty_id>/delete', counterparty_app.counterparty_delete, name="counterparty-delete"),
    path('jurnals/<int:jurnal_id>/edit', jurnals_app.jurnal_edit, name="jurnal-edit"),
    path('jurnals/ojr', jurnals_app.jurnal_ojr_edit, name="jurnal-ojr-edit"),
    # #=======================================================================
    # path('sro/list', counterparty_app.sro_page, name="sro-list"),
    # path('sro/add', counterparty_app.add_sro_page, name="add-sro"),
    # path('sro/<int:sro_id>/', counterparty_app.get_sro, name="sro-detail"),
    # path('sro/<int:sro_id>/delete', counterparty_app.sro_delete, name="sro-delete"),
    # path('sro/<int:sro_id>/edit', counterparty_app.sro_edit, name="sro-edit"),
    path("create/", jurnals_app.create_article, name="create-article"),


    #=======================================================================
    #///////////////////////////////////////////////////////////////////////




    #///////////////////////////////////////////////////////////////////////
    #=======================================================================
    # ****** Контрагенты - добавление, удаление, поиск *********************
    #=======================================================================
    path('counterparties/list', counterparty_app.counterparty_page, name="counterparty-list"),
    path('counterparties/add', counterparty_app.add_counterparty_page, name="add-counterparty"),
    path('counterparties/<int:counterparty_id>/', counterparty_app.get_counterparty, name="counterparty-detail"),
    path('counterparties/<int:counterparty_id>/delete', counterparty_app.counterparty_delete, name="counterparty-delete"),
    path('counterparties/<int:counterparty_id>/edit', counterparty_app.counterparty_edit, name="counterparty-edit"),
    #=======================================================================
    path('sro/list', counterparty_app.sro_page, name="sro-list"),
    path('sro/add', counterparty_app.add_sro_page, name="add-sro"),
    path('sro/<int:sro_id>/', counterparty_app.get_sro, name="sro-detail"),
    path('sro/<int:sro_id>/delete', counterparty_app.sro_delete, name="sro-delete"),
    path('sro/<int:sro_id>/edit', counterparty_app.sro_edit, name="sro-edit"),

    #=======================================================================
    #///////////////////////////////////////////////////////////////////////


    #///////////////////////////////////////////////////////////////////////
    #=======================================================================
    # ****** ТО и ТБ, ООС **************************************************
    #=======================================================================
    path('toytb', toytb_app_views.toytb_page, name="toytb"),
    path('predpisaniye/list', toytb_app_views.predpisaniye_page, name="predpisaniye-list"),
    path('predpisaniye/add', toytb_app_views.add_predpisaniye_page, name="add-predpisaniye"),
    path('predpisaniyes/<int:predpisaniye_id>/', toytb_app_views.get_predpisaniye, name="predpisaniye-detail"),
    path('predpisaniyes/<int:predpisaniye_id>/delete', toytb_app_views.predpisaniye_delete, name="predpisaniye-delete"),
    path('predpisaniyes/<int:predpisaniye_id>/edit', toytb_app_views.predpisaniye_edit, name="predpisaniye-edit"),
    #=======================================================================
    #///////////////////////////////////////////////////////////////////////




] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)


# admin.site.site_title = "Blogs site admin (DEV)"
# admin.site.site_header = "Main Blogs administration"
# admin.site.index_title = "Site administration"
