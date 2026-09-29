from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import User,Cards,Transactions,AdminLogs
# Register your models here.

@admin.register(User)
class CustomUserAdmin(UserAdmin):

    list_display = (
        "id",
        "username",
        "email",
        "first_name",
        "last_name",
        "is_staff",
        "is_active"
    )

    search_fields = (
        "username",
        "email",
        "first_name",
        "last_name",
    )

    list_filter = (
        "is_staff",
        "is_active",
    )

@admin.register(Cards)
class CardsAdmin(admin.ModelAdmin):

    list_display = (
        "id",
        "user",
        "card_type",
        "card_number",
        "last_four_digit",
        "expiry_data",
        "card_holder_name",
    )

    search_fields = (
        "user__username",
        "card_holder_name",
        "last_four_digit",
    )

    list_filter = (
        "card_type",
    )


@admin.register(Transactions)
class TransactionsAdmin(admin.ModelAdmin):

    list_display = (
        "id",
        "user",
        "card",
        "amount",
        "status",
        "timestamp",
    )

    search_fields = (
        "user__username",
        "status",
    )

    list_filter = (
        "status",
        "timestamp",
    )

    ordering = (
        "-timestamp",
    )

@admin.register(AdminLogs)
class AdminLogsAdmin(admin.ModelAdmin):
    list_display = (
        "id",
        "admin",
        "action",
        "timestamp",
    )
    search_fields = (
        "admin__username",
        "action"
    )

    list_filter = (
        "timestamp",
    )

    ordering = (
        "-timestamp",
    )