<%--
  Created by IntelliJ IDEA.
  User: 北寒王
  Date: 2019/8/28
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap-closable-tab.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/closable-tab-div.js"></script>
</head>
<body>
<%@include file="/jsps/common/header.jsp"%>
<div class="container col-md-12" id="indexpage">
    <div class="row clearfix">
        <div class="col-md-2 column" style="margin-top: 0px;margin-left: -20px">
            <div style="height: 550px;overflow: auto;">
                <%@include file="/jsps/common/left.jsp"%>
            </div>
        </div>
        <div class="col-md-10 column">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div style="height: 530px;overflow: auto;">
                        <ul id="myTab" class="nav nav-tabs">

                        </ul>
                        <div id="myTabContent" class="tab-content">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

</html>
