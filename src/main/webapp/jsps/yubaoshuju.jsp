<%--
  Created by IntelliJ IDEA.
  User: 北寒王
  Date: 2019/8/29
  Time: 9:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="col-sm-7" id="tianjia">


    <form class="form-horizontal" role="form">
        <input type="hidden" id="shangbaoren" value="${user.id}">
        <div class="form-group">
            <label for="jihuamingcheng" class="col-sm-2 control-label">计划名称</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="jihuamingcheng" placeholder="请输入计划名称" style="width: 200px">
            </div>
        </div>
        <div class="form-group">
            <label for="jihuazhuoshu" class="col-sm-2 control-label">计划召开桌数</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="jihuazhuoshu" placeholder="请输入计划召开桌数" style="width: 200px">
            </div>
        </div>
        <div class="form-group">
            <label for="starttime" class="col-sm-2 control-label">开始时间</label>
            <div class="col-sm-10">
                <input type="date" class="form-control" id="starttime" style="width: 200px">
            </div>
        </div>
        <div class="form-group">
            <label for="endtime" class="col-sm-2 control-label">结束时间</label>
            <div class="col-sm-10">
                <input type="date" class="form-control" id="endtime" style="width: 200px">
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="button" class="btn btn-default" onclick="tijiao()">提交</button>
            </div>
        </div>
    </form>
</div>
<div id="liebiao">
<h4>
    等待上报实际数据
</h4>


</div>
</body>

<script>

    $(function () {

        $.ajax({
            url:"${pageContext.request.contextPath}/plans/findPlanAll",
            type:"post",
            dataType:"json",
            success:function (data) {
                $(data).each(function(a,b){
                if (b.planDis!=1){
                    $("#tianjia").show();
                    $("#liebiao").hide();


                }else {
                    $("#tianjia").hide();
                    $("#liebiao").show();
                }

                });


            }


        })

    })



function tijiao() {
var planName=$("#jihuamingcheng").val();
var planNum=$("#jihuazhuoshu").val();
var startTime=$("#starttime").val();
var endTime=$("#endtime").val();
var sahngbaoren=$("#shangbaoren").val();


    $.ajax({
        url:"${pageContext.request.contextPath}/plans/tianjiaplan",
        type:"post",
        data:{planName:planName,planNum:planNum,startTime:startTime,endTime:endTime,sahngbaoren:sahngbaoren},
        dataType:"json",
        success:function (data) {
            alert("添加成功");
            window.location.reload();
            $("#tianjia").hide();
            $("#liebiao").show();

        }


    })
}



</script>
</html>
