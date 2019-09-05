<%--
  Created by IntelliJ IDEA.
  User: 北寒王
  Date: 2019/8/28
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>


    <style type="text/css">
        .ztree li span.button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}

        input{
            border-radius:5px;
        }

    </style>
</head>
<body>
<form class="form-inline" role="form">
    <div class="form-group">
        <label class="control-label">导入市级机构数据</label>

    </div>
    <div class="form-group">

        <input type="file">
    </div>

    <button type="submit" class="btn btn-default">确定导入</button>
    <br>
    <div class="form-group">
        <label class="control-label">导入县级机构数据</label>

    </div>
    <div class="form-group">

        <input type="file">
    </div>

    <button type="submit" class="btn btn-default">确定导入</button>


</form>

<div class="col-sm-3">

    <ul id="emp" class="ztree"></ul>
</div>
<!-- 设备管理的ztree树的添加节点模态框 -->
<div class="modal fade" id="tianjiamyModal" tabindex="-1"
     role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加节点</h4>
            </div>
            <div class="modal-body">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <form class="form-horizontal" role="form" action="#" type="post" id="addform">
                                <input type="hidden" class="form-control" name="id" >
                                <div class="form-group">
                                    <label for="name1" class="col-sm-2 control-label">姓名</label>
                                    <div class="col-sm-7">
                                        <input type="text" class="form-control" id="name1"
                                               name="name" placeholder="请输入名字">
                                    </div>
                                    <div class="col-sm-3">
                                        <span class="help-block" id="msg"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="name1" class="col-sm-2 control-label">编码</label>
                                    <div class="col-sm-7">
                                        <input type="text" class="form-control" id="code"
                                               name="code" placeholder="请输入编码">
                                    </div>

                                </div>
                                <input type="hidden" class="form-control" id="pId" name="parentId" >
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" class="btn btn-default" id="tijiao">提交</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal -->
</div>
</body>
<script>
    /*设备管理的ztree树的配置信息*/
    var setting={
        view : {//配置显示视图
            showLine : false,//不显示连接线，默认值true
            showIcon : true,//是否显示节点的图标(包括父级的文件夹图标子级的文件图标都不显示)，默认值true
            addHoverDom: addHoverDom,//用于当鼠标移动到节点上时，显示用户自定义控件，显示隐藏状态同 zTree 内部的编辑、删除按钮
            removeHoverDom: removeHoverDom,//用于当鼠标移出节点时，隐藏用户自定义控件，显示隐藏状态同 zTree 内部的编辑、删除按钮
            selectedMulti: false//设置是否允许同时选中多个节点。
        },
        edit: {
            enable: true,//设置 zTree 是否处于编辑状态
            editNameSelectAll: true,//节点编辑名称 input 初次显示时,设置 txt 内容是否为全选状态。
            showRemoveBtn: true,
            removeTitle: "删除节点",
            showRenameBtn: true,
            renameTitle: "编辑节点"
        },
        data : {
            simpleData:{
                enable :true,
                idKey : "id",
                pIdKey : "parentId",
                rootPid : 0
            }

        },
        async : {
            enable : true,
            url : "${pageContext.request.contextPath}/areas/getAllArea",
            autoParam:["id","name","parentId"]

        },callback:{
            //onClick:zTreeOnClick,
            //beforeRemove: zTreeBeforeRemove,//移除前
           // onRename: onRename

        }
    }

    var newCount=1;
    function addHoverDom(treeId,treeNode){

        var sObj=$("#"+treeNode.tId+"_span");//节点id的值
        //treeNode.editNameFlag节点是否可编辑
        if(treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
        var addStr="<span class='button add' id='addBtn_"+treeNode.tId+"' title='add node' onfocus='this.blur();'></span>";
        //li之后可加span
        sObj.after(addStr);
        var btn=$("#addBtn_"+treeNode.tId);//追加span对象
        if (btn) btn.bind("click", function(){
            addNodes(treeId, treeNode);
        });

    };
    function addNodes(treeId,treeNode){
        $("#tianjiamyModal").modal('show');
        $("#tijiao").click(function(){
            $("#pId").val(treeNode.id);
            var name= $("#name1").val();
            var parentId= $("#pId").val();
            var code= $("#code").val();

            $.ajax({
                url:'${pageContext.request.contextPath}/areas/insertOne',
                type:'post',
                data:{name:name,parentId:parentId,code:code},
                dataType:'json',

                success:function(data){
                    alert("添加成功！");
                    $("#tianjiamyModal").modal('hide');
                    intZtree();
                },error:function(data){
                    alert("失败！");
                }
            });

        })



    };

    /*鼠标移出后隐藏图标  */
    function removeHoverDom(treeId,treeNode){

        $("#addBtn_"+treeNode.tId).unbind().remove();

    };
    /*每次预加载刷新树  */
    $(function(){
        intZtree();
    });
    /*封装一个刷新树的方法  */
    function intZtree(){
        $.fn.zTree.init($("#emp"), setting);//初始化    setting:配置项
    };

</script>
</html>
