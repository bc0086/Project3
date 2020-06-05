<%@page import="java.util.HashMap"%>
<%@page import="smtp.SMTPAuth"%>
<%@page import="java.util.Map"%>
<%@page import="model.MemberDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true" %>

<%
   	//MariaDB정보로 변경되므로 초기화파라미터를 수정한다.
   	String drv = application.getInitParameter("MariaJDBCDriver");
   	String url = application.getInitParameter("MariaConnectURL");
   
   	String id = request.getParameter("pwid"); 
   	String name = request.getParameter("pwname"); 
   	String email = request.getParameter("pwemail");
   
   	// jsp에서 JSON을 사용하기 위해 확장라이브러리 설치후 객체를 생성한다. 
   	JSONObject json = new JSONObject();
   	MemberDAO dao = new MemberDAO(drv, url); // dao로 가서 클래스 생성 클래스명은 getPwMap로 만들예정.
   	Map<String, String> memberInfo = dao.getPwMap(id, name, email); 
   	
   	request.setCharacterEncoding("UTF-8");
	SMTPAuth smtp = new SMTPAuth();
	
	Map<String, String> emailContent = new HashMap<String, String>();
	emailContent.put("from", "bc0086@naver.com");
	emailContent.put("to", email);
	emailContent.put("subject",  "제목");
	emailContent.put("content", memberInfo.get("pw"));
   	
   	if(memberInfo.get("pw")!=null) {
   		boolean emailResult = smtp.emailSending(emailContent);
   		json.put("res", 1); 
    	json.put("text", "검색결과 : 검색된 비밀번호는");
    	json.put("user_pw", memberInfo.get("pw"));
    }
	else {
    	json.put("res", 0);
    	json.put("text", "검색결과 : 검색된 비밀번호는");
    }
   
	// JSON객체를 String타입으로 형변환후 화면에 내용을 출력한다. 
	// JSP에서는 JSON형식을 사용할 수 없기 때문이다.
   	String jsonTxt = json.toJSONString();
   	out.println(jsonTxt);
%>