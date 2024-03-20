from django.urls import path
from . import views
# from django.http import HttpResponse

urlpatterns = [
    path('', views.home, name="home"),
    path('room/', views.room, name="room"),
]
