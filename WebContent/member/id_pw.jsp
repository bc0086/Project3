<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>

<script>
	$(function(){   
	   //아이디찾기    
	    $('#idbtn').click(function(){ // 아이디찾기3. #idbtn을 받아서 해당함수 실행
	    	//인자1 : 전송할 서버의 URL(경로)
	    	$.post( // 아이디찾기4. json형태로..... 전송방식은 post방식  #name, #email을 name1 name2로 재정의해서 IdSearchProc.jsp로 들고감.
	       		'IdSearchProc.jsp',
	        	//인자2 : 파라미터(JSON형태로 조립)
	        	{
	        		'name':$('#name').val(),
	            	'email':$('#email').val()
	        	},
	        //인자3 : 요청후 성공시 실행되는 콜백메소드
		        function(responseData){ // 아이디찾기12. responseData를 매개변수로 받는 함수생성. json타입의 데이터가 들어오겠지...

	        		// 서버로부터 받은 콜백 데이터가 JSON형태일때 파싱을 하기위해 사용하는 메소드.
		            var rData = JSON.parse(responseData);

		        	// 파싱한 데이터를 통해 각 value에 접근할 수 있다.
			        // 파싱변수.Key값 => value가 반환된다.
		            
		            // 아이디존재시
		            if(rData.res==1){ // 아이디찾기13. rData의 값들을 disTxt와 disTitle로 재정의
		            	var disTxt = rData.user_id
		            	var disTitle = rData.text
		               
		            	alert(disTitle+" "+disTxt+" 입니다.");
		               	$('#id').focus();
		        	}
		            // 아이디 없을때
		            else{
		            	alert('검색결과가 없습니다.');
		            }
		        }
	        );
	    });
	   
	    $('#pwbtn').click(function () {
	    	$.post(
	    		'PwSearchProc.jsp',
	    		
	    		{ 
	    			'pwid':$('#pwid').val(),
	    			'pwname':$('#pwname').val(),
	    			'pwemail':$('#pwemail').val()
	    		},
	    		
	    		// 요청 후 성공 시 실행되는 콜백메소드
	    		function(responseData) {
	    			var rData = JSON.parse(responseData);
	    			/*
	    				서버로부터 받은 콜백데이터가 JSON형태일때 파싱을 하기 위해 사용하는 메소드
	    				- 파싱한 데이터를 통해 각 value에 접근할 수 있다.
	    					파싱변수.Key값 => value가 반환된다.
	    			*/
	    			
	    			if(rData.res==1){
	    				//var disTxt = rData.user_pw // 비밀번호 저장됨
	    				//var disTitle = rData.text // "검색결과 : 검색된 비밀번호는" 저장됨
	    				alert("패스워드가 메일로 전송되었습니다.");
	    			}
	    			else{
	    				alert("검색결과가 없습니다.");
	    			}
				}
	    	);
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
					<!-- 아이디찾기2. 값을 보낼 text타입의 id를 지정 -->
					<div class="id_box">
						<ul>
							<li><input type="text" id="name" class="login_input01" /></li>
							<li><input type="text" id="email" class="login_input01" /></li>
						</ul>
						
						<!-- 아이디 찾기 버튼-->
						<!-- 아이디찾기1. id="idbtn"은 해당버튼을 눌렀을때 실행될 함수의 #아이디명 -->
						<button type="button" name="idbtn" id="idbtn" ><img src="../images/member/id_btn01.gif" class="id_btn" /></button>
						
						<a href="../member/join01.jsp"><img src="../images/login_btn03.gif" class="id_btn02" /></a>
					</div>
					<div class="pw_box">
						<ul>
							<li><input type="text" name="pwid" id="pwid" class="login_input01" /></li>
							<li><input type="text" name="pwname" id="pwname" class="login_input01" /></li>
							<li><input type="text" name="pwemail" id="pwemail" class="login_input01" /></li>
						</ul>
						
						<!-- 비밀번호 찾기 버튼-->
						<button type="button" name="pwbtn" id="pwbtn"><img src="../images/member/id_btn01.gif" class="pw_btn" /></button>
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
