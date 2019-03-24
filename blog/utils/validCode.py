#!/usr/bin/env python
# -*- coding:utf-8 -*-
# Author:Irving
import random
from PIL import Image, ImageDraw, ImageFont
from io import BytesIO


def get_random_color():
    """
    生成随机验证码图片背景色
    :return:
    """
    return (random.randint(0, 255), random.randint(0, 255), random.randint(0, 255))


def get_valid_code_img(request):


    # 生成一张随机背景色的图片 在硬盘中存储
    # img = Image.new("RGB", (270, 40), color=get_random_color())
    #
    # with open("valiCode.png", "wb") as f:
    #     img.save(f, "png")
    #
    # with open("valiCode.png", "rb") as f:
    #     data = f.read()

    # 生成一张固定字体，背景色随机的验证码图片 在内存中存储

    # img = Image.new("RGB", (270, 40), color=get_random_color())
    #
    # draw = ImageDraw.Draw(img)
    # hara_font = ImageFont.truetype("static/font/Hara.otf", size=28)
    # draw.text((0, 5), "python", get_random_color(), font=hara_font)
    #
    # f = BytesIO()
    # img.save(f, "png")
    # data = f.getvalue()

    # 生成一张字体颜色随机，背景色随机的验证码图片 在内存中存储
    img = Image.new("RGB", (270, 40), color=get_random_color())
    draw = ImageDraw.Draw(img)
    hara_font = ImageFont.truetype("static/font/Hara.otf", size=32)
    valid_code_str = ""

    for i in range(5):
        random_num = str(random.randint(0, 9))
        random_low_alpha = chr(random.randint(95, 122))
        random_upper_alpha = chr(random.randint(65, 90))
        random_char = random.choice([random_num, random_low_alpha, random_upper_alpha])

        valid_code_str += random_char

        draw.text((i * 60, 5), random_char, get_random_color(), font=hara_font)

    # width = 270
    # height = 40
    # # 噪点
    # for i in range(10):
    #     x1 = random.randint(0, width)
    #     x2 = random.randint(0, width)
    #     y1 = random.randint(0, height)
    #     y2 = random.randint(0, height)
    #     draw.line((x1, x2, y1, y2), fill=get_random_color())
    # # 噪线
    # for i in range(100):
    #     draw.point([random.randint(0, width), random.randint(0, height)], fill=get_random_color())
    #     x = random.randint(0, width)
    #     y = random.randint(0, height)
    #     draw.arc((x, y, x + 4, y + 4), 0, 90, fill=get_random_color())

    # 把验证的值放到session里面
    print("valid_code_str", valid_code_str)

    request.session["valid_code_str"] = valid_code_str

    f = BytesIO()
    img.save(f, "png")
    data = f.getvalue()

    return data
