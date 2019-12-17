from django.contrib import admin
from .models import Notice,Branch,Profile,Doctor
from .import models
from django.contrib.admin.options import ModelAdmin
class NoticeAdmin(ModelAdmin):
    list_display=["subject","cr_date"]
    search_fields=["subject"]
    list_filter=["cr_date"]

admin.site.register(models.Notice,NoticeAdmin)
admin.site.register(Branch)
admin.site.register(Profile)
admin.site.register(Doctor)

class AppointmentAdmin(ModelAdmin):
    list_display=["user"]
    search_fields=["user"]
    list_filter=["user"]

admin.site.register(models.Appointment,AppointmentAdmin)
# Register your models here.
