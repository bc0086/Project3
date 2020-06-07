<%@page import="model.BbsDAO"%>
<%@page import="util.FileUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String filename = request.getParameter("filename");
String num = request.getParameter("num");

/*

http://localhost:8080/Project3/Board_Jsp_Proc/Download.jsp?filename=%EC%BA%A1%EC%B2%9817.PNG&num=15
 서버에 저장된 파일을 무조건 "원본파일명.jpg"로 이름을 변경하여 다운로드 한다.
 차후 DB처리 해야함. 
 */
/* FileUtil.download(req, resp, "/Upload", filename, "원본파일명.jpg"); */
FileUtil.download(request, response, "/upload", filename, filename);

BbsDAO dao = new BbsDAO(application);
/*   dao.downCountPlus(idx); */
dao.close();
%>