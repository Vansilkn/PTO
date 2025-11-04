from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import auth
from CounterpartyApp.forms_counterparty import CounterpartyForm
from django.http import HttpResponseNotAllowed
from CounterpartyApp.models import CounterpartyModel
from django.core.exceptions import ObjectDoesNotExist
from django.contrib.auth.decorators import login_required


# Create your views here.

@login_required
def add_counterparty_page (request):
    """ Добавляем новую карточку контрагента """
    # Создаем пустую форму при запросе GET
    if request.method == "GET":
        form = CounterpartyForm()

        context = {
            'pagename': 'Добавление нового контрагента',
            'form': form
        }
        return render(request, 'pages/add_counterparty.html', context)
    
    # Получае данные из формы и на их основе создаем новую карточку контрагента, сохраняя его в БД
    if request.method == "POST":
        form = CounterpartyForm(request.POST)
        if form.is_valid():

            counterparty = form.save(commit=False) # Получаем экземпляр класса ContragentModel
            if request.user.is_authenticated:
                counterparty.user = request.user
                counterparty.save()
            return redirect("counterparty-list") # URL для списка карточек контрагентов
        return render(request, "pages/add_counterparty.html", context={"form": form})
    return HttpResponseNotAllowed(["POST"], "You must make POST request to add snippet.")


@login_required
def counterparty_page (request):
    """ Получаем все элементы из базы данных. """
    counterparties = CounterpartyModel.objects.filter(public=True) 
    context = {
        'pagename':'Просмотр списка контрагентов',
        'counterparties': counterparties
    }
    return render(request, 'pages/view_counterparties.html', context)



@login_required
def get_counterparty (request, counterparty_id: int):
    """ Получаем элемент по идентификатору из базы данных. """
    context = {'pagename': 'Просмотр карточки контрагента'}
    try:
        counterparty = CounterpartyModel.objects.get(id=counterparty_id)
    except ObjectDoesNotExist:
        return render(request, 'page/errors.html', 
                      context | {"error": f"Counterparty с id={counterparty_id} не найден."})
    else:
        context['counterparty'] = counterparty
        return render(request, 'pages/counterparty_detail.html', context)



# Удаление данных из таблицы
@login_required
def counterparty_delete(request, counterparty_id:int):
    """ Удаляем элемент по идентификатору из базы данных. 
    Найти counterparty по counterparty_id или вернуть ошибку 404 """
    if request.method == "GET" or request.method == "POST":
        counterparty = get_object_or_404(CounterpartyModel.objects.filter(user=request.user), id=counterparty_id)
        counterparty.delete() # Удаляем данные из базы
    return redirect('counterparty-list')



# Обновление данных в таблице
@login_required
def counterparty_edit(request, counterparty_id:int):
    """ Обновление данных контрагента """
    сontext = {
        'pagename': 'Обновление данных контрагента',
        }

    counterparty = get_object_or_404(CounterpartyModel.objects.filter(user=request.user), id=counterparty_id)

    # Создаем форму на основе данных контрагента при запросе GET
    if request.method == "GET":
        form = CounterpartyForm(instance=counterparty)
        return render(request, 'pages/add_counterparty.html', сontext | {"form": form})
    
    # Получае данные из формы и на их основе обновляем данные контрагента, сохраняя их в БД
    if request.method == "POST":
        data_form = request.POST
        counterparty.name_sokr = data_form["name_sokr"]
        counterparty.name_poln = data_form["name_poln"]
        counterparty.ur_adres = data_form["ur_adres"]
        counterparty.pocht_adres = data_form["pocht_adres"]
        counterparty.inn = data_form["inn"]
        counterparty.kpp = data_form["kpp"]
        counterparty.ogrn = data_form["ogrn"]
        counterparty.name_bank = data_form["name_bank"]
        counterparty.rs = data_form["rs"]
        counterparty.ks = data_form["ks"]
        counterparty.bik = data_form["bik"]
        counterparty.phone = data_form["phone"]
        counterparty.email = data_form["email"]
        counterparty.public = data_form.get("public", False)
        counterparty.save()
        return redirect("counterparty-list") # URL для списка контрагентов 
    


@login_required
def counterparty_edit(request, counterparty_id:int):
    """ Редактирование сниппета """
    сontext = {'pagename': 'Обновление сниппета'}
    counterparty = get_object_or_404(CounterpartyModel.objects.filter(user=request.user), id=counterparty_id)

    # Создаем форму на основе данных snippets'а при запросе GET
    if request.method == "GET":
        form = CounterpartyForm(instance=counterparty)
        return render(request, 'pages/add_counterparty.html', сontext | {"form": form})
    
    # Получае данные из формы и на их основе обновляем сниппет, сохраняя его в БД
    if request.method == "POST":
        data_form = request.POST
        counterparty.name = data_form["name_sokr"]
        counterparty.lang = data_form["inn"]
        counterparty.code = data_form["phone"]
        counterparty.public = data_form.get("public", False)
        counterparty.save()
        return redirect("scounterparty-list") # URL для списка сниппитов 
