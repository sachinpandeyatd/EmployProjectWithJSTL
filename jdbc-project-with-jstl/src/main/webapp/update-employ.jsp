<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Employ</title>
</head>
<body>
	<form action="update-employ.jsp">
		Employ No : 
		<input type="number" name="empno" /> <br/><br/>
		<input type="submit" value="Search" /> <br/><br/>
	</form>
	
	<c:if test="${param.empno!=null && param.name == null}">
		<jsp:include page="connection.jsp"></jsp:include>
	<sql:query var="employQuery" dataSource="${conn}">
		select * from Employ where empno=?
		<sql:param value="${param.empno}"/>
	</sql:query>
		<c:set var="flag" value="0" />
		<c:forEach var="e" items="${employQuery.rows}">
		
			<c:set var="name" value="${e.name }" />
			<c:set var="dept" value="${e.dept }" />
			<c:set var="desig" value="${e.desig }" />
			<c:set var="basic" value="${e.basic }" />
			
			<form action="update-employ.jsp">
				Employ No.
				<input type="number" name="empno" value="${param.empno }" /> <br><br>
				Employ Name:
				<input type="text" name="name" value="${name }" /><br><br>
				Employ Dept:
				<input type="text" name="dept" value="${dept }" /><br><br>
				Employ Desig:
				<input type="text" name="desig" value="${desig }" /><br><br>
				Employ Basic:
				<input type="number" name="basic" value="${basic }" /><br><br>
				<c:set var="flag" value="1" />
				<input type="submit" value="SUBMIT" />
			</form>
		</c:forEach>
		<c:if test="${flag==0}">
			<c:out value="Employ No Not Found..." />
		</c:if>
	</c:if>
	
	<c:if test="${param.basic != null}">
		<jsp:include page="connection.jsp"></jsp:include>
		
		<c:set var="name" value="${param.name }" />
		<c:set var="dept" value="${param.dept }" />
		<c:set var="desig" value="${param.desig }" />
		<c:set var="basic" value="${param.basic }" />
		<c:set var="basic" value="${param.empno }" />
		
		<sql:update var="employQuery" dataSource="${conn}">update employ set name=?, dept=?, desig=?, basic=? where empno=?
			<sql:param value="${param.name }"/>
			<sql:param value="${param.dept }"/>
			<sql:param value="${param.desig }"/>
			<sql:param value="${param.basic }"/>
			<sql:param value="${param.empno }"/>
		</sql:update>
		
		<jsp:forward page="employ-show.jsp" />
	</c:if>
</body>
</html>