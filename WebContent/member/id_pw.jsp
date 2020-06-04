<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<script>
	$(function(){   
	   //아이디찾기
	   $('#butt').click(function(){
	      //인자1 : 전송할 서버의 URL(경로)
	      $.post(
	         'IdSearchProc.jsp',
	         //인자2 : 파라미터(JSON형태로 조립)
	         {
	            'name':$('#name').val(),
	            'email':$('#email').val()
	         },
	         //인자3 : 요청후 성공시 실행되는 콜백메소드
	         function(responseData){
	            /*
	            서버로부터 받은 콜백 데이터가 JSON형태일때 파싱을 하기위해
	            사용하는 메소드.
	            */
	            var rData = JSON.parse(responseData);
	            /*  
	            파싱한 데이터를 통해 각 value에 접근할 수 있다.
	            파싱변수.Key값 => value가 반환된다.
	            */ 
	            //아이디존재시
	            if(rData.res==1){
	               var disTxt = rData.user_id
	               var disTitle = rData.text
	               
	               
	               alert("찾은아이디:"+disTxt);
	               $('#id').focus();
	            }
	            //아이디 없을때
	            else{
	               $('#mo1').click();
	               $('#modal_res').html("아이디 존재안함");
	               $('#name').focus();
	            }
	         };
	      });
	});
</script>
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
					<img src="../images/member/id_pw_title.gif" alt="" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;멤버쉽&nbsp;>&nbsp;아이디/비밀번호찾기<p>
				</div>
				<div class="idpw_box">
					<div class="id_box">
						<ul>
							<li><input type="text" id="id" class="login_input01" /></li>
							<li><input type="text" id="pw" class="login_input01" /></li>
						</ul>
						<!-- 아이디 비번 찾기 -->
						
						<button type="button" id="button1"><img src="../images/member/id_btn01.gif" class="id_btn" /></button>
						
						<a href="../main/main.jsp"><img src="../images/login_btn03.gif" class="id_btn02" /></a>
					</div>
					<div class="pw_box">
						<ul>
							<li><input type="text" name="" value="" class="login_input01" /></li>
							<li><input type="text" name="" value="" class="login_input01" /></li>
							<li><input type="text" name="" value="" class="login_input01" /></li>
						</ul>
						<button type='button' id="butt"><img src="../images/member/id_btn01.gif" class="pw_btn" /></button>
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
