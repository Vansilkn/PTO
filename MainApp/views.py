from django.shortcuts import render
from pathlib import Path
import os

# Create your views here.
def index_page(request):
    """  """
    context = {'pagename': 'ПТО'}
    return render(request, 'pages/index.html', context)



def add_folder():
    """ Созаем каталог """
    
#     # Path("/my/directory").mkdir(parents=True, exist_ok=True)


#     path = './projects33333'
#     os.mkdir(path)

    # создание подпапки в каталоге запущенного скрипта
    os.makedirs("subfolder", exist_ok=True)
    # построение полного абсолютного пути к папке project_folder
    ROOT_FOLDER = os.path.abspath(__file__)
    print(ROOT_FOLDER)
    # объединение root_folder и вложенной папки для создания\работы с файлами во вложенных папках
    subfolder_abs_path = os.path.join(ROOT_FOLDER, 'subfolder')
    print(subfolder_abs_path)

    