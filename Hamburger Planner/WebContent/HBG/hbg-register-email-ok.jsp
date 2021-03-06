<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="hbg.dao.*" %>
<%@ page import="java.sql.Connection" %>

<% 	
	UserDAO dao = UserDAO.getInstance();
	String UUID = request.getParameter("UUID");
	String email = request.getParameter("user_email");
	Connection conn = null;
	int row = 0;
	row = dao.emailOk(conn, UUID, email);
%>
<!DOCTYPE html>
<html lang="ko">
<head>

<!-- META -->

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="Author" content="사이트 저작자">
<meta name="Keywords" content="검색 엔진을 위한 키워드">
<meta name="Description" content="사이트에 대한 설명">

<!-- RESPONSIVE -->

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">

<!-- SCRIPT -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!--<script src="경로" type="text/javascript"></script>-->

<!-- STYLESHEET -->

<link href="styles/base.css" type="text/css" rel="stylesheet">
<link href="styles/layout.css" type="text/css" rel="stylesheet">
<link href="styles/module.css" type="text/css" rel="stylesheet">
<link href="styles/states.css" type="text/css" rel="stylesheet">
<link href="styles/theme.css" type="text/css" rel="stylesheet">

<!-- TITLE -->

<title>TITLE</title>
<style>
.section-1{text-align: center;}    
</style>
</head>
<body>
  
    <div class="layout-wrap">
        <div class="layout-inner">
            
			<%@ include file="include/hbg-header.jsp" %>
          
            <div id="hbg-register-email">
            <c:if test="<%=row==1 %>">
                <div class="section-1">
                    <div class="msg">이메일 인증이 완료되었습니다.</div>
                    <a href="/hbg?command=login.go"><input type="button" class="next" value="로그인 이동"></a>
                </div>
                </c:if>
                <c:if test="<%=row==0 %>">
                <div class="section-1">
                    <div class="msg">비정상적인 접근입니다.</div>
                    <a href="/hbg?command=login.go"><input type="button" class="next" value="로그인 이동" ></a>
                </div>
                </c:if>
            </div>          
            
            <%@ include file="include/hbg-footer.jsp" %>
            
        </div>
    </div><!-- END WRAP END -->

</body>
</html>