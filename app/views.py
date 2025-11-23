import json
import requests
from django.contrib import messages
from django.shortcuts import render
from django.db.models import Q
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_POST
from django.conf import settings as django_settings

# Create your views here.
from django.urls import reverse
from django.views import generic
from ratelimit.decorators import ratelimit
from app.forms import CommitForm
from app.models import Job
from helpers import get_page_list


class IndexView(generic.ListView):
    """岗位列表页"""
    model = Job
    template_name = 'app/index.html'
    context_object_name = 'job_list'
    paginate_by = 15
    c = None

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super(IndexView, self).get_context_data(**kwargs)
        paginator = context.get('paginator')
        page = context.get('page_obj')
        page_list = get_page_list(paginator, page)
        context['c'] = self.c
        context['page_list'] = page_list
        context['turnstile_site_key'] = django_settings.TURNSTILE_SITE_KEY
        return context

    def get_queryset(self):
        self.c = self.request.GET.get("c", None)
        if self.c:
            return Job.objects.filter(job_type=self.c).filter(status=1).order_by('-timestamp')
        else:
            return Job.objects.filter(status=1).order_by('-timestamp')


class SearchView(generic.ListView):
    """搜索结果页"""
    model = Job
    template_name = 'app/search.html'
    context_object_name = 'job_list'
    paginate_by = 15

    def get_queryset(self):
        query = self.request.GET.get('q', '').strip()
        if query:
            # 使用Q对象进行多字段搜索：职位名称、公司名称、工作地点、职位描述
            return Job.objects.filter(
                Q(position__icontains=query) |
                Q(company__icontains=query) |
                Q(location__icontains=query) |
                Q(description__icontains=query)
            ).filter(status=1).order_by('-timestamp')
        else:
            return Job.objects.none()

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super(SearchView, self).get_context_data(**kwargs)
        paginator = context.get('paginator')
        page = context.get('page_obj')
        page_list = get_page_list(paginator, page)
        query = self.request.GET.get('q', '').strip()

        context['page_list'] = page_list
        context['q'] = query
        context['job_count'] = self.get_queryset().count()
        return context


class DetailView(generic.DetailView):
    """岗位详情页"""
    model = Job
    template_name = 'app/detail.html'
    context_object_name = 'job'

    def get_object(self, queryset=None):
        obj = super().get_object()
        # 增加浏览量
        obj.pv += 1
        obj.save(update_fields=['pv'])
        return obj

    def get_context_data(self, **kwargs):
        context = super(DetailView, self).get_context_data(**kwargs)
        return context


class CommitView(generic.CreateView):
    """岗位发布页"""
    model = Job
    form_class = CommitForm
    template_name = 'app/commit.html'

    @ratelimit(key='ip', rate='100/h')
    def post(self, request, *args, **kwargs):
        was_limited = getattr(request, 'limited', False)
        if was_limited:
            messages.warning(self.request, "操作太频繁了，请1分钟后再试")
            return render(request, 'app/commit.html', {'form': CommitForm()})
        return super().post(request, *args, **kwargs)

    def get_success_url(self):
        messages.success(self.request, "发布成功! 等待审核通过后将会展示")
        return reverse('app:commit')


@require_POST
@csrf_exempt
def verify_turnstile(request):
    """验证 Cloudflare Turnstile token"""
    try:
        data = json.loads(request.body)
        token = data.get('turnstile-token', '')

        if not token:
            return JsonResponse({'success': False, 'error': '缺少验证token'}, status=400)

        # 向 Cloudflare 验证 token
        verify_url = 'https://challenges.cloudflare.com/turnstile/v0/siteverify'
        verify_data = {
            'secret': django_settings.TURNSTILE_SECRET_KEY,
            'response': token,
            'remoteip': get_client_ip(request)
        }

        response = requests.post(verify_url, data=verify_data, timeout=10)
        result = response.json()
        print('verify--->', result)

        if result.get('success'):
            # 可以在 session 中记录验证状态
            request.session['turnstile_verified'] = True
            return JsonResponse({'success': True})
        else:
            return JsonResponse({
                'success': False,
                'error': '验证失败',
                'error_codes': result.get('error-codes', [])
            })

    except json.JSONDecodeError:
        return JsonResponse({'success': False, 'error': '无效的请求数据'}, status=400)
    except requests.RequestException as e:
        return JsonResponse({'success': False, 'error': f'验证服务请求失败: {str(e)}'}, status=500)
    except Exception as e:
        return JsonResponse({'success': False, 'error': f'服务器错误: {str(e)}'}, status=500)


def get_client_ip(request):
    """获取客户端真实IP地址"""
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0].strip()
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip


class AboutView(generic.TemplateView):
    """关于我们页面"""
    template_name = 'app/about.html'


class PrivacyView(generic.TemplateView):
    """隐私政策页面"""
    template_name = 'app/privacy.html'
