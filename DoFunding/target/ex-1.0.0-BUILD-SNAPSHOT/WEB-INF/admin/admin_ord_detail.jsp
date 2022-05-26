<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_top.jsp" %>   

<style>
	.order-detail {
		background: #fffcf6;
		font: 14px Malgun Ghothic,"맑은고딕",sans-serif;
    	color: #555;
    	min-width:320px;
	}
</style>
<center>
<div class="order-detail">
	<div class="od-head" style="margin-bottom: 50px;">
		<h1>주문 상세 내역</h1><a href="admin_ord_list.ad">주문내역</a>
	</div>
	<table class="od-table" style="margin: auto; border-bottom: 1px solid #555" border="1">
		<div class="od-menu">
			<tr>
				<th colspan="2" style="text-align: center;">상품명</th>
				<th>이미지</th>
				<th>가격</th>
				<th>수량</th>
				<th>옵션</th>
				<th>결제금액</th>
				<th>펀딩현황</th>
			</tr>
		</div>
		<c:set var="totalprice" value="0" />
		<div class="od-in" style="text-align: left;">
			<c:forEach var="odb" items="${detailList}">
				<c:set var= "totalprice" value="${totalprice + odb.amount}"/>
				<tr>
					<td colspan="2">${odb.p_subject}</td>
					<td ><img width="100px" height="100px" src="<%=request.getContextPath()%>/resources/images/${odb.p_image}"></td>
					<td>${odb.price}</td>
					<td>${odb.qty}</td>
					<td>${odb.option_content}</td>
					<td>${odb.amount}</td>
					<td>${(odb.p_total_price/odb.p_end_price)*100} %</td>
<%-- 					<c:choose>
						<c:when test="${odb.deliver != 0}">
							<td>
								<button class="btn-default-disable" disabled="disabled">주문취소</button>
								<br>
								<button class="btn-default-disable" disabled="disabled">주문변경</button>
								<br>
							</td>
						</c:when>
						<c:otherwise>
							<td>
								<button class="btn-default-order_cancel" onclick="location.href='#'+ ${odb.od_num}">주문취소</button>
								<br>
								<button class="btn-default-disable" disabled="disabled">주문변경</button>
							</td>
						</c:otherwise>
					</c:choose> --%>
				</tr>
			</c:forEach>	
		</div>
		<tr>
			<td colspan="8" align="right">
				총 계산금액 : 
					<c:choose>
						<c:when test="${totalprice>30000}">
							${totalprice} 원
						</c:when>
						<c:otherwise>
							${totalprice+3000} 원
						</c:otherwise>
					</c:choose>
			</td>
		</tr>
	</table>
</div>
</center>
<%@ include file="admin_bottom.jsp" %>  