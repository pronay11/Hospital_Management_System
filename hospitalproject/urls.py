from django.contrib import admin
from django.urls import path
from django.urls.conf import include
from hospitalapp import views
from django.views.generic.base import RedirectView
from hospitalproject import settings
from django.conf.urls.static import static
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.views.static import serve
from django.conf.urls import url


urlpatterns = [
    url(r'^download/(?P<path>.*)$', serve, {'document root': settings.MEDIA_ROOT}),
    url(r'^search/$',views.search,name='search'),
    path('admin/', admin.site.urls),
    path('hospitalapp/', include('hospitalapp.urls')),
    path('accounts/', include('registration.backends.default.urls')),
    path('',RedirectView.as_view(url="hospitalapp/")),
    

] 
#urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
urlpatterns +=static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
