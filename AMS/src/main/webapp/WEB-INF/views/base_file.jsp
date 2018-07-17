<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<meta charset="UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<title>기준정보관리 &gt; 동물그룹정보</title>
</head>
<body>
	<div class="sub_wrap">
		<jsp:include page="/header.do"></jsp:include>
		<div id="container">
			<div id="contents">
				<jsp:include page="/lnb.do"></jsp:include>
			</div>
		</div>
		<jsp:include page="/footer.do"></jsp:include>
	</div>
</body>
<jsp:include page="/start.do"></jsp:include>
</html>