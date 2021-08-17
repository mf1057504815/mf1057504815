<%--
  Created by IntelliJ IDEA.
  User: 19441
  Date: 2021/7/22
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>--%>
<HTML>
<HEAD>
    <TITLE>学员论坛--看贴</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=utf-8">
    <Link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/style.css"/>
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
        您尚未　<a href="${pageContext.request.contextPath}/go/login">登录</a>
        &nbsp;| &nbsp; <A href="${pageContext.request.contextPath}//go/reg">注册</A> |
    </DIV>

</c:if>
<!--      主体        -->
<DIV><br/>
    <!--      导航        -->
    <DIV>
        &gt;&gt;<B><a href="${pageContext.request.contextPath}/index">论坛首页</a></B>&gt;&gt;
        <B><a href="${pageContext.request.contextPath}/list?boardid=${board.boardid}">${board.boardname}</a></B>
    </DIV>
    <br/>
    <!--      回复、新帖        -->
    <DIV>
        <A href="${pageContext.request.contextPath}/post/toreply?topicid=${topic.topicid}&boardid=${board.boardid}&pageNo=${mypage.pageCount}"><IMG src="${pageContext.request.contextPath}/image/reply.gif" border="0" id=td_post></A>
        <A href="${pageContext.request.contextPath}/post/totopic?boardid=${board.boardid}"><IMG src="${pageContext.request.contextPath}/image/post.gif"   border="0" id=td_post></A>
    </DIV>
    <!--         翻 页         -->
    <DIV>
        <c:forEach var="p" begin="1" end="${mypage.pageCount}">
            <c:if test="${p!=mypage.pageNo}">
                <a style="text-decoration: underline;"
                   href="${pageContext.request.contextPath}/detail?boardid=${board.boardid}&topicid=${topic.topicid}&pageNo=${p}">${p}</a>&nbsp;
            </c:if>
            <c:if test="${p==mypage.pageNo}">
                <span>${p}</span>&nbsp;
            </c:if>
        </c:forEach>
        <!--      本页主题的标题        -->
        <DIV>
            <TABLE cellSpacing="0" cellPadding="0" width="100%">
                <TR>
                    <TH class="h">本页主题: ${topic.title}</TH>
                </TR>
                <TR class="tr2">
                    <TD>&nbsp;</TD>
                </TR>
            </TABLE>
        </DIV>

        <!--      主题        -->
        <c:if test="${mypage.pageNo==1}">
            <DIV class="t">
                <TABLE style="BORDER-TOP-WIDTH: 0px; TABLE-LAYOUT: fixed" cellSpacing="0" cellPadding="0" width="100%">
                    <TR class="tr1">
                        <TH style="WIDTH: 20%">
                            <B>${topic.user.uname}</B><BR/>
                            <img src="${pageContext.request.contextPath}/image/head/${topic.user.head}"/><BR/>
                            注册:<fmt:formatDate value="${topic.user.regtime}" pattern="yyyy-MM-dd HH:mm:ss"/><BR/>
                        </TH>
                        <TH>
                            <H4>${topic.title}</H4>
                            <DIV>${topic.content}</DIV>
                            <DIV class="tipad gray">
                                发表：[<fmt:formatDate value="${topic.publishtime}" pattern="yyyy-MM-dd HH:mm:ss"/>] &nbsp;
                                最后修改:[<fmt:formatDate value="${topic.modifytime}" pattern="yyyy-MM-dd HH:mm:ss"/>]
                            </DIV>
                        </TH>
                    </TR>
                </TABLE>
            </DIV>
        </c:if>


        <!--      回复        -->
        <<c:forEach var="reply" items="${mypage.pageList}">
        <DIV class="t">
            <TABLE style="BORDER-TOP-WIDTH: 0px; TABLE-LAYOUT: fixed" cellSpacing="0" cellPadding="0" width="100%">
                <TR class="tr1">
                    <TH style="WIDTH: 20%">
                        <B>${reply.user.uname}</B><BR/><BR/>
                        <img src="${pageContext.request.contextPath}/image/head/${reply.user.head}"/><BR/>
                        注册:<fmt:formatDate value="${reply.user.regtime}" pattern="yyyy-MM-dd HH:mm:ss"/><BR/><BR/>
                    </TH>
                    <TH>
                        <H4>${reply.title}</H4>
                        <DIV>${reply.content}</DIV>
                        <DIV class="tipad gray">
                            发表：[<fmt:formatDate value="${reply.publishtime}" pattern="yyyy-MM-dd HH:mm:ss"/>] &nbsp;
                            最后修改:[<fmt:formatDate value="${reply.modifytime}" pattern="yyyy-MM-dd HH:mm:ss"/>]
                            <c:if test="${sessionScope.User.uid==reply.user.uid}">
                            <A href="${pageContext.request.contextPath}/delete?replyid=${reply.replyid}&boardid=${board.boardid}&topicid=${topic.topicid}&pageNo=${mypage.pageNo}" onclick="return del()">[删除]</A>
                            <A href="${pageContext.request.contextPath}/toupdate?boardid=${board.boardid}&replyid=${reply.replyid}&topicid=${topic.topicid}&pageNo=${mypage.pageNo}">[修改]</A>
                            </c:if>
                        </DIV>
                    </TH>
                </TR>
            </TABLE>
        </DIV>
    </c:forEach>

        <script>
            function del() {
                if (confirm("确实要删除吗?")) {
                    return true;
                    alert(${msg});
                } else {

                    return false;
                    alert(${msg});
                }
            }
        </script>
    </DIV>

    <DIV>

        <c:if test="${!mypage.firstPage}">
            <a href="${pageContext.request.contextPath}/detail?boardid=${board.boardid}&topicid=${topic.topicid}&pageNo=1">首页</a>
            <a href="${pageContext.request.contextPath}/detail?boardid=${board.boardid}&topicid=${topic.topicid}&pageNo=${mypage.pageNo-1}">上一页</a>
        </c:if>
        |
        <c:if test="${!mypage.lastPage}">
            <a href="${pageContext.request.contextPath}/detail?boardid=${board.boardid}&topicid=${topic.topicid}&pageNo=${mypage.pageNo+1}">下一页</a>
            <a href="${pageContext.request.contextPath}/detail?boardid=${board.boardid}&topicid=${topic.topicid}&pageNo=${mypage.pageCount}">尾页</a>
        </c:if>
        |
        第${mypage.pageNo}/${mypage.pageCount}&nbsp;共${mypage.rowCount+1}条
    </DIV>
    <span>${msgg}</span>
    <span>${msggg}</span>
    <!--      声明        -->
    <BR>
    <CENTER class="gray">Oriental Boyi Education
        Information Technology Co.,Ltd 版权所有
    </CENTER>
</BODY>
</HTML>
