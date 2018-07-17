<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<script src="/js/html5shiv.js"></script>
<link rel="stylesheet" href="/css/ui/reset.css">
<link rel="stylesheet" href="/css/ui/sub_layout.css">
<link rel="stylesheet" href="/css/base/contents.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> <!-- 달력 css-->
<script src="/js/jquery-1.7.2.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  <!-- 달력 스크립트-->
<script type="text/javascript" src="/js/contents/base.js"></script>
<script type="text/javascript" src="/js/contents/cal.js"></script>
<script src="/js/common/common.js"></script> 
<script src="/js/common/json2.js"></script>

<script type="text/javascript">

function selectBurnReptList(result){
 	if(result!=null){
		console.log("selectburnReptList:" + JSON.stringify(result));
		$("#burn_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("burn_tbody");
			
			var iRow = (i+1);
			$("#burn_tbody div#BORN_INDEX_DIV").eq(iRow).html(iRow); 
			$("#burn_tbody div#BBR_DOCNO_DIV").eq(iRow).html(data.BBR_DOCNO);
			$("#burn_tbody div#BBR_DOCNO_DIV").eq(iRow).attr('data-val', data.BBR_DOCNO); 
			$("#burn_tbody div#BBR_BSDATE_DIV").eq(iRow).html(data.BBR_BSDATE);
			$("#burn_tbody div#BBR_ANINAME_DIV").eq(iRow).html(data.BBR_ANINAME);
			$("#burn_tbody div#MVI_VVRMNAME_DIV").eq(iRow).html(data.MVI_VVRMNAME);
			$("#burn_tbody div#BBR_CNT_DIV").eq(iRow).html(data.BBR_MALECNT +" / " + data.BBR_FEMALECNT); 
			$("#burn_tbody div#PROCSTS_DIV").eq(iRow).html(data.PROCSTS);
			$("#burn_tbody div#BBR_DOCNO_DIV_C").eq(iRow).attr('data-val', data.BBR_DOCNO); 
		}
		$("#burn_tbody tr:first").attr('style',"display:none");
 	}
 	if(result == 0){
 		alert('조회된 결과가 없습니다.');
 		document.getElementById('schAname').value = "";
 		$("#selbox").val(0);
 		return;
 	}
}

function fn_jour_selectburnReptList(param, callback, retObj) {
	fc_clearRow("burn_tbody");
	var targetUrl = "/jour/0303/selectBurnReptList.do";
	$.getJSON(targetUrl, param, function(result) {
//		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

function fn_burn_view0303E(BBR_DOCNO){
	var targetUrl = "/jour/0303/view0303E.do";
	location.href = targetUrl + "?docno=" +BBR_DOCNO;
}	

function fn_sign_view0701E(BBR_DOCNO){
	var targetUrl = "/sign/0701/CONN_insSIGN.do";
	location.href = targetUrl + "?DOCTYPE=1&DOCNO=" +BBR_DOCNO;
}	

function fn_base_search(){
	var param = {
			cal_1 : $("#sch_tbody #cal_1").val(),
			cal_2 : $("#sch_tbody #cal_2").val(),
			schAname:$("#sch_tbody #schAname").val(),
			selbox : $("#sch_tbody #selbox").val()
	};
	console.log(param);
	fn_jour_selectburnReptList(param, selectBurnReptList);
}


$(document).ready(function() {
	if(fn_is_pms_upd(0303)){
		$(".info_add_btn").css("display","");
		$(".copy_btn").css("display","");
	}
});
</script>

<%-- 마우스 오버시 커서 활성화 --%>
<style>
#BBR_DOCNO_DIV {cursor: pointer;}
</style>


<title>동물사육 &gt; 번식보고서</title>
</head>
<body>
<div id="sub_wrap">
<jsp:include page="/header.do"></jsp:include>
	</div>
	<!-- //header -->
	<!-- container-->
	<div id="container">
		<div id="contents">
			<!-- left-->
			<div id="lnb_area">
				<!-- mypage -->
				<jsp:include page="/lnb.do"></jsp:include>
				<!-- //lnb -->
			</div>
			<!-- //left-->
			<!-- right-->
			<section id="contents_area">
			<h2>본문내용</h2>
				<!-- contents_title-->
				<div class="title_area">
                    <p class="contents_title">번식보고서</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 동물사육</li>
                        <li>> 번식보고서</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 번식보고서조회 -->
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
									<td><p><input type="text" class="calendar1" id="cal_1" value="${calInfo.cal_1}" ><label for="cal_1"></label> ~  <input type="text" class="calendar2" id="cal_2" value="${calInfo.cal_2}"><label for="cal_2"></label></p></td>						
								</tr>
								 <tr><th scope="row">동물명</th><td>
								 <input name="schAname" type="text" id="schAname" class="textfield" style="width:90%"/><label for="schAname"></label></td></tr>
								 <tr>
									<th scope="row">동물사명</th>
									<td>
										<div class="select_box">			
											<select name="selbox" id="selbox">
											<option value="">-- 동물사 선택 --</option>
										<c:forEach var="vvrmList" items="${vvrmList }" varStatus="st" >
											<option value="${vvrmList.MVI_VVRMNO}">${vvrmList.MVI_VVRMNAME }</option>
											</c:forEach>
											</select>
										</div>
									</td>
								</tr>
									<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_base_search();" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					<!-- //번식보고서조회 -->
					
					<!-- 번식보고서표 -->
					<div class="aniinfo_add_box">			
					<p><a href="b_report_write.do" class="info_add_btn" style="display: none;">추가</a></p>		
						<table class="aniinfo_add" >
						<caption>번식보고서</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:15%;">
								<col style="width:17%;">
								<col style="width:20%;">
								<col style="width:15%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:8%;">
								<!-- <col style="width:10%;"> -->
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">No</th>
									<th scope="col" id="th02">문서번호</th>
									<th scope="col" id="th03">번식일자</th>
									<th scope="col" id="th04">동물명</th>
									<th scope="col" id="th05">동물사</th>
									<th scope="col" id="th06">동물수(수/암)</th>
									<th scope="col" id="th07">결재상태</th>
									<th scope="col" id="th06">결재</th>
									<!-- <th scope="col" id="th08">복사</th> -->
								</tr>
							</thead>
							<tbody id="burn_tbody">
								<tr style="display:none">
									<th scope="row" id="n01" headers="th01"><div id="BORN_INDEX_DIV" data-val=''></div></th>
									<td headers="n01 th07"><div id="BBR_DOCNO_DIV" data-val='' onclick="javascript:fn_burn_view0303E($(this).attr('data-val'));"></div></td>
									<td headers="n01 th03"><div id="BBR_BSDATE_DIV" data-val=''></div></td>
									<td headers="n01 th04"><div id="BBR_ANINAME_DIV" data-val=''></div></td>
									<td headers="n01 th05"><div id="MVI_VVRMNAME_DIV" data-val=''></div></td>
									<td headers="n01 th06"><div id="BBR_CNT_DIV" data-val=''></div></td>
									<td headers="n01 th07"><div id="PROCSTS_DIV" data-val=''></div></td>
									<td headers="n01 th06"><a href="javascript:;"><div id="BBR_DOCNO_DIV_C" data-val='' onclick="javascript:fn_sign_view0701E($(this).attr('data-val'));" class="copy_btn" style="display: none;">결재</div></a></td>
									<!-- <td headers="n01 th07"><a href="#"><div id="BBR_DOCNO_DIV_S" data-val='' onclick="javascript:fn_burn_view0303E($(this).attr('data-val'));" class="copy_btn">복사</div></a></td> -->
								</tr>
							</tbody>
						
						</table>
					</div>
					<!-- //번식보고서표 -->
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
	<jsp:include page="/footer.do"></jsp:include>
</body>
</html>
