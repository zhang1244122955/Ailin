<%@ page import="com.zz624.entry.User" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/8
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>支付</title>
    <link rel="stylesheet" type="text/css" href="../res/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="../res/layui/css/layui.css">
    <script type="text/javascript" src="../res/layui/layui.js"></script>
    <script type="text/javascript" src="../res/static/js/jquery-1.7.1.min.js"></script>
    <link rel="stylesheet" href="../res/static/css/font.css">
    <%--<link rel="stylesheet" href="/res/static/css/xadmin.css">--%>
    <script type="text/javascript" src="../res/static/js/xadmin.js"></script>
    <script src="../res/static/js/photobooth_min.js"></script>
</head>
<body>
<div>

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








    <div id="example" class="photo" style="padding-left:22px; width: 400px; height: 300px;"></div>
    <%--<hr class="hr15">--%>
    <%--<input name="userid" placeholder="用户名" type="text" id="faceuserid"--%>
    <%--lay-verify="required" class="layui-input">--%>
    <%--<hr class="hr15">--%>
    <%--<input style="display:none" name="userpwd" lay-verify="required" placeholder="密码"  id="faceuserpwd"--%>
    <%--type="password" class="layui-input">--%>
    <input hidden id="facetoken" name="facetoken" />
    <%--<hr class="hr15">--%>
    <%--<button id="btn_face" type="" style="color:white; font-size:18px; background-color:#189F92; border:0px; border-radius:2px; width: 100%;height: 45px;" value="登录">登录</button>--%>
</div>
</body>

<script type="text/javascript">
    layui.use('element', function(){
        var element = layui.element;

        //一些事件监听


        $('#example').photobooth();
        $('#example').data("photobooth").resize(400, 300);
        $('#example').on("image", function(event, dataUrl) {
            $('#facetoken').val(dataUrl);
        });



    });

    function faceMatch() {
        //按钮a点击完成后。b也执行点击事件。
        $(".trigger").trigger('click');

        $.ajax({
            type: "POST",
            url: "facematch",
            async:false,
            data: {
                "facetoken": $('#facetoken').val(),
                "phone": <%=user.getPhone()%>,
                "ids":getValue('ids'),
                "money":getValue('money')
            },
            success: function(data) {
                datas = data.split(",");
                data = datas[0];
                $("#btn_face").html("登录");
                $("#btn_face").css(
                    "background-color",
                    "#189F92");
                $("#btn_face").attr("disabled",
                    false);
                //alert(data);
                switch(data) {
                    case '10002000':
                        //登录成功
                        clearInterval(timer);
                        layer.msg('支付成功', {
                            icon: 1,
                            time: 1000
                        });
                        alert("您本次支付"+getValue('money')+"元，余额剩余"+datas[1]+"元");

                        location.href = "/index.jsp";
                        break;
                    case '10000004':
                        //用户名脸部信息匹配失败
                        layer.msg('用户名脸部信息匹配失败', {
                            icon: 5,
                            time: 1000
                        });
                        break;
                    case '10000005':
                        //余额不足
                        clearInterval(timer);
                        alert("余额不足");
                        break;
                    case '10000008':
                        //必要参数未传入
                        layer.msg('首次支付请先录入人脸', {
                            icon: 5,
                            time: 1000
                        });
                        setTimeout(function () {
                            location.href = "/faceinput.jsp";
                        }, 1000);
                        break;
                    case '10000009':
                        //图片中没有人脸
                        layer.msg('图片中没有人脸', {
                            icon: 5,
                            time: 1000
                        });
                        break;
                    case '10000010':
                        //人脸有被遮挡
                        layer.msg('人脸有被遮挡', {
                            icon: 5,
                            time: 1000
                        });
                        break;
                    case '10000011':
                        //人脸模糊
                        layer.msg('人脸模糊', {
                            icon: 5,
                            time: 1000
                        });
                        break;
                    case '10000012':
                        //人脸光照不好
                        layer.msg('人脸光照不好', {
                            icon: 5,
                            time: 1000
                        });
                        break;
                    case '10000013':
                        //人脸不完整
                        layer.msg('人脸不完整', {
                            icon: 5,
                            time: 1000
                        });
                        break;
                    case '10000014':
                        //活体检测未通过
                        layer.msg('活体检测未通过', {
                            icon: 5,
                            time: 1000
                        });
                        break;
                    case '10000015':
                        //质量检测未通过 右眼遮挡程度过高
                        layer.msg('质量检测未通过 右眼遮挡程度过高', {
                            icon: 5,
                            time: 1000
                        });
                        break;
                    case '10000016':
                        //质量检测未通过 左眼遮挡程度过高
                        layer.msg('质量检测未通过 左眼遮挡程度过高', {
                            icon: 5,
                            time: 1000
                        });
                        break;
                    case '10000017':
                        //质量检测未通过 右脸遮挡程度过高
                        layer.msg('质量检测未通过 右脸遮挡程度过高', {
                            icon: 5,
                            time: 1000
                        });
                        break;
                    case '10000018':
                        //质量检测未通过 左脸遮挡程度过高
                        layer.msg('质量检测未通过 左脸遮挡程度过高', {
                            icon: 5,
                            time: 1000
                        });
                        break;
                    case '10000019':
                        //质量检测未通过 下巴遮挡程度过高
                        layer.msg('质量检测未通过 下巴遮挡程度过高', {
                            icon: 5,
                            time: 1000
                        });
                        break;
                    case '10000020':
                        //质量检测未通过 鼻子遮挡程度过高
                        layer.msg('质量检测未通过 鼻子遮挡程度过高', {
                            icon: 5,
                            time: 1000
                        });
                        break;
                    case '10000021':
                        //质量检测未通过 嘴巴遮挡程度过高
                        layer.msg('质量检测未通过 嘴巴遮挡程度过高', {
                            icon: 5,
                            time: 1000
                        });
                        break;
                    case '10000100':
                        //发现未知错误
                        layer.msg('发现未知错误', {
                            icon: 5,
                            time: 1000
                        });
                        break;

                    default:
                        break;
                }

            }
        });
    }
    function getValue(variable)
    {
        //Url有中文参数，需要手动解码
        var vars = decodeURI(window.location.href).split("&");
        console.log(vars)
        for (var i=0;i<vars.length;i++) {
            var pair = vars[i].split("=");
            console.log(pair+"-----"+pair[0]+"------"+pair[1])
            if(pair[0] == variable){return pair[1];}
        }
        return(false);
    }


    //setInterval("faceMatch()","1000")
    //
    // setTimeout(faceMatch,1000);
    //setTimeout(faceMatch,2500);
    var timer = setInterval("faceMatch()","2000")

</script>
</html>
