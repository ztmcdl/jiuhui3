<%--
  Created by IntelliJ IDEA.
  User: 北寒王
  Date: 2019/8/28
  Time: 20:17
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
<div class="col-sm-3">
    <ul id="emp2" class="ztree"></ul>
</div>
<div class="col-sm-9">
    <div class="panel panel-info">
        <h3 class="panel-heading" id="tableTitle" style="text-align: center;"></h3>

        <div class="panel-body">
            <input type="hidden" id="uid" />
            <table id="tab3" class="table">

            </table>
        </div>
    </div>

</div>


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
                                <div class="form-group">
                                    <label for="password" class="col-sm-2 control-label">密码</label>
                                    <div class="col-sm-7">
                                        <input type="text" class="form-control" id="password"
                                               name="password" placeholder="请输入编码">
                                    </div>

                                </div>

                                <input type="hidden" id="level">
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
    $(function(){
        $("#tab3").bootstrapTable({
            url :"${pageContext.request.contextPath }/yonghus/finaAllzhanshiyonghu", //请求路径

            pagination : true,//开启分页
            sidePagination:'client',//使用服务端分页
            method : 'post',//默认不写get
            cache : false,//禁用缓存
            contentType : "application/x-www-form-urlencoded;charset=UTF-8",//发送到服务器的数据编码类型，设置from表单传输编码

            queryParams : function(params) {//请求参数
                return {

                    id:$("#uid").val()
                }
            },
            columns : [ {
                checkbox:true//开启复选框
            },{
                field : 'id',
                title : '序号',
                formatter : function(value, row, index) {
                    return index + 1;
                }
            }, {
                field : 'name',
                title : '名称',

            }, {
                field : 'userCode',
                title : '编码'
            },{
                title : '操作',

                }]
        });
    });


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
                pIdKey : "pId",
                rootPid : 0
            }

        },
        async : {
            enable : true,
            url : "${pageContext.request.contextPath}/yonghus/findAllyonghu",
            autoParam:["id","name","pId"]

        },callback:{
            onClick:zTreeOnClick,

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
            var userName= $("#name1").val();
            var pId= $("#pId").val();
            var userCode= $("#code").val();
            var password= $("#password").val();
            var level=$("#level").val();

            $.ajax({
                url:'${pageContext.request.contextPath}/yonghus/insertuser',
                type:'post',
                data:{userName:userName,pId:pId,userCode:userCode,password:password,level:level},
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
    function zTreeOnClick(event,treeId,treeNode){
        var id=treeNode.id;

        chaxunlevel(id);
        var str=treeNode.name;

        $("#tableTitle").html(str);
        $("#uid").val(treeNode.id);//给input框赋值

        $("#tab3").bootstrapTable("refresh");//点击参数刷新表格

    }
    
    function chaxunlevel(id) {
        $.ajax({
            url:"${pageContext.request.contextPath}/yonghus/chaxunlevel",
            type:"post",
            data:{id:id},
            dataType:"json",
            success:function (data) {
                $(data).each(function(a,b){
                    if (b.level==2){
                        $("#level").val(1);

                    }
                    if (b.level==1){
                        $("#level").val(0);

                    }



                });
            }
            
        })
    }
    /*鼠标移出后隐藏图标  */
    function removeHoverDom(treeId,treeNode){

        $("#addBtn_"+treeNode.tId).unbind().remove();

    };
    $(function(){
        intZtree();
    });
    /*封装一个刷新树的方法  */
    function intZtree(){
        $.fn.zTree.init($("#emp2"), setting);//初始化    setting:配置项
    };
</script>
</html>
