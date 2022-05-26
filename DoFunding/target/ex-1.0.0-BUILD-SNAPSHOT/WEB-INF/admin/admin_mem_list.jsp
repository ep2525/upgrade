<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_top.jsp"%>  
<center>
 <div class="container">
        <table class="table table-hover table-sm" class="text-center">
	<tr>
		<th>회원번호</th>
		<th>아이디</th>
		<th>이름</th>
		<th>생년<br>월일</th>
		<th>가입일</th>
		<th>성별</th>
		<th>핸드폰<br>번호</th>
		<th>주소</th>
		<th>거래은행</th>
		<th>계좌번호</th>
		<th>적립포인트</th>
		<th>회원등급</th>
		<th>등급<br>관리</th>
		
	</tr>

	<c:forEach var="memList" items="${memlist}">
		<tr>
			<td>
				${memList.no }
			</td>
			<td>
				${memList.id }
			</td>
			<td>
				${memList.name }
			</td>
			<c:set var="birthday">
				<fmt:parseDate value="${memList.birthday}" var="dateValue" pattern="yyyy-MM-dd" />
				<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd" />	
			</c:set> 
			<c:set var="joindate">
				<fmt:parseDate value="${memList.joindate}" var="dateValue" pattern="yyyy-MM-dd" />
				<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd" />	
			</c:set> 	
			<td>
				${birthday }
			</td>
			<td>
				${joindate }
			</td>
			<td>
				${memList.gender }
			</td>
			<td>
				${memList.hp1 } - ${memList.hp2 } - ${memList.hp3 }
			</td>
			<td>
				${memList.address1 } ${memList.address2 } 
			</td>
			<td>
				${memList.accountbank }
			</td>
			<td>
				${memList.account }
			</td>
			<td>
				${memList.mpoint }
			</td>
			<td>
				<c:if test="${memList.admin eq '0'}"> 관리자 </c:if>
				<c:if test="${memList.admin eq '1'}"> 
					<c:if test="${memList.accountbank eq null }"> 일반회원 </c:if>
					<c:if test="${memList.accountbank != null }"> 정회원 </c:if>
				</c:if>
			</td>
			<td>
				<input type="button" value="등업" class="btn btn-default btn-sm" onclick="location.href='upgrade.ad?no=${memList.no}'">
			</td>
		</tr>
		
	</c:forEach>
	
</table>
</div>
</center>











<%@include file="admin_bottom.jsp"%>