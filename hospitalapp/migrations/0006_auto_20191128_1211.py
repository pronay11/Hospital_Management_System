# Generated by Django 2.2.5 on 2019-11-28 06:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('hospitalapp', '0005_auto_20191128_1205'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='notice',
            name='img',
        ),
        migrations.AddField(
            model_name='profile',
            name='img',
            field=models.ImageField(null=True, upload_to='image\\'),
        ),
    ]
