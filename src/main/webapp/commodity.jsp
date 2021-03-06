<%@ page import="com.zz624.entry.User" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="../res/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="../res/layui/css/layui.css">
    <script type="text/javascript" src="../res/layui/layui.js"></script>
    <script type="text/javascript" src="../res/static/js/jquery-1.7.1.min.js"></script>
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
            <div class="sp-cart"><a href="shopcart.jsp?userid=<%=user.getId()%>">购物车</a></div>
            <%}else{%>
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


<div class="content content-nav-base commodity-content">
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
    <div class="commod-cont-wrap">
        <div class="commod-cont w1200 layui-clear">
            <div class="left-nav">
                <div class="title">所有分类</div>
                <div class="list-box">
                    <dl>
                        <dt>母婴用品</dt>
                        <dd><a href="commodity.jsp?category=母婴">母婴用品</a></dd>
                    </dl>
                    <dl>
                        <dt>生鲜水果</dt>
                        <dd><a href="commodity.jsp?category=水果">水果</a></dd>
                    </dl>
                </div>
            </div>
            <div class="right-cont-wrap">
                <div class="right-cont">
                    <div class="sort layui-clear">
                        <a class="active" href="javascript:;" event = 'volume'>销量</a>
                        <a href="javascript:;" event = 'price'>价格</a>
                        <a href="javascript:;" event = 'newprod'>新品</a>
                        <a href="javascript:;" event = 'collection'>收藏</a>
                    </div>
                    <div class="prod-number">
                        <span>200个</span>
                    </div>
                    <div class="cont-list layui-clear" id="list-cont">

                    </div>
                    <!-- 模版引擎导入 -->
                    <!-- <script type="text/html" id="demo">
                      {{# layui.each(d.menu.milk.content,function(index,item){}}
                        <div class="item">
                          <div class="img">
                            <a href="javascript:;"><img src="{{item.img}}"></a>
                          </div>
                          <div class="text">
                            <p class="title"></p>
                            <p class="price">
                              <span class="pri">{{item.pri}}</span>
                              <span class="nub">{{item.nub}}</span>
                            </p>
                          </div>
                        </div>
                      {{# }); }}
                    </script> -->
                    <div id="demo0" style="text-align: center;"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    layui.use(['layer','laypage', 'jquery'], function () {
        var layer = layui.layer, $ = layui.$,laypage = layui.laypage,$ = layui.$;
        laypage.render({
            elem: 'demo0'
            ,count: 100 //数据总数
        });
        $.ajax({
            type: "POST",
            url: "getAllGoods",
            success: function (data){
                data = eval(data);
                for(var i=0;i<data.length;i++){
                    $("#list-cont").append("<div class=\"item\">\n" +
                        "                            <div class=\"img\" style=\"width: 278px;height: 278px;\">\n" +
                        "                                <a href=\"details.jsp?id="+data[i].id+"\"><img src=\""+data[i].imagesrc+"\"></a>\n" +
                        "                            </div>\n" +
                        "                            <div class=\"text\">\n" +
                        "                                <p class=\"title\">"+data[i].goodsname+"</p>\n" +
                        "                                <p class=\"price\">\n" +
                        "                                    <span class=\"pri\">￥"+data[i].details[0].price+"</span>\n" +
                        "                                </p>\n" +
                        "                            </div>\n" +
                        "                        </div>");
                }
                console.log(data);
            }
        });

        // 模版引擎导入
        //  var html = demo.innerHTML;
        //  var listCont = document.getElementById('list-cont');
        //  // console.log(layui.router("#/about.html"))
        // mm.request({
        //     url: '../json/commodity.json',
        //     success : function(res){
        //       console.log(res)
        //       listCont.innerHTML = mm.renderHtml(html,res)
        //     },
        //     error: function(res){
        //       console.log(res);
        //     }
        //   })

        $('.sort a').on('click',function(){
            $(this).addClass('active').siblings().removeClass('active');
        })
        $('.list-box dt').on('click',function(){
            if($(this).attr('off')){
                $(this).removeClass('active').siblings('dd').show()
                $(this).attr('off','')
            }else{
                $(this).addClass('active').siblings('dd').hide()
                $(this).attr('off',true)
            }
        })

    });
</script>


</body>
</html>