<%@page import="model.BbsDTO"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<%@ include file = "../include/isFlag.jsp" %>

<% 
/*
 	검색 후 파라미터 처리를 위한 추가부분
 	: 리스트에서 검색 후 상세보기, 그리고 다시 리스트보기를 눌렀을 때 검색이 유지되도록 처리하기 위한 코드삽입
*/
String queryStr = "bname="+ bname + "&";
String searchColumn = request.getParameter("searchColumn");
String searchWord = request.getParameter("searchWord");
if(searchWord!=null) {
	queryStr += "searchColumn="+searchColumn+"&searchWord="+searchWord+"&";
}

// 3페이지에서 상세보기했다면 리스트로 돌아갈때도 3페이지로 가야한다.
String nowPage = request.getParameter("nowPage");
if(nowPage==null || nowPage.equals(""))
	nowPage = "1";
queryStr += "&nowPage="+nowPage;

// 폼값 받기 - 파라미터로 전달된 게시물의 일련번호
String num = request.getParameter("num");
BbsDAO dao = new BbsDAO(application);

// 게시물의 조회수 +1증가
dao.updateVisitCount(num);

// 게시물을 가져와서 DTO객체로 반환
BbsDTO dto = dao.selectView(num);

// 자원반납 (DB연결해제)
dao.close();
%>

<!DOCTYPE html>
<html lang="en">
<body>
<center>
<div id="wrap">
	<%@ include file="../include/top.jsp" %>

	<img src="../images/space/sub_image.jpg" id="main_visual" />

	<div class="contents_box">
		<div class="left_contents">
			<%@ include file = "../include/space_leftmenu.jsp" %>
		</div>
		
		<div class="right_contents">
			<div class="top_title">
				<img src="../images/space/sub01_title.gif" alt="공지사항" class="con_title" />
				<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;<%=boardTitle %><p>
			</div>
			
			<div>

<form enctype="multipart/form-data">
<table class="table table-bordered">
	<colgroup>
		<col width="20%"/>
		<col width="30%"/>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>

	<tbody>
		<tr>
			<th class="text-center" style="vertical-align:middle;">작성자</th>
			<td><%=dto.getName() %></td>
			
			<th class="text-center" style="vertical-align:middle;">작성일</th>
			<td><%=dto.getPostDate() %></td>
		</tr>
		
		<tr>
			<th class="text-center"	style="vertical-align:middle;">이메일</th>
			<td><%=dto.getEmail() %></td>
			
			<th class="text-center" style="vertical-align:middle;">조회수</th>
			<td><%=dto.getVisitcount() %></td>
		</tr>
		
		<tr>
			<th class="text-center" style="vertical-align:middle;">제목</th>
			<td colspan="3"><%=dto.getTitle() %></td>
		</tr>
		
		<tr> 
			<th class="text-center" style="vertical-align:middle;">내용</th>
			<td colspan="3">
				<%--
					textarea에서 엔터키로 줄바꿈을 한 후 DB에 저장하면 \r\n으로 저장되므로,
					HTML 페이지에서 출력할때는 <br/>태그로 문자열을 변경해야 한다.
				--%>
				<%=dto.getContent().replace("\r\n", "<br/>") %>
			</td>
		</tr>
		
		<% if(bname.equals("databoard")){ %>
			<tr>
				<th class="text-center" style="vertical-align:middle;">첨부파일</th>
				<td colspan="3">파일명.jpg <a href="../space/Download2.jsp?filename=<%=dto.getFile()%>&num=<%=dto.getNum()%>">[다운로드]</a></td>
			</tr> 
		<%} %>
	</tbody>
</table>
</form> 

<div class="row text-center" style="">
	<div class="col-6">
	<%
	 if(session.getAttribute("USER_ID")!= null &&
	 	session.getAttribute("USER_ID").toString().equals(dto.getId())){
	%>
		<!-- 수정, 삭제의 경우 특정게시물에 대해 수행하는 작업이므로 반드시 게시물의 일려번호(PK)가 파라미터로 전달되어야 한다. -->
		<button type="button" class="btn btn-secondary"
			onclick="location.href='sub01_Edit.jsp?num=<%=dto.getNum() %>&bname=<%=bname %>';">수정하기</button>
			
		<!-- 회원제게시판에서 삭제처리는 별도의 폼이 필요없이, 사용자에 대한 인증처리만 되면 즉시 삭제처리한다. -->
		<button type="button" class="btn btn-success"
			onclick="isDelete();">삭제하기</button>
	<%
	 }
	%>
	</div>
	
	<div class="col-6 text-right pr-5">
		<button type="button" class="btn btn-warning" onclick="location.href='sub01_list.jsp?bname=<%=bname %>&nowPage=<%=nowPage%>&<%=queryStr%>';">리스트보기</button>
	</div>
	
	<!-- 
		게시물 삭제의 경우 로그인 된 상태이므로 해당 게시물의 일련번호만 서버로 전송하면 된다.
		이때 hidden폼을 사용하고, JS의 submit()함수를 이용해서 폼값을 전송한다.
		해당 form태그는 HTML문서 어디든지 위치할 수 있다.
	 -->
	<form name="deleteFrm">
		<input type="hidden" name="num" value="<%=dto.getNum() %>" />
		<input type="hidden" name="bname" value="<%=bname %>" />
	</form>
	
	<script>
		function isDelete() {
			var c = confirm("삭제하시겠습니까?");
			if(c) {
				var f = document.deleteFrm;
				f.method = "post";
				f.action = "Deleteproc.jsp";
				f.submit();
			}
		}
	</script>
</div>


				</div>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>


	<%@ include file="../include/footer.jsp" %>
</center>
</body>
</html>