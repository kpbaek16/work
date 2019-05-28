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

<title>업무정보 &gt; ${title}</title>
</head>

<script type="text/javascript">
	var msg = "${msg}";
	if (msg != null && msg != "") {
		alert(msg);
	}
	function fn_biz_comment_insert() {
		var form = document.biz_detailFrom;
		form.action = "/biz/0202/insBiz_action.do";
		form.submit();
	}
	function search_index(page, DOCNO) {
		var sendData = "DOCNO=" + DOCNO + "&page=" + page;
		$.ajax({
			type : "POST",
			url : "/biz/0202/CommentPage.do",
			data : sendData,
			success : function(html) {
				$("#commentInfo").empty();
				$("#commentInfo").append(html);
			},
			error : function(xmlHttpObj) {
				alert(xmlHttpObj.responseText + '오류가 발생하였습니다.');
			}
		});
	}
	function insComment(DOCNO) {
		var cmnt = document.getElementById('comment_cmnt').value;
		var sendData = "DOCNO=" + DOCNO + "&cmnt=" + cmnt;
		$.ajax({
			type : "POST",
			url : "/biz/0202/insComment.do",
			data : sendData,
			success : function(data) {
				if (data == "false") {
					alert("코멘트 저장에 실패하였습니다.");
				} else if (data == "true") {
					search_index('1', DOCNO);
				} else {
					alert(data);
				}
			}
		});
	}
	function delComment(DOCNO, SEQ) {
		var sendData = "DOCNO=" + DOCNO + "&SEQ=" + SEQ;
		$.ajax({
			type : "POST",
			url : "/biz/0202/delComment.do",
			data : sendData,
			success : function(data) {
				if (data == "false") {
					alert("코멘트 삭제에 실패하였습니다.");
				} else if (data == "true") {
					search_index('1', DOCNO);
				} else {
					alert(data);
				}
			}
		});
	}
	function updateComment(DOCNO, SEQ, page) {
		var cmnt = document.getElementById('comment_cmnt').value;
		var sendData = "DOCNO=" + DOCNO + "&SEQ=" + SEQ + "&cmnt=" + cmnt
				+ "&page=" + page;
		$.ajax({
			type : "POST",
			url : "/biz/0202/updateComment.do",
			data : sendData,
			success : function(data) {
				if (data == "false") {
					alert("코멘트 수정에 실패하였습니다.");
				} else if (data == "true") {
					search_index(page, DOCNO);
				} else {
					alert(data);
				}
			}
		});
	}
	function update(seq){
		var a_update = "#a_update" + seq;
		var a_del = "#a_del" + seq;
		var p_tag = "#p_tag" + seq;
		var li_tag = "#li_tag" + seq;	
		var Biz_SEQ = $(a_update).attr('data-val');
		var DOCNO = '${DOCNO}';
		var page = document.getElementById('page').value;
		$(a_update).attr('style', "display:none");
		$(a_del).attr('style', "display:none");
		$(p_tag).html("<textarea rows='5' name='comment_cmnt' id='comment_cmnt' style='width:100%; border: 0; resize: none; padding:10px 5px; font-size:13px; color:#555; line-height:20px; text-align:left;'>" + $(p_tag).text() + "</textarea>");
		$(li_tag).append("<a href='javascript:updateComment("+DOCNO+","+Biz_SEQ+","+page+");' class='co_modify_btn'>수정</a>");
		$(li_tag).append("&nbsp;<a href='javascript:search_index("+page+","+DOCNO+");' class='co_del_btn'>취소</a>");
	}
	function downloadFile(DOCNO, SEQ) {
		var sendData = "DOCNO=" + DOCNO + "&SEQ=" + SEQ;
		var form = document.biz_detailFrom;
		form.action = "/biz/0202/Filedownload.do?" + sendData;
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
                    <p class="contents_title">${title}</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 업무정보</li>
                        <li>> ${title}</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
				<form method="POST" name="biz_detailFrom" id="biz_detailFrom">
				<input type="hidden" id="BBSTYPE" name="BBSTYPE" value="${BBSTYPE}" />
				<p class="sub_title">${Subtitle}</p>
					<!-- 직원게시판글쓰기페이지 -->
					<div class="aniinfo_search_box">
                        <table class="aniinfo_search" >
							<caption>${Subtitle}</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:30%;">
								<col style="width:20%;">
								<col style="width:30%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">종류</th>
									<td>${BizInfo.BBI_MANUALTYPE}</td>
									<th scope="row">게시여부</th>
									<td>${BizInfo.BBI_OPEN_YN}</td>
								</tr>
								<tr>
									<th scope="row">작성자</th>
									<td>${BizInfo.CMN_MAK_NAME}</td>
									<th scope="row">작성일</th>
									<td>${BizInfo.CMN_MAK_DATE}</td>
								</tr>
								<tr>
									<th scope="row">제목</th>
									<td colspan="3">${BizInfo.BBI_TIT}</td>
								</tr>
								<tr style="height:450px;">
									<td colspan="4" style="padding:10px 5px; font-size:13px; color:#555; line-height:20px;">
										${BizInfo.BBI_CTNT}
									</td>
								</tr>
								<c:forEach var="Filelist" items="${Filelist}" varStatus="st">
								<c:choose>
									<c:when test="${st.first}">
										<tr>
											<th rowspan="${FilelistSize}" scope="row" style="vertical-align:middle;">파일</th>
											<td colspan="3">${Filelist.BDA_CMNT}<a href="javascript:downloadFile('${DOCNO}','${Filelist.BDA_BZSEQNO}');" class="down_btn" style="margin-left:30px;">다운로드</a></td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="3">${Filelist.BDA_CMNT}<a href="javascript:downloadFile('${DOCNO}','${Filelist.BDA_BZSEQNO}');" class="down_btn" style="margin-left:30px;">다운로드</a></td>
										</tr>
									</c:otherwise>
								</c:choose>
								</c:forEach>
						   </tbody>
						</table>
						<!-- 댓글 -->
						<div class="comment_box"  id = "commentInfo">
							<input type="hidden" id="page" name="page" value="${page}" />
							<c:forEach var="Commentlist" items="${Commentlist}" varStatus="st">
							<ul	class="comment_list">
								<li id = "li_tag${st.count}">
									<span class="comment_name">${Commentlist.CMN_MAK_NAME}(${Commentlist.TEAMNO})</span>
									<span class="comment_time">${Commentlist.CMN_MAK_DATE}</span>
									<c:if test="${USER_ID == Commentlist.CMN_MAK_ID}">
									<a id = "a_update${st.count}" href="javascript:update('${st.count}');" class="co_cha_btn" data-val='${Commentlist.BBC_SEQ}'>수정</a><a id = "a_del${st.count}" href="javascript:delComment('${DOCNO}','${Commentlist.BBC_SEQ}');" class="co_del_btn">삭제</a>
									</c:if>
									<p id = "p_tag${st.count}">${Commentlist.BBC_CTNT}</p>							
								</li>	
							</ul>
							</c:forEach>
							<div class="comment_write">
								<span style="font-weight:bold;">${USER_NAME}</span>
								<p>
									<textarea rows="5" name="comment_cmnt" id="comment_cmnt" style="width:100%; border: 0; resize: none; padding:10px 5px; font-size:13px; color:#555; line-height:20px; text-align:left;"></textarea>
								</p>
								<a href="javascript:insComment('${DOCNO}');" class="co_save_btn">저장</a>
							</div>
							<!-- pagination -->
							<div class="pagination">
								<a href="javascript:search_index(1);" class="page first"></a>
								<a href="javascript:search_index(${page-1});" class="page prev"></a>
								<c:forEach var="x" begin="${BizFirstPage}" end="${BizLastPage}" step="1">
									<c:if test="${x == page}">
										<a href="#" class="on">${x}</a>
									</c:if>
									<c:if test="${x != page}">
										<a href="javascript:search_index(${x},'${DOCNO}');">${x}</a>
									</c:if>
								</c:forEach> 
								<a href="javascript:search_index(${page+1});" class="page next"></a>
								<a href="javascript:search_index(${BizTotalPage});" class="page last"></a>
							</div>
							<!-- //pagination -->
						</div>
					</div>
				</form>
				</div>
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
