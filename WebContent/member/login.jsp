<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<head>
<script>
	function login() {
		var chklogin = document.getElementById('login');
		if(chklogin.user_id == kosmo61){
			환영합니다;
		}
		else
			alert("아이디를 입력하세요");
		
	}
	</script>

</head>

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
					<img src="../images/login_title.gif" alt="인사말" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;멤버쉽&nbsp;>&nbsp;로그인<p>
				</div>
				<div class="login_box01">
					<img src="../images/login_tit.gif" style="margin-bottom:30px;" />
					
					<form action="loginProcess.jsp" id="login">
					<ul>
						<!-- 아이디 -->
						<li>
							<img src="../images/login_tit001.gif" alt="아이디" style="margin-right:15px;" />
							<input type="text" name="user_id" class="login_input01" />
						</li>
						
						<!-- 비밀번호 -->
						<li>
							<img src="../images/login_tit002.gif" alt="비밀번호" style="margin-right:15px;" />
							<input type="password" name="user_pw" class="login_input01" />
						</li>
					</ul>
					
					<!-- 로그인버튼 -->
					<img src="../images/login_btn.gif" class="login_btn01" /> <!-- 인풋타입이미지 -->
					</form>
					
					
					
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
