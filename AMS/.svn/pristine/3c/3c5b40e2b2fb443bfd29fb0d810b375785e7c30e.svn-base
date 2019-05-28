<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
	function selectAniRentTotList(result){
	 	if(result!=null){
//			console.log("selectAniRentTotList:" + JSON.stringify(result));
			console.log("result.length==>" + result.length);
			$("#tot_tbody tr:first").attr('style',"display:");
			
			var tot_CNT_MAI_ANICLSCODE = 0;
			var tot_MAI_SEX_M = 0;
			var tot_MAI_SEX_F = 0;
			var tot_MAI_SEX_A = 0;
			var tot_TOT_MAI_SEX = 0;
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("tot_tbody");
					
				var iRow = (i+1);
				$("#tot_tbody div#tot_MDI_DPTNAME_DIV").eq(iRow).attr('data-val',data.MTI_DPTNO); 
				$("#tot_tbody div#tot_MDI_DPTNAME_DIV").eq(iRow).html(data.MDI_DPTNAME); 
				$("#tot_tbody div#tot_CNT_MAI_ANICLSCODE_DIV").eq(iRow).html(data.CNT_MAI_ANICLSCODE); 
				$("#tot_tbody div#tot_MAI_SEX_M_DIV").eq(iRow).html(data.MAI_SEX_M); 
				$("#tot_tbody div#tot_MAI_SEX_F_DIV").eq(iRow).html(data.MAI_SEX_F); 
				$("#tot_tbody div#tot_MAI_SEX_A_DIV").eq(iRow).html(data.MAI_SEX_A); 
				$("#tot_tbody div#tot_TOT_MAI_SEX_DIV").eq(iRow).html(data.TOT_MAI_SEX);
				
				
				tot_CNT_MAI_ANICLSCODE += data.CNT_MAI_ANICLSCODE;
				tot_MAI_SEX_M += data.MAI_SEX_M;
				tot_MAI_SEX_F += data.MAI_SEX_F;
				tot_MAI_SEX_A += data.MAI_SEX_A;
				tot_TOT_MAI_SEX += data.TOT_MAI_SEX;
			}
			$("#tot_tfoot div#CNT_MAI_ANICLSCODE_DIV").eq(0).html(tot_CNT_MAI_ANICLSCODE); 
			$("#tot_tfoot div#MAI_SEX_M_DIV").eq(0).html(tot_MAI_SEX_M); 
			$("#tot_tfoot div#MAI_SEX_F_DIV").eq(0).html(tot_MAI_SEX_F); 
			$("#tot_tfoot div#MAI_SEX_A_DIV").eq(0).html(tot_MAI_SEX_A); 
			$("#tot_tfoot div#TOT_MAI_SEX_DIV").eq(0).html(tot_TOT_MAI_SEX); 
			
			$("#tot_tbody tr:first").attr('style',"display:none");
	
			if(result.length > 0){
				fn_sta_selectAniRentList(selectAniRentList);
			}
	 	}

	}
	function selectAniRentList(result){
	 	if(result!=null){
//			console.log("test:" + JSON.stringify(result));
			console.log("result.length==>" + result.length);
			$("#rent_tbody tr:first").attr('style',"display:");
			
			var prev_dptno;
			var iTot = 0;
			for(var i=0; i<result.length; i++){
				var data = result[i];
				
				var isTot = false;
				if((i > 0 && data.MTI_DPTNO!=prev_dptno) || i==result.length){	
					$("#tot_tbody tr").each(function(i_tot){
						if(i_tot > 0 && prev_dptno==$(this).find("div#tot_MDI_DPTNAME_DIV").attr('data-val')){
							console.log("prev_dptno::" + prev_dptno + "::" + $(this).find("div#tot_MDI_DPTNAME_DIV").html());
							console.log("tot_MDI_DPTNAME_DIV==>" + $(this).find("div#tot_MDI_DPTNAME_DIV").attr('data-val'));
							$("#rent_tbody").append($(this));
							isTot = true;
							iTot++;
						}
					});
				}
				prev_dptno = data.MTI_DPTNO;
				
					
				fc_addRow("rent_tbody");
				
				var iRow = (i+1);
				
				$("#rent_tbody div#RENT_INDEX_DIV").eq(iRow).html(iRow); 
				$("#rent_tbody div#RENT_INDEX_DIV").eq(iRow).attr('data-val',iRow); 
				$("#rent_tbody div#MDI_DPTNAME_DIV").eq(iRow).attr('data-val',data.MTI_DPTNO); 
				$("#rent_tbody div#MDI_DPTNAME_DIV").eq(iRow).html("[" + data.MDI_DPTNAME + "]" + data.MTI_TEAMNAME); 
				$("#rent_tbody div#TXT_DAIO_IODATE_DIV").eq(iRow).html(data.TXT_DAIO_IODATE); 
				$("#rent_tbody div#TXT_DAIO_RENTEDATE_DIV").eq(iRow).html(data.TXT_DAIO_RENTEDATE); 
				$("#rent_tbody div#DAIO_PLACE_DIV").eq(iRow).html(data.DAIO_PLACE); 
				$("#rent_tbody div#DAIO_PRICE_DIV").eq(iRow).html(data.DAIO_PRICE); 
				$("#rent_tbody div#TXT_MAI_ANICODE_DIV").eq(iRow).html(data.TXT_MAI_ANICODE); 
				$("#rent_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
				$("#rent_tbody div#MAI_ANICODE_DIV").eq(iRow).html(data.MAI_ANICODE); 
				$("#rent_tbody div#MAI_SEX_M_DIV").eq(iRow).html(data.MAI_SEX_M); 
				$("#rent_tbody div#MAI_SEX_F_DIV").eq(iRow).html(data.MAI_SEX_F); 
				$("#rent_tbody div#MAI_SEX_A_DIV").eq(iRow).html(data.MAI_SEX_A); 
				$("#rent_tbody div#TOT_MAI_SEX_DIV").eq(iRow).html(data.TOT_MAI_SEX); 
				
			}
			$("#rent_tbody tr:first").attr('style',"display:none");
			$("#rent_tbody").append($("#tot_tbody tr:last"));
	 	}
	}
	function fn_sta_selectAniRentList(callback, retObj) {
		console.log("****fn_sta_selectAniRentList");

		fc_clearRow("rent_tbody");

		var targetUrl = "/stat/0606/selectAniRentList.do";
		var param = {
				schDate : $("#schDate").val()
		};
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function fn_sta_selectAniRentTotList(schDate, callback, retObj) {
		console.log("schDate====>" + schDate);

		fc_clearRow("rent_tbody");
		fc_clearRow("tot_tbody");

		var targetUrl = "/stat/0606/selectAniRentTotList.do";
		var param = {
				schDate : schDate
		};
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function fn_sta_selectAniRentSta(){
		var param = {
				schDate : $("#schDate").val()
		};
		fn_sta_selectAniRentTotList(param.schDate, selectAniRentTotList);
	}

	$(document).ready(function() {
	});
	
</script>

<title>현황/통계 &gt; 임대현황</title>
</head>
<body>
<div id="sub_wrap">

	<jsp:include page="/header.do"></jsp:include>
	<!-- container-->
	<div id="container">
		<div id="contents">
			<!-- left-->
			<jsp:include page="/lnb.do"></jsp:include>
			<!-- //left-->
			<!-- right-->
			<section id="contents_area">
			<h2>본문내용</h2>
				<!-- contents_title-->
				<div class="title_area">
                    <p class="contents_title">임대현황</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 현황/통계</li>
                        <li>> 임대현황</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 임대현황 조회 -->
					<div class="aniinfo_search_box">
                        <table class="aniinfo_search" >
							<caption>임대현황 조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">일자</th>
									<td><p><input type="text" class="calendar1" id="schDate" value="${calInfo.cal_1}"><label for="schDate"></label></p></td>
								</tr>
								<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_sta_selectAniRentSta();" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					<!-- //임대현황 조회 -->

					<!-- 동물임대현황 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">동물임대현황</span>
							<div class="sys_btn_box">
								<span class="align_right"><a href="#" class="excel_btn">엑셀</a><a href="#" class="print_btn btn_type2">프린트</a></span>
							</div>
						</div>
						
						
						<table class="aniinfo_add table_view " >
							<tbody id="tot_tbody" style="display:none;">
								<tr style="display:none">
									<th scope="row"  colspan="6"><div id="tot_MDI_DPTNAME_DIV" data-val=''></div></th>
									<th scope="row"  colspan="3"><div id="tot_CNT_MAI_ANICLSCODE_DIV" data-val=''></div></th>
									<td><div id="tot_MAI_SEX_M_DIV" data-val=''></div></td>
									<td><div id="tot_MAI_SEX_F_DIV" data-val=''></div></td>
									<td><div id="tot_MAI_SEX_A_DIV" data-val=''></div></td>
									<td><div id="tot_TOT_MAI_SEX_DIV" data-val=''></div></td>
								</tr>
							</tbody>
						</table>
						
						<table class="aniinfo_add table_view " >
							<caption>동물임대현황</caption>
							<colgroup>
								<col style="width:4%;">
								<col style="width:16%;">
								<col style="width:8%;">
								<col style="width:8%;">
								<col style="width:10%;">
								<col style="width:6%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:8%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" rowspan="2" style="vertical-align:middle;">No</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">부서명</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">반출일자</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">종료일자</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">인계기관</th>
									<th scope="col" rowspan="2" style="vertical-align:middle; line-height:20px;">임대료<br>(천원)</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">분류명</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">동물명</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">동물번호</th>
									<th scope="colgroup" colspan="4">동물 수</th>
								</tr>
								<tr>
									<th scope="col">수</th>
									<th scope="col">암</th>
									<th scope="col">미상</th>
									<th scope="col">합계</th>
								</tr>
							</thead>
							<tbody id="rent_tbody">
								<tr style="display:none">
									<th scope="row"><div id="RENT_INDEX_DIV" data-val=''></div></th>
									<td><div id="MDI_DPTNAME_DIV" data-val=''></div></td>
									<td><div id="TXT_DAIO_IODATE_DIV" data-val=''></div></td>
									<td><div id="TXT_DAIO_RENTEDATE_DIV" data-val=''></div></td>
									<td ><div id="DAIO_PLACE_DIV" data-val=''></div></td>
									<td><div id="DAIO_PRICE_DIV" data-val=''></div></td>
									<td><div id="TXT_MAI_ANICODE_DIV" data-val=''></div></td>
									<td><div id="MAC_NAME_DIV" data-val=''></div></td>
									<td><div id="MAI_ANICODE_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_M_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_F_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_A_DIV" data-val=''></div></td>
									<td><div id="TOT_MAI_SEX_DIV" data-val=''></div></td>
								</tr>
							</tbody>
							<tfoot id="tot_tfoot">
								<tr>
									<th scope="colgroup" colspan="6">총 합계</th>
									<th scope="colgroup" colspan="3"><div id="CNT_MAI_ANICLSCODE_DIV" data-val=''></div></th>
									<td><div id="MAI_SEX_M_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_F_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_A_DIV" data-val=''></div></td>
									<td><div id="TOT_MAI_SEX_DIV" data-val=''></div></td>
								</tr>
							</tfoot>
						</table>
					</div>
					
  					<!-- //동물임대현황 -->

				
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
