<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">
<head>
<link rel="stylesheet" href="/css/ui/reset.css">
<link rel="stylesheet" href="/css/ui/sub_layout.css">
<link rel="stylesheet" href="/css/base/contents.css">
<link rel="stylesheet" href="/css/jquery/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> <!-- 달력 css-->
<script src="/js/jquery-1.7.2.min.js"></script>
<script src="/js/jquery/ui/1.8.18/jquery-ui.min.js"></script>  <!-- 달력 스크립트-->
<script type="text/javascript" src="/js/contents/base.js"></script>
<script type="text/javascript" src="/js/contents/cal.js"></script>
<script src="/js/common/common.js"></script> 
<script src="/js/common/json2.js"></script>
<script>
	function selectDayJnlList(result){
	 	if(result!=null){
			console.log("selectDayJnlList:" + JSON.stringify(result));
			$("#jnl_tbody tr:first").attr('style',"display:");
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("jnl_tbody");
				
				var iRow = (i+1);
				$("#jnl_tbody div#JNL_INDEX_DIV").eq(iRow).html(iRow); 
				$("#jnl_tbody div#DOC_NUMBER_DIV").eq(iRow).html(data.SDJ_DOCNO); 
				$("#jnl_tbody div#DOC_NUMBER_DIV").eq(iRow).attr('data-val', data.SDJ_DOCNO);
				$("#jnl_tbody div#DOC_NUMBER_DIV").eq(iRow).attr('data-val2',data.SDJ_VVRMNO);
				$("#jnl_tbody div#DOC_NUMBER_DIV").eq(iRow).attr('data-val3',data.SDJ_JNLDATE);
				$("#jnl_tbody div#SDJ_DOCNO_DIV").eq(iRow).attr('data-val', data.SDJ_DOCNO);
				$("#jnl_tbody div#SDJ_DOCNO_DIV").eq(iRow).attr('data-val2',data.SDJ_VVRMNO);
				$("#jnl_tbody div#SDJ_DOCNO_DIV").eq(iRow).attr('data-val3',data.SDJ_JNLDATE);
				$("#jnl_tbody div#SIGN_DOCNO_DIV").eq(iRow).attr('data-val', data.SDJ_DOCNO); 
				$("#jnl_tbody div#PROCSTS_DIV").eq(iRow).attr('data-val', data.BDC_PROCSTS); 
				$("#jnl_tbody div#JNLDATE_DIV").eq(iRow).html(data.JNLDATE); 
				$("#jnl_tbody div#MUI_NAME_DIV").eq(iRow).html(data.MUI_NAME); 
				$("#jnl_tbody div#VVRMNAME_DIV").eq(iRow).html(data.MVI_VVRMNAME); 
				$("#jnl_tbody div#PROCSTS_DIV").eq(iRow).html(data.PROCSTS); 
			}
			$("#jnl_tbody tr:first").attr('style',"display:none");
	 	}
	 	if(result == 0){
	 		alert('조회된 결과가 없습니다.');
	 		$("#vlist").val(0);
	 		return;
	 	}
	}
	function fn_jour_selectDayJnlList(param, callback, retObj) {

		fc_clearRow("jnl_tbody");

		var targetUrl = "/jour/0301/selectDayJnlList.do";
		$.getJSON(targetUrl, param, function(result) {
//			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}
	function fn_jour_search(){
		var param = {
				cal_1 : $("#sch_tbody #cal_1").val(),
				cal_2 : $("#sch_tbody #cal_2").val(),
				vlist : $("#sch_tbody #vlist").val()
		};
		console.log(param);
		fn_jour_selectDayJnlList(param, selectDayJnlList);
	}	

	function fn_jour_view0301E(sdj_docno, SDJ_VVRMNO, SDJ_JNLDATE){
		var form = document.sch_form;
		var targetUrl = "/jour/0301/view0301E.do";
		form.action = targetUrl + "?docno=" +sdj_docno +"&vvrmno=" + SDJ_VVRMNO +"&date=" + SDJ_JNLDATE;
		form.submit();
	}	
	
	function fn_jour_view0301C(sdj_docno, SDJ_VVRMNO, SDJ_JNLDATE, c){
		var form = document.sch_form;
		var targetUrl = "/jour/0301/view0301E.do";
		form.action = targetUrl + "?docno=" +sdj_docno +"&vvrmno=" + SDJ_VVRMNO +"&date=" + SDJ_JNLDATE + "&c=" + c;
		form.submit();
	}
	
	function fn_jour_AddDoc(){
		var form = document.sch_form;
		var targetUrl = "/jour/0301/view0301E.do";
		form.action =targetUrl + "?docno=" + "&vvrmno=" +"&date=";
		form.submit();
	}
	
	function fn_sign_view0701E(sdj_docno){
		var targetUrl = "/sign/0701/insSIGN.do";
		location.href = targetUrl + "?DOCTYPE=1&DOCNO=" +sdj_docno;
	}	
	$(document).ready(function() {
		if(fn_is_pms_upd(0301)){
			$(".info_add_btn").css("display","");
			$(".save_btn").css("display","");
			$(".excel_btn").css("display","");
			
		}/* else if(fn_is_vm() == true){
			$(".info_add_btn").css("display","");
		} */
	});
</script>

<%-- 마우스 오버시 커서 활성화 --%>
<style>
#DOC_NUMBER_DIV {cursor: pointer;}
</style>

<title>동물사육 &gt; 사육일지</title>
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
                    <p class="contents_title">사육일지</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 동물사육</li>
                        <li>> 사육일지</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
				<form method="POST" name="sch_form" id="sch_form">
					<!-- 사육일지 조회 -->
					<div class="aniinfo_search_box">
                        <table class="aniinfo_search" >
							<caption>번식보고서 조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody id="sch_tbody">
								<tr>
									<th scope="row">일자</th>
									<td><p><input type="text" class="calendar1" id="cal_1" value="${calInfo.cal_1}"><label for="cal_1"></label> ~ <input type="text" class="calendar1" id="cal_2" value="${calInfo.cal_2}"><label for="cal_2"></label></p></td>
								</tr>
								<tr>
									<th scope="row">동물사</th>
									<td>
									<select id="vlist" name="vlist">
									<option value="">-- 동물사 선택 --</option>
										<c:forEach var="vvrmList" items="${vvrmList }" varStatus="st">
											<option value="${vvrmList.MVI_VVRMNO}">${vvrmList.MVI_VVRMNAME }</option>
											</c:forEach>
									</select>
									</td>
								</tr>
								<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_jour_search();" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					<!-- //사육일지 조회 -->

					<!-- 사육일지 표 -->
					<div class="aniinfo_add_box">
						<p>
						<a href="javascript:fn_jour_AddDoc();" class="info_add_btn" style="display: none;">추가</a>
						</p>						
						<table class="aniinfo_add" >
						<caption>사육일지</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:15%;">
								<col style="width:12%;">
								<col style="width:15%;">
								<col style="width:20%;">
								<col style="width:15%;">
								<col style="width:10%;">
								<col style="width:10%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">No</th>
									<th scope="col" id="th02">문서번호</th>
									<th scope="col" id="th03">일자</th>
									<th scope="col" id="th04">작성자</th>
									<th scope="col" id="th05">동물사</th>
									<th scope="col" id="th06">결재상태</th>
									<th scope="col" id="th07">결재</th>
									<th scope="col" id="th08">복사</th>
								</tr>
							</thead>
							<tbody id="jnl_tbody">
								<tr style="display:none">
									<th scope="row" id="n01" headers="th01">
									<div id="JNL_INDEX_DIV" data-val=''></div></th>
									<td><div id="DOC_NUMBER_DIV" data-val='' onclick="javascript:fn_jour_view0301E($(this).attr('data-val'),$(this).attr('data-val2'),$(this).attr('data-val3'));"></div></td>
									<td><div id="JNLDATE_DIV" data-val=''></div></td>									
									<td><div id="MUI_NAME_DIV" data-val=''></div></td>
									<td><div id="VVRMNAME_DIV" data-val=''></div></td>
									<td><div id="PROCSTS_DIV" data-val=''></div></td>
									<td><a href="javascript:;">
									<div id="SIGN_DOCNO_DIV" data-val='' onclick="javascript:fn_sign_view0701E($(this).attr('data-val'));" class="del2_btn">결재</div></a></td>
									<td><a href="javascript:;">
									<div id="SDJ_DOCNO_DIV" data-val='' onclick="javascript:fn_jour_view0301C($(this).attr('data-val'),$(this).attr('data-val2'),$(this).attr('data-val3'));" class="copy_btn">복사</div></a></td>
								</tr>
							</tbody>
						
						</table>
						
					</div>
					</form>
					<!-- //사육일지 표 -->
					
					<!-- pagination -->
					<div class="pagination">
						<a href="#" class="page first"></a>
						<a href="#" class="page prev"></a>
						<a href="#" class="on">1</a>
						<a href="#">2</a>
						<a href="#">3</a>
						<a href="#">4</a>
						<a href="#">5</a>
						<!--
						<a href="#">6</a>
						<a href="#">7</a>
						<a href="#">8</a>
						<a href="#">9</a>
						<a href="#">10</a>
						-->
						<a href="#" class="page next"></a>
						<a href="#" class="page last"></a>
					</div>
					<!-- //pagination -->		
									
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