from django.contrib import admin
from django.urls import path
from django.urls.conf import include
from django.views.generic.base import RedirectView
from django.templatetags.static import static
from hospitalproject import settings
from django.conf.urls.static import static
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from hospitalapp import views
from django.conf.urls import url

urlpatterns = [
    url(r'^search/$',views.search,name='search'),
    url(r'^contact/$',views.contact,name='contact'),
    url(r'^about/$',views.about,name='contact'),
    path('profile/', views.ProfileUpdateView.as_view()),
    path('appointment/create/', views.AppointmentCreate.as_view(success_url="/hospitalapp/home")),
    path('home/', views.HomeView.as_view()),
    path('notice/', views.NoticeListView.as_view()),
    path('notice/<int:pk>', views.NoticeDetailView.as_view()),
    path('profile/edit/<int:pk>', views.ProfileUpdateView.as_view(success_url="/hospitalapp/home")),
    path('',RedirectView.as_view(url="home/")),
     

]