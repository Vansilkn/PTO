from django.shortcuts import render, redirect, get_object_or_404
from django.http import HttpResponseNotAllowed
from django.contrib import auth

from TOyTB_App.models import PedpisaniyeModel
from TOyTB_App.forms_predpisaniye import PredpisaniyeForm

from django.core.exceptions import ObjectDoesNotExist

from django.contrib.auth.decorators import login_required





# Раздел "ОТ и ТБ, ООС"
@login_required
def toytb_page (request):
    """" Стартовая страница ОТ и ТБ, ООС """
    context = {
        'pagename':'Охрана труда, промышленная безопасность и охрана окружающей среды',
    }
    return render(request, 'view_toytb.html', context)


@login_required
def predpisaniye_page (request):
    """ Получаем все элементы из базы данных. """
    predpisaniyes = PedpisaniyeModel.objects.filter(public=True) 
    context = {
        'pagename':'Список предписаний',
        'predpisaniyes': predpisaniyes
    }
    return render(request, 'pages/predpisaniyes.html', context)


@login_required
def add_predpisaniye_page (request):
    """ Добавляем новое предписание """
    # Создаем пустую форму при запросе GET
    if request.method == "GET":
        form = PredpisaniyeForm()
        context = {
            'pagename': 'Добавление нового предписания',
            'form': form
        }
        return render(request, 'pages/add_predpisaniye.html', context)
    
    # Получае данные из формы и на их основе создаем новый проект, сохраняя его в БД
    if request.method == "POST":
        form = PredpisaniyeForm(request.POST)
        if form.is_valid():
            predpisaniyes = form.save(commit=False) # Получаем экземпляр класса PredpisaniyeForm
            if predpisaniyes.user.is_authenticated:
                predpisaniyes.user = request.user
                predpisaniyes.save()
            return redirect("predpisaniye-list") # URL для списка проектов
        return render(request, "pages/add_predpisaniye.html", context={"form": form})
    return HttpResponseNotAllowed(["POST"], "Вы должны сделать POST-запрос на добавления предписания.")







@login_required
def get_predpisaniye (request):
    """ Получаем все элементы из базы данных. """
    pass


@login_required
def predpisaniye_edit (request):
    """ Получаем все элементы из базы данных. """
    pass



@login_required
def predpisaniye_delete (request):
    """ Получаем все элементы из базы данных. """
    pass