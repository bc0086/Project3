<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="util.FileUtil"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="model.BbsDAO"%>
<%@page import="model.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!-- 글작성 완료 전 로그인 체크하기 -->
<%@ include file = "../include/isLogin.jsp" %>
<%@ include file = "../include/isFlag.jsp" %>

<%
//글쓰기 관련 폼값에 대한 한글처리
request.setCharacterEncoding("UTF-8");

//해당 메소드는 MultipartRequest객체를 생성하면서 파일업로드를 처리한다.
/*
  매개변수로는 request객체, Upload의 서버의 물리적경로를 전달한다. 
 */
MultipartRequest mr = FileUtil.upload(request, request.getServletContext().getRealPath("Upload"));

int affected;


if(mr != null) {
   /*
    파일업로드가 완료되면 나머지 폼값을 받기위해 mr참조변수를 이용한다.
    enctype이 'multipart/form-data'로 설정되므로 request객체를 통해 폼값을 받을 수 없다. 
    */
   String title = mr.getParameter("title");
   String content = mr.getParameter("content");
  String attachedfile = mr.getFilesystemName("Attachment");
 	String id = session.getAttribute("USER_ID").toString();
    
   //DTO객체에 폼값을 저장한다.
   BbsDTO dto = new BbsDTO();
   dto.setFile(attachedfile);
   dto.setContent(content);
   dto.setTitle(title);
	dto.setBname(bname);
	dto.setId(id);
            
   //DAO객체생성 및 DB연결후 insert처리
   BbsDAO dao = new BbsDAO(application);

   affected = dao.insertWrite(dto);
   dao.close();
}
else{
	affected = -1;
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
