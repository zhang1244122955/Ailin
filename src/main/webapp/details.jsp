<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/31
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.zz624.entry.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="../res/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="../res/layui/css/layui.css">
    <script type="text/javascript" src="../res/layui/layui.js"></script>
    <script type="text/javascript" src="../res/static/js/jquery-1.7.1.min.js"></script>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<body>

<div class="site-nav-bg">
    <div class="site-nav w1200">
        <p class="sn-back-home">
            <i class="layui-icon layui-icon-home"></i>
            <a href="index.jsp">首页</a>
        </p>
        <div class="sn-quick-menu">
            <%
                User user = (User) request.getSession().getAttribute("user");
                if (user != null) {
            %>
            <div class="login"><a href="#"><%=user.getPhone()%>
            </a></div>
            <div class="sp-cart"><a href="shopcart.jsp?userid=<%=user.getId()%>">购物车</a></div>
            <%} else {%>
            <div class="login"><a href="login.jsp">登录</a></div>
            <div class="sp-cart"><a href="login.jsp">购物车</a></div>
            <%}%>
        </div>
    </div>
</div>


<div class="header">
    <div class="headerLayout w1200">
        <div class="headerCon">
            <h1 class="mallLogo">
                <a href="index.jsp" title="母婴商城">
                    <img src="../res/static/img/logo.png">
                </a>
            </h1>
            <div class="mallSearch">
                <form action="" class="layui-form" novalidate>
                    <input type="text" name="title" required lay-verify="required" autocomplete="off"
                           class="layui-input" placeholder="请输入需要的商品">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">
                        <i class="layui-icon layui-icon-search"></i>
                    </button>
                    <input type="hidden" name="" value="">
                </form>
            </div>
        </div>
    </div>
</div>


<div class="content content-nav-base datails-content">
    <div class="main-nav">
        <div class="inner-cont0">
            <div class="inner-cont1 w1200">
                <div class="inner-cont2">
                    <a href="commodity.html" class="active">所有商品</a>
                    <a href="buytoday.html">今日团购</a>
                    <a href="information.html">母婴资讯</a>
                    <a href="about.html">关于我们</a>
                </div>
            </div>
        </div>
    </div>
    <div class="data-cont-wrap w1200">
        <div class="crumb">
            <a href="javascript:;">首页</a>
            <span>></span>
            <a href="javascript:;">所有商品</a>
            <span>></span>
            <a href="javascript:;">产品详情</a>
        </div>
        <div class="product-intro layui-clear">
            <div class="preview-wrap">
                <a href="javascript:;"><img src="../res/static/img/details_img1.jpg"></a>
            </div>
            <div class="itemInfo-wrap">
                <div class="itemInfo">
                    <div class="title">
                        <h4>男女宝宝秋冬装套装0一1岁婴儿衣服潮加厚连体衣保暖冬季外出抱衣 </h4>
                    </div>
                    <div class="summary" style="height:70px">
                        <p class="activity"><span>活动价</span><strong class="price"><i>￥</i><span
                                id="price"></span></strong></p>
                    </div>
                    <div class="choose-attrs">
                        <div class="color layui-clear"><span class="title">颜&nbsp;&nbsp;&nbsp;&nbsp;色</span>
                            <div class="color-cont"></div>
                        </div>
                        <input id="color" hidden="hidden">
                        <%--<div class="size layui-clear"><span class="title">规&nbsp;&nbsp;&nbsp;&nbsp;格</span> <div class="size-cont"></div></div>--%>
                        <%--<input id="size" hidden="hidden">--%>
                        <div class="number layui-clear"><span class="title">数&nbsp;&nbsp;&nbsp;&nbsp;量</span>
                            <div class="number-cont"><span class="cut btn">-</span><input
                                    onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                    onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                    maxlength="4" type="" name="" value="1"><span class="add btn">+</span></div>
                        </div>
                    </div>
                    <div class="choose-btns">
                        <button class="layui-btn  layui-btn-danger car-btn" id="addshopcart"><i
                                class="layui-icon layui-icon-cart-simple"></i>加入购物车
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-clear">
            <div class="aside">
                <h4>热销推荐</h4>
                <div class="item-list">
                    <div class="item">
                        <img src="../res/static/img/details_img2.jpg">
                        <p><span>可爱宝宝粉色连体秋裤</span><span class="pric">￥99.00</span></p>
                    </div>
                    <div class="item">
                        <img src="../res/static/img/details_img2.jpg">
                        <p><span>可爱宝宝粉色连体秋裤</span><span class="pric">￥99.00</span></p>
                    </div>
                    <div class="item">
                        <img src="../res/static/img/details_img2.jpg">
                        <p><span>可爱宝宝粉色连体秋裤</span><span class="pric">￥99.00</span></p>
                    </div>
                    <div class="item">
                        <img src="../res/static/img/details_img2.jpg">
                        <p><span>可爱宝宝粉色连体秋裤</span><span class="pric">￥99.00</span></p>
                    </div>
                    <div class="item">
                        <img src="../res/static/img/details_img2.jpg">
                        <p><span>可爱宝宝粉色连体秋裤</span><span class="pric">￥99.00</span></p>
                    </div>
                    <div class="item">
                        <img src="../res/static/img/details_img2.jpg">
                        <p><span>可爱宝宝粉色连体秋裤</span><span class="pric">￥99.00</span></p>
                    </div>
                </div>
            </div>
            <div class="detail">
                <h4>详情</h4>
                <div class="item">
                    <img src="../res/static/img/details_imgbig.jpg">
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    layui.use(['layer', 'jquery'], function () {
        var layer = layui.layer, $ = layui.$;
        var cur = $('.number-cont input').val();
        var d;

        $.getUrlParam = function (name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]);
            return null;
        }

        $.ajax({
            type: "POST",
            url: "getGoodsById",
            data: {
                "id": $.getUrlParam('id')
            },
            success: function (data) {
                data = eval(data);
                d = data[0];
                console.log(data);
                $("#price").html(data[0].details[0].price);
                for (var i = 0; i < data[0].details.length; i++) {
                    $(".color-cont").append("<span class=\"btn\">" + data[0].details[i].color + "(" + data[0].details[i].size + ")" + "</span>");
                }
                $('.color-cont .btn').on('click', function () {
                    $('.color-cont .btn').attr("class", "btn");
                    $(this).addClass("active");
                    $('#color').val($(this).html());
                    for (var i = 0; i < d.details.length; i++) {
                        if ($(this).html() == d.details[i].color + "(" + d.details[i].size + ")") {
                            $("#price").html(d.details[i].price);
                        }
                    }
                })
                $('.size-cont .btn').on('click', function () {
                    $('.size-cont .btn').attr("class", "btn");
                    $(this).addClass("active");
                    $('#size').val($(this).html());
                    for (var i = 0; i < d.details.length; i++) {
                        if ($(this).html() == d.details[i].color) {
                            $("#price").html(d.details[i].price);
                        }
                    }
                })
            }
        });

        $('.number-cont .btn').on('click', function () {
            if ($(this).hasClass('add')) {
                cur++;

            } else {
                if (cur > 1) {
                    cur--;
                }
            }
            $('.number-cont input').val(cur)
        })


        $('.car-btn').on('click', function () {
            if ($('#color').val() == "") {
                layer.msg("请选择规格", {
                    icon: 1,
                    time: 1000
                });
            } else {
                var userid = <%=user == null?0:user.getId()%>;
                if (userid == 0) {
                    location.href="login.jsp";
                } else {
                    $.ajax({
                        type: "POST",
                        url: "setShopcarByUserId",
                        data: {
                            "userid":userid,
                            "goodsid": $.getUrlParam('id'),
                            "color": $('#color').val(),
                            "price": $("#price").html(),
                            "flag": 0,
                            "number": $('.number-cont input').val(),
                            "goodsname": d.goodsname,
                            "url": d.imagesrc,
                            "category": d.category
                        },
                        success: function (data) {
                            console.log(data);
                            if ("000" == data) {
                                layer.msg('添加购物车成功', {
                                    icon: 1,
                                    time: 1000
                                });
                            } else if ("001" == data) {
                                layer.msg('添加购物车失败，请稍后再试', {
                                    icon: 5,
                                    time: 1000
                                });
                            }
                        },
                        error: function () {
                            layer.msg('服务器异常，请稍后再试', {
                                icon: 5,
                                time: 1000
                            });
                        }
                    });
                }

            }


        })
    });
</script>


</body>
</html>