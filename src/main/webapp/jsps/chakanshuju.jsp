<%--
  Created by IntelliJ IDEA.
  User: 北寒王
  Date: 2019/8/28
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

</head>
<body>
开始时间：<input type="date" id="st">
结束时间：<input type="date" id="et">
<button id="btn_id" type="button">查询</button>
<c:if test="${user.level==2 }">
    <button onclick="daochuExcel()">导出活动顺序</button>
</c:if>
<c:if test="${user.level==4}">
    <button onclick="daochuExcel()">导出活动顺序</button>
</c:if>

<br>
<div class="btn-group">

    <button type="button" class="btn btn-default"  id="option1" value="1">统计图</button>
    <button type="button" class="btn btn-default"  id="option2" value="2">详细列表信息</button>

</div>



    <div id="tongjitu">

<div class="col-sm-4">
    <c:if test="${user.level==2 }">
    <div id="eqmLoad3" style="height: 80%"></div>
    </c:if>
    <c:if test="${user.level==4 }">
        <div id="eqmLoad3" style="height: 80%"></div>
    </c:if>
</div>


<div class="col-sm-8">
    <c:if test="${user.level==0 }">
        <div id="eqmLoad2" style="height: 80%"></div>
        <input type="hidden" id="yuid" value="${user.id}">
    </c:if>
    <c:if test="${user.level==1 }">
        <div id="eqmLoad4" style="height: 80%"></div>
        <input type="hidden" id="yuid" value="${user.id}">
    </c:if>
    <c:if test="${user.level==2 }">
        <div id="eqmLoad" style="height: 80%"></div>
    </c:if>
    <c:if test="${user.level==4 }">
        <div id="eqmLoad" style="height: 80%"></div>
    </c:if>

</div>

    </div>


    <div id="xiangxi">
<c:if test="${user.level==0 }">
      <table id="tab4"></table>
</c:if>
<c:if test="${user.level==2}">
      <table id="tab"></table>
</c:if>
<c:if test="${user.level==4}">
      <table id="tab"></table>
</c:if>
<c:if test="${user.level==1}">
      <table id="tab6"></table>
</c:if>
    </div>

</body>
<script>
    $(function () {
        $("#tongjitu").show();
        $("#xiangxi").hide();
    })

    $("#option1").click(function(){
        $("#tongjitu").show();
        $("#xiangxi").hide();
    });
    $("#option2").click(function(){
        $("#tongjitu").hide();
        $("#xiangxi").show();

    });

    $(function(){
        showload();
    });
    $(function () {
        showditu();
    })

function showditu() {
    var dom = document.getElementById("eqmLoad3");
    var myChart = echarts.init(dom);

    $.get('${pageContext.request.contextPath}/static/he.json', function (geoJson) {

        myChart.hideLoading();

        echarts.registerMap('he', geoJson);

        myChart.setOption(option = {
            title: {
                text: '河北省',
                sublink: 'http://zh.wikipedia.org/wiki/%E9%A6%99%E6%B8%AF%E8%A1%8C%E6%94%BF%E5%8D%80%E5%8A%83#cite_note-12'
            },
            tooltip: {
                trigger: 'item',

            },
            toolbox: {
                show: true,
                orient: 'vertical',
                left: 'right',
                top: 'center',
                feature: {
                    dataView: {readOnly: false},
                    restore: {},
                    saveAsImage: {}
                }
            },
            visualMap: {
                min: 800,
                max: 50000,
                text:['High','Low'],
                realtime: false,
                calculable: true,
                inRange: {
                    color: ['lightskyblue','yellow', 'orangered']
                }
            },
            series: [
                {
                    name: '河北省',
                    type: 'map',
                    mapType: 'he', // 自定义扩展图表类型
                    itemStyle:{
                        normal:{label:{show:true}},
                        emphasis:{label:{show:true}}
                    },
                    data:[
                        {name: '张家口市', value: 20057.34},
                        {name: '承德市', value: 15477.48},
                        {name: '秦皇岛市', value: 31686.1},
                        {name: '唐山市', value: 6992.6},
                        {name: '廊坊市', value: 44045.49},
                        {name: '保定市', value: 40689.64},
                        {name: '石家庄市', value: 37659.78},
                        {name: '沧州市', value: 45180.97},
                        {name: '衡水市', value: 55204.26},
                        {name: '邢台市', value: 21900.9},
                        {name: '邯郸市', value: 4918.26}
                    ],
                    // 自定义名称映射
                    nameMap: {

                    }
                }
            ]
        });
    });
}
    function showload(){
        var startTime=$("#st").val();
        var endTime=$("#et").val();
        var dd = new Date();
        var year = dd.getFullYear();
        if(!startTime){
            startTime = year + "-01-01";
        }
        if(!endTime){
            endTime= year + "-12-31";
        }
        $.ajax({
            url:"${pageContext.request.contextPath}/chakans/findAll",
            type:"post",
            dataType:"json",
            data:{"startTime":startTime,"endTime":endTime},
            success:function(data){
                if(data){
                    var dom = document.getElementById("eqmLoad");
                    var myChart = echarts.init(dom);

                    option = null;
                    var eqmN=[];
                    var eqmL=[];
                    for(var i=0;i<data.length;i++){
                        eqmN.push(data[i].userName);
                        eqmL.push(data[i].baofei);
                    }
                    option = {
                        title : {
                            text: '河北省预估保费统计图 ',//标题
                            subtext:startTime+'至'+endTime,//子标题
                            x:'center'  //x轴居中
                        },
                        tooltip: {
                            show:true //显示提示框组件，包括提示框浮层
                        },
                        xAxis: {
                            type: 'category',//类目轴，适用于离散的类目数据，为该类型时必须通过 data 设置类目数据
                            data: eqmN,
                    /*        axisLabel:{  //显示刻度标签
                                interval: 0,  //0 强制显示所有标签。

                            }*/
                        },
                        yAxis: {
                            type: 'value',//数值轴，适用于连续数据
                            max:10000,
                            min:0,
                            name:'预估保费'
                        },
                        series: [{
                            data: eqmL,
                            type: 'bar',
                            label:{
                                show:true,
                                position:'top'
                            }
                        }]
                    };
                    if (option && typeof option === "object") {
                        myChart.setOption(option, true);
                    }
                }
            }
        });
    }


    $("#btn_id").click(function(){
        showload();
    });
$(function () {
    $("#tab").bootstrapTable({
        url : "${pageContext.request.contextPath }/chakans/findAll",//请求路径

        pagination:true,//开启分页
        sidePagination : 'client',//分页客户端
        method : 'post',//提交方式
        contentType : "application/x-www-form-urlencoded;charset=UTF-8",  //发送到服务器的数据编码类型，设置from表单传输编码
        striped : true,//开启使用斑马线效果
        sortName : "id",//定义排序的字段
        sortOrder : "asc",//排序方式
        cache : false,//禁用缓存

        columns : [ {
            field : 'id',
            title : '序号',
            formatter : function(value, row, index) {
                return index + 1;

            }

        }, {
            field : 'userName',
            title : '城市'
        }, {
            field : 'planNum',
            title : '计划桌数'

        }, {
            field : 'trueNum',
            title : '实际桌数'

        }, {
            field : 'newKehu',
            title : '新客户',


        },  {
            field : 'yixiangKehu',
            title : '意向客户'

        },  {
            field : 'baofei',
            title : '保费'

        }
        ]

    });



})

function daochuExcel (){

    $.ajax({
        url:"${pageContext.request.contextPath }/chakans/daochuExcel",
        dataType:"json",
        type:"post",
        success:function (data) {
            alert("导出成功,请去D://jiuhui下查看");
        },error:function (data) {
            alert("导出失败");
        }


    })
}
























    $(function(){
        showload2();
    });


    function showload2(){


        var dd = new Date();
        var id=$("#yuid").val();
        var year = dd.getFullYear();



    var userName='${user.userName}';

        $.ajax({
            url:"${pageContext.request.contextPath}/chakans/findxianAll",
            type:"post",
            dataType:"json",
            data:{id:id},
            success:function(data){
                if(data){
                    var dom = document.getElementById("eqmLoad2");
                    var myChart = echarts.init(dom);

                    option = null;
                    var eqmN=[];
                    var eqmL=[];
                    for(var i=0;i<data.length;i++){
                        eqmN.push(data[i].userName);
                        eqmL.push(data[i].baofei);
                    }
                    option = {
                        title : {
                            text: userName+'预估保费统计图 ',//标题

                            x:'center'  //x轴居中
                        },
                        tooltip: {
                            show:true //显示提示框组件，包括提示框浮层
                        },
                        xAxis: {
                            type: 'category',//类目轴，适用于离散的类目数据，为该类型时必须通过 data 设置类目数据
                            data: eqmN,
                            /*        axisLabel:{  //显示刻度标签
                                        interval: 0,  //0 强制显示所有标签。

                                    }*/
                        },
                        yAxis: {
                            type: 'value',//数值轴，适用于连续数据
                            max:10000,
                            min:0,
                            name:'预估保费'
                        },
                        series: [{
                            data: eqmL,
                            type: 'bar',
                            label:{
                                show:true,
                                position:'top'
                            }
                        }]
                    };
                    if (option && typeof option === "object") {
                        myChart.setOption(option, true);
                    }
                }
            }
        });
    }



    $(function () {
        var id=$("#yuid").val();
        $("#tab4").bootstrapTable({
            url : "${pageContext.request.contextPath }/chakans/findxianAll",//请求路径

            pagination:true,//开启分页
            sidePagination : 'client',//分页客户端
            method : 'post',//提交方式
            contentType : "application/x-www-form-urlencoded;charset=UTF-8",  //发送到服务器的数据编码类型，设置from表单传输编码
            striped : true,//开启使用斑马线效果
            sortName : "id",//定义排序的字段
            sortOrder : "asc",//排序方式
            cache : false,//禁用缓存
            queryParams : function(params) {//请求参数
                return {

                    id:id

                }

            },
            columns : [ {
                field : 'id',
                title : '序号',
                formatter : function(value, row, index) {
                    return index + 1;

                }

            }, {
                field : 'userName',
                title : '城市'
            }, {
                field : 'planNum',
                title : '计划桌数'

            }, {
                field : 'trueNum',
                title : '实际桌数'

            }, {
                field : 'newKehu',
                title : '新客户',


            },  {
                field : 'yixiangKehu',
                title : '意向客户'

            },  {
                field : 'baofei',
                title : '保费'

            }
            ]

        });
    })
    $(function(){
        showload3();
    });


    function showload3(){
        var id=$("#yuid").val();

        var dd = new Date();
        var year = dd.getFullYear();

        var userName='${user.userName}';

        $.ajax({
            url:"${pageContext.request.contextPath}/chakans/findxianAll2",
            type:"post",
            dataType:"json",
            data:{id:id},
            success:function(data){
                if(data){
                    var dom = document.getElementById("eqmLoad4");
                    var myChart = echarts.init(dom);

                    option = null;
                    var eqmN=[];
                    var eqmL=[];
                    for(var i=0;i<data.length;i++){
                        eqmN.push(data[i].userName);
                        eqmL.push(data[i].baofei);
                    }
                    option = {
                        title : {
                            text: userName+'预估保费统计图 ',//标题

                            x:'center'  //x轴居中
                        },
                        tooltip: {
                            show:true //显示提示框组件，包括提示框浮层
                        },
                        xAxis: {
                            type: 'category',//类目轴，适用于离散的类目数据，为该类型时必须通过 data 设置类目数据
                            data: eqmN,
                            /*        axisLabel:{  //显示刻度标签
                                        interval: 0,  //0 强制显示所有标签。

                                    }*/
                        },
                        yAxis: {
                            type: 'value',//数值轴，适用于连续数据
                            max:10000,
                            min:0,
                            name:'预估保费'
                        },
                        series: [{
                            data: eqmL,
                            type: 'bar',
                            label:{
                                show:true,
                                position:'top'
                            }
                        }]
                    };
                    if (option && typeof option === "object") {
                        myChart.setOption(option, true);
                    }
                }
            }
        });
    }


    $(function () {
        var id=$("#yuid").val();
        $("#tab6").bootstrapTable({
            url : "${pageContext.request.contextPath }/chakans/findxianAll2",//请求路径

            pagination:true,//开启分页
            sidePagination : 'client',//分页客户端
            method : 'post',//提交方式
            contentType : "application/x-www-form-urlencoded;charset=UTF-8",  //发送到服务器的数据编码类型，设置from表单传输编码
            striped : true,//开启使用斑马线效果
            sortName : "id",//定义排序的字段
            sortOrder : "asc",//排序方式
            cache : false,//禁用缓存
            queryParams : function(params) {//请求参数
                return {

                    id:id

                }

            },
            columns : [ {
                field : 'id',
                title : '序号',
                formatter : function(value, row, index) {
                    return index + 1;

                }

            }, {
                field : 'userName',
                title : '城市'
            }, {
                field : 'planNum',
                title : '计划桌数'

            }, {
                field : 'trueNum',
                title : '实际桌数'

            }, {
                field : 'newKehu',
                title : '新客户',


            },  {
                field : 'yixiangKehu',
                title : '意向客户'

            },  {
                field : 'baofei',
                title : '保费'

            }
            ]

        });
    })
</script>
</html>
