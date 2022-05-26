<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common_top.jsp" %>
<title>login.jsp</title>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
		<form id="form-kakao-login" method="post" action="kakao-login">
			<input type="hidden" name="email" /> <input type="hidden" name="name" />
			<input type="hidden" name="img" />
		</form>
	</div>

</center>
<%@ include file="../common/common_bottom.jsp" %>
