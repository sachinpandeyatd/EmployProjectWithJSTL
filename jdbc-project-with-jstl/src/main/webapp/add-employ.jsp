<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Employee</title>
</head>
<body>
	<jsp:include page="connection.jsp"></jsp:include>
	<form action="add-employ.jsp">
		Employ Name:
		<input type="text" name="name" value="${var }"/><br><br>
		Employ Dept:
		<input type="text" name="dept" /><br><br>
		Employ Desig:
		<input type="text" name="desig" /><br><br>
		Employ Basic:
		<input type="number" name="basic" /><br><br>
		<input type="submit" value="SUBMIT" />
	</form>
	
	<c:if test="${param.basic != null }">	
		<c:set var="name" value="${param.name }" />
		<c:set var="dept" value="${param.dept }" />
		<c:set var="desig" value="${param.desig }" />
		<c:set var="basic" value="${param.basic }" />
		
		<sql:update var="employQuery" dataSource="${conn}">insert into employ (name, dept, desig, basic) value(?, ?, ?, ?)
			<sql:param value="${param.name }"/>
			<sql:param value="${param.dept }"/>
			<sql:param value="${param.desig }"/>
			<sql:param value="${param.basic }"/>
		</sql:update>
		
		<c:out value="Data Inserted Successfully."></c:out>
	</c:if>
	
</body>
</html>