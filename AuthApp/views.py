from django.shortcuts import render
from django.contrib import auth
from django.shortcuts import redirect
from AuthApp.forms_auth import UserRegistrationForm



# Create your views here.

def login(request):
    if request.method == 'POST':
        username = request.POST.get("username")
        password = request.POST.get("password")
        user = auth.authenticate(request, username=username, password=password)
        if user is not None:
            auth.login(request, user)
        else:
            context = {
                "pagename": "Pythonbin",
                "errors": ["Неправильное имя пользователя или пароль"]
                }
            return render(request, "pages/index.html", context)
    return redirect(to='home')


def logout(request):
    auth.logout(request)
    return redirect(to='home')


def create_user(request):
    context = {'pagename': 'Регистрация  нового пользователя'}
    # Создаем пустую форму при запросе GET
    if request.method == "GET":
        form = UserRegistrationForm()

    # Получае данные из формы и на их основе создаем нового пользователя, сохраняя его в БД
    if request.method == "POST":
        form = UserRegistrationForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect("home")  
    context["form"] = form
    return render(request, "pages/regestrations.html", context)
