<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common_top.jsp" %>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
</head>
<center>
<br>
<h3>회원정보</h3>
<br>

<div class="container">
    <table class="table" class="text-center">
	<tr>
		<th class="text-center" width="600">
			회원번호
		</th>
		<td>
			${loginInfo.no }
			
		</td>
	</tr>
	<tr>
		<th class="text-center">
			ID
		</th>
		<td>
			${loginInfo.id }
		</td>
	</tr>
	<tr>
		<th class="text-center">
			이름
		</th>
		<td>
			${loginInfo.name }
		</td>
	</tr>
	<tr>
		<th class="text-center">
			생년월일
		</th>
		<c:set var="birthday">
			<fmt:parseDate value="${loginInfo.birthday}" var="dateValue" pattern="yyyy-MM-dd" />
			<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd" />	
		</c:set> 
		<td>
			${birthday }
		</td>
	</tr>
	<tr>
		<th class="text-center">
			가입일
		</th>
		<c:set var="joindate">
			<fmt:parseDate value="${loginInfo.joindate}" var="dateValue" pattern="yyyy-MM-dd" />
			<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd" />	
		</c:set> 
		<td>
			${joindate }
		</td>
	</tr>
	<tr>
		<th class="text-center">
			성별
		</th>
		<td>
			${loginInfo.gender }
		</td>
	</tr>
	<tr>
		<th class="text-center">
			핸드폰 번호
		</th>
		<td>
			${loginInfo.hp1 }-${loginInfo.hp2 }-${loginInfo.hp3 }
		</td>
	</tr>
	<tr>
		<th class="text-center">
			주소
		</th>
		<td>
			${loginInfo.address1 } ${loginInfo.address2 }
		</td>
	</tr>
	<tr>
		<th class="text-center">
			은행
		</th>
		<td>
			${loginInfo.accountbank }
		</td>
	</tr>
	<tr>
		<th class="text-center">
			입금전용 계좌
		</th>
		<td>
			${loginInfo.account }
		</td>
	</tr>
	<tr>
		<th class="text-center">
			적립 포인트
		</th>
		<td>
			${loginInfo.mpoint }
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="button" value="정보수정"  class="btn btn-default btn-sm" onclick="location.href='update.mem?id=${loginInfo.id}'">
		</td>
	</tr>
</table>
</div>
</center>
<%@ include file="../common/common_bottom.jsp" %>