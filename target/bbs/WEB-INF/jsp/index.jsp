<%--
  Created by IntelliJ IDEA.
  User: 19441
  Date: 2021/7/21
  Time: 15:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>--%>

<HTML>
<HEAD>
    <TITLE>欢迎访问学员论坛</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=utf-8">
    <Link rel="stylesheet" type="text/css" href="style/style.css" />
</HEAD>

<BODY>
<c:if test="${msg!=null}">
    <script>
        alert("aaaaaa");
    </script>
</c:if>
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
<DIV class="t">
    <TABLE cellSpacing="0" cellPadding="0" width="100%">
        <TR class="tr2" align="center">
            <TD colSpan="2">论坛</TD>
            <TD style="WIDTH: 10%;">主题</TD>
            <TD style="WIDTH: 30%">最后发表</TD>
        </TR>
        <!--       主版块       -->
<c:forEach var="boardtype" items="${List}">
        <TR class="tr3">
            <TD colspan="4">${boardtype.boardtypename}</TD>
        </TR>
        <!--       子版块       -->
    <c:forEach var="board" items="${boardtype.boardList}">
        <TR class="tr3">
            <TD width="5%">&nbsp;</TD>
            <TH align="left">
                <IMG src="image/board.gif">
                <A href="${pageContext.request.contextPath}/list?boardid=${board.boardid}">${board.boardname}</A>
            </TH>
            <TD align="center">${board.topicnum}</TD>
            <TH>
                <c:if test="${board.topicnum==0}">
                    无
                </c:if>

				<SPAN>
					<A href="/detail?boardid=${board.boardid}&topicid=${board.lasttopic.topicid}">${board.lasttopic.title} </A>
				</SPAN>
                <BR/>
                <SPAN>${board.lasttopic.user.uname}</SPAN><fmt:formatDate value="${board.lasttopic.modifytime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                <SPAN class="gray"><fmt:formatDate value="${board.lasttopic.modifytime}" pattern="yyyy-MM-dd HH:mm:ss"/></SPAN>
            </TH>
        </TR>
    </c:forEach>




</c:forEach>
    </TABLE>
</DIV>

<BR/>
<CENTER class="gray">Oriental Boyi Education
    Information Technology Co.,Ltd 版权所有</CENTER>
</BODY>
</HTML>
