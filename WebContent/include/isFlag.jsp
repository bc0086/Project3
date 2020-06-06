<%@page import="util.JavascriptUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

//멀티게시판 구현을 위한 파라미터 처리
String bname = request.getParameter("bname");
if(bname==null || bname.equals("")) {
	// 만약 bname의 값이 없다면 로그인 화면으로 강제이동시킨다.
	JavascriptUtil.jsAlertLocation("필수파라미터 누락됨", "../member/login.jsp", out);
	return;
}
String src="";
String boardTitle = "";
switch(bname){
case "notice":
	src = "../images/space/sub01_title.gif";
	boardTitle = "공지사항";
	break;
	
case "schedule":
	 src = "../images/space/sub02_title.gif";
	boardTitle = "프로그램일정";
	break;
	
case "freeboard":
	src = "../images/space/sub03_title.gif";
	boardTitle = "자유게시판";
	break;
	
case "photoboard":
	src = "../images/space/sub04_title.gif";
	boardTitle = "사진게시판";
	break;
	
case "databoard":
	src = "../images/space/sub05_title.gif";
	boardTitle = "정보자료실";
	break;
}
%>
    
    

    