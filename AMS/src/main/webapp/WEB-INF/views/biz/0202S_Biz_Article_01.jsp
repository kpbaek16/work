<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="java.util.*" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<script src="/js/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" href="/css/ui/reset.css">
<link rel="stylesheet" href="/css/ui/sub_layout.css">
<link rel="stylesheet" href="/css/base/contents.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> <!-- 달력 css-->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  <!-- 달력 스크립트-->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  <!-- 달력 스크립트-->
<script type="text/javascript" src="/js/contents/base.js"></script>
<script type="text/javascript" src="/js/contents/cal.js"></script>
<script src="/js/common/common.js"></script> 
<script src="/js/common/json2.js"></script>

<title>업무정보 &gt; 업무별 매뉴얼</title>
</head>

<script type="text/javascript">
var msg = "${msg}";
if (msg != null && msg != "") {
	alert(msg);
}
function fn_biz_search(Biz_page){
	var form = document.bizFrom;
	document.getElementById('page').value = Biz_page;
	form.action="/biz/0202/main_Article.do";
	form.submit();
}	
function search_index(page)
{
	var iTotalPage = document.getElementById('totalPage').value;
	if( page < 1 )
		page = 1;
	if( page > iTotalPage )
		page = iTotalPage;
	fn_biz_search(page);
}
function fn_insBiz_Manual(type)
{
	var form = document.bizFrom;
	document.getElementById('BBSTYPE').value = type;
	form.action="/biz/0202/insBiz.do";
	form.submit();
}
function BizDetail(DOCNO, type)
{
	var form = document.bizFrom;
	document.getElementById('DOCNO').value = DOCNO;
	document.getElementById('BBSTYPE').value = type;
	form.action="/biz/0202/detailBiz.do";
	form.submit();
}
function BizDel(DOCNO, type)
{
	if(confirm("삭제 하시겠습니까?")){
		var form = document.bizFrom;
		document.getElementById('DOCNO').value = DOCNO;
		document.getElementById('BBSTYPE').value = type;
		form.action="/biz/0202/delelteBizinfo.do";
		form.submit();
	}
}

function BizUpdate(DOCNO, type) {
	var form = document.bizFrom;
	document.getElementById('DOCNO').value = DOCNO;
	document.getElementById('BBSTYPE').value = type;
	form.action = "/biz/0202/updateBiz.do";
	form.submit();
}
</script>
<body>
<div id="sub_wrap">

	<jsp:include page="/header.do"></jsp:include>
	<!-- //header -->
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
                    <p class="contents_title">업무게시판</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 업무정보</li>
                        <li>> 업무게시판</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<!-- search_area -->
					<form method="POST" name="bizFrom" id="bizFrom">
					<input type="hidden" id="page" name="page" value="${page}" />
					<input type="hidden" id="totalPage" name="totalPage" value="${BizTotalPage}" />
					<input type="hidden" id="BBSTYPE" name="BBSTYPE" value="" />
					<input type="hidden" id="DOCNO" name="DOCNO" value="" />
					<div class="search_area">
						<div class="search_box right">
							<span class="sel_box1">
								<select id="bis_Seqtype" name="bis_Seqtype" style="width:100px;" title="검색조건 선택">
									<option value="all">전체</option>
									<option value="name">제목</option>
									<option value="cmnt">내용</option>
								</select>
							</span>
							<input id="SeqTEXT" name="SeqTEXT" type="text" style="width:300px;" placeholder="검색어를 입력하세요" title="검색어 입력">
							<a href="javascript:fn_biz_search('1');" class="btn_search">검색</a>
						</div>
					</div>
					<!-- // search_area -->
					</form>
					<!-- 검색리스트 -->
					<div class="aniinfo_add_box">
						<c:if test="${PMS0202 == 'Y'}">
						<p><a href="javascript:fn_insBiz_Manual('2');" class="info_add_btn" style="width:80px; margin-left:910px;">글쓰기</a></p>		
						</c:if>			
						<table class="search_list" >
						<caption>검색리스트 내역</caption>
							<colgroup>
								<col style="width:8%;">
								<col style="width:15%;">
								<col style="width:24%;">
								<col style="width:8%;">
								<col style="width:15%;">
								<col style="width:15%;">
								<col style="width:15%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">No</th>
									<th scope="col">종류</th>
									<th scope="col">제목</th>									
									<th scope="col">조회</th>
									<th scope="col">작성일</th>
									<th scope="col">작성자</th>
									<th scope="col">수정/삭제</th>
								</tr>
							</thead>
							<tbody  id="biz_tbody">
								<c:forEach var="Bizlist" items="${Bizlist}" varStatus="st">
								<tr>
									<th scope="row"><a href="javascript:BizDetail('${Bizlist.BBI_DOCNO}','2');">${Bizlist.SEQ}</a></th>
									<td><a href="javascript:BizDetail('${Bizlist.BBI_DOCNO}','2');">${Bizlist.BBI_MANUALTYPE}</a></td>
									<td class="text_left"><a href="javascript:BizDetail('${Bizlist.BBI_DOCNO}','2');">${Bizlist.BBI_TIT}</a></td>
									<td><a href="javascript:BizDetail('${Bizlist.BBI_DOCNO}','2');">${Bizlist.BBI_SELECT_CNT}</a></td>
									<td><a href="javascript:BizDetail('${Bizlist.BBI_DOCNO}','2');">${Bizlist.CMN_MAK_DATE}</a></td>
									<td><a href="javascript:BizDetail('${Bizlist.BBI_DOCNO}','2');">${Bizlist.CMN_MAK_NAME}</a></td>
									<td>
										<div id="biz_btn" data-val=''>
										<c:if test="${USER_ID == Bizlist.CMN_MAK_ID or sessionScope['ss_auth_grp'] == 'SA'}">
											<a href="javascript:BizUpdate('${Bizlist.BBI_DOCNO}','2')" class="t_cha_btn">수정</a><a href="javascript:BizDel('${Bizlist.BBI_DOCNO}','2')" class="del2_btn btn_type2">삭제</a>
	            						</c:if>
	            						</div>
									</td>
								<tr>
								</c:forEach>
							</tbody>
						
						</table>

						<!-- pagination -->
						<div class="pagination">
							<a href="javascript:search_index(1);" class="page first"></a>
							<a href="javascript:search_index(${page-1});" class="page prev"></a>
							<c:forEach var="x" begin="${BizFirstPage}" end="${BizLastPage}" step="1">
								<c:if test="${x == page}">
									<a href="#" class="on">${x}</a>
								</c:if>
								<c:if test="${x != page}">
									<a href="javascript:search_index(${x});">${x}</a>
								</c:if>
							</c:forEach> 
							<a href="javascript:search_index(${page+1});" class="page next"></a>
							<a href="javascript:search_index(${BizTotalPage});" class="page last"></a>
						</div>
						<!-- //pagination -->
					</div>
					<!-- //검색리스트 -->

				<!-- //contents-->
			</section>

			<!-- //right-->
		</div>
	


	</div>
	<!-- //container -->
	<!-- footer -->
	<jsp:include page="/footer.do"></jsp:include>
	<!-- //footer -->
</div>
</body>
</html>
