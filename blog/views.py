from django.shortcuts import render, HttpResponse
from django.http import JsonResponse
from django.contrib import auth
from blog.utils.validCode import get_valid_code_img
from blog.utils.geetest import GeetestLib
from blog.myforms import *

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
                ret["msg"] = "/index/"
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
    return render(request, "index.html")


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

        else:
            print(form.cleaned_data)
            print(form.errors)
            response["msg"] = form.errors

        return JsonResponse(response)


    form = UserForm()
    return render(request, "register.html", {"form": form})
