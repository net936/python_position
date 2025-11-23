from django.contrib.sitemaps import Sitemap
from django.urls import reverse
from django.conf import settings
from app.models import Job
from datetime import datetime


class JobSitemap(Sitemap):
    """职位详情页 Sitemap"""
    changefreq = "daily"
    priority = 0.8
    protocol = settings.SITE_PROTOCOL

    def items(self):
        # 只包含已审核通过的职位，限制1000条避免sitemap过大
        return Job.objects.filter(status=1).order_by('-timestamp')[:1000]

    def lastmod(self, obj):
        return obj.timestamp

    def location(self, obj):
        return reverse('app:detail', args=[obj.pk])


class StaticViewSitemap(Sitemap):
    """静态页面 Sitemap"""
    priority = 1.0
    changefreq = 'daily'
    protocol = settings.SITE_PROTOCOL

    def items(self):
        return ['home', 'app:index', 'app:commit', 'about', 'privacy']

    def location(self, item):
        return reverse(item)

    def lastmod(self, item):
        return datetime.now()


class CategorySitemap(Sitemap):
    """分类页面 Sitemap"""
    changefreq = "daily"
    priority = 0.7
    protocol = settings.SITE_PROTOCOL

    def items(self):
        return [
            {'type': '0', 'name': '全职'},
            {'type': '1', 'name': '兼职'},
            {'type': '2', 'name': '实习'},
            {'type': '3', 'name': '外包'},
        ]

    def location(self, obj):
        return f"/app/index?c={obj['type']}"

    def lastmod(self, obj):
        return datetime.now()
