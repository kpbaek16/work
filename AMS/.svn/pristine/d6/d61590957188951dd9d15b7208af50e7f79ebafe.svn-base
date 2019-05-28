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
<script src="/js/common/json2.js"></script>
<script src="/js/common/common.js"></script>

<title>전자결재 &gt; 문서관리</title>
</head>

<script type="text/javascript">
	function updateKJP(page,type) {
		var sendData = "page=" + page + "&type=" + type;
		$.ajax({
			type : "POST",
			data : sendData,
			url : "/sign/0701/updateKJP.do",
			success : function(html) {
				if(type == 'RCV'){
					$("#RCV_div").empty();
					$("#RCV_div").append(html);
				}
				else{
					$("#NOTI_div").empty();
					$("#NOTI_div").append(html);
				}
			},
			error : function(xmlHttpObj) {
				alert(xmlHttpObj.responseText + '오류가 발생하였습니다.');
			}
		});
	}
	function fn_sign_KJP(SIGN_page){
		var form = document.signFrom;
		document.getElementById('page').value = SIGN_page;
		form.action="/sign/0701/SIGN_INFO.do";
		form.submit();
	}	
	function fn_sign_Insert(PROCSTS){
		var rowCount = $('#KJP_TABLE').rowCount();
		if(rowCount == 0){
			alert('결재선을 추가해주세요.');
			return;
		}
		else{
			var cnt = 0;
			$('#KJP_TABLE > tbody > tr').each(function() {
				var kind = $(this).find("td").eq(0).text();   
				kind = $.trim(kind);
				if(kind == '수신'){
					cnt++;
				}
			});
			if(cnt == 0){
				alert('수신자를 추가해주세요.');
				return;
			}
		}
		var form = document.signFrom;
		document.getElementById('PROCSTS').value = PROCSTS;
		form.action="/sign/0701/insSIGN_action.do";
		form.submit();
	}	
	function fn_sign_Modify(PROCSTS){
		var rowCount = $('#KJP_TABLE').rowCount();
		if(rowCount == 0){
			alert('결재선을 추가해주세요.');
			return;
		}
		else{
			var cnt = 0;
			$('#KJP_TABLE > tbody > tr').each(function() {
				var kind = $(this).find("td").eq(0).text();   
				kind = $.trim(kind);
				if(kind == '수신'){
					cnt++;
				}
			});
			if(cnt == 0){
				alert('수신자를 추가해주세요.');
				return;
			}
		}
		var form = document.signFrom;
		document.getElementById('PROCSTS').value = PROCSTS;
		form.action="/sign/0701/modifySIGN_action.do";
		form.submit();
	}	
	function search_index(page,type,totalpage)
	{
		if( page < 1 )
			page = 1;
		if( page > totalpage )
			page = totalpage;
		updateKJP(page,type);
	}
	function USER_search_index(page,totalpage)
	{
		if( page < 1 )
			page = 1;
		if( page > totalpage )
			page = totalpage;
		search_USER(page);
	}
	function search_USER(page){
		var type = document.getElementById('KJPTYPE').value;
		var seqTYPE = $(':radio[name="search_TYPE"]:checked').val();
		var txt_Search = document.getElementById('txt_SearchUSER').value;
		var sendData = "search_TYPE=" + seqTYPE + "&txt_SearchUSER=" + txt_Search + "&page=" + page + "&type=" + type;
		$.ajax({
			type : "POST",
			data : sendData,
			url : "/sign/0701/searchUSER.do",
			success : function(html) {
				$("#user_DIV").empty();
				$("#user_DIV").append(html);
			},
			error : function(xmlHttpObj) {
				alert(xmlHttpObj.responseText + '오류가 발생하였습니다.');
			}
		});
	}
	function pop_User(type){
		document.getElementById('KJPTYPE').value = type;
		//해당 레이어(ID) 노출
		$(".layer_popup").show();
		$("#layer02").show(); 
		// layer_popup(화면 중앙정렬)
		var width_size = $(".layer_box").innerWidth()/2;
		$(".layer_box").css("margin-left",-width_size);
		$("body").css("overflow-y","hidden");
		search_USER('1');
	}
	function pop_UserClose(){
		$("#layer02").hide();
		$("body").css("overflow-y","auto");
	}
	function pop_KJPClose(){
		$(".layer_box").hide();
		$(".layer_popup").hide();
		$("body").css("overflow-y","auto");
		KJPList();
	}
	function AddUser(KJPID, id){
		document.getElementById(id).style.display = 'none';
		var kjptype = document.getElementById('KJPTYPE').value;
		var sendData = "KJPID=" + KJPID + "&KJPTYPE=" + kjptype;
		$.ajax({
			type : "POST",
			data : sendData,
			url : "/sign/0701/AddUser.do",
			success : function(data) {
				if(data == ''){
					updateKJP('1',kjptype);
				}
				else{
					alert(data);
				}
			}
		});
	}
	function DelUser(KJPID, type){
		var sendData = "KJPID=" + KJPID + "&KJPTYPE=" + type;
		$.ajax({
			type : "POST",
			data : sendData,
			url : "/sign/0701/DelUser.do",
			success : function(data) {
				if(data == ''){
					updateKJP('1',type);
				}
				else{
					alert(data);
				}
			}
		});
	}
	function KJPList(){
		$.ajax({
			type : "POST",
			url : "/sign/0701/KJPList.do",
			success : function(html) {
				$("#KJP_DIV").empty();
				$("#KJP_DIV").append(html);
			}
		});
	}
	function fn_MSG(){
		var msg = document.getElementById('msg').value;
		if (msg != null && msg != "") {
			alert(msg);
		}
		document.getElementById('msg').value = "";
	}
	$.fn.rowCount = function() {
	    return $('tr', $(this).find('tbody')).length;
	};
	
	$(document).ready(function() {
		fn_MSG();
	}); 
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
                    <p class="contents_title">문서관리</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 전자결재</li>
                        <li>> 문서관리</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<form method="POST" name="signFrom" id="signFrom">
					<input type="hidden" id="msg" name="msg" value="${msg}" />
					<input type="hidden" id="DOCNO" name="DOCNO" value="${DOCNO}" />
					<input type="hidden" id="DOCTYPE" name="DOCTYPE" value="${DOCTYPE}" />
					<input type="hidden" id="PROCSTS" name="PROCSTS" value="" />
					<input type="hidden" id="KJPTYPE" name="KJPTYPE" value="${KJPTYPE}" />
					<input type="hidden" id="INSTYPE" name="INSTYPE" value="${INSTYPE}" />
					<input type="hidden" id="KJPTYPE" name="KJNO" value="${KJNO}" />
					<div class="aniinfo_add_box" style="margin-top:0px;">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus"><img src="/images/btn_minus.gif" alt=""></a>결재</span>
							<div class="sys_btn_box">
								<span class="align_right btn_hide"><a href="#layer01" class="cha_btn layer_open">수정</a></span>
							</div>
						</div>
						<div id="KJP_DIV">
						<table id="KJP_TABLE" class="aniinfo_add table_view" >
							<caption>결재</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:15%;">
								<col style="width:20%;">
								<col style="width:15%;">
								<col style="width:15%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">No</th>
									<th scope="col" id="th02">구분</th>
									<th scope="col" id="th03">순서</th>
									<th scope="col" id="th04">이름</th>
									<th scope="col" id="th05">부서</th>
									<th scope="col" id="th06">직책</th>
									<th scope="col" id="th07">결재</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="KJP_LIST" items="${KJP_LIST}" varStatus="st">
									<tr>
										<th scope="row" id="n01" headers="th01">${KJP_LIST.SEQ}</th>
										<td headers="n01 th02">
											<c:if test="${KJP_LIST.T_DT == 'RCV'}">
												수신
											</c:if>
											<c:if test="${KJP_LIST.T_DT == 'NOTI'}">
												참조
											</c:if>
										</td>
										<td headers="n01 th03">${KJP_LIST.T_DT1}</td>
										<td headers="n01 th04">${KJP_LIST.T_DT2}</td>
										<td headers="n01 th05">${KJP_LIST.T_DT6}</td>
										<td headers="n01 th06">${KJP_LIST.T_DT8}</td>
										<td headers="n01 th07"></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						</div>
					</div>
					<!-- 문서정보 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus2"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus2"><img src="/images/btn_minus.gif" alt=""></a>문서정보</span>
						</div>
						<table class="aniinfo_search table_view2" >
							<caption>문서정보</caption>
							<colgroup>
								<col style="width:30%;">
								<col style="width:70%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">제목</th>
									<td>
										<input name="DOCCMNT" type="text" id="DOCCMNT" class="textfield" value="${DOCCMNT}"/>
										<label for="DOCCMNT"></label>
									</td>
								</tr>
								<tr>
									<th scope="row">작성자</th>
									<td>${UserInfo.MUI_NAME}(${UserInfo.MDI_DPTNAME} - ${UserInfo.MTI_TEAMNAME})</td>
								</tr>
								<tr>
									<th scope="row">문서종류</th><td>${DOCTYPE_VAL}</td>				
								</tr>
								<tr>
									<th scope="row">문서번호</th><td>${DOCNO}</td>				
								</tr>
						   </tbody>
						</table>
					</div>
					<!-- //문서정보 -->
					<div class="table_title_box" style= "margin-top: 20px;">
						<div class="sys_btn_box">
							<c:choose>
								<c:when test="${INSTYPE == 'M'}">
									<a href="javascript:fn_sign_Modify('1');" class="cancel_btn" style="width: 80px;border:solid 1px #397516;background:#4d9721;color:#fff !important;">수정</a>
									<a href="javascript:fn_sign_Modify('3');" class="save_btn" style="width: 80px;margin-left:10px">상신</a>
								</c:when>
								<c:otherwise>
									<a href="javascript:fn_sign_Insert('1');" class="cancel_btn" style="width: 80px;border:solid 1px #397516;background:#4d9721;color:#fff !important;">임시등록</a>
									<a href="javascript:fn_sign_Insert('3');" class="save_btn" style="width: 80px;margin-left:10px">상신</a>
								</c:otherwise>
							</c:choose>
							<a href="/sign/0701/SIGN_INFO.do" class="cancel_btn" style="width: 80px">목록</a>
						</div>
					</div>

					</form>
					</div>
				<!-- //contents-->
			</section>
			<!-- //right-->
		</div>
	<!-- //container -->
	<!-- footer -->
	<jsp:include page="/footer.do"></jsp:include>
	<!-- //footer -->
						<!-- // search_area -->
	<div class="layer_popup">
		<div class="layer_box" id="layer01" style="width:800px;overflow-y:scroll;height:600px;">
			<div class="layer_tit">결재 정보</div>
			<div class="layer_con">			
				<div id='RCV_div'>		
				<div class="table_box">
					<p class="sub_title" style="margin-bottom:10px;">수신<a href="javascript:pop_User('RCV');" class="table_add_btn" style="margin-top:-5px; text-indent:0;">추가</a></p>
					<table class="aniinfo_add" style="width:760px;" >
						<caption>결재정보 수신</caption>
						<colgroup>
							<col style="width:10%;">
							<col style="width:15%;">
							<col style="width:25%;">
							<col style="width:20%;">
							<col style="width:15%;">
							<col style="width:15%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col" id="th01_1">No</th>
								<th scope="col" id="th02_1">이름</th>
								<th scope="col" id="th03_1">팀</th>
								<th scope="col" id="th04_1">부서</th>
								<th scope="col" id="th05_1">직책</th>
								<th scope="col" id="th06_1">선택</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="KJP_RCVLIST" items="${KJP_RCVLIST}" varStatus="st">
								<tr>
									<th scope="row" id="n01" headers="th01">${KJP_RCVLIST.SEQ}</th>
									<td headers="n01 th03">${KJP_RCVLIST.T_DT2}</td>
									<td headers="n01 th04">${KJP_RCVLIST.T_DT4}</td>
									<td headers="n01 th05">${KJP_RCVLIST.T_DT6}</td>
									<td headers="n01 th06">${KJP_RCVLIST.T_DT8}</td>
									<td headers="n01 th07"><a href="javascript:DelUser('${KJP_RCVLIST.T_K2}','RCV');" class="del2_btn">삭제</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- pagination -->
				<div class="pagination">
					<a href="javascript:search_index(${RCVpage},'RCV',${RCVTotalPage});" class="page first"></a>
					<a href="javascript:search_index(${RCVpage-1},'RCV',${RCVTotalPage});" class="page prev"></a>
					<c:forEach var="x" begin="${RCVFirstPage}" end="${RCVLastPage}" step="1">
						<c:if test="${x == RCVpage}">
							<a href="#" class="on">${x}</a>
						</c:if>
						<c:if test="${x != RCVpage}">
							<a href="javascript:search_index(${x},'RCV',${RCVTotalPage});">${x}</a>
						</c:if>
					</c:forEach> 
					<a href="javascript:search_index(${RCVpage+1},'RCV',${RCVTotalPage});" class="page next"></a>
					<a href="javascript:search_index(${RCVTotalPage},'RCV',${RCVTotalPage});" class="page last"></a>
				</div>
				</div>
				<div id='NOTI_div'>
				<!-- //pagination -->
				<div class="table_box"  style="margin-top:20px;">
					<p class="sub_title" style="margin-bottom:10px;">참조<a href="javascript:pop_User('NOTI');" class="table_add_btn" style="margin-top:-5px; text-indent:0;">추가</a></p>
					<table class="aniinfo_add" style="width:760px;" >
						<caption>결재 정보 참조</caption>
						<colgroup>
							<col style="width:10%;">
							<col style="width:15%;">
							<col style="width:25%;">
							<col style="width:20%;">
							<col style="width:15%;">
							<col style="width:15%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col" id="th01_2">No</th>
								<th scope="col" id="th02_2">이름</th>
								<th scope="col" id="th03_2">부서</th>
								<th scope="col" id="th04_2">팀</th>
								<th scope="col" id="th05_2">직책</th>
								<th scope="col" id="th06_2">선택</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="KJP_NOTILIST" items="${KJP_NOTILIST}" varStatus="st">
								<tr>
									<th scope="row" id="n01" headers="th01">${KJP_NOTILIST.SEQ}</th>
									<td headers="n01 th03">${KJP_NOTILIST.T_DT2}</td>
									<td headers="n01 th04">${KJP_NOTILIST.T_DT4}</td>
									<td headers="n01 th05">${KJP_NOTILIST.T_DT6}</td>
									<td headers="n01 th06">${KJP_NOTILIST.T_DT8}</td>
									<td headers="n01 th07"><a href="javascript:DelUser('${KJP_NOTILIST.T_K2}','NOTI');" class="del2_btn">삭제</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- pagination -->
				<div class="pagination">
					<a href="javascript:search_index(${NOTIpage},'NOTI',${NOTITotalPage});" class="page first"></a>
					<a href="javascript:search_index(${NOTIpage-1},'NOTI',${NOTITotalPage});" class="page prev"></a>
					<c:forEach var="x" begin="${NOTIFirstPage}" end="${NOTILastPage}" step="1">
						<c:if test="${x == NOTIpage}">
							<a href="#" class="on">${x}</a>
						</c:if>
						<c:if test="${x != NOTIpage}">
							<a href="javascript:search_index(${x},'NOTI',${NOTITotalPage});">${x}</a>
						</c:if>
					</c:forEach> 
					<a href="javascript:search_index(${NOTIpage+1},'NOTI',${NOTITotalPage});" class="page next"></a>
					<a href="javascript:search_index(${NOTITotalPage},'NOTI',${NOTITotalPage});" class="page last"></a>
				</div>
				</div>
				<!-- //pagination -->
				<div class="btn_area">
					<a href="javascript:pop_KJPClose();" class="popcancel_btn btn_type2">닫 기</a>
				</div>
			</div>
			<a href="javascript:pop_KJPClose();" style="position:absolute; right:0; top:0; width:50px; line-height:40px; text-indent:-9999px; background:url('/images/btn_layer_close.gif') no-repeat;">레이어팝업 닫기</a>
		</div>
		<!-- #layer02 -->
		<div class="layer_box" id="layer02" style="width:800px;overflow-y:scroll;height:600px;">
			<div class="layer_tit">직원목록</div>
				<div class="layer_con">
					<div class="search_box">
                        <table class="search_table" style="width:760px;" >
							<caption>직원목록</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody>
                            <tr>
                                <th scope="row">종류</th>
                                <td>
                                <p>
                                  <label><input type="radio" name="search_TYPE" value="USER" class="search_radio" checked="checked"/>이름</label>
                                  <label><input type="radio" name="search_TYPE" value="TEAM" class="search_radio"/>팀</label>
								  <label><input type="radio" name="search_TYPE" value="DEPT" class="search_radio"/>부서</label>
                                </p>
                                </td>
                            </tr>
                            <tr><th scope="row">검색</th><td><input name="txt_SearchUSER" id="txt_SearchUSER" type="text" id="txt_SearchUSER" class="textfield" style="width:90%"/><label for="txt_SearchUSER"></label></td></tr>
							<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:search_USER('1');" class="search_btn">조회</a></th></tr>
                            </tbody>
                        </table>
					</div>
					<div id ="user_DIV">
					<div class="table_box">
						<table class="aniinfo_add" style="width:760px; margin-top:20px;" >
							<caption>직원정보</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:15%;">
								<col style="width:25%;">
								<col style="width:20%;">
								<col style="width:15%;">
								<col style="width:15%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01_3">No</th>
									<th scope="col" id="th02_3">이름</th>
									<th scope="col" id="th03_3">부서</th>
									<th scope="col" id="th04_3">팀</th>
									<th scope="col" id="th05_3">직책</th>
									<th scope="col" id="th06_3">선택</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
					</div>
					<div class="btn_area">
						<a href="javascript:pop_UserClose();" class="popcancel_btn btn_type2">닫 기</a>
					</div>
				</div>
				<a href="javascript:pop_UserClose();" style="position:absolute; right:0; top:0; width:50px; line-height:40px; text-indent:-9999px; background:url('/images/btn_layer_close.gif') no-repeat;">레이어팝업 닫기</a>
		</div>		
	</div>
	</div>
</div>
</body>
</html>
