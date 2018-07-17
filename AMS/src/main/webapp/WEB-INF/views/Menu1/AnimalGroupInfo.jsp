<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<table>
		<tr>
			<td>검색 분류 구분</td>
			<td><input type="radio" value="강" /> <input type="radio" value="목" /> <input type="radio" value="과" /> <input type="radio" value="종" /></td>
		</tr>
		<tr>
			<td>검색 분류 구분 명칭</td>
			<td><input type="text" /></td>
		</tr>
	</table>
</body>
</html>
