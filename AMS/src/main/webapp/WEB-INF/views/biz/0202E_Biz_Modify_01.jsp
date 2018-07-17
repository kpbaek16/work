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
if(msg != null && msg != ""){
	alert(msg);
}
$(document).ready(function(){
	function readURL(input) {
		if (input.files && input.files[0]) {
            var FileSize = input.files[0].size; //파일용량
            var MaxFileSize = 1024 * 3072; //제한용량
            if(FileSize > MaxFileSize){
            	return false;
            }
            else{
            	return true;
            }
        }
    }
	//file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
	$("#biz_file1").change(function(){
		var input_value = this.value.replace("C:\\fakepath\\", "");
		$("#filePath1").val(input_value);
		if(this.value != ''){
			if(!readURL(this)){
				alert("제한용량을 초과하였습니다.");
				this.value = '';
				$("#filePath1").val('');
			}
		}
	});
	$("#biz_file2").change(function(){
		var input_value = this.value.replace("C:\\fakepath\\", "");
		$("#filePath2").val(input_value);
		if(this.value != ''){
			if(!readURL(this)){
				alert("제한용량을 초과하였습니다.");
				this.value = '';
				$("#filePath2").val('');
			}
		}
	});
	$("#biz_file3").change(function(){
		var input_value = this.value.replace("C:\\fakepath\\", "");
		$("#filePath3").val(input_value);
		if(this.value != ''){
			if(!readURL(this)){
				alert("제한용량을 초과하였습니다.");
				this.value = '';
				$("#filePath3").val('');
			}
		}
	});
});
function fn_biz_update(){
	var form = document.biz_updateFrom;
	form.action="/biz/0202/updateBiz_action.do";
	form.submit();
}	
function deleteFile(SEQ) {
	if(!confirm("삭제 하시겠습니까?")){
		return;
	}
	var DOCNO = document.getElementById('DOCNO').value;
	var BBSTYPE = document.getElementById('BBSTYPE').value;
	var sendData = "DOCNO=" + DOCNO + "&BBSTYPE=" + BBSTYPE + "&SEQ=" + SEQ;
	$.ajax({
		type : "POST",
		url : "/biz/0202/deleteFileInfo.do",
		data : sendData,
		success : function(data) {
			if (data == "false") {
				alert("파일 삭제에 실패하였습니다.");
			} else if (data == "true") {
				if(SEQ == "1"){
					$("#filePath1").val('');
					$("#label_file1").attr('style',"display:");
					$("#biz_file1").attr('style',"display:");
					$("#file_del1").attr('style',"display: none");
				} else if(SEQ == "2"){
					$("#filePath2").val('');
					$("#label_file2").attr('style',"display:");
					$("#biz_file2").attr('style',"display:");
					$("#file_del2").attr('style',"display: none");
				} else if(SEQ == "3"){
					$("#filePath3").val('');
					$("#label_file3").attr('style',"display:");
					$("#biz_file3").attr('style',"display:");
					$("#file_del3").attr('style',"display: none");
				}
			}
		}
	});
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
				<form method="POST" name="biz_updateFrom" id="biz_updateFrom" enctype="multipart/form-data" >
				<input type="hidden" id="BBSTYPE" name="BBSTYPE" value="${BBSTYPE}" />
				<input type="hidden" id="DOCNO" name="DOCNO" value="${DOCNO}" />
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
									<td>
										<div class="select_box">			
											<select name="select_Kind" id="select_Kind">
											<c:forEach var="KindList" items="${KindList}" varStatus="st">
												<c:choose>
													<c:when test="${BizInfo.BBI_MANUALTYPE_CODE == KindList.MCC_S_CODE}">
														<option value="${KindList.MCC_S_CODE}" selected="selected">${KindList.MCC_S_NAME}</option>
													</c:when>
													<c:otherwise>
														<option value="${KindList.MCC_S_CODE}">${KindList.MCC_S_NAME}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											</select>
										</div>
									</td>
									<th scope="row">게시여부</th>
									<td>
										<c:choose>
										<c:when test="${BizInfo.OPEN_CODE == 'Y'}">
											<input type="checkbox" name="OPENYN" id="OPENYN" value="Y" checked="checked"/>게시여부
										</c:when>
										<c:otherwise>
											<input type="checkbox" name="OPENYN" id="OPENYN" value="Y"/>게시여부
										</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr>
									<th scope="row">제목</th>
									<td colspan="3"><input name="Biz_title" id="Biz_title" type="text" class="textfield" style="width:96%" value="${BizInfo.BBI_TIT}"/><label for="table_text1"></label></td>
								</tr>
								<tr style="height:450px;">
									<td colspan="4">
										<textarea rows="20" id="Biz_cmnt" name="Biz_cmnt" style="width:98%; border: 0; resize: none; padding:10px 5px; font-size:13px; color:#555; line-height:20px; text-align:left;">${BizInfo.BBI_CTNT}</textarea>
									</td>
								</tr>
								<tr>
									<th rowspan="3" scope="row" style="vertical-align:middle;">파일</th>
									<td colspan="3" class="filebox">
										<input type="text" id="filePath1" name="filePath1" class="upload-name"  value="${fileNAME1}" disabled="disabled" style="width:40%;">
										<c:choose>
											<c:when test="${not empty fileNAME1}">
												<label id="label_file1" for="biz_file1" style="display: none;">첨부하기</label> 
												<input type="file" id="biz_file1" name="biz_file1" class="upload-hidden" style="display: none;">
												<a id="file_del1" href="javascript:deleteFile('${fileSEQ1}');" class="btn_search">삭제하기</a>
											</c:when>
											<c:otherwise>
												<label id="label_file1" for="biz_file1">첨부하기</label> 
												<input type="file" id="biz_file1" name="biz_file1" class="upload-hidden">
												<a id="file_del1" href="javascript:deleteFile('${fileSEQ1}');" class="btn_search" style="display: none;">삭제하기</a>
											</c:otherwise>
										</c:choose>
										(최대 3M 까지 업로드가능)
									</td>
								</tr>
								<tr>
									<td colspan="3" class="filebox">
										<input type="text" id="filePath2" name="filePath2" class="upload-name" value="${fileNAME2}" disabled="disabled" style="width:40%;">
										<c:choose>
											<c:when test="${not empty fileNAME2}">
												<label id="label_file2" for="biz_file2" style="display: none;">첨부하기</label> 
												<input type="file" id="biz_file2" name="biz_file2" class="upload-hidden" style="display: none;">
												<a id="file_del2" href="javascript:deleteFile('${fileSEQ2}');" class="btn_search">삭제하기</a>
											</c:when>
											<c:otherwise>
												<label id="label_file2" for="biz_file2">첨부하기</label> 
												<input type="file" id="biz_file2" name="biz_file2" class="upload-hidden">
												<a id="file_del2" href="javascript:deleteFile('${fileSEQ2}');" class="btn_search" style="display: none;">삭제하기</a>
											</c:otherwise>
										</c:choose>
										(최대 3M 까지 업로드가능)
									</td>
								</tr>
								<tr>
									<td colspan="3" class="filebox">
										<input type="text" id="filePath3" name="filePath3" class="upload-name" value="${fileNAME3}" disabled="disabled" style="width:40%;">
										<c:choose>
											<c:when test="${not empty fileNAME3}">
												<label id="label_file3" for="biz_file3" style="display: none;">첨부하기</label> 
												<input type="file" id="biz_file3" name="biz_file3" class="upload-hidden" style="display: none;">
												<a id="file_del3" href="javascript:deleteFile('${fileSEQ3}');" class="btn_search">삭제하기</a>
											</c:when>
											<c:otherwise>
												<label id="label_file3" for="biz_file3">첨부하기</label> 
												<input type="file" id="biz_file3" name="biz_file3" class="upload-hidden">
												<a id="file_del3" href="javascript:deleteFile('${fileSEQ3}');" class="btn_search" style="display: none;">삭제하기</a>
											</c:otherwise>
										</c:choose>
										(최대 3M 까지 업로드가능)
									</td>
								</tr>
						   </tbody>
						</table>
					</div>
					<!-- //직원게시판글쓰기페이지 -->
					<div class="btn_area_bottom">
						<a href="javascript:fn_biz_update();" class="save2_btn">저장</a>
						<c:choose>
							<c:when test="${BBSTYPE == '1'}">
								<a href="/biz/0202/main_Manual.do" class="list_btn">취소</a>
							</c:when>
							<c:otherwise>
								<a href="/biz/0202/main_Article.do" class="list_btn">취소</a>
							</c:otherwise>
						</c:choose>
						
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
