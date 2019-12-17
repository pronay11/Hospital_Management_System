from django.shortcuts import render
from django.views.generic.list import ListView
from .models import Notice,Profile,Appointment,Doctor
from django.views.generic.detail import DetailView
from django.utils.decorators import  method_decorator
from  django.contrib.auth.decorators import login_required
from django.views.generic.edit import UpdateView,CreateView
from django.contrib.auth.models import User
from django.http import Http404, HttpResponse, request
import os
from django.db.models import Q
from hospitalproject import settings
from django.views.generic.base import TemplateView
from django.forms.widgets import DateTimeInput
from django.http.response import HttpResponseRedirect
from django.contrib import messages
import profile

# Create your views here.
class HomeView(TemplateView):
    template_name = "hospitalapp/index.html"
def contact(request):
    return render(request,'hospitalapp/contact.html')
def about(request):
    return render(request,'hospitalapp/about.html')      
    
@method_decorator(login_required, name="dispatch")
class NoticeListView(ListView):
    model=Notice
    def get_queryset(self):
         return Notice.objects.order_by("-id")
       
@method_decorator(login_required, name="dispatch")
class NoticeDetailView(DetailView):
    model=Notice      

@method_decorator(login_required, name="dispatch")
class ProfileUpdateView(UpdateView):
    model=Profile 
    fields=["branch","img","doc","phone"]   

def download(request, path):
    file_path = os.path.join(settings.MEDIA_ROOT, path)
    if os.path.exists(file_path):
        with open(file_path, 'rb') as fh:
            response = HttpResponse(fh.read(), content_type="application/pdf")
            response['Content-Disposition'] = 'inline; filename=' + os.path.basename(file_path)
            return response
    raise Http404


class AppointmentCreate(CreateView):
    model=Appointment 
    fields=["email","doctor","depertment","msg"]   
    def form_valid(self, form):
        self.object = form.save()
        self.object.user = self.request.user
        self.object.save()
        return HttpResponseRedirect(self.get_success_url())

# for searching doctor 
def search (request):
    if request.method == 'POST':
        srch=request.POST['srh']
        if srch:
            match= Doctor.objects.filter(Q(name__icontains=srch)|Q(depertment__icontains=srch))
                                        

            if match:
                return render(request,'hospitalapp/search.html',{'sr':match})
            else:
                messages.error(request,'no result found')
        else:
            return HttpResponseRedirect('/search/')
    return render(request,'hospitalapp/search.html')     
    