from django import forms
from app.models import Job


class CommitForm(forms.ModelForm):
    """岗位发布表单"""
    class Meta:
        model = Job
        fields = [
            'position', 'company', 'job_type',
            'salary_min', 'salary_max',
            'experience', 'education',
            'description', 'location',
            'contact', 'phone', 'email', 'expire'
        ]
        widgets = {
            'description': forms.Textarea(attrs={'rows': 6, 'placeholder': '请详细描述职位要求、岗位职责等信息'}),
        }
