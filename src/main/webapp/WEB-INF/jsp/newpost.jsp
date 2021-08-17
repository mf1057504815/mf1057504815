<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 19441
  Date: 2021/7/28
  Time: 13:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<HTML>
<HEAD>
    <TITLE>学员论坛--发布帖子</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=utf-8">
    <Link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/style.css" />
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"/>
    <script type="text/javascript">
        function check(){
            if(document.postForm.title.value=="") {
                alert("标题不能为空");
                return false;
            }
            if(document.postForm.content.value=="") {
                alert("内容不能为空");
                return false;
            }
            if(document.postForm.content.value.length>1000) {
                alert("长度不能大于1000");
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


<!--      主体        -->
<DIV><BR/>
    <!--      导航        -->
    <DIV>
        &gt;&gt;<B><a href="index.jsp">论坛首页</a></B>&gt;&gt;
        <B><a href="list.jsp">C#语言</a></B>
    </DIV><BR/>
    <DIV>
        <FORM name="postForm" onsubmit="return check()" action="/post/topic">
            <INPUT type="hidden" name="boardid" value="${topic.boardid}"/>
            <INPUT type="hidden" name="topicid" value="${topic.topicid}"/>
            <c:if test="${sessionScope.User!=null}">
                <INPUT type="hidden" name="uid" value="${sessionScope.User.uid}"/>
            </c:if>
            <c:if test="${sessionScope.User==null}">
            <script type="text/javascript">
                function check(){
                    alert("用户没有登录");
                    return false;
                    location.href="/go/login"
                }
            </script>
            </c:if>
            <DIV class="t">
                <TABLE cellSpacing="0" cellPadding="0" align="center">
                    <TR>
                        <TD class="h" colSpan="3"><B>发表帖子</B></TD>
                    </TR>

                    <TR class="tr3">
                        <TH width="20%"><B>标题</B></TH>
                        <TH><INPUT class="input" style="PADDING-LEFT: 2px; FONT: 14px Tahoma" tabIndex="1" size="60" name="title"></TH>
                    </TR>

                    <TR class="tr3">
                        <TH vAlign=top>
                            <DIV><B>内容</B></DIV>
                        </TH>
                        <TH colSpan=2>
                            <DIV>
                                <span><textarea style="WIDTH: 500px;" name="content" rows="20" cols="90" tabIndex="2" ></textarea></span>
                            </DIV>
                            (不能大于:<FONT color="blue">1000</FONT>字)
                        </TH>
                    </TR>
                    <span id="registerMsg"></span>
                </TABLE>
                <script>

                    alert(${"#registerMsg"})
                </script>
            </DIV>

            <DIV style="MARGIN: 15px 0px; TEXT-ALIGN: center">
                <INPUT class="btn" tabIndex="3" type="submit" value="提 交">
                <INPUT class="btn"  tabIndex="4" type="reset"  value="重 置">
            </DIV>
        </FORM>
    </DIV>
</DIV>

<!--      声明        -->
<BR/>
<CENTER class="gray">Oriental Boyi Education
    Information Technology Co.,Ltd 版权所有</CENTER>

</BODY>
</HTML>

