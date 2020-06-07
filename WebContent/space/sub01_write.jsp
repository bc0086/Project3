<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>

<%-- 글 작성 페이지 진입전 로그인 체크하기 --%>
<%@ include file="../include/isLogin.jsp" %>
<%@ include file="../include/isFlag.jsp" %>

<% 
// 게시판과 정보자료실만 글쓰기 가능함.
if(!(bname.equals("freeboard") || bname.equals("photoboard") || bname.equals("databoard"))){ 
	JavascriptUtil.jsAlertBack("해당 게시판은 글쓰기를 할 수 없습니다.", out);
	return;
}
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
					<img src=<%=src %> alt="공지사항" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;<%=boardTitle %><p>
				</div>
				<div>

<script>
	// 유기명 함수
	function checkValidate(frm) { // frm이라는 변수는 form태그의 dom객체이다.
		
		if(frm.title.value == "") {
			alert("제목이 없습니다."); // 경고창 띄움
			frm.title.focus(); // 입력란으로 포커스 이동
			return false; // 전송되지 않도록 이벤트리스너로 false반환
		}
		
		if(frm.content.value == "") {
			alert("내용이 없습니다."); // 경고창 띄움
			frm.content.focus(); // 입력란으로 포커스 이동
			return false; // 전송되지 않도록 이벤트리스너로 false반환
		}
	}
	
	// 무기명 함수
	var checkValidate2 = function(frm){
		// 실행부는 유기명함수와 동일함.
	}
</script>

<form name="writeFrm" method="post" action="WriteProc.jsp?bname=<%=bname %>" 
	onsubmit="return checkValidate(this);" enctype="multipart/form-data">
<table class="table table-bordered">

<!-- 글작성시 게시판 구분을 위한 flag추가 -->
<input type="hidden" name="bname" />

<colgroup>
	<col width="20%"/>
	<col width="*"/>
</colgroup>

<tbody>
	<!-- 
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">작성자</th>
		<td>
			<input type="text" class="form-control" 
				style="width:100px;" />
		</td>
	</tr>
	
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">이메일</th>
		<td>
			<input type="text" class="form-control" 
				style="width:400px;" />
		</td>
	</tr>
	
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">패스워드</th>
		<td>
			<input type="text" class="form-control" 
				style="width:200px;" />
		</td>
	</tr> 
	-->
	
	<tr>
		<th class="text-center" style="vertical-align:middle;">제목</th>
		<td><input type="text" class="form-control" name="title"/></td>
	</tr>
	
	<tr>
		<th class="text-center" style="vertical-align:middle;">내용</th>
		<td><textarea rows="10" class="form-control" name="content"></textarea></td>
	</tr>
	
	<% if((bname.equals("databoard"))){ %>
		<tr>
			<th class="text-center" style="vertical-align:middle;">첨부파일</th>
			<td><input type="file" class="form-control" name="Attachment" /></td>
		</tr> 
	<%} %>
</tbody>
</table> 

<div class="row text-center" style="">
	<div class="col text-right">
		<!-- 각종 버튼 부분 -->
		<button type="submit" class="btn btn-danger">전송하기</button>
		<button type="reset" class="btn">Reset</button>
		<button type="button" class="btn btn-warning" onclick="location.href='sub01_list.jsp?bname=<%=bname %>';">리스트보기</button>
	</div>
</div>
</form> 

				</div>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>


	<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>