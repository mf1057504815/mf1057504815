<%--
  Created by IntelliJ IDEA.
  User: 19441
  Date: 2021/7/22
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<HTML>
<HEAD>
    <TITLE>学员论坛--注册</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=gbk">
    <Link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/style.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"/>
    <script language="javascript">
        function check() {
            if(document.regForm.uName.value==""){
                alert("用户名不能为空");
                return false;
            }
            if(document.regForm.uPass.value==""){
                alert("密码不能为空");
                return false;
            }
            if(document.regForm.uPass.value != document.regForm.uPass1.value){
                alert("2次密码不一样");
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
    &gt;&gt;<B><a href="index.jsp">论坛首页</a></B>
</DIV>
<!--      用户注册表单        -->
<DIV  class="t" style="MARGIN-TOP: 15px" align="center">
    <FORM name="regForm" id="regForm" onSubmit="return check()" method="post">
        <br/>用&nbsp;户&nbsp;名 &nbsp;
        <INPUT class="input" tabIndex="1" tryp="text" maxLength="20" size="35" name="uname">
        <br/>密&nbsp;&nbsp;&nbsp;&nbsp;码 &nbsp;
        <INPUT class="input" tabIndex="2" type="password" maxLength="20" size="40" name="upass">
        <br/>重复密码 &nbsp;
        <INPUT class="input" tabIndex="3" type="password" maxLength="20" size="40" name="upass1">
        <br/>性别 &nbsp;
        女<input type="radio" name="gender" value="1">
        男<input type="radio" name="gender" value="2" checked="checked" />
        <br/>请选择头像 <br/>
        <img src="${pageContext.request.contextPath}/image/head/1.gif"/><input type="radio" name="head" value="1.gif" checked="checked">
        <img src="${pageContext.request.contextPath}/image/head/2.gif"/><input type="radio" name="head" value="2.gif">
        <img src="${pageContext.request.contextPath}/image/head/3.gif"/><input type="radio" name="head" value="3.gif">
        <img src="${pageContext.request.contextPath}/image/head/4.gif"/><input type="radio" name="head" value="4.gif">
        <img src="${pageContext.request.contextPath}/image/head/5.gif"/><input type="radio" name="head" value="5.gif">
        <BR/>
        <img src="${pageContext.request.contextPath}/image/head/6.gif"/><input type="radio" name="head" value="6.gif">
        <img src="${pageContext.request.contextPath}/image/head/7.gif"/><input type="radio" name="head" value="7.gif">
        <img src="${pageContext.request.contextPath}/image/head/8.gif"/><input type="radio" name="head" value="8.gif">
        <img src="${pageContext.request.contextPath}/image/head/9.gif"/><input type="radio" name="head" value="9.gif">
        <img src="${pageContext.request.contextPath}/image/head/10.gif"/><input type="radio" name="head" value="10.gif">
        <BR/>
        <img src="${pageContext.request.contextPath}/image/head/11.gif"/><input type="radio" name="head" value="11.gif">
        <img src="${pageContext.request.contextPath}/image/head/12.gif"/><input type="radio" name="head" value="12.gif">
        <img src="${pageContext.request.contextPath}/image/head/13.gif"/><input type="radio" name="head" value="13.gif">
        <img src="${pageContext.request.contextPath}/image/head/14.gif"/><input type="radio" name="head" value="14.gif">
        <img src="${pageContext.request.contextPath}/image/head/15.gif"/><input type="radio" name="head" value="15.gif">
        <br/>
        <INPUT class="btn" id="btnRegister" tabIndex="4" type="button" value="注 册">
        <span id="registerMsg" style="color: red;"></span>
    </FORM>
</DIV>



<script  language="javascript">
    $(function(){
        $("#registerMsg").html("");
        $("#btnRegister").click(function (){
            $.ajax({
                url:"${pageContext.request.contextPath}/reg",
                data:$("#regForm").serialize(),//序列化表单
                type:'POST',
                success:function (result){
                    console.log(result);
                    if(result=="error"){
                        $("#registerMsg").html("注册失败");
                    }else if(result=="success"){
                        location.href="/go/login";
                    }
                },
                error:function (){
                    console.log("请求失败");
                }
            })
        })

    })
</script>
<!--      声明        -->
<BR>
<CENTER class="gray">Oriental Boyi Education
    Information Technology Co.,Ltd 版权所有</CENTER>
</BODY>
</HTML>
