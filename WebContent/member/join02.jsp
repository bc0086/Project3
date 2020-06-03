<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<head>
	<script src="../common/jquery/jquery-3.5.1.js"></script>
	
	<!-- 우편번호 API -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    <script>
    
    $(function(){
    	// 정규식(Regular Expressions)
    	var ipre = /^[A-Za-z0-9+]{4,12}$/; // 아이디, 비밀번호용
    	var pnre = /^\d{2,3}-\d{3,4}-\d{4}$/; // 전화번호용
    	var hnre = /^\d{3}-\d{3,4}-\d{4}$/; // 핸드폰용
    	
	/* 비밀번호 및 비밀번호 확인기능 */
		//조건1 : 비밀번호
		$('#pwd1').keyup(function(){
			
			//input태그의 value속성을 빈값으로 만들어준다.
			$("#pwd2").val("");
			//암호를 재입력시에는 msg부분의 텍스트도 지워준다.
			$('#pnmsg2').text('');
			
			if(ipre.test($('#pwd1').val())){
				$('#pnmsg1').html('<b style="color:blue;">사용가능한 비밀번호입니다.</b>');
			}
			else{
				$('#pnmsg1').html('<b>4자 이상 12자 이내의 영문/숫자를 조합해주세요.</b>').css('color','red');
				
			}
		});
		
		//조건2 : 비밀번호 확인
		$('#pwd2').keyup(function(){
			//패스워드 입력란에 입력된 내용을 가져온다.
			var compareStr1 = $('#pwd1').val();
			var compareStr2 = $(this).val();

			if(compareStr1==compareStr2){
				//암호가 일치하면 파란색 텍스트
				$('#pnmsg2').html('<b style="color:blue;">비밀번호가 일치합니다.</b>');
			}
			else{
				//일치하지 않으면 붉은색 텍스트
				$('#pnmsg2').html('<b>비밀번호를 확인해주세요.</b>').css('color','red');
			}
		});
    	
    	
    /* 아이디 */
		$('#id').keyup(function(){
			//패스워드 입력란에 입력된 내용을 가져온다.

			if(ipre.test($('#id').val())){
				$('#idmsg').html('<b style="color:blue;">사용가능한 아이디입니다.</b>');
			}
			else{
				$('#idmsg').html('<b>4자 이상 12자 이내의 영문/숫자를 조합해주세요.</b>').css('color','red');
				
			}
		});
    	
    	
    	
    	
    	
    	
		
	/* 전화번호 */
		$('#tel1').keyup(function(){
			if($('#tel1').val().length==3){
				$('#tel2').focus();
			}
		});
		
		$('#tel2').keyup(function(){
			if($('#tel2').val().length==4){
				$('#tel3').focus();
			}
		});
		
	/* 핸드폰번호 */
		$('#mobile1').keyup(function () {
			if($('#mobile1').val().length==3){
				$('#mobile2').focus();
			}
		});
	
		$('#mobile2').keyup(function () {
			if($('#mobile2').val().length==4){
				$('#mobile3').focus();
			}
		});
			
	/* 이메일 */
    	// 이메일 select선택시 도메인 부분 채워주기
        $('#last_email_check2').change(function(){
            // option태그 사이의 텍스트를 읽어온다.
            var text = $('#last_email_check2 option:selected').text();

            // value속성에 지정된 값을 읽어온다.
            var value = $('#last_email_check2 option:selected').val();

            if(value==''){ // 선택하세요를 선택
                $('#email_2').attr('readonly', true);
                $('#email_2').val('');
            }
            else if(value=='direct'){ //직접입력을 선택
                $('#email_2').attr('readonly', false);
                $('#email_2').val('');
            }
            else{ // 그외 포털 도메인 선택
                $('#email_2').attr('readonly', true);
                 // 위에서 읽어온 값을 도메인 부분에 입력한다.
                $('#email_2').val(value);
            }
        });	
    });
    
    /* 주소API */
    function zipFind() {
    	new daum.Postcode({
    		oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddr; // 도로명 주소 변수
                var extraAddr = ''; // 참고 항목 변수
                
            	// 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                
             	// 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddr").value = roadAddr;
                document.getElementById("jibunAddr").value = data.jibunAddr;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraAddr").value = extraAddr;
                } else {
                    document.getElementById("extraAddr").value = '';
                }
                
                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
    		}
    	}).open();
    }	
  
    
    </script>
</head>
 <body>
	<!-- <center> -->
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>

		<img src="../images/member/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				<%@ include file = "../include/member_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<img src="../images/join_tit.gif" alt="회원가입" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;멤버쉽&nbsp;>&nbsp;회원가입<p>
				</div>

				<p class="join_title"><img src="../images/join_tit03.gif" alt="회원정보입력" /></p>
				<table cellpadding="0" cellspacing="0" border="0" class="join_box">
					<colgroup>
						<col width="80px;" />
						<col width="*" />
					</colgroup>
					<tr><!-- 이름 -->
						<th><img src="../images/join_tit001.gif" /></th>
						<td><input type="text" name="name" value="" class="join_input" /></td>
					</tr>
					<tr><!-- 아이디 -->
						<th><img src="../images/join_tit002.gif" /></th>
						<td>
							<input type="text" name="id"  id="id" class="join_input" />&nbsp;
							<a onclick="id_check_person();" style="cursor:hand;">
								<img src="../images/btn_idcheck.gif" alt="중복확인"/>
							</a>&nbsp;&nbsp;
							<span id="idmsg">* 4자 이상 12자 이내의 영문/숫자 조합하여 공백 없이 기입</span>
						</td>
					</tr>
					
					<!-- 비밀번호 -->
					<tr>
						<th><img src="../images/join_tit003.gif" /></th>
						<td><input type="password" name="pass1" id="pwd1" class="join_input" onclick="pw_check_person();"/>&nbsp;&nbsp;<span id="pnmsg1">* 4자 이상 12자 이내의 영문/숫자 조합</span></td>
					</tr>
					
					<!-- 비밀번호 확인 -->
					<tr>
						<th><img src="../images/join_tit04.gif" /></th>
						<td><input type="password" name="pass2" id="pwd2" class="join_input" />&nbsp;&nbsp;<span id="pnmsg2"/></td>
					</tr>
					
					<!-- 전화번호 -->
					<tr>
						<th><img src="../images/join_tit06.gif" /></th>
						<td>
							<input type="text" name="tel1" id="tel1" maxlength="3" class="join_input" style="width:50px;" />&nbsp;-&nbsp;
							<input type="text" name="tel2" id="tel2" maxlength="4" class="join_input" style="width:50px;" />&nbsp;-&nbsp;
							<input type="text" name="tel3" id="tel3" maxlength="4" class="join_input" style="width:50px;" />
						</td>
					</tr>
					
					<!-- 핸드폰번호 -->
					<tr>
						<th><img src="../images/join_tit07.gif" /></th>
						<td>
							<input type="text" name="mobile1" id="mobile1" maxlength="3" class="join_input" style="width:50px;" />&nbsp;-&nbsp;
							<input type="text" name="mobile2" id="mobile2" maxlength="4" class="join_input" style="width:50px;" />&nbsp;-&nbsp;
							<input type="text" name="mobile3" id="mobile3" maxlength="4" class="join_input" style="width:50px;" /></td>
					</tr>
					
					<!-- 이메일 -->
					<tr>
						<th><img src="../images/join_tit08.gif" /></th>
						<td>
 
	<input type="text" id="email_1" name="email_1" style="width:100px;height:20px;border:solid 1px #dadada;" /> @ 
	<input type="text" id="email_2" name="email_2" style="width:150px;height:20px;border:solid 1px #dadada;" readonly />
	<select id="last_email_check2" >
		<option value="">선택해주세요</option>
		<option value="direct" >직접입력</option>
		<option value="daum.net" >daum.net</option>
		<option value="google.com" >google.com</option>
		<option value="msn.co.kr" >msn.co.kr</option>
		<option value="nate.com" >nate.com</option>
		<option value="naver.com" >naver.com</option>		
	</select>
	
	
	 
						<input type="checkbox" name="open_email" value="1">
						<span>이메일 수신동의</span></td>
					</tr>
					<tr><!-- 주소 -->
						<th><img src="../images/join_tit09.gif" /></th>
						<td>
						<input type="text" name="postcode" id="postcode" class="join_input" placeholder="우편번호" style="width:100px;" />
						<input type="button" onclick="zipFind()" value="[우편번호검색]"><br>
						<input type="text" name="roadAddr" id="roadAddr" class="join_input" placeholder="도로명주소" style="width:250px; margin-top:5px;" />
						<input type="text" name="jubunAddr" id="jubunAddr" class="join_input" placeholder="지번주소" style="width:250px; margin-top:5px;" /><br>
						<input type="text" name="detailAddr" id="detailAddr" class="join_input" placeholder="상세주소" style="width:150px; margin-top:5px;" />
						<input type="text" name="extraAddr" id="extraAddr" class="join_input" placeholder="참고항목" style="width:150px; margin-top:5px;" />
						</td>
					</tr>
				</table>
				

				<p style="text-align:center; margin-bottom:20px"><a href="join02.jsp"><img src="../images/btn01.gif" /></a>&nbsp;&nbsp;<a href="#"><img src="../images/btn02.gif" /></a></p>
				
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
	<!-- </center> -->
 </body>
</html>
