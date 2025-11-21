from django.contrib import admin

# Register your models here.
from app.models import Job


@admin.register(Job)
class JobAdmin(admin.ModelAdmin):
    """岗位管理后台"""
    list_display = ('position', 'company', 'job_type', 'location', 'get_salary_range', 'status', 'timestamp', 'pv')
    list_filter = ('status', 'job_type', 'experience', 'education', 'timestamp')
    search_fields = ('position', 'company', 'location', 'description')
    list_editable = ('status',)
    ordering = ('-timestamp',)
    date_hierarchy = 'timestamp'

    fieldsets = (
        ('基本信息', {
            'fields': ('position', 'company', 'job_type', 'location')
        }),
        ('薪资要求', {
            'fields': ('salary_min', 'salary_max')
        }),
        ('任职要求', {
            'fields': ('experience', 'education', 'description')
        }),
        ('联系方式', {
            'fields': ('contact', 'phone', 'email')
        }),
        ('状态信息', {
            'fields': ('status', 'expire', 'pv')
        }),
    )

    def get_salary_range(self, obj):
        return obj.get_salary_range()
    get_salary_range.short_description = '薪资范围'