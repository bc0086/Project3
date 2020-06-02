<%@page import="java.util.Map"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 제목 : loginProcess.jsp -->
<%
String id = request.getParameter("user_id");
String pw = request.getParameter("user_pw");

/* 쿠키3.
checkbox의 경우 항목이 여러개이므로 주로 getParameterValues()를 통해
배열로 받아와야하지만, 항목이 하나만 있는 경우에는 아래와 같이 처리가능하다.
*/
String id_save = request.getParameter("id_save");

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
	
	if(id_save == null){		
		// 아이디저장하기에 체크하지 않았을때...
		// 쿠키를 삭제하기 위해 빈 쿠키를 생성한다.
		Cookie ck = new Cookie("USER_ID", "");
		ck.setPath(request.getContextPath());
		ck.setMaxAge(0); // 유효시간이 0이므로 사용할 수 없는 쿠키가 된다.
		response.addCookie(ck);
	}
	else{		
		// 체크했을때...
		// 사용자가 입력한 아이디로 쿠키를 생성한다.
		Cookie ck = new Cookie("USER_ID", id);
		System.out.println(request.getContextPath());
		ck.setPath(request.getContextPath());
		ck.setMaxAge(60*60*24*100);
		response.addCookie(ck);
	}
	
	// 로그인과 쿠키생성이 완료되면 기존 로그인 페이지로 이동한다.
	response.sendRedirect("../main/main.jsp");
}
else{
	// 실패시
%>
	<script>
		alert("로그인에 실패하였습니다.");
		history.go(-1);
	</script>
<%
}
%>