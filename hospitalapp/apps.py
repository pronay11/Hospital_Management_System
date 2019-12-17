from django.apps import AppConfig
class HospitalappConfig(AppConfig):
    name = 'hospitalapp'
    def ready(self):
        import hospitalapp.mysignal