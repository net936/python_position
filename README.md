# 在线招聘平台

<div align="center">

![Python Version](https://img.shields.io/badge/python-3.7+-blue.svg)
![Django Version](https://img.shields.io/badge/django-3.2-green.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

基于 Python Django 开发的在线招聘平台，支持岗位发布、浏览和管理功能。

[演示地址](http://server.gitapp.cn) | [功能特性](#功能特性) | [快速开始](#快速开始) | [开发文档](#开发文档)

</div>

---

## 📋 目录

- [项目简介](#项目简介)
- [功能特性](#功能特性)
- [技术栈](#技术栈)
- [快速开始](#快速开始)
  - [环境要求](#环境要求)
  - [安装步骤](#安装步骤)
- [项目结构](#项目结构)
- [开发文档](#开发文档)
  - [模型说明](#模型说明)
  - [视图说明](#视图说明)
  - [后台管理](#后台管理)
- [配置说明](#配置说明)
- [部署指南](#部署指南)
- [常见问题](#常见问题)
- [许可证](#许可证)
- [联系方式](#联系方式)

---

## 📖 项目简介

该项目是基于 Python Django 框架开发的在线招聘平台，旨在为企业和求职者提供一个便捷的岗位发布和浏览平台。系统采用前后端不分离的传统 Web 开发模式，使用 Django 模板引擎渲染页面，简单易用，适合中小型招聘需求。

**开发环境：** Django 3.2 + Python 3.7+ + MySQL 5.7

---

## ✨ 功能特性

### 核心功能

- **岗位管理**
  - ✅ 岗位发布：支持发布全职、兼职、实习、外包等多种类型的岗位
  - ✅ 岗位浏览：按职位类型筛选，分页展示岗位列表
  - ✅ 岗位详情：查看完整的岗位信息，包括薪资、要求、描述等
  - ✅ 浏览统计：自动统计岗位浏览次数

- **薪资管理**
  - ✅ 支持薪资范围设置（最低-最高薪资）
  - ✅ 灵活的薪资显示（范围/起薪/面议）

- **任职要求**
  - ✅ 工作经验要求（不限、1年以下、1-3年、3-5年、5-10年、10年以上）
  - ✅ 学历要求（不限、初中、高中/中专、大专、本科、硕士、博士）

- **联系方式**
  - ✅ 支持电话和邮箱联系
  - ✅ 岗位过期后隐藏联系方式

- **后台管理**
  - ✅ 岗位审核：管理员可审核岗位是否展示
  - ✅ 岗位管理：支持搜索、筛选、编辑、删除
  - ✅ 数据统计：浏览量统计

- **其他功能**
  - ✅ 分页显示
  - ✅ 类型筛选
  - ✅ 有效期管理
  - ✅ 频率限制（防止恶意提交）

---

## 🛠 技术栈

### 后端技术

- **框架：** Django 3.2
- **语言：** Python 3.7+
- **数据库：** MySQL 5.7 / SQLite3
- **ORM：** Django ORM
- **模板引擎：** Django Templates

### 前端技术

- **UI框架：** Semantic UI 2.4.1
- **JavaScript库：** jQuery 3.7.0
- **样式：** CSS3

### 其他

- **频率限制：** django-ratelimit
- **版本控制：** Git

---

## 🚀 快速开始

### 环境要求

- Python 3.7 或更高版本
- MySQL 5.7 或更高版本（可选，默认使用 SQLite）
- pip（Python 包管理工具）

### 安装步骤

1. **克隆项目**

   ```bash
   git clone https://github.com/yourusername/python_position.git
   cd python_position
   ```

2. **创建虚拟环境**（推荐）

   ```bash
   python -m venv venv

   # Windows
   venv\Scripts\activate

   # Linux/Mac
   source venv/bin/activate
   ```

3. **安装依赖包**

   ```bash
   pip install -r requirements.txt
   ```

4. **配置数据库**

   编辑 `server/settings.py` 文件，根据需要配置数据库：

   ```python
   # 使用 MySQL（推荐）
   DATABASES = {
       'default': {
           'ENGINE': 'django.db.backends.mysql',
           'NAME': 'job_recruitment',
           'USER': 'root',
           'PASSWORD': 'your_password',
           'HOST': 'localhost',
           'PORT': '3306',
       }
   }

   # 或使用 SQLite（开发测试）
   DATABASES = {
       'default': {
           'ENGINE': 'django.db.backends.sqlite3',
           'NAME': BASE_DIR / 'db.sqlite3',
       }
   }
   ```

5. **执行数据库迁移**

   ```bash
   python manage.py makemigrations
   python manage.py migrate
   ```

6. **创建超级管理员**

   ```bash
   python manage.py createsuperuser
   ```

7. **运行开发服务器**

   ```bash
   python manage.py runserver
   ```

8. **访问应用**

   - 前台首页：http://127.0.0.1:8000/
   - 后台管理：http://127.0.0.1:8000/admin/

---

## 📁 项目结构

```
python_position/
├── app/                          # 主应用目录
│   ├── migrations/               # 数据库迁移文件
│   ├── templatetags/             # 自定义模板标签
│   │   └── app_tag.py           # 过期检查标签
│   ├── __init__.py
│   ├── admin.py                 # 后台管理配置
│   ├── apps.py                  # 应用配置
│   ├── forms.py                 # 表单定义
│   ├── models.py                # 数据模型（Job模型）
│   ├── tests.py                 # 测试文件
│   ├── urls.py                  # URL路由
│   └── views.py                 # 视图逻辑
│
├── server/                         # 项目配置目录
│   ├── __init__.py
│   ├── settings.py              # Django设置
│   ├── urls.py                  # 根URL配置
│   └── wsgi.py                  # WSGI配置
│
├── templates/                    # 模板目录
│   ├── app/                     # 应用模板
│   │   ├── index.html          # 岗位列表页
│   │   ├── detail.html         # 岗位详情页
│   │   └── commit.html         # 岗位发布页
│   └── base/                    # 基础模板
│       ├── base.html           # 基础模板
│       ├── header.html         # 页头
│       ├── footer.html         # 页脚
│       ├── page_nav.html       # 分页导航
│       ├── form_errors.html    # 表单错误
│       └── form_messages.html  # 表单消息
│
├── static/                       # 静态文件目录
│   ├── css/                     # 样式文件
│   ├── js/                      # JavaScript文件
│   └── img/                     # 图片资源
│
├── helpers.py                    # 辅助函数
├── manage.py                     # Django管理脚本
├── requirements.txt              # 项目依赖
└── README.md                     # 项目说明文档
```

---

## 📚 开发文档

### 模型说明

#### Job 模型（岗位模型）

位置：`app/models.py`

| 字段 | 类型 | 说明 |
|------|------|------|
| position | CharField | 职位名称 |
| company | CharField | 公司名称 |
| job_type | IntegerField | 职位类型（0:全职, 1:兼职, 2:实习, 3:外包） |
| salary_min | IntegerField | 最低薪资（K/月） |
| salary_max | IntegerField | 最高薪资（K/月） |
| experience | IntegerField | 工作经验要求 |
| education | IntegerField | 学历要求 |
| description | TextField | 职位描述 |
| location | CharField | 工作地点 |
| contact | CharField | 联系人 |
| phone | CharField | 联系电话 |
| email | EmailField | 邮箱 |
| status | BooleanField | 审核状态 |
| pv | IntegerField | 浏览量 |
| timestamp | DateTimeField | 发布时间 |
| expire | IntegerField | 有效期（天） |

**主要方法：**

- `get_salary_range()`: 返回格式化的薪资范围字符串

### 视图说明

#### IndexView（岗位列表）

- **类型：** ListView
- **模板：** `app/index.html`
- **功能：** 展示岗位列表，支持按职位类型筛选
- **分页：** 每页15条记录

#### DetailView（岗位详情）

- **类型：** DetailView
- **模板：** `app/detail.html`
- **功能：** 展示岗位详细信息，自动统计浏览量

#### CommitView（岗位发布）

- **类型：** CreateView
- **模板：** `app/commit.html`
- **功能：** 发布新岗位
- **限制：** 每IP每小时最多100次提交

### 后台管理

#### JobAdmin 配置

- **列表显示：** 职位、公司、类型、地点、薪资、状态、时间、浏览量
- **筛选器：** 状态、职位类型、经验、学历、时间
- **搜索：** 职位名称、公司名称、地点、描述
- **可编辑：** 审核状态
- **字段分组：** 基本信息、薪资要求、任职要求、联系方式、状态信息

---

## ⚙️ 配置说明

### 数据库配置

在 `server/settings.py` 中修改：

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': '数据库名',
        'USER': '用户名',
        'PASSWORD': '密码',
        'HOST': '主机地址',
        'PORT': '端口',
    }
}
```

### 静态文件配置

```python
STATIC_URL = '/static/'
STATICFILES_DIRS = [BASE_DIR / 'static']
STATIC_ROOT = BASE_DIR / 'staticfiles'
```

### 频率限制配置

在视图中使用装饰器：

```python
@ratelimit(key='ip', rate='100/h')  # 每小时100次
```

---

## 🚀 部署指南

### 1. 收集静态文件

```bash
python manage.py collectstatic
```

### 2. 配置生产环境

在 `settings.py` 中：

```python
DEBUG = False
ALLOWED_HOSTS = ['your-domain.com', 'www.your-domain.com']
```

### 3. 使用 Gunicorn + Nginx

安装 Gunicorn：

```bash
pip install gunicorn
```

启动 Gunicorn：

```bash
gunicorn server.wsgi:application --bind 0.0.0.0:8000
```

配置 Nginx：

```nginx
server {
    listen 80;
    server_name your-domain.com;

    location /static/ {
        alias /path/to/staticfiles/;
    }

    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

---

## ❓ 常见问题

### 1. 数据库迁移错误

**问题：** `No changes detected`

**解决：**
```bash
python manage.py makemigrations app
python manage.py migrate
```

### 2. 静态文件404

**解决：** 确保在 `settings.py` 中正确配置 `STATICFILES_DIRS`

### 3. MySQL连接错误

**解决：** 安装 MySQL 客户端库
```bash
pip install mysqlclient
# 或
pip install pymysql
```

### 4. 频率限制不生效

**解决：** 确保已安装 `django-ratelimit`
```bash
pip install django-ratelimit
```

---

 

## 🤝 贡献指南

欢迎贡献代码！请遵循以下步骤：

1. Fork 本仓库
2. 创建您的特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交您的更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 打开一个 Pull Request

### 代码规范

- 遵循 PEP 8 Python 代码规范
- 添加适当的注释和文档字符串
- 编写单元测试

---

## 📄 许可证

本项目采用 MIT 许可证。详情请参阅 [LICENSE](LICENSE) 文件。

```
MIT License

Copyright (c) 2024 在线招聘平台

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

## 📧 联系方式

- **作者：** Python招聘平台开发团队
- **GitHub：** [https://github.com/geeeeeeeek/](https://github.com/geeeeeeeek/)
- **问题反馈：** 请在 GitHub Issues 中提交

---

## 🙏 鸣谢

感谢以下开源项目：

- [Django](https://www.djangoproject.com/) - Web 框架
- [Semantic UI](https://semantic-ui.com/) - UI 框架
- [jQuery](https://jquery.com/) - JavaScript 库

---

<div align="center">

**如果这个项目对您有帮助，请给一个 ⭐️ Star 支持一下！**

Made with ❤️ by Python Developers

</div>