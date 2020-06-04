<%@page import="model.MemberDAO"%>
<%@page import="java.util.Map"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true" %>
<%
   //MariaDB정보로 변경되므로 초기화파라미터를 수정한다.
   String drv = application.getInitParameter("MariaJDBCDriver");
   String url = application.getInitParameter("MariaConnectURL");

   String name = request.getParameter("name");
   String email = request.getParameter("email");
   
   //jsp에서 JSON을 사용하기 위해 확장라이브러리 설치후 객체를 생성한다.
   JSONObject json = new JSONObject();
   MemberDAO dao = new MemberDAO(drv, url);
   Map<String, String> memberInfo = dao.getIdMap(name, email);
   
   if(memberInfo.get("id")!=null)
   {
      json.put("res", 1);
      json.put("text", "아이디 찾기");
      json.put("user_id", memberInfo.get("id"));
   }
   else{
      json.put("res", 0);
      json.put("text", "아이디 찾기");
   }
   
   //JSON객체를 String타입으로 형변환후 화면에 내용을 출력한다.
   String jsonTxt = json.toJSONString();
   out.println(jsonTxt);
%>