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

function selectAnesList(result){
 	if(result!=null){
		console.log("selectAnesList:" + JSON.stringify(result));
		console.log("result.length==>" + result.length);
		$("#anes_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("anes_tbody"); 
			
			var iRow = (i+1);
			$("#anes_tbody div#ANES_INDEX_DIV").eq(iRow).html(iRow); 
			$("#anes_tbody div#ANES_DIVISION_DIV").eq(iRow).html(data.JAD_TYPE); 
			$("#anes_tbody div#ANES_DOCNO_DIV").eq(iRow).html(data.JAD_DOCNO); 
			$("#anes_tbody div#ANES_JRDATE_DIV").eq(iRow).html(data.JAD_JRDATE); 
			$("#anes_tbody div#ANES_JRDNAME_DIV").eq(iRow).html(data.JAD_JRDZZNAME); 
			$("#anes_tbody div#ANES_MACNAME_DIV").eq(iRow).html(data.MAC_NAME); 
			$("#anes_tbody div#ANES_ANICODE_DIV").eq(iRow).html(data.JAD_ANICODE); 
			$("#anes_tbody div#ANES_PURPOSE_DIV").eq(iRow).html(data.JAD_GOAL); 
			$("#anes_tbody div#ANES_MDI_NAME_DIV").eq(iRow).html(data.MDI_NAME); 
			$("#anes_tbody div#ANES_VOL_DIV").eq(iRow).html(data.JAD_UNIT);

				
		}
		$("#anes_tbody tr:first").attr('style',"display:none");
 	}
}


function fn_treat_selectAnesList(param, callback, retObj) {
	fc_clearRow("anes_tbody");

	var targetUrl = "/treat/0405/selectAnesList.do";
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
			divKeyword:$("#sch_tbody #divKeyword").val(),
			drugKeyword:$("#sch_tbody #drugKeyword").val(),
			nameKeyword:$("#sch_tbody #nameKeyword").val()
	};
	console.log(param);
	fn_treat_selectAnesList(param, selectAnesList);
}
$(document).ready(function() {
});
</script>

<title>병리방역 &gt; 마취내역</title>
</head>
<body>
<div id="sub_wrap">

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
                    <p class="contents_title">마취내역</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 병리방역</li>
                        <li>> 마취내역</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 마취내역 조회 -->
					<div class="aniinfo_search_box">
                        <table class="aniinfo_search" >
							<caption>마취내역 조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody id="sch_tbody">
								<tr>
									<th scope="row">접종일자</th>
									<td><p><input type="text" class="calendar1" id="cal_1" value="${calInfo.cal_1}"><label for="cal_1"></label> ~  <input type="text" class="calendar2" id="cal_2" value="${calInfo.cal_2}"><label for="cal_2"></label></p></td>						
								</tr>
								<tr>
									<th scope="row">구분</th>
									<td><input name="divKeyword" type="text" id="divKeyword" class="textfield"><label for="divKeyword"></label></td>
								</tr>
								<tr>
									<th scope="row">약품</th>
									<td><input name="drugKeyword" type="text" id=drugKeyword class="textfield"><label for="drugKeyword"></label></td>
								</tr>
								<tr>
									<th scope="row">동물명</th>
									<td><input name="nameKeyword" type="text" id="nameKeyword" class="textfield"><label for="nameKeyword"></label></td>
								</tr>
								<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_treat_search();" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					<!-- //마취내역 조회 -->
					<!-- 마취내역 표 -->
					<div class="aniinfo_add_box">
						<div class="sys_btn_box" style="margin-bottom:5px;">
						<span><a href="#" class="excel_btn">엑셀</a><a href="#" class="print_btn btn_type2">프린트</a></span>	
						</div>
						<table class="aniinfo_add" >
						<caption>마취내역 내역</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:8%;">
								<col style="width:15%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:15%;">
								<col style="width:12%;">
								<col style="width:8%;">
								<col style="width:10%;">
								<col style="width:10%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">No</th>
									<th scope="col" id="th02">구분</th>
									<th scope="col" id="th03">진료번호</th>
									<th scope="col" id="th04">마취일자</th>
									<th scope="col" id="th05">진단명</th>
									<th scope="col" id="th06">동물명</th>
									<th scope="col" id="th07">동물번호</th>
									<th scope="col" id="th08">마취목적</th>
									<th scope="col" id="th09">약품명칭</th>
									<th scope="col" id="th10">용량</th>
								</tr>
							</thead>
							<tbody id="anes_tbody">
								<tr style="display:none">
									<th scope="row" id="n01" headers="th01"><div id="ANES_INDEX_DIV"></div></th>
									<td headers="n01 th01"><div id="ANES_DIVISION_DIV"></div></td>
									<td headers="n01 th02"><div id="ANES_DOCNO_DIV"></div></td>
									<td headers="n01 th03"><div id="ANES_JRDATE_DIV"></div></td>
									<td headers="n01 th04"><div id="ANES_JRDNAME_DIV"></div></td>
									<td headers="n01 th05"><div id="ANES_MACNAME_DIV"></div></td>
									<td headers="n01 th06"><div id="ANES_ANICODE_DIV"></div></td>
									<td headers="n01 th07"><div id="ANES_PURPOSE_DIV"></div></td>
									<td headers="n01 th08"><div id="ANES_MDI_NAME_DIV"></div></td>
									<td headers="n01 th09"><div id="ANES_VOL_DIV"></div></td>
								</tr>
							</tbody>
						</table>

						<table class="aniinfo_search" style="margin-top:20px;" >
							<caption>합계</caption>
							<colgroup>
								<col style="width:25%;">
								<col style="width:25%;">
								<col style="width:25%;">
								<col style="width:25%;">
							</colgroup>
                            <tbody id="schRst_tbody">
								<tr>
									<th scope="row">기간 내 총 마취건수</th><td>0 건</td>
									<th scope="row">기간 내  총 수술건수</th><td>0 건</td>
								</tr>
								<tr>
									<th scope="row">목적별 마취건수</th><td>0 건</td>
								</tr>
						   </tbody>
						</table>

					</div>
					<!-- //마취내역 표 -->
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
		<footer id="footer">
		<jsp:include page="/footer.do"></jsp:include>
		</footer>
	</div>
	<!-- //footer -->
</div>
</body>
</html>
