<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Employ</title>
</head>
<body>
	<form action="delete-employ.jsp">
		Employ No : 
		<input type="number" name="empno" /> <br/><br/>
		<input type="submit" value="Search" /> <br/><br/>
	</form>
	<c:if test="${param.empno!=null}">
		<jsp:include page="connection.jsp"></jsp:include>
		<sql:update var="employQuery" dataSource="${conn}">delete from Employ where empno=? 
			<sql:param value="${param.empno}"/>
		</sql:update>
		
		<jsp:forward page="employ-show.jsp" />
	</c:if>
</body>
</html>