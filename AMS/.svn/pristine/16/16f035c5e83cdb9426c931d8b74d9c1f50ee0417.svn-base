<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
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
	function selectAniDeadList(result){
	 	if(result!=null){
//			console.log("test:" + JSON.stringify(result));
			console.log("result.length==>" + result.length);
			$("#dead_tbody tr:first").attr('style',"display:");
			
			for(var i=0; i<result.length; i++){
				var data = result[i];
				
				fc_addRow("dead_tbody");
				
				var iRow = (i+1);
				
				$("#dead_tbody div#DEAD_INDEX_DIV").eq(iRow).html(iRow); 
				$("#dead_tbody div#DEAD_INDEX_DIV").eq(iRow).attr('data-val',iRow); 
				
				$("#dead_tbody div#TXT_MAI_DETHDATE_DIV").eq(iRow).html(data.TXT_MAI_DETHDATE); 
				$("#dead_tbody div#TXT_MAI_ANICODE_1_DIV").eq(iRow).html(data.TXT_MAI_ANICODE_1); 
				$("#dead_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
				$("#dead_tbody div#MAI_ANICODE_DIV").eq(iRow).html(data.MAI_ANICODE); 
				$("#dead_tbody div#PBR_WEIGHT_DIV").eq(iRow).html(data.PBR_WEIGHT); 
				$("#dead_tbody div#PBR_BUDZZNAME_DIV").eq(iRow).html(data.PBR_BUDZZNAME); 
				$("#dead_tbody div#TXT_MAI_SEX_DIV").eq(iRow).html(data.TXT_MAI_SEX); 
				$("#dead_tbody div#TXT_MAI_BIRTHDAY_DIV").eq(iRow).html(data.TXT_MAI_BIRTHDAY); 
				$("#dead_tbody div#MAI_DETHPLC_DIV").eq(iRow).html(data.MAI_DETHPLC); 
				$("#dead_tbody div#TXT_MAC_RANK_DIV").eq(iRow).html(data.TXT_MAC_RANK); 
				$("#dead_tbody div#TXT_MAC_CITES_DIV").eq(iRow).html(data.TXT_MAC_CITES); 
				$("#dead_tbody div#MAC_NATMON_DIV").eq(iRow).html(data.MAC_NATMON); 
				$("#dead_tbody div#PBR_BUDZZNAME_DIV").eq(iRow).html(data.PBR_BUDZZNAME); 
				$("#dead_tbody div#TXT_MAI_DETHBDYPRC_DIV").eq(iRow).html(data.TXT_MAI_DETHBDYPRC); 
				
				$("#dead_tbody div#MVI_VVRMNAME_DIV").eq(iRow).html(data.MVI_VVRMNAME); 
				
			}
			$("#dead_tbody tr:first").attr('style',"display:none");
			$("#dead_tbody").append($("#tot_tbody tr:last"));
	 	}
	}
	function fn_sta_selectAniDeadList(param, callback, retObj) {
		console.log("****fn_sta_selectAniDeadList");

		fc_clearRow("dead_tbody");

		var targetUrl = "/stat/0608/selectAniDeadList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function fn_sta_selectAniDeadSta(){
		var param = {
				schYear : $("#sch_dead_tbody #schYear").val(),
				schMonth : $("#sch_dead_tbody #schMonth").val()
		};
		fn_sta_selectAniDeadList(param, selectAniDeadList);
	}

	$(document).ready(function() {
		getComboAniCites("#sch_cites_tbody #sch_cites");
		$("#sch_dead_tbody #schYear").val('${nowInfo.year}');
		$("#sch_dead_tbody #schMonth").val('${nowInfo.month}');
	});
</script>

<title>현황/통계 &gt; 폐사현황</title>
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
                    <p class="contents_title">폐사현황</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 현황/통계</li>
                        <li>> 폐사현황</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">

					<!-- tab_menu -->
					<div class="tab_menu" style="margin-top:0px;">
						<ul>
							<li class="on"><a href="#tab01">폐사현황</a></li>
							<li><a href="#tab02">분류명별</a></li>
							<li><a href="#tab03">등급별</a></li>
							<li><a href="#tab04">연령별</a></li>
							<li><a href="#tab05">원인별</a></li>
						</ul>
					</div>
					<!-- // tab_menu -->

					<!-- tab01 -->	
					<div class="tab_cont" id="tab01">	
						<!-- 폐사현황 조회 -->
						<div class="aniinfo_search_box" style="margin-top:40px;">
							<table class="aniinfo_search" >
								<caption>폐사현황 조회</caption>
								<colgroup>
									<col style="width:20%;">
									<col style="width:80%;">
								</colgroup>
								<tbody id="sch_dead_tbody">
									<tr>
										<th scope="row">년월</th>
										<td><p>
											<div class="select_box">
												<select name="schYear" id="schYear" style="width: 120px">
												<option value="">전체</option>
												<c:forEach var="years" varStatus="status" begin="2000" end="${nowInfo.year}">
												<option value="${status.index}">${status.index}년도</option>
												</c:forEach>
												</select>
												<select name="schMonth" id="schMonth" style="width: 120px">
												<option value="">전체</option>
												<c:forEach var="month" varStatus="status" begin="1" end="12">
												<option value="${status.index}">${status.index}월</option>
												</c:forEach>
												</select>
											</div>
										
										</p></td>
									</tr>
									<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_sta_selectAniDeadSta();" class="search_btn">조회</a></th></tr>
							   </tbody>
							</table>
						</div>
						<!-- //폐사현황 조회 -->

						<!-- 폐사현황 -->
						<div class="aniinfo_add_box">
							<div class="table_title_box">
								<span class="table_title">동물폐사현황</span>
								<div class="sys_btn_box">
									<span class="align_right btn_hide"><a href="#" class="excel_btn">엑셀</a><a href="#" class="print_btn btn_type2">프린트</a></span>
								</div>
							</div>
							<table class="aniinfo_add table_view table_td_margin" >
								<caption>동물폐사현황</caption>
								<colgroup>
									<col style="width:4%;">
									<col style="width:7%;">
									<col style="width:5%;">
									<col style="width:7%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:7%;">
									<col style="width:4%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:7%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">No</th>
										<th scope="col">폐사일시</th>
										<th scope="col">분류명</th>
										<th scope="col">동물명</th>
										<th scope="col">동물번호</th>
										<th scope="col">중량</th>
										<th scope="col">병리진단명</th>
										<th scope="col">성별</th>
										<th scope="col">생년월일</th>
										<th scope="col">폐사장소</th>
										<th scope="col">갑을병</th>
										<th scope="col">CITES</th>
										<th scope="col">천연기념물</th>
										<th scope="col">질명구분</th>
										<th scope="col">폐체처리</th>
										<th scope="col">생존기간</th>
										<th scope="col">동물사</th>
									</tr>
								</thead>
								<tbody id="dead_tbody">
								<tr style="display:none">
										<th scope="row"><div id="DEAD_INDEX_DIV" data-val=''></div></th>
										<td><div id="TXT_MAI_DETHDATE_DIV" data-val=''></div></td>
										<td><div id="TXT_MAI_ANICODE_1_DIV" data-val=''></div></td>
										<td><div id="MAC_NAME_DIV" data-val=''></div></td>
										<td><div id="MAI_ANICODE_DIV" data-val=''></div></td>
										<td><div id="PBR_WEIGHT_DIV" data-val=''></div></td>
										<td><div id="PBR_BUDZZNAME_DIV" data-val=''></div></td>
										<td><div id="TXT_MAI_SEX_DIV" data-val=''></div></td>
										<td><div id="TXT_MAI_BIRTHDAY_DIV" data-val=''></div></td>
										<td><div id="MAI_DETHPLC_DIV" data-val=''></div></td>
										<td><div id="TXT_MAC_RANK_DIV" data-val=''></div></td>
										<td><div id="TXT_MAC_CITES_DIV" data-val=''></div></td>
										<td><div id="MAC_NATMON_DIV" data-val=''></div></td>
										<td><div id="PBR_BUDZZNAME_DIV" data-val=''></div></td>
										<td><div id="TXT_MAI_DETHBDYPRC_DIV" data-val=''></div></td>
										<td><div id="" data-val=''></div></td>
										<td><div id="MVI_VVRMNAME_DIV" data-val=''></div></td>
									</tr>
								</tbody>
								
							</table>
						</div>
						<!-- //폐사현황 -->
					</div>
					<!-- //tab01 -->

					<!-- tab02 -->	
					<div class="tab_cont" id="tab02">	
						<!-- 분류명별 조회 -->
						<div class="aniinfo_search_box" style="margin-top:40px;">
							<table class="aniinfo_search" >
								<caption>분류명별 조회</caption>
								<colgroup>
									<col style="width:20%;">
									<col style="width:80%;">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">기간종류</th>
										<td>
											<p>
											  <label><input type="radio" name="align" value="계절" class="search_radio"/>계절</label>
											  <label><input type="radio" name="align" value="월" class="search_radio"/>월</label>
											  <label><input type="radio" name="align" value="일" class="search_radio type1"/>일</label>
											</p>
										</td>
									</tr>
									<tr>
										<th scope="row">동물 종</th>
										<td>
											<input type="checkbox" id="tab2_check1"><label for="tab2_check1">전체</label>
											<input type="checkbox" id="tab2_check2"><label for="tab2_check2">포유류</label>
											<input type="checkbox" id="tab2_check3"><label for="tab2_check3">조류</label>
											<input type="checkbox" id="tab2_check4"><label for="tab2_check4">파충류</label>
											<input type="checkbox" id="tab2_check5"><label for="tab2_check5">양서류</label>
											<input type="checkbox" id="tab2_check6"><label for="tab2_check6">곤충류</label>
											<input type="checkbox" id="tab2_check7"><label for="tab2_check7">어류</label>
										</td>
									</tr>
									<tr>
										<th scope="row">년월</th>
										<td><p>
											<div class="select_box">
												<select name="schYear" id="schYear" style="width: 120px">
												<c:forEach var="years" varStatus="status" begin="2000" end="${nowInfo.year}">
												<option value="${status.index}">${status.index}년도</option>
												</c:forEach>
												</select>
												<select name="전체" id="tab1_table_sel1" style="width: 120px">
												<option value="전체">전체</option>
												<c:forEach var="month" varStatus="status" begin="1" end="12">
												<option value="${status.index}">${status.index}월</option>
												</c:forEach>
												</select>
											</div>
										
										</p></td>
									</tr>
									<tr><th colspan="2" scope="col" class="search_btn_area"><a href="#" class="search_btn">조회</a></th></tr>
							   </tbody>
							</table>
						</div>
						<!-- //분류명별 조회 -->

						<!-- 분류명별 -->
						<div class="aniinfo_add_box">
							<div class="table_title_box">
								<span class="table_title">2016년 폐사현황</span>
								<!-- <div class="sys_btn_box">
									<span class="align_right btn_hide"><a href="#" class="excel_btn">엑셀</a><a href="#" class="print_btn btn_type2">프린트</a></span>
								</div> -->
							</div>
							<table class="aniinfo_add table_view table_td_margin" >
								<caption>폐사현황</caption>
								<colgroup>
									<col style="width:7%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									
								</colgroup>
								<thead>
									<tr>
										<th scope="col" style="line-height:15px; vertical-align:middle">분류군<br>/월</th>
										<th scope="col" style="vertical-align:middle">1</th>
										<th scope="col" style="vertical-align:middle">2</th>
										<th scope="col" style="vertical-align:middle">3</th>
										<th scope="col" style="vertical-align:middle">4</th>
										<th scope="col" style="vertical-align:middle">5</th>
										<th scope="col" style="vertical-align:middle">6</th>
										<th scope="col" style="vertical-align:middle">7</th>
										<th scope="col" style="vertical-align:middle">8</th>
										<th scope="col" style="vertical-align:middle">9</th>
										<th scope="col" style="vertical-align:middle">10</th>
										<th scope="col" style="vertical-align:middle">11</th>
										<th scope="col" style="vertical-align:middle">12</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">양서강</th>
										<td>1</td>
										<td>0</td>
										<td>2</td>
										<td>1</td>
										<td>3</td>
										<td>0</td>
										<td>0</td>
										<td>0</td>
										<td>5</td>
										<td>0</td>
										<td>1</td>
										<td>0</td>
									</tr>
									<tr>
										<th scope="row">조강</th>
										<td>1</td>
										<td>0</td>
										<td>2</td>
										<td>1</td>
										<td>3</td>
										<td>0</td>
										<td>0</td>
										<td>0</td>
										<td>5</td>
										<td>0</td>
										<td>1</td>
										<td>0</td>
									</tr>
									<tr>
										<th scope="row">포충강</th>
										<td>1</td>
										<td>0</td>
										<td>2</td>
										<td>1</td>
										<td>3</td>
										<td>0</td>
										<td>0</td>
										<td>0</td>
										<td>5</td>
										<td>0</td>
										<td>1</td>
										<td>0</td>
									</tr>
																
								</tbody>
								<tfoot>
									<tr>
										<th scope="row">총 합계</th>
										<td>1</td>
										<td>0</td>
										<td>2</td>
										<td>1</td>
										<td>3</td>
										<td>0</td>
										<td>0</td>
										<td>0</td>
										<td>5</td>
										<td>0</td>
										<td>1</td>
										<td>0</td>
									</tr>
								</tfoot>
								
							</table>
						
							<div id="chart1" class="aniinfo_add table_view" style="margin-top:10px;"></div>
							<script>
								var options = {
									'legend':{
										names: ['1일','2일','3일','4일','5일','6일','7일','8일','9일','10일','11일','12일','13일','14일','15일','16일','17일','18일','19일','20일','21일','22일','23일','24일','25일','26일','27일','28일','29일','30일','31일'],
										hrefs: []
											},
									'dataset':{
										title:'폐사현황', 
										values: [[5,2,2,8,4], [4,7,1,5,2], [4,2,6,3,4], [2,5,9,1,3], [2,4,8,1,5], [4,6,1,5,10], [3,2,4,8,2], [7,6,1,9,1],[2,3,1,6,4], [4,6,1,11,3], [1,2,4,7,5], [9,6,1,9,6],[3,2,2,8,4], [1,2,1,5,2], [4,2,1,3,4], [6,5,1,3,3], [2,3,1,5,5], [4,6,1,5,10], [1,2,4,8,2], [9,6,1,9,1],[2,3,1,6,4], [4,6,1,11,3], [4,10,4,7,5], [3,6,1,9,6],[12,5,1,1,3], [2,13,5,8,5], [4,6,1,5,10], [6,2,4,8,2], [3,6,5,9,1],[2,3,1,6,4], [4,6,7,11,3]],
										colorset: ['#30a1ce','#DC143C', '#FF8C00','#888','#1dbc7e'],
										fields:['양서강', '곤충강', '포유강','조강','파충강']
										},
									'chartDiv' : 'chart1',
									'chartType' : 'stacked_column',
									'chartSize' : {width:990, height:300},
									'maxValue' : 50,
									'increment' : 5
								};

//								Nwagon.chart(options);

							</script>
							

						</div>



						<!-- 분류명별 -->
						<div class="aniinfo_add_box">
							<div class="table_title_box">
								<span class="table_title">2016년 폐사현황</span>
								<!-- <div class="sys_btn_box">
									<span class="align_right btn_hide"><a href="#" class="excel_btn">엑셀</a><a href="#" class="print_btn btn_type2">프린트</a></span>
								</div> -->
							</div>
							<table class="aniinfo_add table_view table_td_margin" >
								<caption>폐사현황</caption>
								<colgroup>
									<col style="width:7%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									
								</colgroup>
								<thead>
									<tr>
										<th scope="col" style="line-height:15px; vertical-align:middle">분류군<br>/계절</th>
										<th scope="col" style="vertical-align:middle">3-5(봄)</th>
										<th scope="col" style="vertical-align:middle">6-8(여름)</th>
										<th scope="col" style="vertical-align:middle">9-11(가을)</th>
										<th scope="col" style="vertical-align:middle">12-2(겨울)</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">양서강</th>
										<td>1</td>
										<td>0</td>
										<td>2</td>
										<td>1</td>
									</tr>
									<tr>
										<th scope="row">조강</th>
										<td>1</td>
										<td>0</td>
										<td>2</td>
										<td>1</td>
									</tr>
									<tr>
										<th scope="row">포충강</th>
										<td>1</td>
										<td>0</td>
										<td>2</td>
										<td>1</td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<th scope="row">총 합계</th>
										<td>1</td>
										<td>0</td>
										<td>2</td>
										<td>1</td>
									</tr>
								</tfoot>
								
							</table>
						
							<div id="chart1" class="aniinfo_add table_view" style="margin-top:10px;"></div>
							<script>
								var options = {
									'legend':{
										names: ['1일','2일','3일','4일','5일','6일','7일','8일','9일','10일','11일','12일','13일','14일','15일','16일','17일','18일','19일','20일','21일','22일','23일','24일','25일','26일','27일','28일','29일','30일','31일'],
										hrefs: []
											},
									'dataset':{
										title:'폐사현황', 
										values: [[5,2,2,8,4], [4,7,1,5,2], [4,2,6,3,4], [2,5,9,1,3], [2,4,8,1,5], [4,6,1,5,10], [3,2,4,8,2], [7,6,1,9,1],[2,3,1,6,4], [4,6,1,11,3], [1,2,4,7,5], [9,6,1,9,6],[3,2,2,8,4], [1,2,1,5,2], [4,2,1,3,4], [6,5,1,3,3], [2,3,1,5,5], [4,6,1,5,10], [1,2,4,8,2], [9,6,1,9,1],[2,3,1,6,4], [4,6,1,11,3], [4,10,4,7,5], [3,6,1,9,6],[12,5,1,1,3], [2,13,5,8,5], [4,6,1,5,10], [6,2,4,8,2], [3,6,5,9,1],[2,3,1,6,4], [4,6,7,11,3]],
										colorset: ['#30a1ce','#DC143C', '#FF8C00','#888','#1dbc7e'],
										fields:['양서강', '곤충강', '포유강','조강','파충강']
										},
									'chartDiv' : 'chart1',
									'chartType' : 'stacked_column',
									'chartSize' : {width:990, height:300},
									'maxValue' : 50,
									'increment' : 5
								};

//								Nwagon.chart(options);

							</script>
							

						</div>




						
						<div class="aniinfo_add_box">
							<div class="table_title_box">
								<span class="table_title">2016년 6월 폐사현황</span>
								<!-- <div class="sys_btn_box">
									<span class="align_right btn_hide"><a href="#" class="excel_btn">엑셀</a><a href="#" class="print_btn btn_type2">프린트</a></span>
								</div> -->
							</div>
							<table class="aniinfo_add table_view table_td_margin" >
								<caption>폐사현황</caption>
								<colgroup>
									<col style="width:7%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									<col style="width:3%;">
									
								</colgroup>
								<thead>
									<tr>
										<th scope="col" style="line-height:15px; vertical-align:middle">분류군<br>/일자</th>
										<th scope="col" style="vertical-align:middle">1</th>
										<th scope="col" style="vertical-align:middle">2</th>
										<th scope="col" style="vertical-align:middle">3</th>
										<th scope="col" style="vertical-align:middle">4</th>
										<th scope="col" style="vertical-align:middle">5</th>
										<th scope="col" style="vertical-align:middle">6</th>
										<th scope="col" style="vertical-align:middle">7</th>
										<th scope="col" style="vertical-align:middle">8</th>
										<th scope="col" style="vertical-align:middle">9</th>
										<th scope="col" style="vertical-align:middle">10</th>
										<th scope="col" style="vertical-align:middle">11</th>
										<th scope="col" style="vertical-align:middle">12</th>
										<th scope="col" style="vertical-align:middle">13</th>
										<th scope="col" style="vertical-align:middle">14</th>
										<th scope="col" style="vertical-align:middle">15</th>
										<th scope="col" style="vertical-align:middle">16</th>
										<th scope="col" style="vertical-align:middle">17</th>
										<th scope="col" style="vertical-align:middle">18</th>
										<th scope="col" style="vertical-align:middle">19</th>
										<th scope="col" style="vertical-align:middle">20</th>
										<th scope="col" style="vertical-align:middle">21</th>
										<th scope="col" style="vertical-align:middle">22</th>
										<th scope="col" style="vertical-align:middle">23</th>
										<th scope="col" style="vertical-align:middle">24</th>
										<th scope="col" style="vertical-align:middle">25</th>
										<th scope="col" style="vertical-align:middle">26</th>
										<th scope="col" style="vertical-align:middle">27</th>
										<th scope="col" style="vertical-align:middle">28</th>
										<th scope="col" style="vertical-align:middle">29</th>
										<th scope="col" style="vertical-align:middle">30</th>
										<th scope="col" style="vertical-align:middle">31</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">양서강</th>
										<td>1</td>
										<td>0</td>
										<td>2</td>
										<td>1</td>
										<td>3</td>
										<td>0</td>
										<td>0</td>
										<td>0</td>
										<td>5</td>
										<td>0</td>
										<td>1</td>
										<td>0</td>
										<td>2</td>
										<td>1</td>
										<td>3</td>
										<td>0</td>
										<td>3</td>
										<td>0</td>
										<td>4</td>
										<td>0</td>
										<td>1</td>
										<td>0</td>
										<td>2</td>
										<td>1</td>
										<td>2</td>
										<td>0</td>
										<td>6</td>
										<td>0</td>
										<td>11</td>
										<td>0</td>
										<td>0</td>
									</tr>
									<tr>
										<th scope="row">조강</th>
										<td>1</td>
										<td>0</td>
										<td>2</td>
										<td>1</td>
										<td>3</td>
										<td>0</td>
										<td>0</td>
										<td>0</td>
										<td>5</td>
										<td>0</td>
										<td>1</td>
										<td>0</td>
										<td>2</td>
										<td>1</td>
										<td>3</td>
										<td>0</td>
										<td>3</td>
										<td>0</td>
										<td>4</td>
										<td>0</td>
										<td>1</td>
										<td>0</td>
										<td>2</td>
										<td>1</td>
										<td>2</td>
										<td>0</td>
										<td>6</td>
										<td>0</td>
										<td>11</td>
										<td>0</td>
										<td>0</td>
									</tr>
									<tr>
										<th scope="row">포충강</th>
										<td>1</td>
										<td>0</td>
										<td>2</td>
										<td>1</td>
										<td>3</td>
										<td>0</td>
										<td>0</td>
										<td>0</td>
										<td>5</td>
										<td>0</td>
										<td>1</td>
										<td>0</td>
										<td>2</td>
										<td>1</td>
										<td>3</td>
										<td>0</td>
										<td>3</td>
										<td>0</td>
										<td>4</td>
										<td>0</td>
										<td>1</td>
										<td>0</td>
										<td>2</td>
										<td>1</td>
										<td>2</td>
										<td>0</td>
										<td>6</td>
										<td>0</td>
										<td>11</td>
										<td>0</td>
										<td>0</td>
									</tr>
									<tr>
										<th scope="row">파충강</th>
										<td>1</td>
										<td>0</td>
										<td>2</td>
										<td>1</td>
										<td>3</td>
										<td>0</td>
										<td>0</td>
										<td>0</td>
										<td>5</td>
										<td>0</td>
										<td>1</td>
										<td>0</td>
										<td>2</td>
										<td>1</td>
										<td>3</td>
										<td>0</td>
										<td>3</td>
										<td>0</td>
										<td>4</td>
										<td>0</td>
										<td>1</td>
										<td>0</td>
										<td>2</td>
										<td>1</td>
										<td>2</td>
										<td>0</td>
										<td>6</td>
										<td>0</td>
										<td>11</td>
										<td>0</td>
										<td>0</td>
									</tr>
																
								</tbody>
								<tfoot>
									<tr>
										<th scope="row">총 합계</th>
										<td>1</td>
										<td>0</td>
										<td>2</td>
										<td>1</td>
										<td>3</td>
										<td>0</td>
										<td>0</td>
										<td>0</td>
										<td>5</td>
										<td>0</td>
										<td>1</td>
										<td>0</td>
										<td>2</td>
										<td>1</td>
										<td>3</td>
										<td>0</td>
										<td>3</td>
										<td>0</td>
										<td>4</td>
										<td>0</td>
										<td>1</td>
										<td>0</td>
										<td>2</td>
										<td>1</td>
										<td>2</td>
										<td>0</td>
										<td>6</td>
										<td>0</td>
										<td>11</td>
										<td>0</td>
										<td>0</td>
									</tr>
								</tfoot>
								
							</table>
						
							<div id="chart1" class="aniinfo_add table_view" style="margin-top:10px;"></div>
							<script>
								var options = {
									'legend':{
										names: ['1일','2일','3일','4일','5일','6일','7일','8일','9일','10일','11일','12일','13일','14일','15일','16일','17일','18일','19일','20일','21일','22일','23일','24일','25일','26일','27일','28일','29일','30일','31일'],
										hrefs: []
											},
									'dataset':{
										title:'폐사현황', 
										values: [[5,2,2,8,4], [4,7,1,5,2], [4,2,6,3,4], [2,5,9,1,3], [2,4,8,1,5], [4,6,1,5,10], [3,2,4,8,2], [7,6,1,9,1],[2,3,1,6,4], [4,6,1,11,3], [1,2,4,7,5], [9,6,1,9,6],[3,2,2,8,4], [1,2,1,5,2], [4,2,1,3,4], [6,5,1,3,3], [2,3,1,5,5], [4,6,1,5,10], [1,2,4,8,2], [9,6,1,9,1],[2,3,1,6,4], [4,6,1,11,3], [4,10,4,7,5], [3,6,1,9,6],[12,5,1,1,3], [2,13,5,8,5], [4,6,1,5,10], [6,2,4,8,2], [3,6,5,9,1],[2,3,1,6,4], [4,6,7,11,3]],
										colorset: ['#30a1ce','#DC143C', '#FF8C00','#888','#1dbc7e'],
										fields:['양서강', '곤충강', '포유강','조강','파충강']
										},
									'chartDiv' : 'chart1',
									'chartType' : 'stacked_column',
									'chartSize' : {width:990, height:300},
									'maxValue' : 50,
									'increment' : 5
								};

//								Nwagon.chart(options);

							</script>
							

						</div>
						<!-- //분류명별 -->
					</div>
					<!-- //tab02 -->


					<!-- tab03 -->	
					<div class="tab_cont" id="tab03">
						<!-- 등급별 조회 -->
						<div class="aniinfo_search_box" style="margin-top:40px;">
							<table class="aniinfo_search" >
								<caption>등급별 조회</caption>
								<colgroup>
									<col style="width:20%;">
									<col style="width:80%;">
								</colgroup>
								<tbody id="sch_cites_tbody">
									<tr>
										<th scope="row">기간종류</th>
										<td>
											<p>
											  <label><input type="radio" name="align" value="연도" class="search_radio type1"/>연도</label>
											  <label><input type="radio" name="align" value="월" class="search_radio"/>월</label>
											</p>
										</td>
									</tr>
									<tr>
										<th scope="row">일자</th>
										<td><p><input type="text" class="calendar3" id="cal_8"><label for="cal_8"></label> ~ <input type="text" class="calendar3" id="cal_9"><label for="cal_9"></label></p></td>
									</tr>
									<tr>
										<th scope="row">동물 종</th>
										<td>
											<div class="select_box">			
												<select name="전체" id="tab3_table_sel1">
												<option value="전체">전체</option>
												</select>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">등급</th>
										<td>
											<div class="select_box">			
												<select name="sch_cites" id="sch_cites">
												<option value="">전체</option>
												</select>
											</div>
										</td>
									</tr>								
									<tr><th colspan="2" scope="col" class="search_btn_area"><a href="#" class="search_btn">조회</a></th></tr>
							   </tbody>
							</table>
						</div>
						<!-- //등급별 조회 -->

						<!-- 등급별 -->
						<div class="aniinfo_add_box">
							<div class="table_title_box">
								<span class="table_title">2016년 CITES 폐사현황</span>
								<!-- <div class="sys_btn_box">
									<span class="align_right btn_hide"><a href="#" class="excel_btn">엑셀</a><a href="#" class="print_btn btn_type2">프린트</a></span>
								</div> -->
							</div>
							<div class="aniinfo_add" ><span>CITES Ⅰ</span>
								<div id="tab3_chart1" class="chart_align"></div>
								<script>
									var options = {
										'legend':{
											names: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월',],
											hrefs: []
												},
										'dataset':{
											title:'폐사현황', 
											values: [[5,2,2,8], [4,7,5,2], [4,2,6,4], [5,9,1,3], [2,4,8,5], [4,6,5,10], [3,12,8,2],[4,7,5,12], [5,6,6,4], [15,9,11,13], [12,6,8,5], [4,6,15,10]],
											colorset: ['#30a1ce','#DC143C', '#FF8C00','#888','#1dbc7e'],
											fields:['포유류','조류','파충류','기타']
											},
										'chartDiv' : 'tab3_chart1',
										'chartType' : 'stacked_column',
										'chartSize' : {width:720, height:300},
										'maxValue' : 50,
										'increment' : 5
									};
									Nwagon.chart(options);

								</script>

								<div id="tab3_pie1"></div>
								<script>
									var options = {
										'dataset': {
											title: 'CITES Ⅰ',
											values:[90, 10],
											colorset: ['#30a1ce', '#DC143C'],
											fields: ['생존', '사망'] 
										},
										'donut_width' : 60, 
										'core_circle_radius':0,
										'chartDiv': 'tab3_pie1',
										'chartType': 'pie',
										'chartSize': {width:250, height:260}
									};
									Nwagon.chart(options);
								</script>

							</div>

							<div class="aniinfo_add" style="margin-top:20px;" ><span>CITES Ⅱ</span>
								<div id="tab3_chart2" class="chart_align"></div>
								<script>
									var options = {
										'legend':{
											names: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월',],
											hrefs: []
												},
										'dataset':{
											title:'폐사현황', 
											values: [[5,2,2,8], [4,7,5,2], [4,2,6,4], [5,9,1,3], [2,4,8,5], [4,6,5,10], [3,12,8,2],[4,7,5,12], [5,6,6,4], [15,9,11,13], [12,6,8,5], [4,6,15,10]],
											colorset: ['#30a1ce','#DC143C', '#FF8C00','#888','#1dbc7e'],
											fields:['포유류','조류','파충류','기타']
											},
										'chartDiv' : 'tab3_chart2',
										'chartType' : 'stacked_column',
										'chartSize' : {width:720, height:300},
										'maxValue' : 50,
										'increment' : 5
									};
									Nwagon.chart(options);

								</script>

								<div id="tab3_pie2"></div>
								<script>
									var options = {
										'dataset': {
											title: 'CITES Ⅰ',
											values:[90, 10],
											colorset: ['#30a1ce', '#DC143C'],
											fields: ['생존', '사망'] 
										},
										'donut_width' : 60, 
										'core_circle_radius':0,
										'chartDiv': 'tab3_pie2',
										'chartType': 'pie',
										'chartSize': {width:250, height:270}
									};
									Nwagon.chart(options);
								</script>

							</div>

							
							<div class="aniinfo_add" style="margin-top:20px;" ><span>CITES Ⅲ</span>
								<div id="tab3_chart3" class="chart_align"></div>
								<script>
									var options = {
										'legend':{
											names: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월',],
											hrefs: []
												},
										'dataset':{
											title:'폐사현황', 
											values: [[5,2,2,8], [4,7,5,2], [4,2,6,4], [5,9,1,3], [2,4,8,5], [4,6,5,10], [3,12,8,2],[4,7,5,12], [5,6,6,4], [15,9,11,13], [12,6,8,5], [4,6,15,10]],
											colorset: ['#30a1ce','#DC143C', '#FF8C00','#888','#1dbc7e'],
											fields:['포유류','조류','파충류','기타']
											},
										'chartDiv' : 'tab3_chart3',
										'chartType' : 'stacked_column',
										'chartSize' : {width:720, height:300},
										'maxValue' : 50,
										'increment' : 5
										};
										Nwagon.chart(options);

								</script>

								<div id="tab3_pie3"></div>
								<script>
									var options = {
										'dataset': {
											title: 'CITES Ⅰ',
											values:[90, 10],
											colorset: ['#30a1ce', '#DC143C'],
											fields: ['생존', '사망'] 
										},
										'donut_width' : 60, 
										'core_circle_radius':0,
										'chartDiv': 'tab3_pie3',
										'chartType': 'pie',
										'chartSize': {width:250, height:270}
									};
									Nwagon.chart(options);
								</script>
							</div>
							<div class="aniinfo_add" style="margin-top:20px;" ><span>전체</span>
								<div id="tab3_chart4" class="chart_align"></div>
								<script>
									var options = {
										'legend':{
											names: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월',],
											hrefs: []
												},
										'dataset':{
											title:'폐사현황', 
											values: [[5,2,2,8], [4,7,5,2], [4,2,6,4], [5,9,1,3], [2,4,8,5], [4,6,5,10], [3,12,8,2],[4,7,5,12], [5,6,6,4], [15,9,11,13], [12,6,8,5], [4,6,15,10]],
											colorset: ['#30a1ce','#DC143C', '#FF8C00','#888','#1dbc7e'],
											fields:['포유류','조류','파충류','기타']
											},
										'chartDiv' : 'tab3_chart4',
										'chartType' : 'stacked_column',
										'chartSize' : {width:720, height:300},
										'maxValue' : 50,
										'increment' : 5
									};
									Nwagon.chart(options);

								</script>

								<div id="tab3_pie4"></div>
								<script>
									var options = {
										'dataset': {
											title: 'CITES Ⅰ',
											values:[90, 10],
											colorset: ['#30a1ce', '#DC143C'],
											fields: ['생존', '사망'] 
										},
										'donut_width' : 60, 
										'core_circle_radius':0,
										'chartDiv': 'tab3_pie4',
										'chartType': 'pie',
										'chartSize': {width:250, height:270}
									};
									Nwagon.chart(options);
								</script>

							</div>


						</div>
						
						<!-- //등급별 -->
					</div>
					<!-- //tab03 -->

					<!-- tab04 -->	
					<div class="tab_cont" id="tab04">
						<!-- 연령별 조회 -->
						<div class="aniinfo_search_box" style="margin-top:40px;">
							<table class="aniinfo_search" >
								<caption>연령별 조회</caption>
								<colgroup>
									<col style="width:20%;">
									<col style="width:80%;">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">기간종류</th>
										<td>
											<p>
											  <label><input type="radio" name="align" value="연도" class="search_radio type1"/>연도</label>
											  <label><input type="radio" name="align" value="월" class="search_radio"/>월</label>
											   <label><input type="radio" name="align" value="계절" class="search_radio"/>계절</label>
											</p>
										</td>
									</tr>
									<tr>
										<th scope="row">동물 종</th>
										<td>
											<input type="checkbox" id="tab4_check1"><label for="tab4_check1">전체</label>
											<input type="checkbox" id="tab4_check2"><label for="tab4_check2">포유류</label>
											<input type="checkbox" id="tab4_check3"><label for="tab4_check3">조류</label>
											<input type="checkbox" id="tab4_check4"><label for="tab4_check4">파충류</label>
										</td>
									</tr>
									<tr>
										<th scope="row">일자</th>
										<td><p><input type="text" class="calendar3" id="cal_8"><label for="cal_8"></label> ~ <input type="text" class="calendar3" id="cal_9"><label for="cal_9"></label></p></td>
									</tr>
									<tr><th colspan="2" scope="col" class="search_btn_area"><a href="#" class="search_btn">조회</a></th></tr>
							   </tbody>
							</table>
						</div>
						<!-- //연령별 조회 -->

						<!-- 연령별 -->
						<div class="aniinfo_add_box">
							<div class="table_title_box">
								<span class="table_title">2016년 CITES 폐사현황</span>
								<!-- <div class="sys_btn_box">
									<span class="align_right btn_hide"><a href="#" class="excel_btn">엑셀</a><a href="#" class="print_btn btn_type2">프린트</a></span>
								</div> -->
							</div>
							<div id="tab4_chart1" class="aniinfo_add"><span>[보육기간]</span></div>
							<script>
								var options = {
									'legend': {
										names: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월','전체'],
										hrefs: []
									},
									'dataset': {
										title: '보육기간',
										values: [[5,2,2,8], [4,7,2,2], [14,5,6,4], [5,9,3,3], [3,4,8,5], [4,6,5,1], [3,2,8,2],[4,7,5,2], [5,6,6,4], [5,9,11,3], [2,6,8,5], [4,6,1,1],[34,16,21,15]],
										colorset: ['#30a1ce','#DC143C', '#FF8C00','#888','#1dbc7e'],
										fields:['포유류','조류','파충류','기타']
									},
									'chartDiv': 'tab4_chart1',
									'chartType': 'multi_column',
									'chartSize': { width: 990, height: 250 },
									'maxValue': 50,
									'increment': 10
								};
								Nwagon.chart(options);
							</script>

							<div id="tab4_chart2" class="aniinfo_add" style="margin-top:20px;" ><span>[약령]</span></div>
							<script>
								var options = {
									'legend': {
										names: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월','전체'],
										hrefs: []
									},
									'dataset': {
										title: '약령',
										values: [[5,2,2,8], [4,7,2,2], [14,5,6,4], [5,9,3,3], [3,4,8,5], [4,6,5,1], [3,2,8,2],[4,7,5,2], [5,6,6,4], [5,9,11,3], [2,6,8,5], [4,6,1,1],[34,16,21,15]],
										colorset: ['#30a1ce','#DC143C', '#FF8C00','#888','#1dbc7e'],
										fields:['포유류','조류','파충류','기타']
									},
									'chartDiv': 'tab4_chart2',
									'chartType': 'multi_column',
									'chartSize': { width: 990, height: 250 },
									'maxValue': 50,
									'increment': 10
								};
								Nwagon.chart(options);
							</script>
							

							<div id="tab4_chart3" class="aniinfo_add" style="margin-top:20px;" ><span>[성령]</span></div>
							<script>
								var options = {
									'legend': {
										names: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월','전체'],
										hrefs: []
									},
									'dataset': {
										title: '성령',
										values: [[5,2,2,8], [4,7,2,2], [14,5,6,4], [5,9,3,3], [3,4,8,5], [4,6,5,1], [3,2,8,2],[4,7,5,2], [5,6,6,4], [5,9,11,3], [2,6,8,5], [4,6,1,1],[34,16,21,15]],
										colorset: ['#30a1ce','#DC143C', '#FF8C00','#888','#1dbc7e'],
										fields:['포유류','조류','파충류','기타']
									},
									'chartDiv': 'tab4_chart3',
									'chartType': 'multi_column',
									'chartSize': { width: 990, height: 250 },
									'maxValue': 50,
									'increment': 10
								};
								Nwagon.chart(options);
							</script>


							<div id="tab4_chart4" class="aniinfo_add" style="margin-top:20px;" ><span>[노령]</span></div>
							<script>
								var options = {
									'legend': {
										names: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월','전체'],
										hrefs: []
									},
									'dataset': {
										title: '노령',
										values: [[5,2,2,8], [4,7,2,2], [14,5,6,4], [5,9,3,3], [3,4,8,5], [4,6,5,1], [3,2,8,2],[4,7,5,2], [5,6,6,4], [5,9,11,3], [2,6,8,5], [4,6,1,1],[34,16,21,15]],
										colorset: ['#30a1ce','#DC143C', '#FF8C00','#888','#1dbc7e'],
										fields:['포유류','조류','파충류','기타']
									},
									'chartDiv': 'tab4_chart4',
									'chartType': 'multi_column',
									'chartSize': { width: 990, height: 250 },
									'maxValue': 50,
									'increment': 10
								};
								Nwagon.chart(options);
							</script>

						</div>
						
						<!-- //연령별 -->
					</div>
					<!-- //tab04 -->


					<!-- tab05 -->	
					<div class="tab_cont" id="tab05">
						<!-- 원인별 조회 -->
						<div class="aniinfo_search_box" style="margin-top:40px;">
							<table class="aniinfo_search" >
								<caption>원인별 조회</caption>
								<colgroup>
									<col style="width:20%;">
									<col style="width:80%;">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">동물 종</th>
										<td>
											<input type="checkbox" id="tab5_check1"><label for="tab5_check1">소화기</label>
											<input type="checkbox" id="tab5_check2"><label for="tab5_check2">호흡기</label>
											<input type="checkbox" id="tab5_check3"><label for="tab5_check3">비뇨생식기</label>
											<input type="checkbox" id="tab5_check4"><label for="tab5_check4">사고외상</label>
											<input type="checkbox" id="tab5_check5"><label for="tab5_check5">종양</label>
											<input type="checkbox" id="tab5_check6"><label for="tab5_check6">기생충</label>
											<input type="checkbox" id="tab5_check7"><label for="tab5_check7">근골격</label>
											<input type="checkbox" id="tab5_check8"><label for="tab5_check8">기타</label>
										</td>
									</tr>
									<tr>
										<th scope="row">일자</th>
										<td><p><input type="text" class="calendar3" id="cal_8"><label for="cal_8"></label> ~ <input type="text" class="calendar3" id="cal_9"><label for="cal_9"></label></p></td>
									</tr>
									<tr>
										<th scope="row">동물 종</th>
										<td>
											<div class="select_box">			
												<select name="전체" id="tab5_table_sel1">
												<option value="전체">전체</option>
												</select>
											</div>
										</td>
									</tr>
									<tr><th colspan="2" scope="col" class="search_btn_area"><a href="#" class="search_btn">조회</a></th></tr>
							   </tbody>
							</table>
						</div>
						<!-- //원인별 조회 -->

						<!-- 원인별 -->
					
						<!-- 폐사현황 -->
						<div class="aniinfo_add_box">
							<div class="table_title_box">
								<span class="table_title">2016년 6월 폐사현황</span>
							</div>
							<table class="aniinfo_add table_view table_td_margin" >
								<caption>2016년 6월 폐사현황</caption>
								<colgroup>
									<col style="width:20%;">
									<col style="width:16%;">
									<col style="width:16%;">
									<col style="width:16%;">
									<col style="width:16%;">
									<col style="width:16%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">원인/종</th>
										<th scope="col">포유류</th>
										<th scope="col">조류</th>
										<th scope="col">파충류</th>
										<th scope="col">기타</th>
										<th scope="col">전체</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">소화기계</th>
										<td>1</td>
										<td>2</td>
										<td>3</td>
										<td>4</td>
										<td>10</td>
									</tr>
									<tr>
										<th scope="row">호흡기계</th>
										<td>0</td>
										<td>0</td>
										<td>0</td>
										<td>0</td>
										<td>0</td>
									</tr>
									<tr>
										<th scope="row">종양</th>
										<td>4</td>
										<td>3</td>
										<td>2</td>
										<td>1</td>
										<td>10</td>
									</tr>
									<tr>
										<th scope="row">기타</th>
										<td>0</td>
										<td>0</td>
										<td>0</td>
										<td>0</td>
										<td>0</td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<th scope="row">총 합계</th>
										<td>5</td>
										<td>5</td>
										<td>5</td>
										<td>5</td>
										<td>20</td>
									</tr>

								</tfoot>
								
							</table>
						</div>
						
						<!-- //폐사현황 -->
						
						<div id="tab5_chart1" class="aniinfo_add"></div>
							<script>
								var options = {
									'legend': {
										names: ['소화기계','호흡기계','종양','기타'],
										hrefs: []
									},
									'dataset': {
										title: '보육기간',
										values: [[4,2,2,1], [1,1,1,1],[4,2,2,1], [1,1,1,1]],
										colorset: ['#30a1ce','#DC143C', '#FF8C00','#888','#1dbc7e'],
										fields:['포유류','조류','파충류','기타']
									},
									'chartDiv': 'tab5_chart1',
									'chartType': 'multi_column',
									'chartSize': { width: 990, height: 250 },
									'maxValue': 5,
									'increment': 1
								};
//								Nwagon.chart(options);
							</script>
						
						
						<!-- //원인별 -->
					</div>
					<!-- //tab05 -->

				
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
