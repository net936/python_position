"""
Context Processors
将全局配置变量注入到所有模板中
"""
from django.conf import settings


def site_settings(request):
    """
    将网站配置信息注入到模板上下文中
    使所有模板都可以访问这些变量
    """
    return {
        'SITE_PROTOCOL': settings.SITE_PROTOCOL,
        'SITE_DOMAIN': settings.SITE_DOMAIN,
        'SITE_URL': settings.SITE_URL,
    }
