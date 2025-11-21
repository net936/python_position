from django.db import models

# Create your models here.

class Job(models.Model):
    """岗位模型"""

    # 职位类型选择
    JOB_TYPE_CHOICES = [
        (0, '全职'),
        (1, '兼职'),
        (2, '实习'),
        (3, '外包'),
    ]

    # 经验要求选择
    EXPERIENCE_CHOICES = [
        (0, '不限'),
        (1, '1年以下'),
        (2, '1-3年'),
        (3, '3-5年'),
        (4, '5-10年'),
        (5, '10年以上'),
    ]

    # 学历要求选择
    EDUCATION_CHOICES = [
        (0, '不限'),
        (1, '初中及以下'),
        (2, '高中/中专'),
        (3, '大专'),
        (4, '本科'),
        (5, '硕士'),
        (6, '博士'),
    ]

    list_display = ("position", "company", "location", "job_type")

    # 基本信息
    position = models.CharField(max_length=100, verbose_name='职位名称')
    company = models.CharField(max_length=200, verbose_name='公司名称')
    job_type = models.IntegerField(choices=JOB_TYPE_CHOICES, default=0, verbose_name='职位类型')

    # 薪资信息
    salary_min = models.IntegerField(default=0, verbose_name='最低薪资(K)')
    salary_max = models.IntegerField(default=0, verbose_name='最高薪资(K)')

    # 要求
    experience = models.IntegerField(choices=EXPERIENCE_CHOICES, default=0, verbose_name='经验要求')
    education = models.IntegerField(choices=EDUCATION_CHOICES, default=0, verbose_name='学历要求')

    # 职位描述
    description = models.TextField(blank=True, null=True, verbose_name='职位描述')

    # 工作地点
    location = models.CharField(max_length=100, verbose_name='工作地点')

    # 联系方式
    contact = models.CharField(max_length=50, verbose_name='联系人')
    phone = models.CharField(max_length=20, verbose_name='联系电话')
    email = models.EmailField(max_length=100, blank=True, null=True, verbose_name='邮箱')

    # 状态和统计
    status = models.BooleanField(default=False, verbose_name='审核状态')
    pv = models.IntegerField(default=0, verbose_name='浏览量')
    timestamp = models.DateTimeField(auto_now_add=True, verbose_name='发布时间')
    expire = models.IntegerField(default=7, verbose_name='有效期(天)')

    def __str__(self):
        return f"{self.company} - {self.position}"

    def get_salary_range(self):
        """获取薪资范围显示"""
        if self.salary_min > 0 and self.salary_max > 0:
            return f"{self.salary_min}K-{self.salary_max}K"
        elif self.salary_min > 0:
            return f"{self.salary_min}K以上"
        else:
            return "面议"

    class Meta:
        db_table = "job_position"
        verbose_name = "招聘岗位"
        verbose_name_plural = "招聘岗位"
        ordering = ['-timestamp']
