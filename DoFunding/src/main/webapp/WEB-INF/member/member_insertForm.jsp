<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common_top.jsp" %>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
</head>
<script type="text/javascript">
$(document).ready(function(){
	var exppass = "^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$";
	var id;
	var password = false;
	var repassword = false;
	var use;
	var isCheck=false;
	$('#titleCheck').click(function(){
		isCheck=true;
		$.ajax({
			url : "idfunction.mem",
			data : ({id : $('input[name=id]').val()}),
			success : function(data){
				if(data=='false'){
					alert("사용 가능한 아이디 입니다.");
					use=false;
					isChange=false;
				}
				else{
					alert("이미 사용중인 아이디 입니다.");
					use=true;	
				}
			},
			error : function(){
	        	alert(data);
	        }
		});
	}); //titleCheck	
	$('input[name=id]').keydown(function(){
		isChange=true;
		use=false;
		$('td[id=id]').text("");
	});
	id=true;
	$('input[name=id]').focus(function(){
		if(id){
			if($('input[name=id]').val()==""){
				$('td[id=id]').append("<font color='red'>아이디를 입력하세요</font>");
				id=false;
			}
		}
	});
	$('input[name=password]').keyup(function(){
		$('td[id=password]').text("");
		 var pw = $(this).val();
		 var num = pw.search(/[0-9]/g);
		 var eng = pw.search(/[a-z]/ig);
		 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		 if(pw==""){
			 $('td[id=password]').text("");
		 }else if(pw.search(/\s/) != -1){
			 $('td[id=password]').append("<font color='red'>비밀번호는 공백 없이 입력해주세요.</font>");
			 $('input[name=password]').focus();
		 }else if(num < 0 || eng < 0 || spe < 0 ){
			 $('td[id=password]').append("<font color='red'>영문,숫자, 특수문자를 혼합하여 입력해주세요</font>");
			 $('input[name=password]').focus();
		 }else if(pw.length < 8 || pw.length > 20){
			 $('td[id=password]').append("<font color='red'>8자리 ~ 20자리 이내로 입력해주세요.</font>");
			 $('input[name=password]').focus();
		 }else{
			 password = true;
		 }
	});
	 $('input[name=repassword]').keyup(function() {
		$('td[id=repassword]').text("");
		var password1 = $('input[name=password]').val(); /* 패스워드와 패스워드 확인 부분 가져오기 */
	    var repassword1 = $('input[name=repassword]').val(); 	
	    if(password1 == repassword1) {
			repassword = true;
	    }else if(repassword1==""){
	    	$('td[id=repassword]').text("");
	    }else{
			$('td[id=repassword]').text("");	    	
			$('td[id=repassword]').append("<font color='red'>패스워드가 일치하지 않습니다.<font>");
			$('input[name=repassword]').focus();			
	    }
	});
	 
	$('#sub').click(function(){
		if($('input[name=id]').val()==""){
			alert("아이디를 입력하세요");
			return false;
		}
		if(use==true){
			alert("이미 사용중인 아이디 입니다.");
			return false;
		}
		if(password==false){
			alert("비밀번호 규칙을 지켜주세요.");
			return false;
		}
		if(repassword==false){
			alert("비밀번호가 일치 하지않습니다.");
			return false;
		}
		if(isCheck==false||isChange==true){
			alert("아이디 중복체크 해주세요");
			return false;
		}
	});
	
});//ready
</script>

<center>
<br>
<h3>회원가입</h3>
<br>
<form name="myform" action="insert.mem" method="post">
	<div class="container"> 
	<table class="table">
		<tr align="center">
		    <td width="33%">
		    </td>
			<th>아이디 :
				<input type="text" name="id">
				<input type="button" value="중복체크" id="titleCheck" class="btn btn-default btn-sm">
			</th>
			<td width="28%" id="id">
		     </td>
		</tr>
		<tr align="center">
		    <td></td>
			<th>
			    비밀번호 : <input type="password" name="password" id="password" value="${memBean.password}">
			</th>
			<td id="password"></td>
		<tr>
		<tr align="center">
			<td></td>
			<th>
			    비밀번호 확인 : <input type="password" name="repassword" value="${memBean.password}">
			</th>
			<td id="repassword"></td>
		<tr>
		<tr align="center">
			<td></td>
			<th>
			    이름 : <input type="text" name="name" value="${memBean.name}">
			</th>
			<td></td>
		<tr>
		<tr align="center">
			<td></td>
			<th>
			    생년월일 : <input type="date" name="birthday" value="${memBean.birthday }" style = "height : 30px;" >
			</th>
			<td></td>
		</tr>
		<tr>
			<td align="center" colspan="5">
			<input type="submit" value="가입하기" id="sub" class="btn btn-default btn-sm"></td>
		</tr>
	</table>
	</div>
</form>
</center>
<%@ include file="../common/common_bottom.jsp" %>
