<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>For Potal</h1>
<P>  The time on the server is ${serverTime}. </P>
<P>CKey : <a href="http://98.33.0.126/AMSMain/Index?CKey=${CKey}"> ${CKey} </a> </P>
<P>Info : ${result} </P>
</body>
</html>
