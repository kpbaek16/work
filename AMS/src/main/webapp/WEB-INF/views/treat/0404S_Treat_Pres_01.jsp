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
<script src="/js/common/common.js"></script> 
<script src="/js/common/json2.js"></script>
<script type="text/javascript">

function selectPreslist(result){
	if(result!=null){
		console.log("selectPreslist:" + JSON.stringify(result));
		$("#pres_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("pres_tbody");
			
			var iRow = (i+1);
			$("#pres_tbody div#PRES_INDEX_DIV").eq(iRow).html(iRow); 
			$("#pres_tbody div#JJJ_JRTYPE_DIV").eq(iRow).html(data.JJJ_JRTYPE);
			$("#pres_tbody div#JJDCB_JRNO_DIV").eq(iRow).html(data.JJDCB_JRNO); 
			$("#pres_tbody div#JJDCB_CBDATE_DIV").eq(iRow).html(data.JJDCB_CBDATE);
			$("#pres_tbody div#JJJDCB_DOCNO_DIV").eq(iRow).html(data.JJDCB_DOCNO);
			$("#pres_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME);
			$("#pres_tbody div#MAI_ANICODE_DIV").eq(iRow).html(data.MAI_ANICODE);
			$("#pres_tbody div#MDI_NAME_DIV").eq(iRow).html(data.MDI_NAME);
			$("#pres_tbody div#JJDCB_USEVOL_DIV").eq(iRow).html(data.JJDCB_USEVOL);
			$("#pres_tbody div#UNITNAME_DIV").eq(iRow).html(data.UNITNAME);
			$("#pres_tbody div#JJDCB_CMNT_DIV").eq(iRow).html(data.JJDCB_CMNT);
		}
		$("#pres_tbody tr:first").attr('style',"display:none");
	}
 	if(result == 0){
 		alert('조회된 결과가 없습니다.');
 		return;
 	}
}

function fn_treat_selectPreslist(param, callback, retObj) {
	
	fc_clearRow("pres_tbody");

	var targetUrl = "/treat/0404/selectPreslist.do";
	$.getJSON(targetUrl, param, function(result) {
//		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

function fn_treat_search(){
	var param = {
			cal_1 : $("#sch_tbody #cal_1").val(),
			cal_2 : $("#sch_tbody #cal_2").val(),
			drugKeyword:$("#sch_tbody #drugKeyword").val(),
			vvrmKeyword:$("#sch_tbody #vvrmKeyword").val(),
			nameKeyword:$("#sch_tbody #nameKeyword").val(),
	};
	console.log(param);
	fn_treat_selectPreslist(param, selectPreslist);
}	
$(document).ready(function() {
});
</script>

<title>동물진료 &gt; 처방전</title>
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
				<!-- //lnb -->
			</div>
			<!-- //left-->
			<!-- right-->
			<section id="contents_area">
			<h2>본문내용</h2>
				<!-- contents_title-->
				<div class="title_area">
					<p class="contents_title">처방전</p>
					<ol class="location">
						<li><img src="/images/home_icon.gif" alt="home"></li>
						<li>> 동물진료</li>
						<li>> 처방전</li>
					</ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 처방전 조회 -->
					<div class="aniinfo_search_box">
						<table class="aniinfo_search" >
							<caption>처방전 조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
							<tbody id="sch_tbody">
								<tr>
									<th scope="row">일자</th>
									<td><p><input type="text" class="calendar1" id="cal_1" value="${calInfo.cal_1}"><label for="cal_1"></label> ~  <input type="text" class="calendar2" id="cal_2" value="${calInfo.cal_2}"><label for="cal_2"></label></p></td>						
								</tr>
								<tr>
									<th scope="row">약품명</th>
									<td><input name="drugKeyword" type="text" id="drugKeyword" class="textfield"><label for="drugKeyword"></label></td>
								</tr>
								<tr>
									<th scope="row">동물사</th>
									<td><input name="vvrmKeyword" type="text" id="vvrmKeyword" class="textfield"><label for="vvrmKeyword"></label></td>
								</tr>
								<tr>
									<th scope="row">동물명</th>
									<td><input name="nameKeyword" type="text" id="nameKeyword" class="textfield"><label for="nameKeyword"></label></td>
								</tr>
								<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_treat_search();" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					<!-- //처방전 조회 -->
					<!-- 처방전 표 -->
					<div class="aniinfo_add_box">
						<div class="sys_btn_box" style="margin-bottom:5px;">
						<span><a href="#" class="excel_btn">엑셀</a><a href="#" class="print_btn btn_type2">프린트</a></span>	
						</div>
						<table class="aniinfo_add" >
						<caption>처방전 내역</caption>
							<colgroup>
								<col style="width:4%;">
								<col style="width:6%;">
								<col style="width:12%;">
								<col style="width:8%;">
								<col style="width:12%;">
								<col style="width:13%;">
								<col style="width:9%;">
								<col style="width:18%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:10%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">No</th>
									<th scope="col" id="th02">진료구분</th>
									<th scope="col" id="th03">진료번호</th>
									<th scope="col" id="th04">진료일자</th>
									<th scope="col" id="th05">처방번호</th>
									<th scope="col" id="th06">동물명</th>
									<th scope="col" id="th07">동물번호</th>
									<th scope="col" id="th08">약물명칭</th>
									<th scope="col" id="th09">용량</th>
									<th scope="col" id="th10">단위</th>
									<th scope="col" id="th11">용법</th>
								</tr>
							</thead>
							<tbody id="pres_tbody">
								<tr style="display:none">
									<th scope="row" id="n01" headers="th01"><div id="PRES_INDEX_DIV"></div></th>
									<td><div id="JJJ_JRTYPE_DIV"></div></td>
									<td><div id="JJDCB_JRNO_DIV"></div></td>
									<td><div id="JJDCB_CBDATE_DIV"></div></td>
									<td><div id="JJJDCB_DOCNO_DIV"></div></td>
									<td><div id="MAC_NAME_DIV"></div></td>
									<td><div id="MAI_ANICODE_DIV"></div></td>
									<td><div id="MDI_NAME_DIV"></div></td>
									<td><div id="JJDCB_USEVOL_DIV"></div></td>
									<td><div id="UNITNAME_DIV"></div></td>
									<td><div id="JJDCB_CMNT_DIV"></div></td>				
								</tr>
							</tbody>
						
						</table>
					</div>
					<!-- //처방전 표 -->
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
