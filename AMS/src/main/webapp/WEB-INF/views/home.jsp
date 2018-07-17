<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<form:form name="mainForm">  
	ID : <input type="text" value="" name="ID" id="ID" />
	PW : <input type="password" value="" name="PW" id="PW" />
	<input type="submit" value="Login" />
</form:form>
</body>
</html>
