#!/usr/bin/env python
# -*- coding:utf-8 -*-
# Author:Irving

from django import forms
from django.forms import widgets
from blog.models import *
from django.core.exceptions import NON_FIELD_ERRORS, ValidationError


class UserForm(forms.Form):
    """
    用户注册表单校验
    """
    user = forms.CharField(max_length=32,
                           label="用户名",
                           widget=widgets.TextInput(attrs={"class": "form-control"})
                           )
    pwd = forms.CharField(max_length=32,
                          label="密码",
                          widget=widgets.PasswordInput(attrs={"class": "form-control"})
                          )
    re_pwd = forms.CharField(max_length=32,
                             label="确认密码",
                             widget=widgets.PasswordInput(attrs={"class": "form-control"})
                             )
    email = forms.EmailField(max_length=32,
                             label="邮箱",
                             widget=widgets.EmailInput(attrs={"class": "form-control"})
                             )

    def clean_user(self):
        """
        用户名局部钩子
        :return:
        """
        user = self.cleaned_data.get("user")
        user_flag = UserInfo.objects.filter(username=user).first()
        if not user_flag:
            return user
        else:
            raise ValidationError("用户名已存在！")

    def clean(self):
        """
        全局钩子：校验两次输入密码是否一致
        :return:
        """
        pwd = self.cleaned_data.get("pwd")
        re_pwd = self.cleaned_data.get("re_pwd")
        if pwd and re_pwd:
            if pwd == re_pwd:
                return self.cleaned_data
            else:
                raise ValidationError("两次密码不一致！")
        else:
            return self.cleaned_data