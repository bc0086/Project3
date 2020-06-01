<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 제목 : loginProcess.jsp -->
<%
	String id = request.getParameter("user_id");
String pw = request.getParameter("user_pw");

// MariaDB정보로 변경되므로 초기화 파라미터를 수정한다.
String drv = application.getInitParameter("MariaJDBCDriver");
String url = application.getInitParameter("MariaConnectURL");

MemberDAO dao = new MemberDAO(drv, url);

// Map 컬렉션에 회원정보 저장후 반환받기
Map<String, String> memberInfo = dao.getMemberMap(id, pw);

//Map의 id키값에 저장된 값이 있는지 확인
if(memberInfo.get("id") != null){
	// 저장된 값이 있다면... 세션 영역에 아이디, 패스워드, 이름을 속성으로 저장한다.	
	session.setAttribute("USER_ID", memberInfo.get("id"));
	session.setAttribute("USER_PW", memberInfo.get("pass"));
	session.setAttribute("USER_NAME", memberInfo.get("name"));
	
	response.sendRedirect("login.jsp");
}
else{
	// 저장된 값이 없다면, 리퀘스트 영역에 오류메세지를 저장하고 포워드한다.
	request.setAttribute("ERROR_MSG", "넌 회원이 아니다.");
	request.getRequestDispatcher("login.jsp").forward(request,response);
}
%>