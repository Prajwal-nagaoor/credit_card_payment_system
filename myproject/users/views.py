from django.shortcuts import render
import json
import jwt
from datetime import datetime,timezone,timedelta
from django.conf import settings
from django.contrib.auth import get_user_model
from django.contrib.auth.hashers import make_password,check_password
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
@csrf_exempt
def login(request):
    if request.method != 'POST':
        return JsonResponse(
            {"error":"Only POST method are allowed here"},
            status = 405
        )
    try:
        data = json.loads(request.body)
        username = data.get("username")
        password = data.get("password")

        if not username or not password:
            return JsonResponse(
                {"error":"Username and Password required"},
                status = 400
            )
        try:
            user = User.objects.get(username=username)
        except:
            return JsonResponse(
                {"error":"User not exists"},
                status = 400
            )
        if not check_password(password,user.password):
            return JsonResponse(
                {"error":"Invalid username or password"},
                status = 400
            )
        plyload = {
            "user_id":user.id,
            "username":user.username,
            "first_name":user.first_name,
            "last_name":user.last_name
        }

        token = jwt.encode(
            plyload,
            settings.SECRET_KEY,
            algorithm="HS256"

        )

        return JsonResponse(
            {"message":"Login Successfully",
            "access token":token,
            "token type":"Bearer",
            "User":{
                "User id":user.id,
                "username":user.username,
                "Email":user.email
            }
            }

        )
    except:
        return json.JSONDecodeError(
            {
                "error":"Invalid JSON"
            },
            status = 400
        )

