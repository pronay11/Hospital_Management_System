# Generated by Django 2.2.5 on 2019-11-30 05:23

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('hospitalapp', '0012_auto_20191130_1113'),
    ]

    operations = [
        migrations.RenameField(
            model_name='profile',
            old_name='pn',
            new_name='phone',
        ),
    ]