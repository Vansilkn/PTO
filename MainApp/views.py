from django.shortcuts import render

# Create your views here.
def index_page(request):
    """  """
    context = {'pagename': 'ПТО'}
    return render(request, 'pages/index.html', context)