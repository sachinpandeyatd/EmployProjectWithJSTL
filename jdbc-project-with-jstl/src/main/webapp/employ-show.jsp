<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employ Show</title>
</head>
<body>
	<jsp:include page="connection.jsp"></jsp:include>
	<sql:query var="employQuery" dataSource="${conn}">select * from employ</sql:query>
		<table border="3">
			<tr>
				<th>Employ No.</th>
				<th>Employ Name</th>
				<th>Employ Dept</th>
				<th>Employ Desig</th>
				<th>Employ Basic</th>
				<th>Update Employ</th>
				<th>DELETE Employ</th>
			</tr>
			<c:forEach var="employ" items="${employQuery.rows }">
				<tr>
					<c:set var="empno" value="${employ.empno }"></c:set>
					<td><c:out value="${empno }"></c:out></td>
					<td><c:out value="${employ.name }"></c:out></td>
					<td><c:out value="${employ.dept }"></c:out></td>
					<td><c:out value="${employ.desig }"></c:out></td>
					<td><c:out value="${employ.basic }"></c:out></td>
					<td><a href="update-employ.jsp?empno=${empno }"><button>Update</button></a></td>
					<td><a href="delete-employ.jsp?empno=${empno }"><button><b>DELETE</b></button></a></td>
				</tr>
			</c:forEach>
		</table>
</body>
</html>