<%--
  Created by IntelliJ IDEA.
  User: 19441
  Date: 2021/7/27
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>s
<HTML>
<HEAD>
    <TITLE>学员论坛--修改帖子</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=utf-8">
    <Link rel="stylesheet" type="text/css" href="style/style.css" />
    <script type="text/javascript">
        function check(){
            if(document.updateForm.title.value=="") {
                alert("标题不能为空");
                return false;
            }
            if(document.updateForm.content.value=="") {
                alert("内容不能为空");
                return false;
            }
            if(document.updateForm.content.value.length>1000) {
                alert("长度不能大于1000");
                return false;
            }
        }
    </script>
</HEAD>

<BODY>
<DIV>
    <IMG src="image/logo.gif">
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


<!--      主体        -->
<DIV><BR/>
    <!--      导航        -->
    <DIV>
        &gt;&gt;<B><a href="${pageContext.request.contextPath}/index">论坛首页</a></B>&gt;&gt;
        <B><a href="${pageContext.request.contextPath}/list?boardid=${board.boardid}">${board.boardname}</a></B>
    </DIV><BR/>
    <DIV>
        <FORM name="updateForm" onSubmit="return check();" action="/update">
            <INPUT type="hidden" name="boardid" value="${topic.boardid}"/>
            <INPUT type="hidden" name="replyid" value="${reply.replyid}"/>
            <INPUT type="text" name="pageNo" value="${pageNo}"/>
            <INPUT type="hidden" name="topicid" value="${topic.topicid}"/>
            <DIV class="t">
                <TABLE cellSpacing="0" cellPadding="0" align="center">

                    <TR>
                        <TD class="h" colSpan="3"><B>&#20462;&#25913;&#24086;&#23376;</B></TD>
                    </TR>

                    <TR class="tr3">
                        <TH width="20%"><B>标题</B></TH>
                        <TH><INPUT name="title" value="${reply.title}" class="input" style="PADDING-LEFT: 2px; FONT: 14px Tahoma" tabIndex="1" size="60"></TH>
                    </TR>

                    <TR class="tr3">
                        <TH vAlign="top">
                            <DIV><B>内容</B></DIV>
                        </TH>
                        <TH colSpan="2">
                            <DIV>
                                <span><textarea  name="content" style="WIDTH: 500px;" rows="20" cols="90" tabIndex="2" >${reply.content}</textarea></span>
                            </DIV>
                            (不能大于:<FONT color="blue">1000</FONT>字)
                        </TH>
                    </TR>
                </TABLE>
            </DIV>

            <DIV style="MARGIN: 15px 0px; TEXT-ALIGN: center">
                <INPUT class="btn" tabIndex="3" type="submit" value="修 改">
            </DIV>
        </FORM>

    </DIV>
    <!--      声明        -->
    <BR/>
</DIV>
<CENTER class="gray">Oriental Boyi Education
    Information Technology Co.,Ltd 版权所有</CENTER>

</BODY>
</HTML>

