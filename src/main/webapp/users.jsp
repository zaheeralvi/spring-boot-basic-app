<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<anyxmlelement xmlns:c="http://java.sun.com/jsp/jstl/core">

<h2>All Users Will be visible here</h2>
<table>
	<c:forEach items="${userlist}" var="user">
	    <tr>      
	        <td>${user.name}</td>
	        <td>${user.email}</td>
	        <td>${user.country}</td>
	    </tr>
	</c:forEach>
</table>