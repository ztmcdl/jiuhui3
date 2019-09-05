<%--
  Created by IntelliJ IDEA.
  User: 北寒王
  Date: 2019/7/31
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/static/jquery-1.4.2.min.js"></script>
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;

        }
        div{
            width: 200px;
            height: 200px;
            background-color: #ffffff;
        }
        .center-in-center{
            background-color: #ffffff;
            position: absolute;
            top: 40%;
            left: 45%;
        }
    </style>
</head>
<body>
<div  class="center-in-center">
用户：<input type="text"  id="userCode" value="${userCode}"><br>
密码：<input type="password"  id="password"  value="${password}"><br>
    <input type="checkbox" id="jzmm">记住密码<br>
    <input type="hidden" id="jzmm2">
      <button type="button" onclick="denglu()" id="denglu">登录</button>
</div>
</body>
<script>
    $(function () {
var password=$("#password").val();
        if (password==''||password==null) {

        }else {

            $("#jzmm").attr("checked","checked");
        }

    })
    function denglu() {
        var userCode=$("#userCode").val();
        var password=$("#password").val();
        var $isChecked = $("#jzmm").is(":checked");
        if ($isChecked==false){
        $("#jzmm2").val(0);

        }
        if ($isChecked==true){
        $("#jzmm2").val(1);

        }
     var jzmm2=$("#jzmm2").val();

        $.ajax({
        url:"${pageContext.request.contextPath}/users/login",
        type:"post",
        dataType:"json",
        data:{userCode:userCode,password:password,jzmm2:jzmm2},
        error : function(error) {
            alert('登陆失败！');
        },success : function(data) {
            if (data.flag) {

                location.href = "${pageContext.request.contextPath}/jsps/common/bodypage.jsp";
            }else{
                alert(data.msg);
            }
        }


    })
    }
    document.onkeydown = function(e){
        var ev = document.all ? window.event : e;
        if(ev.keyCode==13) {
          $("#denglu").click();
        }
    }


</script>
</html>
