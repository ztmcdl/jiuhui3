<%--
  Created by IntelliJ IDEA.
  User: 北寒王
  Date: 2019/8/29
  Time: 9:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="biaoge">

    <table id="tab2"></table>

</div>
<div id="tianjiashiji">
    <form class="form-horizontal" role="form" id="trueform">
        <input name="shijishangbaoren" type="hidden" value="${user.id}">
        <div class="form-group">
            <label for="shijimingchneg" class="col-sm-2 control-label">活动名称</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="trueName" id="shijimingchneg"  style="width: 200px">
            </div>
        </div>
        <div class="form-group">
            <label for="shijizhuoshu" class="col-sm-2 control-label">实际桌数</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="trueNum" id="shijizhuoshu" placeholder="请输入实际桌数" style="width: 200px">
            </div>
        </div>
        <div class="form-group">
            <label for="xinkehu" class="col-sm-2 control-label">新客户</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="newKehu" id="xinkehu" style="width: 200px" placeholder="请输入新客户">
            </div>
        </div>
        <div class="form-group">
            <label for="laopkehu" class="col-sm-2 control-label">老客户</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="oldKehu" id="laopkehu" style="width: 200px"placeholder="请输入老客户">
            </div>
        </div>
        <div class="form-group">
            <label for="yixiangkehu" class="col-sm-2 control-label">意向客户</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="yixiangKehu" id="yixiangkehu" style="width: 200px"placeholder="请输入意向客户">
            </div>
        </div>
        <div class="form-group">
            <label for="baofei" class="col-sm-2 control-label">保费</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="baofei" id="baofei" style="width: 200px"placeholder="请输入保费">
            </div>
        </div>
        <div class="form-group">
            <label for="huodongshijian" class="col-sm-2 control-label">活动时间</label>
            <div class="col-sm-10">
                <input type="date" class="form-control" name="huodongtime" id="huodongshijian" style="width: 200px">
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="button" class="btn btn-default" onclick="tijiaotrue()">提交</button>
            </div>
        </div>
    </form>

</div>
<div id="sahngchuantupian">
    <div class="bmsc_nr_input">
        <div style="width: 100%;position: relative;">
            <form id="upBox">
                <input type="hidden" id="PicId" value="${buf}"/>
                <div id="inputBox"><input name="files" type="file" title="请选择图片" id="file" multiple accept="image/png,image/jpg,image/gif,image/JPEG"/>点击选择图片(限上传10张)</div>
                <div id="imgBox"></div>
                <a id="btn">上传</a>
            </form>
        </div>
    </div>


</div>
</body>
<script>
    $(function () {
        $("#tab2").bootstrapTable({
            url : "${pageContext.request.contextPath }/plans/findliebiao",//请求路径
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
                field : 'planName',
                title : '计划名称'
            }, {
                field : 'planNum',
                title : '计划桌数'

            }, {
                field : 'startTime',
                title : '开始时间'

            }, {
                field : 'endTime',
                title : '结束时间',


            },  {
                field : 'creattime',
                title : '录入时间'

            },{
                field:'',
                title:'操作',
                formatter :function (value,row,index){
                    return "<button class='btn btn-primary'><a href='javascript:shangbao("+row.id+")' style='color: white'>上报实际数据</a></button>";
                }

            }
            ]

        });
    })
   //启用插件设置相应的参数
    imgUpload({
        inputId:'file', //input框id
        imgBox:'imgBox', //图片容器id
        buttonId:'btn', //提交按钮id
        upUrl:'${pageContext.request.contextPath}/pics/uploadFiles',  //提交地址
        data:'files', //type="file"控件的name名
        formId:"upBox",//form表单的id
        num:"10"//上传个数
    })
    $(function () {
        $("#biaoge").show();
        $("#tianjiashiji").hide();
        $("#sahngchuantupian").hide();
        $.ajax({
            url:"${pageContext.request.contextPath }/plans/findliebiao",
            type:"post",

            dataType:"json",
            success:function (data) {
                $(data).each(function(a,b){
                $("#shijimingchneg").val(b.planName);

                });

            }


        })



    })

    function shangbao(id) {
        $.ajax({
            url:"${pageContext.request.contextPath }/plans/xiugaizhungtai",
            type:"post",
            data:{id:id},
            dataType:"json",
            success:function (data) {
            }
        })
        $("#biaoge").hide();
        $("#tianjiashiji").show();
        $("#sahngchuantupian").hide();

    }
    
    
    function tijiaotrue() {
        $.ajax({
            url:"${pageContext.request.contextPath }/trues/tianjiatrue",
            type:"post",
            data:$("#trueform").serialize(),
            dataType:"json",
            success:function (data) {
                alert("上报成功");
                $("#biaoge").hide();
                $("#tianjiashiji").hide();
                $("#sahngchuantupian").show();
            }


        })
    }


</script>
</html>
