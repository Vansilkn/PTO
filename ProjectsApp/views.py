from django.shortcuts import render, redirect, get_object_or_404
from ProjectsApp.forms_projects import ProjectForm
from django.http import HttpResponseNotAllowed
from ProjectsApp.models import ProjectModel
from django.core.exceptions import ObjectDoesNotExist
from django.contrib.auth.decorators import login_required


# Create your views here.
@login_required
def add_project_page (request):
    """ Добавляем новый проект """
    # Создаем пустую форму при запросе GET
    if request.method == "GET":
        form = ProjectForm()

        context = {
            'pagename': 'Добавление нового проекта',
            'form': form
        }
        return render(request, 'pages/add_projects.html', context)
    
    # Получае данные из формы и на их основе создаем новый проект, сохраняя его в БД
    if request.method == "POST":
        form = ProjectForm(request.POST)
        if form.is_valid():

            project = form.save(commit=False) # Получаем экземпляр класса ContragentModel
            if request.user.is_authenticated:
                project.user = request.user
                project.save()
            return redirect("projects-list") # URL для списка проектов
        return render(request, "pages/add_projects.html", context={"form": form})
    return HttpResponseNotAllowed(["POST"], "Вы должны сделать POST-запрос на добавление проекта.")


@login_required
def projects_page (request):
    """ Получаем все элементы из базы данных. """
    projects = ProjectModel.objects.filter(public=True) 
    context = {
        'pagename':'Просмотр списка проектов',
        'projects': projects
    }
    return render(request, 'view_projects.html', context)


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
        return render(request, 'pages/projects_detail.html', context)


# Удаление данных из таблицы
@login_required
def project_delete(request, project_id:int):
    """ Удаляем элемент по идентификатору из базы данных. 
    Найти project по project_id или вернуть ошибку 404 """
    if request.method == "GET" or request.method == "POST":
        project = get_object_or_404(ProjectModel.objects.filter(user=request.user), id=project_id)
        project.delete() # Удаляем данные из базы
    return redirect('project-list')


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
        return render(request, 'pages/add_projects.html', сontext | {"form": form})
    
    # Получае данные из формы и на их основе обновляем данные проекта, сохраняя их в БД
    if request.method == "POST":
        data_form = request.POST
        project.name_project = data_form["name_project"]
        project.projects_adres = data_form["projects_adres"]
        project.zakazchik_name = data_form["zakazchik_name"]
        project.zastroschik_name = data_form["zastroschik_name"]
        project.genpodryadchyk_name = data_form["genpodryadchyk_name"]
        # # project.creation_date = data_form["creation_date"]
        # project.public = data_form.get("public", False)
        project.save()
        return redirect("projects-list") # URL для списка проектов 
