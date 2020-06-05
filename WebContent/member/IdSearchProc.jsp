<%@page import="java.util.Map"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true" %>

<%
	//MariaDB정보로 변경되므로 초기화파라미터를 수정한다.
   	String drv = application.getInitParameter("MariaJDBCDriver");
   	String url = application.getInitParameter("MariaConnectURL");

   	String name = request.getParameter("name"); // 아이디찾기5. 앞서 만든 #name, #email을 json방식으로 조립한 name1, email1을 가져와서  name2, email2로 재정의
   	String email = request.getParameter("email");
   
   	// jsp에서 JSON을 사용하기 위해 확장라이브러리 설치후 객체를 생성한다. // 아이디찾기6. 이건 약속됨.
   	JSONObject json = new JSONObject();
   	MemberDAO dao = new MemberDAO(drv, url); // 아이디찾기7. dao로 가서 클래스 생성 클래스명은 getIdMap로 만들예정임.
   	Map<String, String> memberInfo = dao.getIdMap(name, email);  // 아이디찾기9. getIdMap의 name과 email을 map형식의 임의의 인스턴스(memberInfo)생성
   
   	if(memberInfo.get("id")!=null)
   	{
    	json.put("res", 1); // 아이디찾기10. jsonobject의 json인스턴스에 임의변수명 jason방식의 res, text, user_id를 생성 및 value값 설정
      	json.put("text", "검색결과 : 검색된 아이디는");
      	json.put("user_id", memberInfo.get("id"));
   	}
   	else{
    	json.put("res", 0);
    	json.put("text", "검색결과 : 검색된 아이디는");
   	}
   
   	//JSON객체를 String타입으로 형변환후 화면에 내용을 출력한다. // 아이디찾기11. jsonobject의 json의 value들을읽어서 jsonTxt(아직 json타입임)로 재정의 
   	String jsonTxt = json.toJSONString();
   	out.println(jsonTxt);
%>