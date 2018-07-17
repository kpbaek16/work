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
<script src='/js/contents/Nwagon.js'></script>
<script src="/js/common/json2.js"></script>
<script>
	function selectAniVvrmTotList(result){
	 	if(result!=null){
	//		console.log("selectAniVvrmTotList:" + JSON.stringify(result));
			console.log("result.length==>" + result.length);
			
			$("#clsTot_tbody tr:first").attr('style',"display:");
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("clsTot_tbody");
					
				var iRow = (i+1);
				$("#clsTot_tbody div#MTI_TEAMNO_DIV").eq(iRow).attr('data-val', data.MTI_TEAMNO_DIV); 
				$("#clsTot_tbody div#TXT_TEAMNAME_DIV").eq(iRow).html("[" + data.TXT_TEAMNAME + "]"); 
				$("#clsTot_tbody div#TXT_DPT_TEAM_DIV").eq(iRow).html("[" + data.TXT_TEAMNAME + "] 합계"); 
				$("#clsTot_tbody div#CNT_MAI_SEX_M_DIV").eq(iRow).html(data.CNT_MAI_SEX_M); 
				$("#clsTot_tbody div#CNT_MAI_SEX_F_DIV").eq(iRow).html(data.CNT_MAI_SEX_F); 
				$("#clsTot_tbody div#CNT_MAI_SEX_A_DIV").eq(iRow).html(data.CNT_MAI_SEX_A); 
				$("#clsTot_tbody div#CNT_MAI_SEX_DIV").eq(iRow).html(data.CNT_MAI_SEX); 
				$("#clsTot_tbody div#CNT_BOYUK_DIV").eq(iRow).html(data.CNT_BOYUK); 
	
				if(i!=0){
					$("div#ANILIST_DIV").append($("div#ANIINFO_DIV").html());
				}
			}
			$("#clsTot_tbody tr:first").attr('style',"display:none");
			
			if(result.length > 0){
				$("div#TEAM_DIV").attr('style',"display:");
				$("div#TEAM_DIV").each(function(i_tot){
					var i_totRow = (i_tot+1);
					$(this).find("div#MTI_TEAMNO_DIV").attr('data-val', $("#clsTot_tbody div#MTI_TEAMNO_DIV").eq(i_totRow).attr('data-val')); 
	
					$(this).find("div#TXT_TEAMNAME_DIV").html($("#clsTot_tbody div#TXT_TEAMNAME_DIV").eq(i_totRow).html());
					$(this).find("div#TXT_DPT_TEAM_DIV").html("[" + $("#clsTot_tbody div#TXT_TEAMNAME_DIV").eq(i_totRow).html() + "] 합계");
					$(this).find("#ani_tot_tbody div#MAC_NAME_DIV").html($("#clsTot_tbody div#MAC_NAME_DIV").eq(i_totRow).html()); 
					$(this).find("#ani_tot_tbody div#CNT_MAI_SEX_M_DIV").html($("#clsTot_tbody div#CNT_MAI_SEX_M_DIV").eq(i_totRow).html()); 
					$(this).find("#ani_tot_tbody div#CNT_MAI_SEX_F_DIV").html($("#clsTot_tbody div#CNT_MAI_SEX_F_DIV").eq(i_totRow).html()); 
					$(this).find("#ani_tot_tbody div#CNT_MAI_SEX_A_DIV").html($("#clsTot_tbody div#CNT_MAI_SEX_A_DIV").eq(i_totRow).html()); 
					$(this).find("#ani_tot_tbody div#CNT_MAI_SEX_DIV").html($("#clsTot_tbody div#CNT_MAI_SEX_DIV").eq(i_totRow).html()); 
					$(this).find("#ani_tot_tbody div#CNT_BOYUK_DIV").html($("#clsTot_tbody div#CNT_BOYUK_DIV").eq(i_totRow).html()); 
				});
				fn_sta_selectAniVvrmList(selectAniVvrmList);
			}else{
				$("div#TEAM_DIV").attr('style',"display:none");
			}
			
	 	}
	}
	function selectAniVvrmList(result){
	 	if(result!=null){
	//		console.log("test:" + JSON.stringify(result));
			console.log("result.length==>" + result.length);
			$("#cls_tbody tr:first").attr('style',"display:");
			
			for(var i=0; i<result.length; i++){
				var data = result[i];
				
				fc_addRow("cls_tbody");
	
				var iRow = (i+1);
				$("#cls_tbody div#CLS_INDEX_DIV").eq(iRow).attr('data-val',iRow); 
	//			$("#cls_tbody div#CLS_INDEX_DIV").eq(iRow).html(iRow); 
				$("#cls_tbody div#CLS_INDEX_DIV").eq(iRow).html(data.ANILIST_ROW); 
				$("#cls_tbody div#MVI_VVRMNAME_DIV").eq(iRow).html(data.MVI_VVRMNAME); 
				$("#cls_tbody div#TXT_MAI_ANICODE_DIV").eq(iRow).html(data.TXT_MAI_ANICODE); 
				$("#cls_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
				
				$("#cls_tbody div#CNT_MAI_SEX_M_DIV").eq(iRow).html(data.CNT_MAI_SEX_M); 
				$("#cls_tbody div#CNT_MAI_SEX_F_DIV").eq(iRow).html(data.CNT_MAI_SEX_F); 
				$("#cls_tbody div#CNT_MAI_SEX_A_DIV").eq(iRow).html(data.CNT_MAI_SEX_A); 
				$("#cls_tbody div#CNT_MAI_SEX_DIV").eq(iRow).html(data.CNT_MAI_SEX); 
				$("#cls_tbody div#CNT_BOYUK_DIV").eq(iRow).html(data.CNT_BOYUK); 

				$("div#TEAM_DIV").eq(data.ANI_ROW-1).find("#ani_list_tbody").append($("#cls_tbody tr").eq(iRow).clone());
	//			console.log($("#ani_list_tbody tr").eq(i).find("div#CLS_INDEX_DIV").html());
				
			}
			
			$("#cls_tbody tr:first").attr('style',"display:none");
			$("#cls_tbody").append($("#tot_tbody tr:last"));
			
	 	}
	}
	function fn_sta_selectAniVvrmList(callback, retObj) {
		console.log("****fn_sta_selectAniVvrmList");
	
		fc_clearRow("cls_tbody");
		
		var targetUrl = "/stat/0602/selectAniVvrmList.do";
		var param = {
				cal_1 : $("#sch_tbody #cal_1").val(),
				schVvrm : $("#sch_tbody #schVvrm").val()
		};
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}
	
	function fn_sta_selectAniVvrmTotList(param, callback, retObj) {
		fc_clearRow("clsTot_tbody");
	
		var targetUrl = "/stat/0602/selectAniVvrmTotList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}
	
	function fn_sta_selectAniVvrmSta(){
		$("div#ANILIST_DIV").html("");
		$("div#ANIINFO_DIV #ani_list_tbody tr").each(function(index){
			$(this).remove();
		});
	
		var param = {
				cal_1 : $("#sch_tbody #cal_1").val(),
				schVvrm : $("#sch_tbody #schVvrm").val()
		};
		fn_sta_selectAniVvrmTotList(param, selectAniVvrmTotList);
	}
	
	$(document).ready(function() {
		getComboVvrm("#sch_tbody #schVvrm");
	//	$("div#TEAM_DIV").attr('style',"display:none");
	});

</script>

<title>현황/통계 &gt; 동물사별현황</title>
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
                    <p class="contents_title">동물사별현황</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 현황/통계</li>
                        <li>> 동물사별현황</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 동물사별현황 조회 -->
					<div class="aniinfo_search_box">
                        <table class="aniinfo_search" >
							<caption>동물사별현황 조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody id="sch_tbody">
								<tr>
									<th scope="row">일자</th>
									<td><p><input type="text" class="calendar1" id="cal_1" value="${calInfo.cal_1}"><label for="cal_1"></label></p></td>
								</tr>
								<tr>
									<th scope="row">동물사 선택</th>
									<td>
										<div class="select_box">			
											<select name="schVvrm" id="schVvrm">
											<option value="">동물사 선택</option>
											</select>
										</div>
									</td>
								</tr>
								<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_sta_selectAniVvrmSta();" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					<!-- //동물사별현황 조회 -->

					<!-- [동물사] 팀 -->
					<div class="aniinfo_add_box" style="display:none">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus"><img src="/images/btn_minus.gif" alt=""></a>[동물교실] 자연학습팀</span>
							<div class="sys_btn_box">
								<span class="align_right btn_hide"><a href="#" class="excel_btn">엑셀</a><a href="#" class="print_btn btn_type2">프린트</a></span>
							</div>
						</div>
						<table class="aniinfo_add table_view" >
							<caption>[동물교실] 자연학습팀</caption>
							<colgroup>
								<col style="width:7%;">
								<col style="width:12%;">
								<col style="width:16%;">
								<col style="width:20%;">
								<col style="width:9%;">
								<col style="width:9%;">
								<col style="width:9%;">
								<col style="width:9%;">
								<col style="width:9%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" rowspan="2" style="vertical-align:middle;">No</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">동물사명</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">분류명</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">동물명</th>
									<th scope="colgroup" colspan="4">동물 수</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">보육</th>
								</tr>
								<tr>
									<th scope="col">수</th>
									<th scope="col">암</th>
									<th scope="col">미상</th>
									<th scope="col">합계</th>
								</tr>
							</thead>
							<tbody id="cls_tbody">
								<tr style="display:none">
									<th scope="row"><div id="CLS_INDEX_DIV" data-val=''>
									<div id="MTI_TEAMNO_DIV" data-val=''></div>
									</th>
									<td><div id="MVI_VVRMNAME_DIV" data-val=''></div></td>
									<td><div id="TXT_MAI_ANICODE_DIV" data-val=''></div></td>
									<td><div id="MAC_NAME_DIV" data-val=''></div></td>
									<td><div id="CNT_MAI_SEX_M_DIV" data-val=''></div></td>
									<td><div id="CNT_MAI_SEX_F_DIV" data-val=''></div></td>
									<td><div id="CNT_MAI_SEX_A_DIV" data-val=''></div></td>
									<td><div id="CNT_MAI_SEX_DIV" data-val=''></div></td>
									<td><div id="CNT_BOYUK_DIV" data-val=''></div></td>
								</tr>
							</tbody>
							<tbody id="clsTot_tbody">
								<tr style="display:none">
									<th scope="colgroup" colspan="4"><div id="TXT_TEAMNAME_DIV" data-val=''></div></th>
									<td><div id="CNT_MAI_SEX_M_DIV" data-val=''></div></td>
									<td><div id="CNT_MAI_SEX_F_DIV" data-val=''></div></td>
									<td><div id="CNT_MAI_SEX_A_DIV" data-val=''></div></td>
									<td><div id="CNT_MAI_SEX_DIV" data-val=''></div></td>
									<td><div id="CNT_BOYUK_DIV" data-val=''></div></td>
								</tr>
							</tbody>
						</table>
						<table class="aniinfo_add table_view" style="margin-top:10px;" >
							<caption></caption>
								<colgroup>
								<col style="width:7%;">
								<col style="width:12%;">
								<col style="width:16%;">
								<col style="width:20%;">
								<col style="width:9%;">
								<col style="width:9%;">
								<col style="width:9%;">
								<col style="width:9%;">
								<col style="width:9%;">
								</colgroup>
							<thead>
								<tr>
									<th scope="col" rowspan="2" style="vertical-align:middle;">No</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">동물사명</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">분류명</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">동물명</th>
									<th scope="colgroup" colspan="4">동물 수</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">보육</th>
								</tr>
								<tr>
									<th scope="col">수</th>
									<th scope="col">암</th>
									<th scope="col">미상</th>
									<th scope="col">합계</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="colgroup" colspan="4">합계</th>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
						<div id="Nwagon1" class="aniinfo_add table_view" style="margin-top:10px;"></div>
						<script>
							var options = {
								'legend': {
									names: ['동물교실','동물기획과','합계'],
									hrefs: []
								},
								'dataset': {
									title: 'Playing time per day',
									values: [[3,0,1], [3,2,1], [4,5,6]],
									colorset: ['#30a1ce','#DC143C', '#FF8C00'],
									fields:['수', '암', '미상']
								},
								'chartDiv': 'Nwagon1',
								'chartType': 'multi_column',
								'chartSize': { width: 990, height: 300 },
								'maxValue': 6,
								'increment': 2
							};
//							Nwagon.chart(options);
						</script>

					</div>
					
  					<!-- //[동물교실] 자연학습팀 -->

					<div id="ANILIST_DIV" style="display:;"></div>

					<div id="ANIINFO_DIV" style="display:;">
					<!-- [동물기획과] 자연학습팀 -->
						<div class="aniinfo_add_box" id="TEAM_DIV">
							<div id="MTI_TEAMNO_DIV" data-val=''></div>
							<div class="table_title_box">
								<span class="table_title"><a href="#" id="btn_plus2"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus2"><img src="/images/btn_minus.gif" alt=""></a><div id="TXT_TEAMNAME_DIV" data-val=''></div></span>
								<div class="sys_btn_box">
									<span class="align_right btn_hide2"><a href="#" class="excel_btn">엑셀</a><a href="#" class="print_btn btn_type2">프린트</a></span>
								</div>
							</div>
							<table class="aniinfo_add table_view2" >
								<caption>[동물기획과] 자연학습팀</caption>
								<colgroup>
									<col style="width:7%;">
									<col style="width:12%;">
									<col style="width:16%;">
									<col style="width:20%;">
									<col style="width:9%;">
									<col style="width:9%;">
									<col style="width:9%;">
									<col style="width:9%;">
									<col style="width:9%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" rowspan="2" style="vertical-align:middle;">No</th>
										<th scope="col" rowspan="2" style="vertical-align:middle;">동물사명</th>
										<th scope="col" rowspan="2" style="vertical-align:middle;">분류명</th>
										<th scope="col" rowspan="2" style="vertical-align:middle;">동물명</th>
										<th scope="colgroup" colspan="4">동물 수</th>
										<th scope="col" rowspan="2" style="vertical-align:middle;">보육</th>
									</tr>
									<tr>
										<th scope="col">수</th>
										<th scope="col">암</th>
										<th scope="col">미상</th>
										<th scope="col">합계</th>
									</tr>
								</thead>
								<tbody id="ani_list_tbody">
								</tbody>
								<!-- <tfoot>
									<tr>
										<th scope="colgroup" colspan="4">[동물교실] 소계</th>
										<td>3</td>
										<td>10</td>
										<td>14</td>
										<td>27</td>
										<td>0</td>
									</tr>
								</tfoot> -->
								<tbody id="ani_tot_tbody">
									<tr>
										<th scope="colgroup" colspan="4"><div id="TXT_DPT_TEAM_DIV" data-val=''></div></th>
										<td><div id="CNT_MAI_SEX_M_DIV" data-val=''></div></td>
										<td><div id="CNT_MAI_SEX_F_DIV" data-val=''></div></td>
										<td><div id="CNT_MAI_SEX_A_DIV" data-val=''></div></td>
										<td><div id="CNT_MAI_SEX_DIV" data-val=''></div></td>
										<td><div id="CNT_BOYUK_DIV" data-val=''></div></td>
									</tr>
								</tbody>
							</table>
							<div id="Nwagon2" class="aniinfo_add table_view2" style="margin-top:10px;"></div>
							<script>
								var options = {
									'legend': {
										names: ['동물교실','동물기획과','합계'],
										hrefs: []
									},
									'dataset': {
										title: 'Playing time per day',
										values: [[3,0,1], [3,2,1], [4,5,6]],
										colorset: ['#30a1ce','#DC143C', '#FF8C00'],
										fields:['수', '암', '미상']
									},
									'chartDiv': 'Nwagon2',
									'chartType': 'multi_column',
									'chartSize': { width: 990, height: 300 },
									'maxValue': 6,
									'increment': 2
								};
	//							Nwagon.chart(options);
							</script>
	
						</div>
						
	  					<!-- //[동물교실] 자연학습팀 -->
					</div>
					
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
					<!-- 합계 -->
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
