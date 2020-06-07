<%@page import="util.FileUtil"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="model.BbsDAO"%>
<%@page import="model.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!-- 글작성 완료 전 로그인 체크하기 -->
<%@ include file = "../include/isLogin.jsp" %>
<%@ include file = "../include/isFlag.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

MultipartRequest mr = FileUtil.upload(request, request.getServletContext().getRealPath("upload"));

int affected = 0;

if(mr != null){
	String title = mr.getParameter("title");
	String content = mr.getParameter("content");
	String file = mr.getFilesystemName("Attachment");
	String id = session.getAttribute("USER_ID").toString();
	
	//DTO객체에 폼값을 저장한다.
    BbsDTO dto = new BbsDTO();
    dto.setFile(file);
    dto.setContent(content);
    dto.setTitle(title);
    dto.setId(id);
    dto.setBname(bname);
             
    //DAO객체생성 및 DB연결후 insert처리
    BbsDAO dao = new BbsDAO(application);
 
    affected = dao.insertWrite(dto);
    dao.close();
}

if(affected==1) {
	// 글쓰기에 성공했을때...
	response.sendRedirect("sub01_list.jsp?bname="+bname);
}
else {
	// 글쓰기에 실패헀을떄...
%>
	<script>
		alert("글쓰기에 실패하였습니다.");
		history.go(-1);
	</script>
<%
}
%>
