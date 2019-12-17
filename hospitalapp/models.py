from django.db import models
from django.db.models.deletion import CASCADE
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.core.validators import MinValueValidator, MaxValueValidator,\
    RegexValidator

class Branch(models.Model):
    name=models.CharField(max_length=100)
    dep=models.CharField(max_length=100)
    def __str__(self):
        return "%s (%s)"%(self.name,self.dep)

class Doctor(models.Model):
    picture= models.ImageField(upload_to="image\\",null=True)
    name=models.CharField(max_length=100)
    depertment=models.CharField(max_length=100)
    description=models.TextField()
    def __str__(self):
        return "%s (%s)"%(self.name,self.depertment)


class Notice(models.Model):
    subject=models.CharField(max_length=100)
    msg=models.TextField()
    
    cr_date=models.DateTimeField(auto_now_add=True)
    branch =models.ForeignKey('Branch', on_delete=CASCADE,null=True,blank=True)

    def __str__(self): 
        return self.subject

class Profile(models.Model):
    user=models.OneToOneField(to=User, on_delete=CASCADE,null=True)
    img= models.ImageField(upload_to="image\\",null=True)
    phone = models.CharField( max_length=15, null=True, blank=True)
    notice =models.ForeignKey(to=Notice, on_delete=CASCADE,null=True,blank=True)
    doc= models.FileField(upload_to="file\\",null=True)
    branch =models.ForeignKey(to=Branch, on_delete=CASCADE,null=True,blank=True)
    def __str__(self):
        return self.user.username
        
class Appointment(models.Model):
    user = models.ForeignKey(to=User, on_delete=CASCADE, null=True, blank=True)
    cr_date = models.DateTimeField(auto_now_add=True)
    email=models.EmailField(max_length=50)
    phone = models.CharField( max_length=15, null=True, blank=True)
    #pn = models.CharField(validators=[RegexValidator("^0?[5-9]{1}\d{9}$")], max_length=15, null=True, blank=True)
    doctor=models.CharField(max_length=100,null=True)
    depertment=models.CharField(max_length=100,null=True)
    msg = models.TextField()
  
    def __str__(self):
        return self.user.username


      
   
# Create your models here.
