<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/17
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>分析</title>
    <link rel="stylesheet" type="text/css" href="/res/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="/res/layui/css/layui.css">
    <script type="text/javascript" src="/res/layui/layui.js"></script>
    <script type="text/javascript" src="/res/static/js/jquery-1.7.1.min.js"></script>
    <script src="/res/static/js/echarts.min.js"></script>
</head>
<body>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="width: 600px;height:400px;"></div>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    $.ajax({
        type: "POST",
        url: "getSevenDays",
        dataType:"json",

        success: function (data) {
            data = eval(data);
            console.log(data);
            console.log(data.value);
            console.log(data.key);
            // 指定图表的配置项和数据
            option = {
                title: {
                    text: '一周交易额'
                },
                color: ['#3398DB'],
                tooltip : {
                    trigger: 'axis',
                    axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                        type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis : [
                    {
                        type : 'category',
                        data : data.key,
                        axisTick: {
                            alignWithLabel: true
                        }
                    }
                ],
                yAxis : [
                    {
                        type : 'value'
                    }
                ],
                series : [
                    {
                        name:'销售额',
                        type:'bar',
                        barWidth: '60%',
                        data:data.value
                    }
                ]
            };

            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        }
    });


</script>
</body>
</html>
