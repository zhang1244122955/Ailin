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
<div id="main1" style="width: 600px;height:400px;"></div>
<div id="main2" style="width: 600px;height:400px;"></div>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    var myChart1 = echarts.init(document.getElementById('main1'));
    var myChart2 = echarts.init(document.getElementById('main2'));

    var posList = [
        'left', 'right', 'top', 'bottom',
        'inside',
        'insideTop', 'insideLeft', 'insideRight', 'insideBottom',
        'insideTopLeft', 'insideTopRight', 'insideBottomLeft', 'insideBottomRight'
    ];

    myChart1.configParameters = {
        rotate: {
            min: -90,
            max: 90
        },
        align: {
            options: {
                left: 'left',
                center: 'center',
                right: 'right'
            }
        },
        verticalAlign: {
            options: {
                top: 'top',
                middle: 'middle',
                bottom: 'bottom'
            }
        },
        position: {
            options: echarts.util.reduce(posList, function (map, pos) {
                map[pos] = pos;
                return map;
            }, {})
        },
        distance: {
            min: 0,
            max: 100
        }
    };

    myChart1.config = {
        rotate: 90,
        align: 'left',
        verticalAlign: 'middle',
        position: 'insideBottom',
        distance: 15,
        onChange: function () {
            var labelOption = {
                normal: {
                    rotate: myChart1.config.rotate,
                    align: myChart1.config.align,
                    verticalAlign: myChart1.config.verticalAlign,
                    position: myChart1.config.position,
                    distance: myChart1.config.distance
                }
            };
            myChart.setOption({
                series: [{
                    label: labelOption
                }, {
                    label: labelOption
                }, {
                    label: labelOption
                }, {
                    label: labelOption
                }]
            });
        }
    };


    var labelOption = {
        normal: {
            show: true,
            position: myChart1.config.position,
            distance: myChart1.config.distance,
            align: myChart1.config.align,
            verticalAlign: myChart1.config.verticalAlign,
            rotate: myChart1.config.rotate,
            formatter: '{c}  {name|{a}}',
            fontSize: 16,
            rich: {
                name: {
                    textBorderColor: '#fff'
                }
            }
        }
    };

    $.ajax({
        type: "POST",
        url: "getSevenDays",
        dataType:"json",

        success: function (data) {
            data = eval(data);
            console.log(data);
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
    //男女报表

    $.ajax({
        type: "POST",
        url: "getSumPersonBySex",
        dataType:"json",

        success: function (data) {
            data = eval(data);
            console.log(data);
            // 指定图表的配置项和数据
            option = {
                title: {
                    text: '一周男女比例'
                },
                color: ['#003366', '#006699', '#4cabce'],
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'shadow'
                    }
                },
                legend: {
                    data: ['Forest', 'Steppe', 'Desert', 'Wetland']
                },
                toolbox: {
                    show: true,
                    orient: 'vertical',
                    left: 'right',
                    top: 'center',
                    feature: {
                        mark: {show: true},
                        dataView: {show: true, readOnly: false},
                        magicType: {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                        restore: {show: true},
                        saveAsImage: {show: true}
                    }
                },
                calculable: true,
                xAxis: [
                    {
                        type: 'category',
                        axisTick: {show: false},
                        data: data.key
                    }
                ],
                yAxis: [
                    {
                        type: 'value'
                    }
                ],
                series: [
                    {
                        name: '男',
                        type: 'bar',
                        barGap: 0,
                        label: labelOption,
                        data: data.value1
                    },
                    {
                        name: '女',
                        type: 'bar',
                        label: labelOption,
                        data: data.value2
                    },
                    {
                        name: '合计',
                        type: 'bar',
                        label: labelOption,
                        data: data.value3
                    }
                ]
            };

            // 使用刚指定的配置项和数据显示图表。
            myChart1.setOption(option);
        }
    });

    //年龄报表
    $.ajax({
        type: "POST",
        url: "getSumPersonByAge",
        dataType:"json",

        success: function (data) {
            data = eval(data);
            console.log(data);
            // 指定图表的配置项和数据
            option = {
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b}: {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    x: 'left',
                    data:['0到20岁','21到30岁','31到40岁','41到50岁','51到60岁','61到70岁','70岁以上']
                },
                series: [
                    {
                        name:'访问来源',
                        type:'pie',
                        radius: ['50%', '70%'],
                        avoidLabelOverlap: false,
                        label: {
                            normal: {
                                show: false,
                                position: 'center'
                            },
                            emphasis: {
                                show: true,
                                textStyle: {
                                    fontSize: '30',
                                    fontWeight: 'bold'
                                }
                            }
                        },
                        labelLine: {
                            normal: {
                                show: false
                            }
                        },
                        data:[
                            {value:data.value[0], name:'0到20岁'},
                            {value:data.value[1], name:'21到30岁'},
                            {value:data.value[2], name:'31到40岁'},
                            {value:data.value[3], name:'41到50岁'},
                            {value:data.value[4], name:'51到60岁'},
                            {value:data.value[5], name:'61到70岁'},
                            {value:data.value[6], name:'71岁以上'}
                        ]
                    }
                ]
            };

            // 使用刚指定的配置项和数据显示图表。
            myChart2.setOption(option);
        }
    });


</script>
</body>
</html>
