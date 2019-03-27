import json
from django.shortcuts import render, HttpResponse, redirect
from django.http import JsonResponse
from django.contrib import auth
from blog.utils.validCode import get_valid_code_img
from blog.utils.geetest import GeetestLib
from blog.myforms import *
from django.db.models import Count, F

# Create your views here.
pc_geetest_id = "b46d1900d0a894591916ea94ea91bd2c"
pc_geetest_key = "36fc3fe98530eea08dfc6ce76e3d24c4"


# def login(request):
#     """
#     登录视图函数
#     :param request:
#     :return:
#     """
#     if request.method == "POST":
#         response = {"user": None, "msg": None}
#
#         user = request.POST.get("user")
#         pwd = request.POST.get("pwd")
#
#         # 图片随机验证码
#         # valid_code = request.POST.get("valid_code")
#         # valid_code_str = request.session.get("valid_code_str")
#         # if valid_code.upper() == valid_code_str.upper():
#         #     user = auth.authenticate(username=user, password=pwd)
#         #     if user:
#         #         auth.login(request, user)
#         #         response["user"] = user.username
#         #     else:
#         #         response["msg"] = "user or password wrong!"
#         # else:
#         #     response["msg"] = "valid code error!"
#         gt = GeetestLib(pc_geetest_id, pc_geetest_key)
#         challenge = request.POST.get(gt.FN_CHALLENGE)
#         validate = request.POST.get(gt.FN_VALIDATE)
#         seccode = request.POST.get(gt.FN_SECCODE)
#         status = request.session[gt.GT_STATUS_SESSION_KEY]
#         user_id = request.session["user_id"]
#
#
#         user = auth.authenticate(username=user, password=pwd)
#
#         if user:
#             auth.login(request, user)
#             response["user"] = user.username
#         else:
#             response['msg'] = '用户名密码错误'
#         return JsonResponse(response)
#
#     return render(request, "login2.html")

def login(request):
    # 修改密码
    # user2 = UserInfo.objects.get(username='irving')
    # user2.set_password("zhangshan")
    # user2.save()
    if request.method == "POST":
        # 初始化一个给AJAX返回的数据
        ret = {"status": 0, "msg": ""}
        # 从提交过来的数据中 取到用户名和密码
        username = request.POST.get("username")
        pwd = request.POST.get("password")
        # 获取极验 滑动验证码相关的参数
        gt = GeetestLib(pc_geetest_id, pc_geetest_key)
        challenge = request.POST.get(gt.FN_CHALLENGE, '')
        validate = request.POST.get(gt.FN_VALIDATE, '')
        seccode = request.POST.get(gt.FN_SECCODE, '')
        status = request.session[gt.GT_STATUS_SESSION_KEY]
        user_id = request.session["user_id"]

        if status:
            result = gt.success_validate(challenge, validate, seccode, user_id)
        else:
            result = gt.failback_validate(challenge, validate, seccode)
        if result:
            # 验证码正确
            # 利用auth模块做用户名和密码的校验
            user = auth.authenticate(username=username, password=pwd)

            if user:
                # 用户名密码正确
                # 给用户做登录
                auth.login(request, user)  # 将登录用户赋值给 request.user
                ret["msg"] = "/"
            else:
                # 用户名密码错误
                ret["status"] = 1
                ret["msg"] = "用户名或密码错误！"
        else:
            ret["status"] = 1
            ret["msg"] = "验证码错误"

        return JsonResponse(ret)
    return render(request, "login.html")


def get_validCode_img(request):
    """
    验证码
    :param request:
    :return:
    """
    data = get_valid_code_img(request)
    return HttpResponse(data)


def index(request):
    """
    首页视图函数
    :param request:
    :return:
    """
    article_list = Article.objects.all()

    return render(request, "index.html", {"article_list": article_list})


# 处理极验 获取验证码的视图
def get_geetest(request):
    user_id = 'test'
    gt = GeetestLib(pc_geetest_id, pc_geetest_key)
    status = gt.pre_process(user_id)
    request.session[gt.GT_STATUS_SESSION_KEY] = status
    request.session["user_id"] = user_id
    response_str = gt.get_response_str()
    return HttpResponse(response_str)


def register(request):
    if request.is_ajax():
        form = UserForm(request.POST)
        response = {"user": None, "msg": None}

        if form.is_valid():
            response["user"] = form.cleaned_data.get("user")

            # 生产一条用户记录
            user = form.cleaned_data.get("user")
            pwd = form.cleaned_data.get("pwd")
            email = form.cleaned_data.get("email")
            avatar_obj = request.FILES.get("avatar")

            extra = {}
            if avatar_obj:
                extra['avator'] = avatar_obj
            UserInfo.objects.create_user(username=user, password=pwd, email=email, **extra)



        else:
            print(form.cleaned_data)
            print(form.errors)
            response["msg"] = form.errors

        return JsonResponse(response)

    form = UserForm()
    return render(request, "register.html", {"form": form})


def logout(request):
    """
    用户注册视图函数
    :param request:
    :return:
    """
    auth.logout(request)  # request.session.flush()

    return redirect('/login/')


def home_site(request, username, **kwargs):
    """
    用户站点视图
    :param request:
    :return:
    """
    user_obj = UserInfo.objects.filter(username=username).first()
    # 判断用户是否存在
    if not user_obj:
        return render(request, "not_found.html")

    # 查询当前站点对象
    blog = user_obj.blog

    # 当前用户或则当前站点对应的所有文章
    # 基于对象查询
    # article_list = user_obj.article_set.all()
    # 基于 __
    print(kwargs)
    article_list = Article.objects.filter(user=user_obj)
    if kwargs:
        condition = kwargs.get("condition")
        param = kwargs.get("param")

        if condition == "category":
            article_list = article_list.filter(category__title=param)
        elif condition == "tag":
            article_list = article_list.filter(tags__title=param)
        else:
            year, month = param.split("-")
            article_list = article_list.filter(create_time__year=year, create_time__month=month)

    # 每一个后的表模型.objects.values("pk").annotate(聚合函数(关联表__统计字段)).values('')

    # 查询每一个分类名称以及对应的文章数
    ret = Category.objects.values("pk").annotate(c=Count("article__title")).values_list("title", "c")
    print(ret)

    # 查询当前站点的每一个分类名称以及对应的文章数
    cate_list = Category.objects.filter(blog=blog).values("pk").annotate(c=Count("article__title")).values_list("title",
                                                                                                                "c")
    print(cate_list)

    # 查询当前站点的每一个标签名称以及对应的文章数
    tag_list = Tag.objects.filter(blog=blog).values("pk").annotate(c=Count("article__title")).values_list("title", "c")
    print(tag_list)

    # 查询当前站点每一个年月的名称以及对应的文章数
    # ret2 = Article.objects.extra(select={"is_recent": "create_time > '2017-09-15'"}).values_list("title", "is_recent")
    # print(ret2)

    # 方式1
    date_list = Article.objects.filter(user=user_obj).extra(
        select={"y_m_date": "date_format(create_time, '%%Y-%%m')"}).values("y_m_date").annotate(
        c=Count("nid")).values_list("y_m_date", "c")
    print(date_list)

    # 方式2
    from django.db.models.functions import TruncMonth
    ret4 = Article.objects.filter(user=user_obj).annotate(month=TruncMonth("create_time")).values("month").annotate(
        c=Count("nid")).values_list("month", "c")
    print(ret4)

    return render(request, "home_site.html", {"user_obj": user_obj,
                                              "blog": blog,
                                              "cate_list": cate_list,
                                              "tag_list": tag_list,
                                              "date_list": date_list,
                                              "article_list": article_list})


def get_classisfication_data(username):
    """
    获取分类数据
    :param username:
    :return:
    """
    user_obj = UserInfo.objects.filter(username=username).first()

    blog = user_obj.blog

    cate_list = Category.objects.filter(blog=blog).values("pk").annotate(c=Count("article__title")).values_list("title",
                                                                                                                "c")

    tag_list = Tag.objects.filter(blog=blog).values("pk").annotate(c=Count("article__title")).values_list("title", "c")

    date_list = Article.objects.filter(user=user_obj).extra(
        select={"y_m_date": "date_format(create_time, '%%Y-%%m')"}).values("y_m_date").annotate(
        c=Count("nid")).values_list("y_m_date", "c")

    return {"user_obj": user_obj, "blog": blog, "cate_list": cate_list, "tag_list": tag_list, "date_list": date_list}


def article_detail(request, username, article_id):
    """
    文章详情页
    :param request: 
    :param username: 
    :param article_id: 
    :return: 
    """
    print(1, username)
    user_obj = UserInfo.objects.filter(username=username).first()
    # print(user)
    blog = user_obj.blog

    article_obj = Article.objects.filter(pk=article_id).first()

    return render(request, "article_detail.html", locals())


def digg(request):
    """
    点赞操作视图
    :param request:
    :return:
    """
    print(request.POST)

    article_id = request.POST.get("article_id")
    is_up = json.loads(request.POST.get("is_up"))
    user_id = request.user.pk

    obj = ArticleUpDown.objects.filter(article_id=article_id, user_id=user_id).first()
    response = {"state": True}
    if not obj:
        ard = ArticleUpDown.objects.create(user_id=user_id, article_id=article_id, is_up=is_up)
        queryset = Article.objects.filter(pk=article_id)
        if is_up:
            queryset.update(up_count=F("up_count") + 1)
        else:
            queryset.update(down_count=F("up_count") + 1)
    else:
        response["state"] = False
        response["handled"] = obj.is_up


    return JsonResponse(response)
