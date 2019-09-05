<%--
  Created by IntelliJ IDEA.
  User: 北寒王
  Date: 2019/8/28
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.js"></script>

</head>
<body>
<div class="container  col-sm-12 " style="padding: 0px;margin: 0px;" >
    <div class="row clearfix">
        <div  class="col-md-12 column">
                <div class="container-fluid" style="background-color: #002a80">
                    <ul class="nav navbar-nav navbar-left">
                        <li><h4 style="color: white">太平洋保险</h4></li>

                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a style="color: red;">欢迎${user.userName }</a></li>
                        <li><a href="${pageContext.request.contextPath}/users/logout">退出</a></li>
                    </ul>
                </div>
        </div>
    </div>
</div>

</body>
</html>
