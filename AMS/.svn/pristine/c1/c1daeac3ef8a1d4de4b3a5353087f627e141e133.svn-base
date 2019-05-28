<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="/css/ui/reset.css">
<link rel="stylesheet" href="/css/ui/sub_layout.css">
<link rel="stylesheet" href="/css/base/contents.css">
<link rel='stylesheet' href='/css/base/Nwagon.css' type='text/css'>
<script src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/contents/base.js"></script>
<script src="/js/common/common.js"></script> 
<script src="/js/common/json2.js"></script>

<script type="text/javascript">
function mainSearch(){
	var form = document.myform2;
	var tt = document.getElementById("mainSearch").value; 	

	if(tt == ''){
		alert('검색어가 없습니다.');
		return;
	}

	form.action="/main/mainSearch.do";
	form.submit();
	}

</script>


<title>통합검색</title>
</head>
<body>
<div id="sub_wrap">
	<jsp:include page="/header.do"></jsp:include>
	<!-- container-->
	<div id="container">
		<div id="contents">
			<!-- left-->
			<div id="lnb_area">
			<jsp:include page="/lnb.do"></jsp:include>
			</div>
			<!-- //left-->
			<!-- right-->
			<section id="contents_area">
			<h2>본문내용</h2>
				<!-- contents_title-->
				<div class="title_area">
                    <p class="contents_title">통합검색</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 통합검색</li>                       
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<!-- search_area -->
					<form name="myform2" id="myform2" method="get">
				<div class="search_area" style="margin-top:30px; margin-right:200px">
					<div class="search_box right" id="main">
						<span class="sel_box1">
							<select style="width:120px;" id="optType" name="optType">
							 <option value="All" <c:if test="${'All'== optType }"> selected</c:if>>전체</option>
							 <option value="sayuk" <c:if test="${'sayuk'== optType }"> selected</c:if>>사육일지(미정)</option>
							 <option value="jinryo" <c:if test="${'jinryo'== optType }"> selected</c:if>>진료일지(미정)</option>
							 <option value="bokun" <c:if test="${'bokun'== optType }"> selected</c:if>>보건일지(미정)</option>
							</select>
						</span> 
						<input type="text" name="mainSearch" id="mainSearch" class="textfield" style="width:400px;" value="<%=request.getParameter("mainSearch")%>"/>
						<!-- <input type="submit" class="search_btn" value="조회"> -->
						<a href="javascript:mainSearch();" class="btn_search">검색</a>
					</div>
				</div>
				</form>
				
					<!-- // search_area -->
					<ul	class="allsearch_list">
								<li>
								<span class="sear_title">[진료일지]</span>
								<c:forEach items="${jinryo}" var="jn">
									<p class="sear_title2">${jn.JJJ_DOCNO } ${jn.JJJ_JRCMNT }</p> <div class = "sear_title2" align="right">${jn.JJJ_SDATE }</div><br>
									</c:forEach>
									
									<c:if test="${jinryo.size() == 0 }">
									<p class="sear_title2">데이터가 없습니다.</p>
									</c:if>
								</li>	
								
								<li>
									<span class="sear_title">[보건일지]</span>
								<c:forEach items="${bokun}" var="bo">		
									<p class="sear_title2">${bo.JBJ_DOCNO } ${bo.JBJ_CMNT }</p> <div class="sear_title2" align="right">${bo.JBJ_JNLDATE }</div><br>
									</c:forEach>
									
									<c:if test="${bokun.size() == 0 }">
									<p class="sear_title2">데이터가 없습니다.</p>
									</c:if>
								</li>
								<li>
									<span class="sear_title">[사육일지]</span>	
								<c:forEach items="${sayuk}" var="sa">
									<p class="sear_title2">${sa.SDJ01_DOCNO } ${sa.SDJ01_CMNT }</p> <div class="sear_title2" align="right">${sa.CMN_MAK_DATE }</div> <br>
									</c:forEach>
									
									<c:if test="${sayuk.size() == 0 }">
									<p class="sear_title2">데이터가 없습니다.</p>
									</c:if>
								</li>
								
								
							</ul>

					<!-- 검색리스트 -->
					<!-- <div class="allsearch_box">

						pagination
						<div class="pagination">
							<a href="#" class="page first"></a>
							<a href="#" class="page prev"></a>
							<a href="#" class="on">1</a>
							<a href="#">2</a>
							<a href="#">3</a>
							<a href="#">4</a>
							<a href="#">5</a>
							
							<a href="#">6</a>
							<a href="#">7</a>
							<a href="#">8</a>
							<a href="#">9</a>
							<a href="#">10</a>
							
							<a href="#" class="page next"></a>
							<a href="#" class="page last"></a>
						</div>
						//pagination
					</div> -->
					<!-- //검색리스트 -->

				<!-- //contents-->
			</section>

			<!-- //right-->
		</div>
	


	</div>
	<jsp:include page="/footer.do"></jsp:include>
</div>
</body>
</html>