<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common_top.jsp" %>
<title>login.jsp</title>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
</head>
<center>
<form action="login.mem" method="post">
<div class="container">
<table class="table" class="text-center">
        <h4>로그인</h4>
		<tr align="center">
			<th class="text-center">
				아이디 : 	<input type="text" name="id">
			</th>

		</tr>
		<tr  align="center">
			<th class="text-center">
				패스워드 : <input type="password" name="password">
			</th>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="로그인"  class="btn btn-default btn-sm">
				<input type="button" value="아이디/비밀번호 찾기"  class="btn btn-default btn-sm" onclick="location.href='findid.mem'">
				<input type="button" value="회원가입"  class="btn btn-default btn-sm" onclick="location.href='insert.mem'">
			</td>
		</tr>
	</table>
	</div>
</form>
</center>
<%@ include file="../common/common_bottom.jsp" %>
