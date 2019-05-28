<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="/css/ui/reset.css">
<link rel="stylesheet" href="/css/ui/sub_layout.css">
<link rel="stylesheet" href="/css/base/contents.css">
<link rel='stylesheet' href='/css/base/Nwagon.css' type='text/css'>
<link rel="stylesheet" href="/css/jquery/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> <!-- 달력 css-->
<script src="/js/jquery-1.7.2.min.js"></script>
<script src="/js/jquery/ui/1.8.18/jquery-ui.min.js"></script>  <!-- 달력 스크립트-->
<script type="text/javascript" src="/js/contents/base.js"></script>
<script type="text/javascript" src="/js/contents/cal.js"></script>
<script src="/js/common/common.js"></script>
<script src="/js/common/json2.js"></script>

<script>
	function selectAniBreedTotList(result){
		if(result!=null){
	//		console.log("selectAniRentTotList:" + JSON.stringify(result));
			console.log("result.length==>" + result.length);
			$("#breedTot_tbody tr:first").attr('style',"display:");
			
			var tot_CNT_MAI_ANICLSCODE = 0;
			var tot_MAI_SEX_M = 0;
			var tot_MAI_SEX_F = 0;
			var tot_MAI_SEX_A = 0;
			var tot_TOT_MAI_SEX = 0;
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("breedTot_tbody");
					
				var iRow = (i+1);
				$("#breedTot_tbody div#tot_MAC_ANICODE1_DIV").eq(iRow).attr('data-val',data.MAC_ANICODE1); 
				$("#breedTot_tbody div#tot_TXT_MAI_ANICODE_1_DIV").eq(iRow).html("[" + data.TXT_MAI_ANICODE_1 + "] 소계"); 
				$("#breedTot_tbody div#tot_MAI_SEX_M_DIV").eq(iRow).html(data.MAI_SEX_M); 
				$("#breedTot_tbody div#tot_MAI_SEX_F_DIV").eq(iRow).html(data.MAI_SEX_F); 
				$("#breedTot_tbody div#tot_MAI_SEX_A_DIV").eq(iRow).html(data.MAI_SEX_A); 
				$("#breedTot_tbody div#tot_TOT_MAI_SEX_DIV").eq(iRow).html(data.TOT_MAI_SEX);
				
				tot_MAI_SEX_M += data.MAI_SEX_M;
				tot_MAI_SEX_F += data.MAI_SEX_F;
				tot_MAI_SEX_A += data.MAI_SEX_A;
				tot_TOT_MAI_SEX += data.TOT_MAI_SEX;
			}
			$("#breedTot_tfoot div#MAI_SEX_M_DIV").eq(0).html(tot_MAI_SEX_M); 
			$("#breedTot_tfoot div#MAI_SEX_F_DIV").eq(0).html(tot_MAI_SEX_F); 
			$("#breedTot_tfoot div#MAI_SEX_A_DIV").eq(0).html(tot_MAI_SEX_A); 
			$("#breedTot_tfoot div#TOT_MAI_SEX_DIV").eq(0).html(tot_TOT_MAI_SEX); 

			$("#breedTot_tbody tr:first").attr('style',"display:none");
			
			if(result.length > 0){
				fn_sta_selectAniBreedList(selectAniBreedList);
			}
	 	}
	
	}

	function selectAniBreedList(result){
	 	if(result!=null){
//			console.log("test:" + JSON.stringify(result));
			console.log("result.length==>" + result.length);
			$("#breed_tbody tr:first").attr('style',"display:");
			
			var prev_MAC_ANICODE1;
			for(var i=0; i<result.length; i++){
				var data = result[i];
				
				if((i > 0 && data.MAC_ANICODE1!=prev_MAC_ANICODE1)){	
					$("#breedTot_tbody tr").each(function(i_tot){
						if(i_tot > 0 && prev_MAC_ANICODE1==$(this).find("div#tot_MAC_ANICODE1_DIV").attr('data-val')){
//							console.log(data.MAC_ANICODE1 + "::" + prev_MAC_ANICODE1);
							$("#breed_tbody").append($(this));
						}
					});
				}
				prev_MAC_ANICODE1 = data.MAC_ANICODE1;
				
				fc_addRow("breed_tbody");
				
				var iRow = (i+1);
				
				$("#breed_tbody div#BREED_INDEX_DIV").eq(iRow).html(iRow); 
				$("#breed_tbody div#BREED_INDEX_DIV").eq(iRow).attr('data-val',iRow); 
				$("#breed_tbody div#TXT_NSRDATE_DIV").eq(iRow).html(data.TXT_NSRDATE); 
				$("#breed_tbody div#TXT_DAIO_RESN_DIV").eq(iRow).html(data.TXT_DAIO_RESN); 
				$("#breed_tbody div#MDI_DPTNAME_DIV").eq(iRow).html("[" + data.MDI_DPTNAME + "]" + data.MTI_TEAMNAME); 
				$("#breed_tbody div#MVI_VVRMNAME_DIV").eq(iRow).html(data.MVI_VVRMNAME); 
				$("#breed_tbody div#TXT_MAI_ANICODE_1_DIV").eq(iRow).html(data.TXT_MAI_ANICODE_1); 
				$("#breed_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
				$("#breed_tbody div#MAI_ANICODE_DIV").eq(iRow).html(data.MAI_ANICODE); 
				$("#breed_tbody div#MAI_SEX_M_DIV").eq(iRow).html(data.MAI_SEX_M); 
				$("#breed_tbody div#MAI_SEX_F_DIV").eq(iRow).html(data.MAI_SEX_F); 
				$("#breed_tbody div#MAI_SEX_A_DIV").eq(iRow).html(data.MAI_SEX_A); 
				$("#breed_tbody div#CNT_MAI_SEX_DIV").eq(iRow).html(data.CNT_MAI_SEX); 
				
			}
			$("#breed_tbody").append($("#breedTot_tbody tr:last"));
			$("#breed_tbody tr:first").attr('style',"display:none");
	 	}
	}
	function fn_sta_selectAniBreedList(callback, retObj) {
		fc_clearRow("breed_tbody");

		var targetUrl = "/stat/0605/selectAniBreedList.do";
		var param = {
				cal_1 : $("#sch_tbody #cal_1").val()
		};
		
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function fn_sta_selectAniBreedTotList(param, callback, retObj) {
		fc_clearRow("breed_tbody");
		fc_clearRow("breedTot_tbody");

		var targetUrl = "/stat/0605/selectAniBreedTotList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function fn_sta_selectAniBreedSta(){
		var param = {
				cal_1 : $("#sch_tbody #cal_1").val()
		};
		fn_sta_selectAniBreedTotList(param, selectAniBreedTotList);
	}

	$(document).ready(function() {
		fc_clearRow("breed_tbody");
		fc_clearRow("breedTot_tbody");
	});
	
</script>

<title>현황/통계 &gt; 보육현황</title>
</head>
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
                    <p class="contents_title">보육현황</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 현황/통계</li>
                        <li>> 보육현황</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 보육현황 조회 -->
					<div class="aniinfo_search_box">
                        <table class="aniinfo_search" >
							<caption>보육현황 조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody id="sch_tbody">
								<tr>
									<th scope="row">일자</th>
									<td><p><input type="text" class="calendar1" id="cal_1" value="${calInfo.cal_1}"><label for="cal_1"></label></p></td>
								</tr>
								<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_sta_selectAniBreedSta();" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					<!-- //보육현황 조회 -->

					<div id="breedTot_div">
						<table class="aniinfo_add table_view ">
							<tbody id="breedTot_tbody" style="display:none;">
								<tr style="display:none;">
									<th scope="row"  colspan="8"><div id="tot_MAC_ANICODE1_DIV" data-val=''></div><div id="tot_TXT_MAI_ANICODE_1_DIV" data-val=''></div></th>
									<td><div id="tot_MAI_SEX_M_DIV" data-val=''></div></td>
									<td><div id="tot_MAI_SEX_F_DIV" data-val=''></div></td>
									<td><div id="tot_MAI_SEX_A_DIV" data-val=''></div></td>
									<td><div id="tot_TOT_MAI_SEX_DIV" data-val=''></div></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- 동물보육현황 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">동물보육현황</span>
							<div class="sys_btn_box">
								<span class="align_right btn_hide"><a href="#" class="excel_btn">엑셀</a><a href="#" class="print_btn btn_type2">프린트</a></span>
							</div>
						</div>
						<table class="aniinfo_add table_view" >
							<caption>동물보육현황</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:20%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:8%;">
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
									<th scope="col" rowspan="2" style="vertical-align:middle;">부서명</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">동물사</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">분류명</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">동물명</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">동물번호</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">증가사유</th>
									<th scope="colgroup" colspan="4">동물 수</th>
								</tr>
								<tr>
									<th scope="col">수</th>
									<th scope="col">암</th>
									<th scope="col">미상</th>
									<th scope="col">합계</th>
								</tr>
							</thead>
							<tbody id="breed_tbody">
								<tr style="display:none">
									<th scope="row"><div id="BREED_INDEX_DIV" data-val=''></div></th>
									<td><div id="TXT_NSRDATE_DIV" data-val=''></div></td>
									<td><div id="MDI_DPTNAME_DIV" data-val=''></div></td>
									<td><div id="MVI_VVRMNAME_DIV" data-val=''></div></td>
									<td><div id="TXT_MAI_ANICODE_1_DIV" data-val=''></div></td>
									<td><div id="MAC_NAME_DIV" data-val=''></div></td>
									<td><div id="MAI_ANICODE_DIV" data-val=''></div></td>
									<td><div id="TXT_DAIO_RESN_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_M_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_F_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_A_DIV" data-val=''></div></td>
									<td><div id="CNT_MAI_SEX_DIV" data-val=''></div></td>
								</tr>
								<tr>
									<th scope="row"  colspan="8">[파충강] 소계</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
								</tr>
							</tbody>
							<tfoot id="breedTot_tfoot">
								<tr>
									<th scope="colgroup" colspan="8">총 합계</th>
									<td><div id="MAI_SEX_M_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_F_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_A_DIV" data-val=''></div></td>
									<td><div id="TOT_MAI_SEX_DIV" data-val=''></div></td>
								</tr>
							</tfoot>
						</table>
					</div>
					
  					<!-- //동물보육현황 -->

				
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
