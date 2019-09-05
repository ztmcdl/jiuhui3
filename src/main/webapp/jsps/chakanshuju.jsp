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
开始时间：<input type="date">
结束时间：<input type="date">
<button>查询</button>
<button>导出活动顺序</button>
<br>
<div class="btn-group">

    <button type="button" class="btn btn-default"  id="option1" value="1">统计图</button>
    <button type="button" class="btn btn-default"  id="option2" value="2">详细列表信息</button>

</div>



    <div id="tongjitu">
        <c:if test="${user.level==0 }">
        <div id="eqmLoad2" style="height: 80%"></div>
            <input type="hidden" id="yuid" value="${user.id}">
        </c:if>
        <c:if test="${user.level!=0 }">
        <div id="eqmLoad" style="height: 80%"></div>
        </c:if>
    </div>


    <div id="xiangxi">
<c:if test="${user.level==0 }">
      <table id="tab4"></table>
</c:if>
<c:if test="${user.level!=0 }">
      <table id="tab"></table>
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


    function showload(){

        var dd = new Date();
        var year = dd.getFullYear();

        $.ajax({
            url:"${pageContext.request.contextPath}/chakans/findAll",
            type:"post",
            dataType:"json",
            data:{},
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
                            max:10,
                            min:0,
                            name:'预估保费(%)'
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


























    $(function(){
        showload2();
    });


    function showload2(){
        var id=$("#yuid").val();
        var dd = new Date();
        var year = dd.getFullYear();

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
                            text: '本县预估保费统计图 ',//标题

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
                            max:10,
                            min:0,
                            name:'预估保费(%)'
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
</script>
</html>
