<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common_top.jsp" %>
<title>login.jsp</title>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<meta name="viewport" content="width=device-width,initial-scale=1">
</head>
<%
	if(session.getAttribute("cnt")!=null){
		out.println("<script> alert('회원가입에 성공하였습니다. 로그인 화면으로 이동합니다.');</script>");
		session.removeAttribute("cnt");
	}
%>
<center>
<form action="login.mem" method="post">
<div class="container" >
<table class="table" class="text-center"  >
        <h4>로그인</h4>
		<tr align="center" >
		     <td width="35%">
		     </td>
			<th>
				아이디 : <input type="text" name="id">
			</th>
			 <td width="33%">
		     </td>

		</tr>
		<tr align="center">
		    <td>
		    </td>
			<th>
				비밀번호 : <input type="password" name="password">
			</th>
			<td>
		     </td>
		</tr>
		<tr>
			<td colspan="3" align="center">
				<input type="submit" value="로그인"  class="btn btn-default btn-sm">
				<input type="button" value="아이디/비밀번호 찾기"  class="btn btn-default btn-sm" onclick="location.href='findid.mem'">
				<input type="button" value="회원가입"  class="btn btn-default btn-sm" onclick="location.href='insert.mem'">
			</td>
		</tr>
	</table>
	</div>
</form>
	<div class="modal-footer ">
		<!-- loginType 카카오 로그인일 경우 1 해주기  -->
		<p>SNS 로그인</p>
		<div class="border p-3 mb-4 bg-light d-flex justify-content-between">
			<%-- 
			    			카카오 로그인 처리중 중 오류가 발생하면 아래 경고창에 표시된다.
			    			카카오 로그인 오류는 스크립트에서 아래 경고창에 표시합니다.
			    		 --%>
			<div class="alert alert-danger d-none" id="alert-kakao-login">오류
				메세지</div>

			<a id="btn-kakao-login" href="kakao/login"> <img
				src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
				width="200" alt="카카오 로그인 버튼" />
			</a>
		</div>
		<form id="form-kakao-login" method="post" action="kakao-login.mem">
			<input type="hidden" name="email" /> <input type="hidden" name="name" />
			<input type="hidden" name="gender" /> <input type="hidden" name="birthday" />
			<input type="hidden" name="img" />
		</form>
	</div>
</center>
<script>
	$(function(){
	
		$("#btn-kakao-login").click(function(event){
			// a태그 기능 실행멈춤.
			event.preventDefault();
			// 카카오 로그인 실행시 오류메시지를 표시하는 경고창을 화면에 보이지 않게 한다.
			$("alert-kakao-login").addClass("d-none");
			// 사용자 키를 전달, 카카오 로그인 서비스 초기화.
			Kakao.init('e853cba823ade770505470a9269644bb');
			// 카카오 로그인 서비스 실행하기 및 사용자 정보 가져오기.
			Kakao.Auth.login({
				success:function(auth){
					Kakao.API.request({
						url: '/v2/user/me',
						success: function(response){
							// 사용자 정보를 가져와서 폼에 추가.
							var account = response.kakao_account;
							
							$('#form-kakao-login input[name=email]').val(account.account_email);
							$('#form-kakao-login input[name=name]').val(account.profile_nickname);
							$('#form-kakao-login input[name=img]').val(account.profile_image);
							$('#form-kakao-login input[name=gender]').val(account.gender);
							$('#form-kakao-login input[name=birthday]').val(account.birthday);
							// 사용자 정보가 포함된 폼을 서버로 제출한다.
							document.querySelector('#form-kakao-login').submit();
						},
						fail: function(error){
							// 경고창에 에러메시지 표시
							$('alert-kakao-login').removeClass("d-none").text("카카오 로그인 처리 중 오류가 발생했습니다.")
						}
					}); // api request
				}, // success 결과.
				fail:function(error){
					// 경고창에 에러메시지 표시
					$('alert-kakao-login').removeClass("d-none").text("카카오 로그인 처리 중 오류가 발생했습니다.")
				}
			}); // 로그인 인증.
		}) // 클릭이벤트
	})// 카카오로그인 끝.
</script>
<%@ include file="../common/common_bottom.jsp" %>
