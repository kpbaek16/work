<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script type="text/javascript">
	$(function(){
		$(".search_btn").click(function(){
			var form = document.ani_groupForm;
			form.submit();
		})
	})
	//type :  kang, mog, gwa, jong
	//aniCode1 : 강코드, aniCode2 : 목코드, aniCode3 : 과코드
	function AniGrp_rowRank(type, aniCode1, aniCode2, aniCode3){
		//alert(type + " " + aniCode1 + " " + aniCode2 + " " + aniCode3);
		var form = document.ani_groupForm;
		form.Rowtype.value = type;
		form.aniCode1.value = aniCode1;
		form.aniCode2.value = aniCode2;
		form.aniCode3.value = aniCode3;
		form.action = "Ani_GroupRowRank.do";
		form.submit();
	}
</script>
<title>기준정보관리 &gt; 동물그룹정보</title>
</head>
<body>
	<form:form name="ani_groupForm" modelAttribute = "ani_groupForm" method="post" action="Ani_GroupSeq.do">
	<input type="hidden" name="Rowtype" value=""/>
	<input type="hidden" name="aniCode1" value=""/>
	<input type="hidden" name="aniCode2" value=""/>
	<input type="hidden" name="aniCode3" value=""/>
	<div class="sub_wrap">
		<jsp:include page="/header.do"></jsp:include>
		<div id="container">
			<div id="contents">
				<jsp:include page="/lnb.do"></jsp:include>
				<section id="contents_area">
			<h2>본문내용</h2>
				<!-- contents_title-->
				<div class="title_area">				
                    <p class="contents_title">동물그룹정보관리</p>
                    <ol class="location">
                        <li><img src="${pageContext.request.contextPath}/images/home_icon.gif" alt="home"></li>
                        <li>> 기준정보관리</li>
                        <li>> 동물그룹정보관리</li>        
                    </ol>  
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 분류검색표-->
					<div class="search_box">
                        <table class="search_table" >
							<caption>동물그룹정보조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody>
                            <tr>
                                <th scope="row">검색 분류 구분</th>
                                <td>
                                <p>	
                                  <label><input type="radio" name="groupType" value="kang" class="search_radio" <c:if test="${type == 'kang'}">checked="checked"</c:if>/>강</label>
                                  <label><input type="radio" name="groupType" value="mog" class="search_radio" <c:if test="${type == 'mog'}">checked="checked"</c:if>/>목</label>
                                  <label><input type="radio" name="groupType" value="gwa" class="search_radio" <c:if test="${type == 'gwa'}">checked="checked"</c:if>/>과</label>
                                  <label><input type="radio" name="groupType" value="jong" class="search_radio" <c:if test="${type == 'jong'}">checked="checked"</c:if>/>종</label>            
                                </p>
                                </td>
                            </tr>
                            <tr><th scope="row">검색 분류 구분 명칭</th><td><input name="groupName" type="text" id="seach_text" class="textfield" style="width:80%" value = "${name}" /></td></tr>
							<tr><td colspan="2" style="border-top:1px solid #d0d0d0; background:#f5f5f5;"><button class="search_btn" type="button">조회</button></td></tr>
                            </tbody>
                        </table>					
					</div>
					<!-- 그룹항목표-->
					<div class="table_wrap">
						<p class="sub_title">동물 그룹정보 일람</p>      
						<c:set var="url" value=""/>
						<c:choose>
						<c:when test="${type == 'mog'}">               
						<c:set var="url" value="AniGrp_mog.jsp"/>
						</c:when>
						<c:when test="${type == 'gwa'}">               
						<c:set var="url" value="AniGrp_gwa.jsp"/>
						</c:when>
						<c:when test="${type == 'jong'}">               
						<c:set var="url" value="AniGrp_jong.jsp"/>
						</c:when>
						<c:otherwise>               
						<c:set var="url" value="AniGrp_kang.jsp"/>
						</c:otherwise>
						</c:choose>
						<c:import url="${url}" var="AniTable">
    						<c:param name="list" value="${list}"/>
    						<c:param name="type" value="${type}"/>
    						<c:param name="kangCnt" value="${kangCnt}"/>
    						<c:param name="mogCnt" value="${mogCnt}"/>
    						<c:param name="gwaCnt" value="${gwaCnt}"/>
						</c:import>
						<c:out value="${AniTable}" escapeXml="false"/>
                    <!-- //그룹항목표-->
					<!-- 상세정보표-->
                    <table class="ani_info" > 
						<caption>동물그룹상세정보</caption>
                        <colgroup>
							<col style="width:30%"/>
							<col style="width:70%"/>
                        </colgroup>
						<thead>
							<tr><th colspan="2" scope="col"><span class="info_title">상세정보</span><button class="cha_btn" type="button">수정</button><button class="del_btn" type="button">삭제</button></th></tr>
                        </thead>
						<tbody>
							<tr><th scope="row">강정보</th><td>조강 (B)</td></tr>
							<tr><th scope="row">목정보</th><td>타조목 (1)</td></tr>
							<tr><th scope="row">과정보</th><td>타조과 (1)</td></tr>
							<tr><th scope="row">종번호</th><td>1</td></tr>
							<tr><th scope="row">종명칭</th><td>타조</td></tr>
							<tr><th scope="row">영명</th><td>South African Ostrich</td></tr>
							<tr><th scope="row">학명</th><td>Struthio camelus</td></tr>
							<tr><th scope="row">CITES</th><td>CITESⅡ</td></tr>
							<tr><th scope="row">멸종위기</th><td>해당없음</td></tr>
							<tr><th scope="row">천연기년물</th><td>0</td></tr>
							<tr><th scope="row">등급</th><td>을</td></tr>
							<tr><th scope="row">평가내용</th><td>유지종</td></tr>
							<tr><th scope="row">원산지</th><td>토종</td></tr>
							<tr><th scope="row">임신기간</th><td>개월</td></tr>
							<tr><th scope="row">군집구분</th><td>군집</td></tr>
							<tr><th scope="row">개체수</th><td>마리</td></tr>
							<tr><th scope="row">평균수명</th><td>10 년</td></tr>
                       </tbody>
                    </table>
					<!-- //상세정보표-->
					</div>
				</div>
				<!-- //contents-->
			</section>
			<!-- //right-->
			</div>
		</div>
		<jsp:include page="/footer.do"></jsp:include>
	</div>
	</form:form>
</body>
</html>
