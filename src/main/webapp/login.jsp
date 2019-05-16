<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/10
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录</title>
    <link rel="stylesheet" type="text/css" href="../res/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="../res/layui/css/layui.css">
    <script type="text/javascript" src="../res/layui/layui.js"></script>
    <script type="text/javascript" src="../res/static/js/jquery-1.7.1.min.js"></script>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<body>
<div class="content content-nav-base  login-content">
    <div class="login-bg">
        <div class="login-cont w1200">
            <div class="form-box">
                <form class="layui-form" action="">
                    <legend>手机号登录</legend>
                    <div class="layui-form-item">
                        <div class="layui-inline iphone">
                            <div class="layui-input-inline">
                                <i class="layui-icon layui-icon-cellphone iphone-icon"></i>
                                <input type="tel" name="phone" id="phone" lay-verify="required|phone"
                                       placeholder="请输入手机号" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline veri-code">
                            <div class="layui-input-inline">
                                <input id="code" type="text" name="pnum" lay-verify="required"
                                       placeholder="请输入验证码"
                                       autocomplete="off" class="layui-input">
                                <input id="getcode" type="button" class="layui-btn" id="find" value="获取验证码"/>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item login-btn">
                        <div class="layui-input-block">
                            <button id="login" class="layui-btn" lay-submit="" lay-filter="demo1"
                                    onclick="return false">登录
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="footer">
    <div class="ng-promise-box">
        <div class="ng-promise w1200">
            <p class="text">
                <a class="icon1" href="javascript:;">7天无理由退换货</a>
                <a class="icon2" href="javascript:;">满99元全场免邮</a>
                <a class="icon3" style="margin-right: 0" href="javascript:;">100%品质保证</a>
            </p>
        </div>
    </div>
    <div class="mod_help w1200">
        <p>
            <a href="javascript:;">关于我们</a>
            <span>|</span>
            <a href="javascript:;">帮助中心</a>
            <span>|</span>
            <a href="javascript:;">售后服务</a>
            <span>|</span>
            <a href="javascript:;">母婴资讯</a>
            <span>|</span>
            <a href="javascript:;">关于货源</a>
        </p>
        <p class="coty">母婴商城版权所有 &copy; 2012-2020</p>
    </div>
</div>
<script type="text/javascript">
    layui.use(['layer', 'form'], function () {
        var layer = layui.layer, form = layui.form;

        $("#login").click(function () {
            $("#login").html("正在登录···");
            $("#login").css("background-color", "#D7D7D7");
            $("#login").attr("disabled", true);
            $.ajax({
                type: "POST",
                url: "login",
                data: {
                    "phone": $("#phone").val(),
                    "code": $("#code").val()
                },
                success: function (data) {
                    $("#login").html("登录");
                    $("#login").css(
                        "background-color",
                        "#cfb2f6");
                    $("#login").attr("disabled",
                        false);
                    console.log(data);
                    if ("000" == data) {

                        layer.msg('验证码错误', {
                            icon: 5,
                            time: 1000
                        });
                    } else if ("001" == data) {
                        layer.msg('登录成功', {
                            icon: 1,
                            time: 1000
                        });
                        setTimeout(function () {
                            location.href = "/index.jsp";
                        }, 1000);
                    } else if ("002" == data) {
                        layer.msg('欢迎新用户', {
                            icon: 1,
                            time: 1000
                        });
                        setTimeout(function () {
                            location.href = "/index.jsp";
                        }, 1000);
                    }
                }
            });

            //监听提交
            form.on('submit(demo1)', function (data) {
                layer.msg(JSON.stringify(data.field));
                return false;
            });
        })

        $("#getcode").click(function () {
            if (!/^1\d{10}$/.test($("#phone").val())) {
                layer.msg("请输入正确的手机号");
                return false;
            }
            var obj = this;
            $.ajax({
                type: "get",
                url: "sendmessage",
                data: {
                    "phone": $("#phone").val()
                },
                success: function (data) {

                    $("#getcode").addClass(" layui-btn-disabled");
                    $('#getcode').attr('disabled', "true");
                    settime(obj);

                },
                error: function (msg) {
                    console.log(msg);
                }
            });
        })
        var countdown = 60;

        function settime(obj) {
            if (countdown == 0) {
                obj.removeAttribute("disabled");
                obj.classList.remove("layui-btn-disabled")
                obj.value = "获取验证码";
                countdown = 60;
                return;
            } else {

                obj.value = "重新发送(" + countdown + ")";
                countdown--;
            }
            setTimeout(function () {
                    settime(obj)
                }
                , 1000)
        }
    })


</script>
</body>
</html>
