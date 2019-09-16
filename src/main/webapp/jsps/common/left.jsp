<%--
  Created by IntelliJ IDEA.
  User: 北寒王
  Date: 2019/8/28
  Time: 15:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/ztree/css/demo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/ztree/css/zTreeStyle/zTreeStyle.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/imageUpload.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/table/bootstrap-table.css">
    <script  type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/echarts.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/table/bootstrap-table.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/table/locale/bootstrap-table-zh-CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap-closable-tab.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/closable-tab-div.js"></script>
    <script  type="text/javascript" src="${pageContext.request.contextPath}/static/uploadImg26.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath }/static/ztree/js/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/ztree/js/jquery.ztree.excheck.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/ztree/js/jquery.ztree.exedit.js"></script>
    <style type="text/css">
        #accordion .panel-heading{
            background-color: #D1E0F5;
            color: #16408A;
            font-weight: 900;
            font-size: 5px;
            font-family: "黑体"
        }
        #accordion{
            background-color: #D1E0F5;
        }

    </style>

</head>
<body>
<div class="panel-group" id="accordion" style="height: 100%">
<c:if test="${user.level==4 }">
    <div class="panel panel-default">

            <div class="panel-heading">
                <h4 class="panel-title">
                    <a href="javascript:chakanshuju()"> 查看数据</a>

                </h4>
            </div>


    </div>
    <div class="panel panel-default">

            <div class="panel-heading">
                <h4 class="panel-title">
                    <a href="javascript:jigouguanli()">   机构管理</a>
                </h4>
            </div>


    </div>
    <div class="panel panel-default">

            <div class="panel-heading">
                <h4 class="panel-title">
                    <a href="javascript:yonghuguanli()">   用户管理</a>
                </h4>
            </div>


    </div>
</c:if>
<c:if test="${user.level==2 }">
    <div class="panel panel-default">

            <div class="panel-heading">
                <h4 class="panel-title">
                    <a href="javascript:chakanshuju()"> 查看数据</a>

                </h4>
            </div>


    </div>
    <div class="panel panel-default">

            <div class="panel-heading">
                <h4 class="panel-title">
                    <a href="javascript:jigouguanli()">   机构管理</a>
                </h4>
            </div>


    </div>
    <div class="panel panel-default">

            <div class="panel-heading">
                <h4 class="panel-title">
                    <a href="javascript:yonghuguanli()">   用户管理</a>
                </h4>
            </div>


    </div>
</c:if>
<c:if test="${user.level==0 }">
    <div class="panel panel-default">

    <div class="panel-heading">
    <h4 class="panel-title">
    <a href="javascript:chakanshuju()"> 查看数据</a>

    </h4>
    </div>


    </div>
    <div class="panel panel-default">

            <div class="panel-heading">
                <h4 class="panel-title">
                    <a href="javascript:yubaoshuju()">预报数据</a>
                </h4>
            </div>


    </div>
    <div class="panel panel-default">

            <div class="panel-heading">
                <h4 class="panel-title">
                    <a href="javascript:shangbaoshuju()">上报数据</a>
                </h4>
            </div>


    </div>
</c:if>
<c:if test="${user.level==1}">
    <div class="panel panel-default">

        <div class="panel-heading">
            <h4 class="panel-title">
                <a href="javascript:chakanshuju()"> 查看数据</a>

            </h4>
        </div>


    </div>

    <div class="panel panel-default">

        <div class="panel-heading">
            <h4 class="panel-title">
                <a href="javascript:yubaoshuju()">预报数据</a>
            </h4>
        </div>


    </div>
    <div class="panel panel-default">

        <div class="panel-heading">
            <h4 class="panel-title">
                <a href="javascript:shangbaoshuju()">上报数据</a>
            </h4>
        </div>


    </div>
</c:if>
</div>
</body>
<script>
$(function () {
    closableTab.addTab({"id" : "p1" , "name" : "查看数据" , "url" : "/jsps/chakanshuju.jsp" , "closable" : false});

})
function chakanshuju() {
    closableTab.addTab({"id" : "p1" , "name" : "查看数据" , "url" : "/jsps/chakanshuju.jsp" , "closable" : false});

}
function jigouguanli() {
    closableTab.addTab({"id" : "p2" , "name" : "机构管理" , "url" : "/jsps/jigouguanli.jsp" , "closable" : true});

}
function yonghuguanli() {
    closableTab.addTab({"id" : "p3" , "name" : "用户管理" , "url" : "/jsps/yonghuguanli.jsp" , "closable" : true});

}
function yubaoshuju() {
    closableTab.addTab({"id" : "p4" , "name" : "预报数据" , "url" : "/jsps/yubaoshuju.jsp" , "closable" : true});

}
function shangbaoshuju() {
    closableTab.addTab({"id" : "p5" , "name" : "上报数据" , "url" : "/jsps/shangbaoshuju.jsp" , "closable" : true});

}

    function createTab(id,name,url,isClose){
        closableTab.addTab({'id': id, 'name': name, 'url': url, 'closable': isClose});
    }


</script>
</html>
