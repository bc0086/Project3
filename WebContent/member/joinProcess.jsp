<%@page import="model.MemberDTO"%>
<%@page import="java.util.Map"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 제목 : joinProcess.jsp -->
<%
String name = request.getParameter("name");
String id = request.getParameter("id");
String pwd1 = request.getParameter("pwd1");
String tel = request.getParameter("tel1") + '-' + request.getParameter("tel2") + '-' + request.getParameter("tel3");
String mobile = request.getParameter("mobile1") + '-' + request.getParameter("mobile2") + '-' + request.getParameter("mobile3");
String email = request.getParameter("email_1") + '@' + request.getParameter("email_2");
String addr = request.getParameter("roadAddress") + request.getParameter("detailAddress");

//MariaDB정보로 변경되므로 초기화 파라미터를 수정한다.
String drv = application.getInitParameter("MariaJDBCDriver");
String url = application.getInitParameter("MariaConnectURL");

MemberDAO dao = new MemberDAO(drv, url);

MemberDTO dto = new MemberDTO();

dto.setName(name);
dto.setId(id);
dto.setPass(pwd1);
dto.setPnum(tel);
dto.setHnum(mobile);
dto.setEmail(email);
dto.setAddr(addr);

int affected = dao.getJoin(dto);

if(affected==1){
	%>
	<script>
	alert("회원가입에 성공하였습니다.");
	window.location="../main/main.jsp";
	</script>
	<%
}
else{
	// 저장된 값이 없다면, 리퀘스트 영역에 오류메세지를 저장하고 포워드한다.
	%>
	<script>
		alert("회원가입에 실패하였습니다.");
		history.go(-1);
	</script>
<%
}
%>