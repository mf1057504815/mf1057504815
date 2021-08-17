<%--
  Created by IntelliJ IDEA.
  User: 19441
  Date: 2021/7/23
  Time: 13:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<HTML>
<HEAD>
    <TITLE>学员论坛--帖子列表</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=utf-8">
    <Link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/style.css" />
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


<!--      主体        -->
<DIV>
    <!--      导航        -->
    <br/>
    <DIV>
        &gt;&gt;<B><a href="${pageContext.request.contextPath}/index">论坛首页</a></B>&gt;&gt;
        <B><a href="${pageContext.request.contextPath}/list?boardid=${board.boardid}">${board.boardname}</a></B>
    </DIV>
    <br/>
    <!--      新帖        -->
    <DIV>
        <A href="${pageContext.request.contextPath}/post/totopic?boardid=${board.boardid}"><IMG src="${pageContext.request.contextPath}/image/post.gif" name="td_post" border="0" id=td_post></A>
    </DIV>
    <!--         翻 页         -->
    <DIV>
        <c:forEach var="p" begin="1" end="${mypage.pageCount}">
            <c:if test="${p!=mypage.pageNo}">
                <a style="text-decoration: underline;" href="${pageContext.request.contextPath}/list?boardid=${board.boardid}&pageNo=${p}">${p}</a>&nbsp;
            </c:if>
            <c:if test="${p==mypage.pageNo}">
                <span>${p}</span>&nbsp;
            </c:if>
        </c:forEach>

    </DIV>

    <DIV class="t">
        <TABLE cellSpacing="0" cellPadding="0" width="100%">
            <TR>
                <TH class="h" style="WIDTH: 100%" colSpan="4"><SPAN>&nbsp;</SPAN></TH>
            </TR>
            <!--       表 头           -->
            <TR class="tr2">
                <TD>&nbsp;</TD>
                <TD style="WIDTH: 80%" align="center">文章</TD>
                <TD style="WIDTH: 10%" align="center">作者</TD>
                <TD style="WIDTH: 10%" align="center">回复</TD>
            </TR>
            <!--         主 题 列 表        -->
            <c:forEach var="topic" items="${mypage.pageList}">
            <TR class="tr3">
                <TD><IMG src="${pageContext.request.contextPath}/image/topic.gif" border=0></TD>
                <TD style="FONT-SIZE: 15px">
                    <A href="/detail?boardid=${board.boardid}&topicid=${topic.topicid}&pageNo=1">${topic.title}</A>
                </TD>
                <TD align="center">${topic.user.uname}</TD>
                <TD align="center">${topic.replyNum}</TD>
            </TR>
            </c:forEach>


        </TABLE>
    </DIV>
    <!--            翻 页          -->
    <DIV>

        <c:if test="${!mypage.firstPage}">
            <a href="${pageContext.request.contextPath}/list?boardid=${board.boardid}&pageNo=1">首页</a>
            <a href="${pageContext.request.contextPath}/list?boardid=${board.boardid}&pageNo=${mypage.pageNo-1}">上一页</a>
        </c:if>
        |
        <c:if test="${!mypage.lastPage}">
            <a href="${pageContext.request.contextPath}/list?boardid=${board.boardid}&pageNo=${mypage.pageNo+1}">下一页</a>
            <a href="${pageContext.request.contextPath}/list?boardid=${board.boardid}&pageNo=${mypage.pageCount}">尾页</a>
        </c:if>
        |
        第${mypage.pageNo}/${mypage.pageCount}&nbsp;共${mypage.rowCount}条

    </DIV>
    <span>${msgg}</span>
</DIV>
<!--             声 明          -->
<BR/>
<CENTER class="gray">Oriental Boyi Education
    Information Technology Co.,Ltd 版权所有</CENTER>

</BODY>
</HTML>