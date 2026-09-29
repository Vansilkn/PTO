from django.shortcuts import render, redirect, get_object_or_404
from JurnalsApp.forms_jurnals import JurnalsForm #ProjectForm
from django.http import HttpResponseNotAllowed, HttpResponse
from JurnalsApp.models import JurnalsModel
from django.core.exceptions import ObjectDoesNotExist
from django.contrib.auth.decorators import login_required


import openpyxl



import json
# from pathlib import Path
from django.http import JsonResponse
from django.conf import settings





from JurnalsApp.forms_jurnals import ArticleForm
from JurnalsApp.models import Category

def create_article(request):
    if request.method == "POST":
        form = ArticleForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect("create_article")
    else:
        form = ArticleForm()

    return render(request, "pages/create_article.html", {"form": form})






# from ProjectsApp import projects_page


# from ProjectsApp import co
# jurnals_app.jurnals_page


# from django.core.cache import cache

# def my_page(request, payload_id):
#     extra_data = cache.get(f"payload_{payload_id}") or {}
#     context = {"extra_data": extra_data}
#     return render(request, "app_b/my_page.html", context)


# def my_page(request):
#     data = get_data_dict()  # словарь из другого приложения
#     context = {
#         "pagename": "Моя страница",
#         "extra_data": data,  # передаём в шаблон
#     }
#     return render(request, "app_b/my_page.html", context)





# app_b/views.py
# def my_page(request):
#     extra_data = request.session.get("temp_data", {})
#     context = {
#         "pagename": "Моя страница",
#         "extra_data": extra_data,
#     }
#     return render(request, "app_b/my_page.html", context)


def spisok_jr_json(request):
    # Путь относительно BASE_DIR проекта
    json_path = settings.BASE_DIR / "JurnalsApp" / "static" / "jr" / "json" / "spisok_jr.json"
    with json_path.open("r", encoding="utf-8") as f:
        data = json.load(f)
    return JsonResponse(data, safe=False)  # safe=False, если data — список




@login_required
def jurnals_page (request):
    """ Получаем все элементы из базы данных. """
    # project = request.session.get("projects", {})
    datas = spisok_jr_json(request)
    jurnals = JurnalsModel.objects.filter(public=True) 
    context = {
        'pagename':'Просмотр списка журналов',
        'jurnals': jurnals,
        # 'project': project,
        'datas': datas,
    }
    return render(request, 'index_jurnals.html', context)


@login_required
def jurnals_add (request):
    """ Добавляем новый журнал """
    # Создаем пустую форму при запросе GET
    if request.method == "GET":
        form = JurnalsForm()

        context = {
            'pagename': 'Добавление нового журнала',
            'form': form
        }
        return render(request, 'pages/jurnals_add.html', context)
    
    # Получае данные из формы и на их основе создаем новый проект, сохраняя его в БД
    if request.method == "POST":
        form = JurnalsForm(request.POST)
        if form.is_valid():

            jurnal = form.save(commit=False) # Получаем экземпляр класса ContragentModel
            if request.user.is_authenticated:
                jurnal.user = request.user
                jurnal.save()
            return redirect("jurnals-list") # URL для списка проектов
        return render(request, "pages/jurnals_add.html", context={"form": form})
    return HttpResponseNotAllowed(["POST"], "Вы должны сделать POST-запрос на добавление проекта.")


@login_required
def get_jurnal (request, jurnal_id: int):
    """ Получаем элемент по идентификатору из базы данных. """
    context = {'pagename': 'Просмотр журнала'}
    try:
        jurnal = JurnalsModel.objects.get(id=jurnal_id)

    except ObjectDoesNotExist:
        return render(request, 'page/errors.html', 
                    context | {"error": f"Журнал {jurnal_id} не найден."})
    else:
        context['jurnal'] = jurnal
        return render(request, 'pages/jurnal.html', context)


    # Обновление данных в таблице
@login_required
def jurnal_edit(request, jurnal_id:int):
    """ Обновление данных проекта """
    сontext = {
        'pagename': 'Обновление данных журнала',
        }
    jurnal = get_object_or_404(JurnalsModel.objects.filter(user=request.user), id=jurnal_id)

    # Создаем форму на основе данных проекта при запросе GET
    if request.method == "GET":
        form = JurnalsForm(instance=jurnal)
        return render(request, 'pages/jurnals_add.html', сontext | {"form": form})
    
    # Получае данные из формы и на их основе обновляем данные проекта, сохраняя их в БД
    if request.method == "POST":
        data_form = request.POST
        jurnal.name_jurnal = data_form["name_jurnal"]
        # # project.creation_date = data_form["creation_date"]
        # project.public = data_form.get("public", False)
        jurnal.save()
        return redirect("jurnals-list") # URL для списка проектов 


    # Обновление данных в таблице
@login_required
def jurnal_ojr_edit(request):
    """ Получаем все элементы из базы данных. """
    return render(request, 'pages/jr/ojr/ojr.html')