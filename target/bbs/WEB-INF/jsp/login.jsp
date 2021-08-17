<%--
  Created by IntelliJ IDEA.
  User: 19441
  Date: 2021/7/22
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<HTML>
<HEAD>
    <TITLE>学员论坛--登录</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=utf-8">
    <Link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/style.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"/>
    <script language="javascript">
        function check() {
            if (document.loginForm.uname.value == "") {
                alert("用户名不能为空");
                return false;
            }
            if (document.loginForm.upass.value == "") {
                alert("密码不能为空");
                return false;
            }
        }
    </script>
</HEAD>

<BODY>
<DIV>
    <IMG src="${pageContext.request.contextPath}/image/logo.gif">
</DIV>
<!--      用户信息、登录、注册        -->

<c:if test="${sessionScope.User!=null}">
    ${sessionScope.User.uname},欢迎！
    &nbsp; &nbsp; <a href="/logOut">登出</a>
</c:if>
<c:if test="${sessionScope.User==null}">

    <DIV class="h">
        您尚未　<a href="/go/login">登录</a>
        &nbsp;| &nbsp; <A href="/go/reg">注册</A> |
    </DIV>

</c:if>


<BR/>
<!--      导航        -->
<DIV>
    &gt;&gt;<B><a href="${pageContext.request.contextPath}/index">论坛首页</a></B>
</DIV>
<!--      用户登录表单        -->
<DIV class="t" style="MARGIN-TOP: 15px" align="center">
    <FORM name="loginForm" onSubmit="return check()">
        <br/>用户名 &nbsp;<INPUT class="input" tabIndex="1" type="text" maxLength="20" size="35" name="uname" id="uname">
        <br/>密　码 &nbsp;<INPUT class="input" tabIndex="2" type="password" maxLength="20" size="40" name="upass"
                              id="upass">
        <br/><INPUT class="btn" tabIndex="6" type="button" id="btnLogin" value="登 录">
        <span style="color:#2C59AA" id="loginMsg"></span>

    </FORM>
</DIV>

<script language="javascript">
    $(function () {
        $("#loginMsg").html("");
        $("#btnLogin").click(function () {
            $.ajax({
                url: "${pageContext.request.contextPath}/login",
                data: {"uname": $("#uname").val(), "upass": $("#upass").val()},
                type: 'GET',
                success: function (result) {
                    console.log(result);
                    if (result == "error") {
                        $("#loginMsg").html("账号或者密码错误");
                    } else if (result == "success") {
                        location.href = "/index";
                    }
                },
                error: function () {
                    console.log("请求失败");
                }
            })
        })

    })
</script>
<!--      声明        -->

<BR/>
<CENTER class="gray">Oriental Boyi Education
    Information Technology Co.,Ltd 版权所有
</CENTER>
</BODY>
</HTML>
