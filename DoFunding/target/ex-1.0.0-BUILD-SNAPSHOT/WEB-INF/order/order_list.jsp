<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common_top.jsp"%>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
</head>
<style>
	.order-detail {
		background: #fffcf6;
		font: 14px Malgun Ghothic,"맑은고딕",sans-serif;
    	color: #555;
    	min-width:320px;
	}
</style>
<center>
<center>
<br>
<h3>주문 내역</h3>
<br>
</center>

	<div class="container">
            <table class="table" class="text-center">
		<c:choose>
			<c:when test="${orderList == null}">
				<tr>
					<td colspan="3"><h3>주문 내역이 없습니다.</h3></td>
				</tr>
			</c:when>
			<c:otherwise>
				<div class="order-menu">
					<tr>
						<td colspan="3" align="center">${sessionScope.loginInfo.name}님의 주문 내역입니다.</td>
					</tr>
					<tr>
						<th class="text-center">주문 번호</th>
						<th class="text-center">결제 일자</th>
						<th class="text-center">상세보기</th>
					</tr>
				</div>
				
				<c:forEach var="order" items="${orderList}">
					<div class="order-in">
						<tr align="center">
							<td>${order.o_num}</td>
							<td>${order.o_date}</td>
							<td>
								<a href="order_detail.ord?o_num=${order.o_num}" class="btn btn-default btn-sm">상세보기</a>
							</td>
						</tr>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</div>
</center>
<%@ include file="../common/common_bottom.jsp"%>