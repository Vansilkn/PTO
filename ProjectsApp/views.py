from django.shortcuts import render, redirect, get_object_or_404
from ProjectsApp.forms_projects import ProjectForm
from django.http import HttpResponseNotAllowed, HttpResponse
from ProjectsApp.models import ProjectModel
from django.core.exceptions import ObjectDoesNotExist
from django.contrib.auth.decorators import login_required


import openpyxl


@login_required
def projects_page (request):
    """ Получаем все элементы из базы данных. """
    projects = ProjectModel.objects.filter(public=True) 
    context = {
        'pagename':'Просмотр списка проектов',
        'projects': projects
    }
    return render(request, 'index_projects.html', context)


@login_required
def project_add_page (request):
    """ Добавляем новый проект """
    # Создаем пустую форму при запросе GET
    if request.method == "GET":
        form = ProjectForm()

        context = {
            'pagename': 'Добавление нового проекта',
            'form': form
        }
        return render(request, 'pages/project_add.html', context)
    
    # Получае данные из формы и на их основе создаем новый проект, сохраняя его в БД
    if request.method == "POST":
        form = ProjectForm(request.POST)
        if form.is_valid():

            project = form.save(commit=False) # Получаем экземпляр класса ContragentModel
            if request.user.is_authenticated:
                project.user = request.user
                project.save()
            return redirect("projects-list") # URL для списка проектов
        return render(request, "pages/project_add.html", context={"form": form})
    return HttpResponseNotAllowed(["POST"], "Вы должны сделать POST-запрос на добавление проекта.")


@login_required
def get_project (request, project_id: int):
    """ Получаем элемент по идентификатору из базы данных. """
    context = {'pagename': 'Просмотр проекта'}
    try:
        project = ProjectModel.objects.get(id=project_id)
    except ObjectDoesNotExist:
        return render(request, 'page/errors.html', 
                    context | {"error": f"Проект {project_id} не найден."})
    else:
        context['project'] = project
        return render(request, 'project_pages/project.html', context)


# Удаление данных из таблицы
@login_required
def project_delete(request, project_id:int):
    """ Удаляем элемент по идентификатору из базы данных. 
    Найти project по project_id или вернуть ошибку 404 """
    if request.method == "GET" or request.method == "POST":
        project = get_object_or_404(ProjectModel.objects.filter(user=request.user), id=project_id)
        project.delete() # Удаляем данные из базы
    return redirect('projects-list')


# Обновление данных в таблице
@login_required
def project_edit(request, project_id:int):
    """ Обновление данных проекта """
    сontext = {
        'pagename': 'Обновление данных проекта',
        }
    project = get_object_or_404(ProjectModel.objects.filter(user=request.user), id=project_id)

    # Создаем форму на основе данных проекта при запросе GET
    if request.method == "GET":
        form = ProjectForm(instance=project)
        return render(request, 'pages/project_add.html', сontext | {"form": form})
    
    # Получае данные из формы и на их основе обновляем данные проекта, сохраняя их в БД
    if request.method == "POST":
        data_form = request.POST
        project.name_project = data_form["name_project"]
        project.projects_adres = data_form["projects_adres"]
        project.zakazchik_name = data_form["zakazchik_name"]
        project.zastroschik_name = data_form["zastroschik_name"]
        project.genpodryadchyk_name = data_form["genpodryadchyk_name"]
        project.project_status = data_form["project_status"]
        # # project.creation_date = data_form["creation_date"]
        # project.public = data_form.get("public", False)
        project.save()
        return redirect("projects-list") # URL для списка проектов 


@login_required
def project_ird (request, project_id: int):
    """ Получаем элемент по идентификатору из базы данных. """
    context = {'pagename': 'Исходно-разрешительная документация'}
    try:
        project = ProjectModel.objects.get(id=project_id)
    except ObjectDoesNotExist:
        return render(request, 'page/errors.html', 
                    context | {"error": f"Исходно-разрешительная документация {project_id} не найдена."})
    else:
        context['project'] = project
        return render(request, 'pages/project_ird.html', context)

@login_required
def project_psd (request, project_id: int):
    """ Получаем элемент по идентификатору из базы данных. """
    context = {'pagename': 'Проектная документация'}
    try:
        project = ProjectModel.objects.get(id=project_id)
    except ObjectDoesNotExist:
        return render(request, 'page/errors.html', 
                    context | {"error": f"Проектная документация {project_id} не найдена."})
    else:
        context['project'] = project
        return render(request, 'pages/project_psd.html', context)


@login_required
def project_ppr (request, project_id: int):
    """ Получаем элемент по идентификатору из базы данных. """
    context = {'pagename': 'ППР, ТТК, СГП'}
    try:
        project = ProjectModel.objects.get(id=project_id)
    except ObjectDoesNotExist:
        return render(request, 'page/errors.html', 
                    context | {"error": f"ППР, ТТК, СГП {project_id} не найдена."})
    else:
        context['project'] = project
        return render(request, 'pages/project_ppr.html', context)


@login_required
def project_stroyka (request, project_id: int):
    """ Получаем элемент по идентификатору из базы данных. """
    context = {'pagename': 'Строительное производство'}
    try:
        project = ProjectModel.objects.get(id=project_id)
    except ObjectDoesNotExist:
        return render(request, 'page/errors.html', 
                    context | {"error": f"Строительное производство {project_id} не найдена."})
    else:
        context['project'] = project
        return render(request, 'pages/project_stroyka.html', context)


@login_required
def project_priyomka_rabot (request, project_id: int):
    """ Получаем элемент по идентификатору из базы данных. """
    context = {'pagename': 'Приемка работ, объекта'}
    try:
        project = ProjectModel.objects.get(id=project_id)
    except ObjectDoesNotExist:
        return render(request, 'page/errors.html', 
                    context | {"error": f"Приемка работ, объекта {project_id} не найдена."})
    else:
        context['project'] = project
        return render(request, 'pages/project_priyomka_rabot.html', context)


@login_required
def project_doc (request, project_id: int):
    """ Получаем элемент по идентификатору из базы данных. """
    context = {'pagename': 'Строительный документооборот'}
    try:
        project = ProjectModel.objects.get(id=project_id)
    except ObjectDoesNotExist:
        return render(request, 'page/errors.html', 
                    context | {"error": f"Строительный документооборот {project_id} не найдена."})
    else:
        context['project'] = project
        return render(request, 'pages/project_doc.html', context)


@login_required
def export_projects_to_excel(request):
    # Создаём книгу и лист
    wb = openpyxl.Workbook()
    ws = wb.active
    ws.title = 'Проекты'

    # Заголовки колонок
    columns = [
        ('ID', 'id'),
        ('Наименование проекта', 'name_project'),
        ('Адрес объекта', 'projects_adres'),
        ('Заказчик', 'zakazchik_name'),
        ('Застройщик', 'zastroschik_name'),
        ('Генподрядчик', 'genpodryadchyk_name'),
        ('Статус', 'project_status'),
    ]

    ws.append([label for label, _ in columns])

    # Жирный шрифт для заголовков
    from openpyxl.styles import Font

    for cell in ws[1]:
        cell.font = Font(bold=True)

    # Данные
    for project in ProjectModel.objects.all():
        ws.append([getattr(project, field) for _, field in columns])

    # Автоширина колонок
    for col_cells in ws.columns:
        max_length = max(len(str(cell.value or '')) for cell in col_cells)
        ws.column_dimensions[col_cells[0].column_letter].width = max_length + 2

    # Формируем HTTP-ответ
    response = HttpResponse(
        content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
    )
    response['Content-Disposition'] = 'attachment; filename="projects.xlsx"'
    wb.save(response)
    return response


