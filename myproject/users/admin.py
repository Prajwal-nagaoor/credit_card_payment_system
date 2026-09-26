from django.contrib import admin
from .models import User,Cards
# Register your models here.

class user(admin.ModelAdmin):
    list_display=["email"]
admin.site.register(User,user)
class card(admin.ModelAdmin):
    list_display = ["user","card_number","expiry_data","card_holder_name"]
admin.site.register(Cards,card)
