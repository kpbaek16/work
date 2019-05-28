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

function selectVcnlist(result){
 	if(result!=null){
		console.log("selectVcnlist:" + JSON.stringify(result));
		$("#prevent_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("prevent_tbody");
			
			var iRow = (i+1);
			$("#prevent_tbody div#PREVENT_INDEX_DIV").eq(iRow).html(iRow); 
			$("#prevent_tbody div#PREVENT_VCNDATE_DIV").eq(iRow).html(data.YVI_JJDATE); 
			$("#prevent_tbody div#PREVENT_VCNNAME_DIV").eq(iRow).html(data.MVI_VCNNAME); 
			$("#prevent_tbody div#PREVENT_PRDNAME_DIV").eq(iRow).html(data.MVI_PRODNAME); 
			$("#prevent_tbody div#PREVENT_MACNAME_DIV").eq(iRow).html(data.MAC_NAME); 
			$("#prevent_tbody div#PREVENT_VVRMNAME_DIV").eq(iRow).html(data.MVI_VVRMNAME); 
			$("#prevent_tbody div#PREVENT_VCNVOL_DIV").eq(iRow).html(data.YVI_VOL); 
			
		}
		$("#prevent_tbody tr:first").attr('style',"display:none");
 	}
}

function fn_prevent_selectVcnlist(param, callback, retObj) {
	fc_clearRow("prevent_tbody");

	var targetUrl = "/prevent/0503/selectVcnlist.do";
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
			nameKeyword:$("#sch_tbody #nameKeyword").val(),
			vcnKeyword:$("#sch_tbody #vcnKeyword").val(),
			prdKeyword:$("#sch_tbody #prdKeyword").val()
	};
	console.log(param);
	fn_prevent_selectVcnlist(param, selectVcnlist);
}	
$(document).ready(function() {
if(fn_is_pms_upd(0503))
{
	$(".add_btn").css("display","");
	$(".save_btn").css("display","");
	$(".cancel_btn").css("display","");
	$(".cha_btn").css("display","");
}
});
</script>

<title>병리방역 &gt; 백신접종관리</title>
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
                    <p class="contents_title">백신접종관리</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 병리방역</li>
                        <li>> 백신접종관리</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				
				<!-- contents-->
				<div class="contents_table">
					<!-- 백신접종관리 조회 -->
					<div class="aniinfo_search_box">
                        <table class="aniinfo_search" >
							<caption>백신접종관리 조회</caption>
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
									<th scope="row">동물사</th>
									<td><input name="vvrmKeyword" type="text" id="vvrmKeyword" class="textfield"><label for="vvrmKeyword"></label></td>
								</tr>
								<tr>
									<th scope="row">동물명</th>
									<td><input name="nameKeyword" type="text" id="nameKeyword" class="textfield"><label for="nameKeyword"></label></td>
								</tr>
								<tr>
									<th scope="row">백신명</th>
									<td><input name="vcnKeyword" type="text" id="vcnKeyword" class="textfield"><label for="drugKeyword"></label></td>
								</tr>
								<tr>
									<th scope="row">상품명</th>
									<td><input name="prdKeyword" type="text" id="prdKeyword" class="textfield"><label for="prdKeyword"></label></td>
								</tr>
								<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_prevent_search();" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					<!-- //백신접종관리 조회 -->
					
					<!-- 백신접종관리 표 -->
					<div class="aniinfo_add_box">
						<div class="sys_btn_box" style="margin-bottom:5px;">
						<span><!-- <a href="#" class="transform_btn">변환</a> -->
						<a href="#" class="print_btn btn_type2">프린트</a></span>	
						</div>
						<table class="aniinfo_add" >
						<caption>백신접종관리 내역</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:15%;">
								<col style="width:20%;">
								<col style="width:20%;">
								<!-- <col style="width:13%;"> -->
								<col style="width:20%;">
								<col style="width:15%;">
								<col style="width:7%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">No</th>
									<th scope="col" id="th02">접종일자</th>
									<th scope="col" id="th03">백신명</th>
									<th scope="col" id="th04">상품명</th>
									<!-- <th scope="col" id="th05">폐사일</th> -->
									<th scope="col" id="th06">동물명</th>
									<th scope="col" id="th07">동물사</th>
									<th scope="col" id="th08">용량</th>
								</tr>
							</thead>
							<tbody id="prevent_tbody">
								<tr style="display:none">
									<th scope="row" id="n01" headers="th01"><div id="PREVENT_INDEX_DIV"></div></th>
									<td headers="n01 th02"><div id="PREVENT_VCNDATE_DIV"></div></td>
									<td headers="n01 th03"><div id="PREVENT_VCNNAME_DIV"></div></td>
									<td headers="n01 th04"><div id="PREVENT_PRDNAME_DIV"></div></td>
									<!-- <td headers="n01 th05"></td> -->
									<td headers="n01 th06"><div id="PREVENT_MACNAME_DIV"></div></td>
									<td headers="n01 th07"><div id="PREVENT_VVRMNAME_DIV"></div></td>
									<td headers="n01 th08"><div id="PREVENT_VCNVOL_DIV"></div></td>
								</tr>
							</tbody>
						
						</table>
					</div>
					<!-- //백신접종관리 표 -->
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