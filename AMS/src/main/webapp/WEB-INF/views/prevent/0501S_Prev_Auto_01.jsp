<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="/css/ui/reset.css">
<link rel="stylesheet" href="/css/ui/sub_layout.css">
<link rel="stylesheet" href="/css/base/contents.css">
<link rel="stylesheet" href="/css/jquery/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> <!-- 달력 css-->
<script src="/js/jquery-1.7.2.min.js"></script>
<script src="/js/jquery/ui/1.8.18/jquery-ui.min.js"></script>  <!-- 달력 스크립트-->
<script type="text/javascript" src="/js/contents/base.js"></script>
<script type="text/javascript" src="/js/contents/cal.js"></script>
<script src="/js/html5shiv.js"></script>
<script src="/js/common/common.js"></script> 
<script src="/js/common/json2.js"></script>

<script type="text/javascript">

function selectBukumlist(result){
 	if(result!=null){
		console.log("selectBukumlist:" + JSON.stringify(result));
		$("#bukum_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("bukum_tbody");
			
			var iRow = (i+1);
			$("#bukum_tbody div#PREVENT_INDEX_DIV").eq(iRow).html(iRow); 
			$("#bukum_tbody div#PREVENT_INDEX_DIV").eq(iRow).attr('data-val', data.PBR_DOCNO); 
			$("#bukum_tbody div#PBR_KSReqSts_DIV").eq(iRow).html(data.PBR_KSREQSTS); 
			$("#bukum_tbody div#PBR_KSReqSts_DIV").eq(iRow).attr('data-val', data.PBR_DOCNO); 
			$("#bukum_tbody div#PBR_REQDOCNO_DIV").eq(iRow).html(data.PBR_REQDOCNO); 
			$("#bukum_tbody div#PBR_REQDOCNO_DIV").eq(iRow).attr('data-val', data.PBR_DOCNO);
			$("#bukum_tbody div#PDR_PSDATE_DIV").eq(iRow).html(data.PDR_PSDATE); 
			$("#bukum_tbody div#PDR_PSDATE_DIV").eq(iRow).attr('data-val', data.PBR_DOCNO);
			$("#bukum_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
			$("#bukum_tbody div#MAC_NAME_DIV").eq(iRow).attr('data-val', data.PBR_DOCNO);	
			$("#bukum_tbody div#MAI_ANICODE_DIV").eq(iRow).html(data.MAI_ANICODE); 
			$("#bukum_tbody div#MAI_ANICODE_DIV").eq(iRow).attr('data-val', data.PBR_DOCNO);			
			$("#bukum_tbody div#MAI_GENDER_DIV").eq(iRow).html(data.MAI_GENDER); 
			$("#bukum_tbody div#MAI_GENDER_DIV").eq(iRow).attr('data-val', data.PBR_DOCNO);	
			$("#bukum_tbody div#MVI_VVRMNAME_DIV").eq(iRow).html(data.MVI_VVRMNAME); 
			$("#bukum_tbody div#MVI_VVRMNAME_DIV").eq(iRow).attr('data-val', data.PBR_DOCNO);	
			$("#bukum_tbody div#PBR_DOCNO_DIV_S").eq(iRow).attr('data-val', data.PBR_DOCNO); 
		}
		$("#bukum_tbody tr:first").attr('style',"display:none");
 	}
}

function fn_prevent_selectBukumlist(param, callback, retObj) {
	fc_clearRow("bukum_tbody");

	var targetUrl = "/prevent/0501/selectBukumlist.do";
	$.getJSON(targetUrl, param, function(result) {
//		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

function fn_prevent_search(){
	var param = {
			cal_1 : $("#sch_tbody #cal_1").val(),
			cal_2 : $("#sch_tbody #cal_2").val(),
			vvrmKeyword:$("#sch_tbody #vvrmKeyword").val(),
			nameKeyword:$("#sch_tbody #nameKeyword").val()
	};
	console.log(param);
	fn_prevent_selectBukumlist(param, selectBukumlist);
}	

function fn_prevent_view0501E(PBR_DOCNO){
	var targetUrl = "/prevent/0501/view0501E.do";
	location.href = targetUrl + "?docno=" +PBR_DOCNO;
}	

function fn_prevent_view0501F(PBR_DOCNO){
	var targetUrl = "/prevent/0501/view0501F.do";
	location.href = targetUrl + "?docno=" +PBR_DOCNO;
}	

$(document).ready(function() {
if(fn_is_pms_upd(0501)){
	$(".search_btn").css("display","");
	$(".cancel_btn").css("display","");
	$(".add_btn").css("display","");
}
});
</script>

<title>병리방역 &gt; 부검결과서</title>
</head>
<body>
<div id="sub_wrap">
	<!-- header -->
    <div id="header_wrap">
		<jsp:include page="/header.do"></jsp:include>
	</div>
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
                    <p class="contents_title">부검결과서</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 병리방역</li>
                        <li>> 부검결과서</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 부검결과서 조회 -->
					<div class="aniinfo_search_box">
                        <table class="aniinfo_search" >
							<caption>부검결과서 조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody id="sch_tbody">
								<tr>
									<th scope="row">폐사일자</th>
									<td><p><input type="text" class="calendar1" id="cal_1" value="${calInfo.cal_1}"><label for="cal_1"></label> ~  <input type="text" class="calendar2" id="cal_2" value="${calInfo.cal_2}"><label for="cal_2"></label></p></td>						
								</tr>
								<tr>
									<th scope="row">동물사</th>
									<td><input name="vvrmKeyword" type="text" id="vvrmKeyword" class="textfield"><label for="vvrmKeyword"></label></td>
								</tr>
								<tr>
									<th scope="row">동물명</th>
									<td><input name="nameKeyword" type="text" id="nameKeyword" class="textfield"><label for="nameKeyword"></label></td>
								</tr>
								<tr>
									<th scope="row">검사요청상태</th>
									<td>
										<p>
										<label><input type="radio" id="schType" name="schType" value="all" class="search_radio" checked="checked"/>전체</label>
										<label><input type="radio" id="schType" name="schType" value="request" class="search_radio"/>요청</label>
										<label><input type="radio" id="schType" name="schType" value="testing" class="search_radio"/>검사중</label>
										<label><input type="radio" id="schType" name="schType" value="finish" class="search_radio"/>완료</label>
										</p>
									</td>
								</tr>
								<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_prevent_search();" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					<!-- //부검결과서 조회 -->
					<!-- 부검결과서 표 -->
					<div class="aniinfo_add_box">
						<div class="sys_btn_box" style="margin-bottom:5px;">
						<span><!-- <a href="#" class="transform_btn">변환</a> --><a href="#" class="print_btn btn_type2">프린트</a></span>	
						</div>
						<table class="aniinfo_add" >
						<caption>부검결과서 내역</caption>
							<colgroup>
								<col style="width:4%;">
								<col style="width:8%;">
								<col style="width:8%;">
								<col style="width:12%;">
								<col style="width:10%;">
								<col style="width:4%;">
								<col style="width:8%;">
								<col style="width:14%;">
								<col style="width:7%;">
								<col style="width:10%;">
								<!-- <col style="width:5%;"> -->
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">No</th>
									<th scope="col" id="th02">검사요청상태</th>
									<th scope="col" id="th03">폐사일</th>
									<th scope="col" id="th04">동물명</th>
									<th scope="col" id="th05">동물번호</th>
									<th scope="col" id="th06">성별</th>
									<th scope="col" id="th07">동물사</th>
									<th scope="col" id="th08">폐사보고서</th>
									<th scope="col" id="th09">검사요청</th>
									<th scope="col" id="th10">검사결과입력</th>
									<!-- <th scope="col" id="th11">결재</th> -->
								</tr>
							</thead>
							<tbody id="bukum_tbody">
									<tr style="display:none">
									<th scope="row" id="n01" headers="th01"><div id="PREVENT_INDEX_DIV" data-val='' onclick="javascript:fn_prevent_view0501E($(this).attr('data-val'));"></div></th>
									<td headers="n01 th02"><div id="PBR_KSReqSts_DIV" data-val='' onclick="javascript:fn_prevent_view0501E($(this).attr('data-val'));"></div></td>
									<td headers="n01 th03"><div id="PDR_PSDATE_DIV" data-val=''></div></td>
									<td headers="n01 th04"><div id="MAC_NAME_DIV" data-val='' onclick="javascript:fn_prevent_view0501E($(this).attr('data-val'));"></div></td>	
									<td headers="n01 th05"><div id="MAI_ANICODE_DIV" data-val=''></div></td>
									<td headers="n01 th06"><div id="MAI_GENDER_DIV" data-val=''></div></td>
									<td headers="n01 th07"><div id="MVI_VVRMNAME_DIV" data-val=''></div></td>
									<td headers="n01 th08"><div id="PBR_REQDOCNO_DIV" data-val=''></div></td>
									<td headers="n01 th09"><a href="#" class="search_btn">검사요청</a></td>
									<td headers="n01 th11"><a href="#" class="search_btn"><div id="PBR_DOCNO_DIV_S" data-val='' onclick="javascript:fn_prevent_view0501F($(this).attr('data-val'));" >결과입력</div></a></td>			
							</tbody>
						</table>
					</div>
					<!-- //부검결과서 표 -->
					
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
	<div id="footer_wrap">
			<jsp:include page="/footer.do"></jsp:include>
	</div>
	<!-- //footer -->
</div>
</body>
</html>
