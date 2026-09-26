from django.shortcuts import render
import json
from django.contrib.auth import get_user_model
from django.contrib.auth.hashers import make_password
from  django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
# Create your views here.
User = get_user_model()
@csrf_exempt
def register(request):
    if request.method != "POST":
        return JsonResponse(
            {"error":"Only POST method allowed here"},
            status=405
        )
    try:
        data = json.loads   (request.body)
        username = data.get('username')
        email = data.get('email')
        first_name = data.get('first_name')
        last_name = data.get('last_name')
        password = data.get('password')

        if not username or not email or not password:
            return JsonResponse(
                {"error":"All the fields are manditory"},
                status = 400
            )
        if User.objects.filter(username= username).exists():
            return JsonResponse(
                {"error":"Username already exists"},
                status = 400
            )
        if User.objects.filter(email = email).exists():
            return JsonResponse(
                {"error":"Email already exists"},
                status = 400
            )
        user = User.objects.create(
            username= username,
            email = email,
            first_name = first_name,
            last_name = last_name,
            password=make_password(password)
        )
        return JsonResponse(
            {"message":"User created successfully",
            "User":{
                "id":user.id,
                "username":user.username,
                "email":user.email,
                "First name":user.first_name,
                "Last name":user.last_name
            }},
            status = 201
        )
    except json.JSONDecodeError:
        return JsonResponse(
            {"error":"Invalid JSON"},
            status = 400
        )
