<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>

 <body>
	<center>
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>

		<img src="../images/member/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				<%@ include file = "../include/member_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;멤버쉽&nbsp;>&nbsp;로그인<p>
				</div>
					<img src="../images/login_title.gif" alt="인사말" class="con_title" />
				<div class="login_box01">				
					<img src="../images/login_tit.gif" style="margin-bottom:30px;" /> 
					
			
				<%
				// 로그인 전이거나 로그인에 실패했을때 출력되는 내용
				if(session.getAttribute("USER_ID")==null){
				%>
					<script>
					function loginValidate(fn){
						if(!fn.user_id.value){
							alert("아이디를 입력하세요.");
							fn.user_id.focus();
							return false;
						}
						if(fn.user_pw.value==""){
							alert("패스워드를 입력하세요");
							fn.user_pw.focus();
							return false;
						}
					}
					</script>
					
					<!-- 로그인 폼 -->
					<form action="loginProcess.jsp" id="login" onsubmit="return loginValidate(this);">
					<ul>
						<!-- 1. 아이디 -->
						<li>
							<img src="../images/login_tit001.gif" alt="아이디" style="margin-right:15px;" />
							<input type="text" name="user_id" class="login_input01" />
						</li>						
						<!-- 2. 비밀번호 -->
						<li>
							<img src="../images/login_tit002.gif" alt="비밀번호" style="margin-right:15px;" />
							<input type="password" name="user_pw" class="login_input01" />
						</li>
					</ul>					
					<!-- 3. 로그인버튼 -->
					<!-- 이미지 버튼(Image Type)은 전송버튼(Submit Button)의 역할을 하면서 이미지로 출력되는 버튼 -->
					<input type="image" src="../images/login_btn.gif" class="login_btn01" /> 
					</form>
					
				<% }else{ %>
					<!-- 로그인에 성공했을때 출력되는 화면 -->
					<table border='1'>
						<tr>
							<td style="text-align:center;">
							<!-- 세션영역은 웹브라우저를 최초 연후 닫을떄까지 그 영역이 공유되므로
							로그인처리 페이지에서 저장된 내용을 가져올 수 있다. -->
								<%=session.getAttribute("USER_ID") %> 회원님, 로그인 하셨습니다. <br />
								즐거운 시간 보내세요 ^^* <br />
								<a href="logout.jsp">[로그아웃]</a>
							</td>
						</tr>
					</table>
				<% } %>
					
					
				</div>
				<p style="text-align:center; margin-bottom:50px;"><a href=""><img src="../images/login_btn02.gif" alt="아이디/패스워드찾기" /></a>&nbsp;<a href=""><img src="../images/login_btn03.gif" alt="회원가입" /></a></p>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	</center>
 </body>
</html>
