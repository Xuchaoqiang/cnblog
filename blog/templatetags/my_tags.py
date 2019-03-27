#!/usr/bin/env python
# -*- coding:utf-8 -*-
# Author:Irving

from django import template
from blog.models import *
from django.db.models import Count


register = template.Library()

@register.inclusion_tag("classification.html")
def get_classifcation_style(username):
    user_obj = UserInfo.objects.filter(username=username).first()

    blog = user_obj.blog

    cate_list = Category.objects.filter(blog=blog).values("pk").annotate(c=Count("article__title")).values_list("title",
                                                                                                                "c")

    tag_list = Tag.objects.filter(blog=blog).values("pk").annotate(c=Count("article__title")).values_list("title", "c")

    date_list = Article.objects.filter(user=user_obj).extra(
        select={"y_m_date": "date_format(create_time, '%%Y-%%m')"}).values("y_m_date").annotate(
        c=Count("nid")).values_list("y_m_date", "c")

    return {"user_obj": user_obj, "blog": blog, "cate_list": cate_list, "tag_list": tag_list, "date_list": date_list}