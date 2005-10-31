<%@ include file="/WEB-INF/template/include.jsp" %>

<openmrs:require privilege="Manage Orders" otherwise="/login.jsp" redirect="/admin/orders/orderType.list" />

<%@ include file="/WEB-INF/template/header.jsp" %>
<%@ include file="localHeader.jsp" %>

<h2><spring:message code="OrderType.manage.title"/></h2>	

<a href="orderType.form"><spring:message code="OrderType.add"/></a> <br />

<br />

<b class="boxHeader"><spring:message code="OrderType.list.title"/></b>
<form method="post" class="box">
	<table>
		<tr>
			<th> </th>
			<th> <spring:message code="OrderType.name" /> </th>
			<th> <spring:message code="OrderType.description" /> </th>
		</tr>
		<c:forEach var="orderType" items="${orderTypeList}">
			<tr>
				<td valign="top"><input type="checkbox" name="orderTypeId" value="${orderType.orderTypeId}"></td>
				<td valign="top">
					<a href="editOrderType-Standard.jsp?orderTypeId=${orderType.orderTypeId}">
					   ${orderType.name} (jsp)
					</a> | 
					<a href="orderType.form?orderTypeId=${orderType.orderTypeId}">
					   ${orderType.name} (spring)
					</a>
				</td>
				<td valign="top">${orderType.description}</td>
			</tr>
		</c:forEach>
	</table>
	<input type="submit" value="<spring:message code="OrderType.delete"/>" name="action">
</form>

<%@ include file="/WEB-INF/template/footer.jsp" %>