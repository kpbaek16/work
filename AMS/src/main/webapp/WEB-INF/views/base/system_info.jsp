<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
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
				<section id="contents_area">
					<h2>본문내용</h2>
					<div class="title_area">
						<p class="contents_title">동물그룹정보관리</p>
						<ol class="location">
							<li><img src="../images/home_icon.gif" alt="home"></li>
							<li>> 기준정보관리</li>
							<li>> 시스템 정보</li>
						</ol>
					</div>
					<div class="contents_table">
						<form:form id="systemForm" name="systemForm" method="POST" action="/Base/System_Info_Update.do">
						<div class="search_box">
							<table class="search_table">
								<caption>동물그룹정보조회</caption>
								<colgroup>
									<col style="width: 20%;">
									<col style="width: 80%;">
								</colgroup>
								
								<tbody>
									<tr>
										<th scope="row">동물원 명칭</th>
										<td><input type="text" id="zoo_name" name="zoo_name"  class="textfield" style="width: 80%" value="${SystemInfo.MSC_AMS_NAME}"/></td>
									</tr>
									<tr>
										<th scope="row">로고 파일명</th>
										<td><input type="text" id="file_name" name="file_name" class="textfield" style="width: 80%" value="${SystemInfo.MSC_LOGONM}"/></td>
									</tr>
									<tr>
										<th scope="row">업로드 폴더 경로</th>
										<td><input type="text" id="folder_path" name="folder_path" class="textfield" style="width: 80%" value="${SystemInfo.MSC_UPLOADPATH}"/></td>
									</tr>
									<tr>
										<th scope="row">서울대공원 행정포털 코드</th>
										<td><input type="text" id="potal_code" name="potal_code" class="textfield" style="width: 80%" value="${SystemInfo.MSC_HJPT_SCODE}"/></td>
									</tr>
									<tr>
										<td colspan="2" style="border-top: 1px solid #d0d0d0; background: #f5f5f5;"><button class="search_btn" type="button" onclick="system_info_update()">수정</button></td>
									</tr>
								</tbody>
								
							</table>
						</div>
						</form:form>
					</div>
				</section>
			</div>
		</div>
		<jsp:include page="/footer.do"></jsp:include>
	</div>
</body>
<jsp:include page="/start.do"></jsp:include>
<script type="text/javascript">
	function system_info_update(){
		var form = document.systemForm;
		
		var zoo_name = form.zoo_name.value;
		var file_name = form.file_name.value;
		var folder_path = form.folder_path.value;
		var potal_code = form.potal_code.value;
		
		if(zoo_name)
		
		form.submit();
	}
</script>
</html>