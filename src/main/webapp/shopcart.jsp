<%@ page import="com.zz624.entry.User" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="/res/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="/res/layui/css/layui.css">
    <script type="text/javascript" src="/res/layui/layui.js"></script>
    <script type="text/javascript" src="/res/static/js/jquery-1.7.1.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
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
                User user = (User)request.getSession().getAttribute("user");
                if(user != null){
            %>
            <div class="login"><a href="#"><%=user.getPhone()%></a></div>
            <%}else{%>
            <div class="login"><a href="login.jsp">登录</a></div>
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
                    <input type="text" name="title" required  lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入需要的商品">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">
                        <i class="layui-icon layui-icon-search"></i>
                    </button>
                    <input type="hidden" name="" value="">
                </form>
            </div>
        </div>
    </div>
</div>


<div class="content content-nav-base shopcart-content">
    <div class="main-nav">
        <div class="inner-cont0">
            <div class="inner-cont1 w1200">
                <div class="inner-cont2">
                    <a href="commodity.jsp" class="active">所有商品</a>
                    <a href="buytoday.jsp">今日团购</a>
                    <a href="information.jsp">母婴资讯</a>
                    <a href="about.jsp">关于我们</a>
                </div>
            </div>
        </div>
    </div>
    <div class="banner-bg w1200">
        <h3>夏季清仓</h3>
        <p>宝宝被子、宝宝衣服3折起</p>
    </div>
    <div class="cart w1200">
        <div class="cart-table-th">
            <div class="th th-chk">
                <div class="select-all">
                    <div class="cart-checkbox">
                        <input class="check-all check" id="allCheckked" type="checkbox" value="true">
                    </div>
                    <label>&nbsp;&nbsp;全选</label>
                </div>
            </div>
            <div class="th th-item">
                <div class="th-inner">
                    商品
                </div>
            </div>
            <div class="th th-price">
                <div class="th-inner">
                    单价
                </div>
            </div>
            <div class="th th-amount">
                <div class="th-inner">
                    数量
                </div>
            </div>
            <div class="th th-sum">
                <div class="th-inner">
                    小计
                </div>
            </div>
            <div class="th th-op">
                <div class="th-inner">
                    操作
                </div>
            </div>
        </div>
        <div class="OrderList">
            <div class="order-content" id="list-cont">
                <ul class="item-content layui-clear">
                    <li class="th th-chk">
                        <div class="select-all">
                            <div class="cart-checkbox">
                                <input class="CheckBoxShop check" id="" type="checkbox" num="all" name="select-all" value="true">
                            </div>
                        </div>
                    </li>
                    <li class="th th-item">
                        <div class="item-cont">
                            <a href="javascript:;"><img src="../res/static/img/paging_img1.jpg" alt=""></a>
                            <div class="text">
                                <div class="title">宝宝T恤棉质小衫</div>
                                <p><span>粉色</span>  <span>130</span>cm</p>
                            </div>
                        </div>
                    </li>
                    <li class="th th-price">
                        <span class="th-su">189.00</span>
                    </li>
                    <li class="th th-amount">
                        <div class="box-btn layui-clear">
                            <div class="less layui-btn">-</div>
                            <input class="Quantity-input" type="" name="" value="1" disabled="disabled">
                            <div class="add layui-btn">+</div>
                        </div>
                    </li>
                    <li class="th th-sum">
                        <span class="sum">189.00</span>
                    </li>
                    <li class="th th-op">
                        <span class="dele-btn">删除</span>
                    </li>
                </ul>
                <ul class="item-content layui-clear">
                    <li class="th th-chk">
                        <div class="select-all">
                            <div class="cart-checkbox">
                                <input class="CheckBoxShop check" id="" type="checkbox" num="all" name="select-all" value="true">
                            </div>
                        </div>
                    </li>
                    <li class="th th-item">
                        <div class="item-cont">
                            <a href="javascript:;"><img src="../res/static/img/paging_img2.jpg" alt=""></a>
                            <div class="text">
                                <div class="title">宝宝T恤棉质小衫</div>
                                <p><span>粉色</span>  <span>130</span>cm</p>
                            </div>
                        </div>
                    </li>
                    <li class="th th-price">
                        <span class="th-su">189.00</span>
                    </li>
                    <li class="th th-amount">
                        <div class="box-btn layui-clear">
                            <div class="less layui-btn">-</div>
                            <input class="Quantity-input" type="" name="" value="1" disabled="disabled">
                            <div class="add layui-btn">+</div>
                        </div>
                    </li>
                    <li class="th th-sum">
                        <span class="sum">189.00</span>
                    </li>
                    <li class="th th-op">
                        <span class="dele-btn">删除</span>
                    </li>
                </ul>
                <ul class="item-content layui-clear">
                    <li class="th th-chk">
                        <div class="select-all">
                            <div class="cart-checkbox">
                                <input class="CheckBoxShop check" id="" type="checkbox" num="all" name="select-all" value="true">
                            </div>
                        </div>
                    </li>
                    <li class="th th-item">
                        <div class="item-cont">
                            <a href="javascript:;"><img src="../res/static/img/paging_img3.jpg" alt=""></a>
                            <div class="text">
                                <div class="title">宝宝T恤棉质小衫</div>
                                <p><span>粉色</span>  <span>130</span>cm</p>
                            </div>
                        </div>
                    </li>
                    <li class="th th-price">
                        <span class="th-su">189.00</span>
                    </li>
                    <li class="th th-amount">
                        <div class="box-btn layui-clear">
                            <div class="less layui-btn">-</div>
                            <input class="Quantity-input" type="" name="" value="1" disabled="disabled">
                            <div class="add layui-btn">+</div>
                        </div>
                    </li>
                    <li class="th th-sum">
                        <span class="sum">189.00</span>
                    </li>
                    <li class="th th-op">
                        <span class="dele-btn">删除</span>
                    </li>
                </ul>
            </div>
        </div>


        <!-- 模版导入数据 -->
        <!-- <script type="text/html" id="demo">
          {{# layui.each(d.infoList,function(index,item){}}
            <ul class="item-content layui-clear">
              <li class="th th-chk">
                <div class="select-all">
                  <div class="cart-checkbox">
                    <input class="CheckBoxShop check" id="" type="checkbox" num="all" name="select-all" value="true">
                  </div>
                </div>
              </li>
              <li class="th th-item">
                <div class="item-cont">
                  <a href="javascript:;"><img src="../res/static/img/paging_img1.jpg" alt=""></a>
                  <div class="text">
                    <div class="title">宝宝T恤棉质小衫</div>
                    <p><span>粉色</span>  <span>130</span>cm</p>
                  </div>
                </div>
              </li>
              <li class="th th-price">
                <span class="th-su">189.00</span>
              </li>
              <li class="th th-amount">
                <div class="box-btn layui-clear">
                  <div class="less layui-btn">-</div>
                  <input class="Quantity-input" type="" name="" value="1" disabled="disabled">
                  <div class="add layui-btn">+</div>
                </div>
              </li>
              <li class="th th-sum">
                <span class="sum">189.00</span>
              </li>
              <li class="th th-op">
                <span class="dele-btn">删除</span>
              </li>
            </ul>
          {{# });}}
        </script> -->


        <div class="FloatBarHolder layui-clear">
            <div class="th th-chk">
                <div class="select-all">
                    <div class="cart-checkbox">
                        <input class="check-all check" id="" name="select-all" type="checkbox"  value="true">
                    </div>
                    <label>&nbsp;&nbsp;已选<span class="Selected-pieces">0</span>件</label>
                </div>
            </div>
            <div class="th batch-deletion">
                <span class="batch-dele-btn">批量删除</span>
            </div>
            <div class="th Settlement">
                <button class="layui-btn">结算</button>
            </div>
            <div class="th total">
                <p>应付：<span class="pieces-total">0</span></p>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    layui.config({
        base: '../res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
    }).use(['layer','jquery','element','car'],function(){
        var layer = layui.layer,$ = layui.$,element = layui.element,car = layui.car;
            $.ajax({
                type: "POST",
                url: "getShopcarByUserId",
                data: {
                    "userid": <%=user.getId()%>
                },
                success: function (data) {
                    data = eval(data);
                    for(var i=0;i<data.length;i++){
                        $("#list-cont").append("<ul class=\"item-content layui-clear\">\n" +
                            "                    <li class=\"th th-chk\">\n" +
                            "                        <div class=\"select-all\">\n" +
                            "                            <div class=\"cart-checkbox\">\n" +
                            "                                <input class=\"CheckBoxShop check\" id=\"\" type=\"checkbox\" num=\"all\" name=\"select-all\" value=\"true\">\n" +
                            "                            </div>\n" +
                            "                        </div>\n" +
                            "                    </li>\n" +
                            "                    <li class=\"th th-item\">\n" +
                            "                        <div class=\"item-cont\">\n" +
                            "                            <a href=\"javascript:;\"><img src=\""+data[i].url+"\" alt=\"\"></a>\n" +
                            "                            <div class=\"text\">\n" +
                            "                                <div class=\"title\">"+data[i].goodsname+"</div>\n" +
                            "                                <p>"+data[i].color+"</p>\n" +
                            "                            </div>\n" +
                            "                        </div>\n" +
                            "                    </li>\n" +
                            "                    <li class=\"th th-price\">\n" +
                            "                        <span class=\"th-su\">"+data[i].price+"</span>\n" +
                            "                    </li>\n" +
                            "                    <li class=\"th th-amount\">\n" +
                            "                        <div class=\"box-btn layui-clear\">\n" +
                            "                            <div class=\"less layui-btn\">-</div>\n" +
                            "                            <input class=\"Quantity-input\" type=\"\" name=\"\" value=\""+data[i].number+"\" disabled=\"disabled\">\n" +
                            "                            <div class=\"add layui-btn\">+</div>\n" +
                            "                        </div>\n" +
                            "                    </li>\n" +
                            "                    <li class=\"th th-sum\">\n" +
                            "                        <span class=\"sum\">"+(data[i].price*data[i].number)+"</span>\n" +
                            "                    </li>\n" +
                            "                    <li class=\"th th-op\">\n" +
                            "                        <span class=\"dele-btn\">删除</span>\n" +
                            "                    </li>\n" +
                            "                </ul>");
                    }
                    console.log(data);
                    car.init()
                }
            });


    });
</script>
</body>
</html>