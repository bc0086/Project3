<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 제목 : logout.jsp -->

<%
	session.removeAttribute("USER_ID");
	session.removeAttribute("USER_PW");
	
	session.invalidate();
	
	response.sendRedirect("../main/main.jsp");
%>	

<script>
	alert("로그아웃 되었습니다.");
	location.href="../main/main.jsp";
</script>