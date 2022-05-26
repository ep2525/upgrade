<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common_top.jsp" %>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
</head>
<script type="text/javascript">
	function idcheck(myform){
		location.href="idfunction.mem?id="+myform.id.value;
	}
	function check(myform){
		if (myform.id.value.length==0){
			alert("id를 입력하세요.");
			myform.id.focus();
			return false;
		}
		if (myform.password.value.length==0){
			alert("비밀번호를 입력하세요.");
			myform.password.focus();
			return false;
		}
		if (myform.repassword.value != myform.password.value){
			alert("비밀번호가 일치하지 않습니다.");
			myform.repassword.focus();
			return false;
		}
		if (myform.name.value.length==0){
			alert("이름을 입력하세요.");
			myform.id.focus();
			return false;
		}
		if (myform.birthday.value.length==""){
			alert("생년월일을 입력하세요");
			myform.birthday.focus();
			return false;
		}
		
	}
</script>
<title>insert.jsp</title>
<center>
<form name="myform" action="insert.mem" method="post">
	<div class="container"> 
	<table class="table">
		<tr align="center">
			<th class="text-center" width="130px">아이디 :
				<input type="text" name="id" <c:if test="${param.id != null }">value="${param.id}"</c:if>>
				<input type="button" value="중복체크" onclick="return idcheck(myform)" class="btn btn-default btn-sm">
			</th>
		</tr>
		<tr align="center">
			<th class="text-center">
			    패스워드 : <input type="password" name="password">
			</th>
		<tr>
		<tr align="center">
			<th class="text-center">
			    패스워드 확인 : <input type="password" name="repassword">
			</th>
		<tr>
		<tr align="center">
			<th class="text-center">
			    이름 : <input type="text" name="name">
			</th>
		<tr>
		<tr align="center">
			<th class="text-center">
			    생년월일 : <input type="date" name="birthday" style = "height : 30px;" >
			</th>
		</tr>
		<tr>
			<td align="center">
			<input type="submit" value="가입하기" class="btn btn-default btn-sm" onclick="idcheck(myform)"></td>
		</tr>
	</table>
	</div>
</form>
</center>
<%@ include file="../common/common_bottom.jsp" %>
