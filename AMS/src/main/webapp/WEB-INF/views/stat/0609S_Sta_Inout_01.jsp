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
	function selectAniIoOList(result){
		console.log("****selectAniIoOList");
	 	if(result!=null){
//			console.log("test:" + JSON.stringify(result));
			console.log("result.length==>" + result.length);
			$("#ioO_tbody tr:first").attr('style',"display:");
			
			var tot_MAI_SEX_M = 0;
			var tot_MAI_SEX_F = 0;
			var tot_MAI_SEX_A = 0;
			var tot_CNT_MAI_SEX = 0;
			for(var i=0; i<result.length; i++){
				var data = result[i];
				
				fc_addRow("ioO_tbody");
				
				var iRow = (i+1);
				
				$("#ioO_tbody div#IO_O_INDEX_DIV").eq(iRow).html(iRow); 
				$("#ioO_tbody div#IO_O_INDEX_DIV").eq(iRow).attr('data-val',iRow); 
				$("#ioO_tbody div#TXT_DAIO_IODATE_DIV").eq(iRow).html(data.TXT_DAIO_IODATE); 
				$("#ioO_tbody div#TXT_DAIO_RESN_DIV").eq(iRow).html(data.TXT_DAIO_RESN); 
				$("#ioO_tbody div#MDI_DPTNAME_DIV").eq(iRow).html("[" + data.MDI_DPTNAME + "]" + data.MTI_TEAMNAME); 
				$("#ioO_tbody div#DAIO_NATION_DIV").eq(iRow).html(data.DAIO_NATION); 
				$("#ioO_tbody div#DAIO_PLACE_DIV").eq(iRow).html(data.DAIO_PLACE); 
				$("#ioO_tbody div#DAIO_PRICE_DIV").eq(iRow).html(data.DAIO_PRICE); 
				$("#ioO_tbody div#TXT_MAI_ANICODE_1_DIV").eq(iRow).html(data.TXT_MAI_ANICODE_1); 
				$("#ioO_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
				$("#ioO_tbody div#MAI_ANICODE_DIV").eq(iRow).html(data.MAI_ANICODE); 
				$("#ioO_tbody div#MAI_SEX_M_DIV").eq(iRow).html(data.MAI_SEX_M); 
				$("#ioO_tbody div#MAI_SEX_F_DIV").eq(iRow).html(data.MAI_SEX_F); 
				$("#ioO_tbody div#MAI_SEX_A_DIV").eq(iRow).html(data.MAI_SEX_A); 
				$("#ioO_tbody div#CNT_MAI_SEX_DIV").eq(iRow).html(data.CNT_MAI_SEX); 
				
				tot_MAI_SEX_M += data.MAI_SEX_M;
				tot_MAI_SEX_F += data.MAI_SEX_F;
				tot_MAI_SEX_A += data.MAI_SEX_A;
				tot_CNT_MAI_SEX += data.CNT_MAI_SEX;
			}
			$("#totIoO_tfoot div#MAI_SEX_M_DIV").eq(0).html(tot_MAI_SEX_M); 
			$("#totIoO_tfoot div#MAI_SEX_F_DIV").eq(0).html(tot_MAI_SEX_F); 
			$("#totIoO_tfoot div#MAI_SEX_A_DIV").eq(0).html(tot_MAI_SEX_A); 
			$("#totIoO_tfoot div#CNT_MAI_SEX_DIV").eq(0).html(tot_CNT_MAI_SEX); 
	 	}
		$("#ioO_tbody tr:first").attr('style',"display:none");

	}
	function selectAniIoIList(result){
	 	if(result!=null){
//			console.log("test:" + JSON.stringify(result));
			console.log("result.length==>" + result.length);
			$("#ioI_tbody tr:first").attr('style',"display:");
			
			var tot_MAI_SEX_M = 0;
			var tot_MAI_SEX_F = 0;
			var tot_MAI_SEX_A = 0;
			var tot_CNT_MAI_SEX = 0;
			for(var i=0; i<result.length; i++){
				var data = result[i];
				
				fc_addRow("ioI_tbody");
				
				var iRow = (i+1);
				
				$("#ioI_tbody div#IO_I_INDEX_DIV").eq(iRow).html(iRow); 
				$("#ioI_tbody div#IO_I_INDEX_DIV").eq(iRow).attr('data-val',iRow); 
				$("#ioI_tbody div#TXT_DAIO_IODATE_DIV").eq(iRow).html(data.TXT_DAIO_IODATE); 
				$("#ioI_tbody div#TXT_DAIO_RESN_DIV").eq(iRow).html(data.TXT_DAIO_RESN); 
				$("#ioI_tbody div#MDI_DPTNAME_DIV").eq(iRow).html("[" + data.MDI_DPTNAME + "]" + data.MTI_TEAMNAME); 
				$("#ioI_tbody div#DAIO_NATION_DIV").eq(iRow).html(data.DAIO_NATION); 
				$("#ioI_tbody div#DAIO_PLACE_DIV").eq(iRow).html(data.DAIO_PLACE); 
				$("#ioI_tbody div#DAIO_PRICE_DIV").eq(iRow).html(data.DAIO_PRICE); 
				$("#ioI_tbody div#TXT_MAI_ANICODE_1_DIV").eq(iRow).html(data.TXT_MAI_ANICODE_1); 
				$("#ioI_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
				$("#ioI_tbody div#MAI_ANICODE_DIV").eq(iRow).html(data.MAI_ANICODE); 
				$("#ioI_tbody div#MAI_SEX_M_DIV").eq(iRow).html(data.MAI_SEX_M); 
				$("#ioI_tbody div#MAI_SEX_F_DIV").eq(iRow).html(data.MAI_SEX_F); 
				$("#ioI_tbody div#MAI_SEX_A_DIV").eq(iRow).html(data.MAI_SEX_A); 
				$("#ioI_tbody div#CNT_MAI_SEX_DIV").eq(iRow).html(data.CNT_MAI_SEX); 
				
				tot_MAI_SEX_M += data.MAI_SEX_M;
				tot_MAI_SEX_F += data.MAI_SEX_F;
				tot_MAI_SEX_A += data.MAI_SEX_A;
				tot_CNT_MAI_SEX += data.CNT_MAI_SEX;
			}
			$("#totIoI_tfoot div#MAI_SEX_M_DIV").eq(0).html(tot_MAI_SEX_M); 
			$("#totIoI_tfoot div#MAI_SEX_F_DIV").eq(0).html(tot_MAI_SEX_F); 
			$("#totIoI_tfoot div#MAI_SEX_A_DIV").eq(0).html(tot_MAI_SEX_A); 
			$("#totIoI_tfoot div#CNT_MAI_SEX_DIV").eq(0).html(tot_CNT_MAI_SEX); 
	 	}
		$("#ioI_tbody tr:first").attr('style',"display:none");
	}
	function fn_sta_selectAniIoOList(param, callback, retObj) {
		fc_clearRow("ioO_tbody");

		var targetUrl = "/stat/0609/selectAniIoOList.do";
		
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}
	function fn_sta_selectAniIoIList(param, callback, retObj) {
		fc_clearRow("ioI_tbody");

		var targetUrl = "/stat/0609/selectAniIoIList.do";
		
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function fn_sta_selectAniIoSta(){
		var chk_del_sts = "N";
		if($('#sch_tbody #chk_del_sts').prop("checked")){
			chk_del_sts = "";
		}
		var param = {
				del_sts : chk_del_sts,
				cal_1 : $("#sch_tbody #cal_1").val(),
				cal_2 : $("#sch_tbody #cal_2").val()
		};
		fn_sta_selectAniIoOList(param, selectAniIoOList);
		fn_sta_selectAniIoIList(param, selectAniIoIList);
	}

	$(document).ready(function() {
		fc_clearRow("ioI_tbody");
		fc_clearRow("ioO_tbody");
	});
	
</script>


<title>현황/통계 &gt; 반출입현황</title>
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
                    <p class="contents_title">반출입현황</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 현황/통계</li>
                        <li>> 반출입현황</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 반출입현황 조회 -->
					<div class="aniinfo_search_box">
                        <table class="aniinfo_search" >
							<caption>반출입현황 조회</caption>
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
									<th scope="row">삭제구분</th>
									<td><input type="checkbox" id="chk_del_sts"><label for="chk_del_sts"></label> 삭제 (삭제 데이터를 포함합니다.)</td>
								</tr>
								<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_sta_selectAniIoSta();" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					<!-- //반출입현황 조회 -->

					<!-- 동물반출현황 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus"><img src="/images/btn_minus.gif" alt=""></a>동물반출현황</span>
							<div class="sys_btn_box">
								<span class="align_right btn_hide"><a href="#" class="excel_btn">엑셀</a><a href="#" class="print_btn btn_type2">프린트</a></span>
							</div>
						</div>
						<table class="aniinfo_add table_view table_td_margin" >
							<caption>동물반출현황</caption>
							<colgroup>
								<col style="width:4%;">
								<col style="width:7%;">
								<col style="width:7%;">
								<col style="width:13%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:5%;">
								<col style="width:7%;">
								<col style="width:10%;">
								<col style="width:7%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" rowspan="2" style="vertical-align:middle;">No</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">반출일자</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">구분/사유</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">부서명</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">반출입국가</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">반출입기관</th>
									<th scope="col" rowspan="2" style="vertical-align:middle; line-height:20px;">가격<br>(천원)</th>
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
							<tbody id="ioO_tbody">
								<tr style="display:none">
									<th scope="row"><div id="IO_O_INDEX_DIV" data-val=''></div></th>
									<td><div id="TXT_DAIO_IODATE_DIV" data-val=''></div></td>
									<td><div id="TXT_DAIO_RESN_DIV" data-val=''></div></td>
									<td><div id="MDI_DPTNAME_DIV" data-val=''></div></td>
									<td><div id="DAIO_NATION_DIV" data-val=''></div></td>
									<td><div id="DAIO_PLACE_DIV" data-val=''></div></td>
									<td><div id="DAIO_PRICE_DIV" data-val=''></div></td>
									<td><div id="TXT_MAI_ANICODE_1_DIV" data-val=''></div></td>
									<td><div id="MAC_NAME_DIV" data-val=''></div></td>
									<td><div id="MAI_ANICODE_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_M_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_F_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_A_DIV" data-val=''></div></td>
									<td><div id="CNT_MAI_SEX_DIV" data-val=''></div></td>
								</tr>
								<tr>
									<th scope="row">2</th>
									<td>2016-07-01</td>
									<td>반출/매각</td>
									<td>[동물복지 1과]복지 2팀</td>
									<td></td>
									<td>JK 트레이드(우크라이나)</td>
									<td>1000</td>
									<td>포유강</td>
									<td>유럽비버</td>
									<td>M5-3-2-5</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								
							</tbody>
							<tfoot id="totIoO_tfoot">
								<tr>
									<th scope="colgroup" colspan="10">총 합계</th>
									<td><div id="MAI_SEX_M_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_F_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_A_DIV" data-val=''></div></td>
									<td><div id="CNT_MAI_SEX_DIV" data-val=''></div></td>
								</tr>
							</tfoot>
						</table>
					</div>
					
  					<!-- //동물반출현황 -->

					<!-- 반입현황 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus2"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus2"><img src="/images/btn_minus.gif" alt=""></a>동물반입현황</span>
							<div class="sys_btn_box">
								<span class="align_right btn_hide2"><a href="#" class="excel_btn">엑셀</a><a href="#" class="print_btn btn_type2">프린트</a></span>
							</div>
						</div>
						<table class="aniinfo_add table_view table_td_margin" >
							<caption>동물반입현황</caption>
							<colgroup>
								<col style="width:4%;">
								<col style="width:7%;">
								<col style="width:7%;">
								<col style="width:13%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:5%;">
								<col style="width:7%;">
								<col style="width:10%;">
								<col style="width:7%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" rowspan="2" style="vertical-align:middle;">No</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">반입일자</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">구분/사유</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">부서명</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">반출입국가</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">반출입기관</th>
									<th scope="col" rowspan="2" style="vertical-align:middle; line-height:20px;">가격<br>(천원)</th>
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
							<tbody id="ioI_tbody">
								<tr style="display:none">
									<th scope="row"><div id="IO_I_INDEX_DIV" data-val=''></div></th>
									<td><div id="TXT_DAIO_IODATE_DIV" data-val=''></div></td>
									<td><div id="TXT_DAIO_RESN_DIV" data-val=''></div></td>
									<td><div id="MDI_DPTNAME_DIV" data-val=''></div></td>
									<td><div id="DAIO_NATION_DIV" data-val=''></div></td>
									<td><div id="DAIO_PLACE_DIV" data-val=''></div></td>
									<td><div id="DAIO_PRICE_DIV" data-val=''></div></td>
									<td><div id="TXT_MAI_ANICODE_1_DIV" data-val=''></div></td>
									<td><div id="MAC_NAME_DIV" data-val=''></div></td>
									<td><div id="MAI_ANICODE_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_M_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_F_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_A_DIV" data-val=''></div></td>
									<td><div id="CNT_MAI_SEX_DIV" data-val=''></div></td>
								</tr>
								<tr>
									<th scope="row">2</th>
									<td>2016-07-01</td>
									<td>반입/구입</td>
									<td>[동물복지 1과]복지 2팀</td>
									<td></td>
									<td>JK 트레이드(우크라이나)</td>
									<td>1000</td>
									<td>포유강</td>
									<td>유럽비버</td>
									<td>M5-3-2-5</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								
							</tbody>
							<tfoot id="totIoI_tfoot">
								<tr>
									<th scope="colgroup" colspan="10">총 합계</th>
									<td><div id="MAI_SEX_M_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_F_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_A_DIV" data-val=''></div></td>
									<td><div id="CNT_MAI_SEX_DIV" data-val=''></div></td>
								</tr>
							</tfoot>
						</table>
						
					</div>
					
  					<!-- //반입현황 -->
					<!-- 합계 -->
<!-- 					
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus3"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus3"><img src="/images/btn_minus.gif" alt=""></a>합계</span>
							<div class="sys_btn_box">
								<span class="align_right btn_hide3"><a href="#" class="excel_btn">엑셀</a><a href="#" class="print_btn btn_type2">프린트</a></span>
							</div>
						</div>
						
					</div>
 -->					
  					<!-- //합계 -->

				
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
