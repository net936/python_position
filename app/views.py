from django.contrib import messages
from django.shortcuts import render

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
        return context

    def get_queryset(self):
        self.c = self.request.GET.get("c", None)
        if self.c:
            return Job.objects.filter(job_type=self.c).filter(status=1).order_by('-timestamp')
        else:
            return Job.objects.filter(status=1).order_by('-timestamp')


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
