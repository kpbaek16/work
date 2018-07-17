<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	function selectAniBurnList(result){
	 	if(result!=null){
//			console.log("test:" + JSON.stringify(result));
			console.log("result.length==>" + result.length);
			$("#burn_tbody tr:first").attr('style',"display:");
			
			for(var i=0; i<result.length; i++){
				var data = result[i];
				
				fc_addRow("burn_tbody");
				
				var iRow = (i+1);
				
				$("#burn_tbody div#BURN_INDEX_DIV").eq(iRow).html(iRow); 
				$("#burn_tbody div#BURN_INDEX_DIV").eq(iRow).attr('data-val',iRow); 
				$("#burn_tbody div#TXT_DAIO_IODATE_DIV").eq(iRow).html(data.TXT_DAIO_IODATE); 
				$("#burn_tbody div#MDI_DPTNAME_DIV").eq(iRow).attr('data-val',data.MTI_DPTNO); 
				$("#burn_tbody div#MDI_DPTNAME_DIV").eq(iRow).html("[" + data.MDI_DPTNAME + "]" + data.MTI_TEAMNAME); 
				$("#burn_tbody div#MVI_VVRMNAME_DIV").eq(iRow).html(data.MVI_VVRMNAME); 
				$("#burn_tbody div#MAC_NATMON_DIV").eq(iRow).html(data.MAC_NATMON); 
				$("#burn_tbody div#TXT_MAC_CITES_DIV").eq(iRow).html(data.TXT_MAC_CITES); 
				$("#burn_tbody div#TXT_MAC_ENDANG_DIV").eq(iRow).html(data.TXT_MAC_ENDANG); 
				$("#burn_tbody div#TXT_MAI_ANICODE_1_DIV").eq(iRow).html(data.TXT_MAI_ANICODE_1); 
				$("#burn_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
				$("#burn_tbody div#MAI_ANICODE_DIV").eq(iRow).html(data.MAI_ANICODE); 
				$("#burn_tbody div#MAI_SEX_M_DIV").eq(iRow).html(data.MAI_SEX_M); 
				$("#burn_tbody div#MAI_SEX_F_DIV").eq(iRow).html(data.MAI_SEX_F); 
				$("#burn_tbody div#MAI_SEX_A_DIV").eq(iRow).html(data.MAI_SEX_A); 
				$("#burn_tbody div#TOT_MAI_SEX_DIV").eq(iRow).html(data.TOT_MAI_SEX); 
				
			}
			$("#burn_tbody tr:first").attr('style',"display:none");
			$("#burn_tbody").append($("#tot_tbody tr:last"));
	 	}
	}
	function fn_sta_selectAniBurnList(schYear, callback, retObj) {
		console.log("****fn_sta_selectAniBurnList");

		fc_clearRow("burn_tbody");

		var targetUrl = "/stat/0607/selectAniBurnList.do";
		var param = {
				schYear : schYear
		};
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function fn_sta_selectAniBurnSta(){
		var param = {
				schYear : $("#schYear").val()
		};
		fn_sta_selectAniBurnList(param.schYear, selectAniBurnList);
	}

	$(document).ready(function() {
		getComboMajorAniCls1("#sch_cls1_tbody #sch_anicode1");
		getComboAniCites("#sch_cites_tbody #sch_cites");
		$("#schYear").val('${nowInfo.year}');
	});
</script>

<title>현황/통계 &gt; 번식현황</title>
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
                    <p class="contents_title">번식현황</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 현황/통계</li>
                        <li>> 번식현황</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">

					<!-- tab_menu -->
					<div class="tab_menu" style="margin-top:0px;">
						<ul>
							<li class="on"><a href="#tab01">번식현황</a></li>
							<li><a href="#tab02">종별</a></li>
							<li><a href="#tab03">분류명별</a></li>
							<li><a href="#tab04">등급별</a></li>
						</ul>
					</div>
					<!-- // tab_menu -->

					<!-- tab01 -->	
					<div class="tab_cont" id="tab01">	
					<!-- 번식현황 조회 -->
					<div class="aniinfo_search_box" style="margin-top:40px;">
                        <table class="aniinfo_search" >
							<caption>번식현황 조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">년도</th>
									<td><p>
										<div class="select_box">
											<select name="schYear" id="schYear" style="width: 120px">
											<option value="전체">전체</option>
											<c:forEach var="years" varStatus="status" begin="2000" end="${nowInfo.year}">
											<option value="${status.index}">${status.index}년도</option>
											</c:forEach>
											</select>
										</div>
									
									</p></td>
								</tr>
								<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_sta_selectAniBurnSta();" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					<!-- //번식현황 조회 -->

					<!-- 동물번식현황 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">동물번식현황</span>
							<div class="sys_btn_box">
								<span class="align_right btn_hide"><a href="#" class="excel_btn">엑셀</a><a href="#" class="print_btn btn_type2">프린트</a></span>
							</div>
						</div>
						<table class="aniinfo_add table_view table_td_margin" >
							<caption>동물번식현황</caption>
							<colgroup>
								<col style="width:4%;">
								<col style="width:7%;">
								<col style="width:8%;">
								<col style="width:6%;">
								<col style="width:8%;">
								<col style="width:5%;">
								<col style="width:8%;">
								<col style="width:5%;">
								<col style="width:7%;">
								<col style="width:6%;">
								<col style="width:6%;">
								<col style="width:6%;">
								<col style="width:6%;">
								<col style="width:6%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" rowspan="2" style="vertical-align:middle;">No</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">번식일자</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">부서명</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">동물사</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">천연기념물</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">CITES</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">멸종위기종</th>
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
							<tbody id="burn_tbody">
								<tr style="display:none">
									<th scope="row"><div id="BURN_INDEX_DIV" data-val=''></div></th>
									<td><div id="TXT_DAIO_IODATE_DIV" data-val=''></div></td>
									<td><div id="MDI_DPTNAME_DIV" data-val=''></div></td>
									<td><div id="MVI_VVRMNAME_DIV" data-val=''></div></td>
									<td><div id="MAC_NATMON_DIV" data-val=''></div></td>
									<td><div id="TXT_MAC_CITES_DIV" data-val=''></div></td>
									<td><div id="TXT_MAC_ENDANG_DIV" data-val=''></div></td>
									<td><div id="TXT_MAI_ANICODE_1_DIV" data-val=''></div></td>
									<td><div id="MAC_NAME_DIV" data-val=''></div></td>
									<td><div id="MAI_ANICODE_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_M_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_F_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_A_DIV" data-val=''></div></td>
									<td><div id="TOT_MAI_SEX_DIV" data-val=''></div></td>
								</tr>
							</tbody>
							
						</table>
					</div>
					
  					<!-- //동물번식현황 -->
					</div>
					<!-- //tab01 -->

					<!-- tab02 -->	
					<div class="tab_cont" id="tab02">
					<!-- 종별 조회 -->
					<div class="aniinfo_search_box" style="margin-top:40px;">
                        <table class="aniinfo_search" >
							<caption>종별 조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">기간종류</th>
									<td>
										<p>
										  <label><input type="radio" name="align" value="계절" class="search_radio type1"/>계절</label>
										  <label><input type="radio" name="align" value="월" class="search_radio"/>월</label>
										</p>
									</td>
								</tr>
								<tr>
									<th scope="row">년도</th>
									<td><p>
										<div class="select_box">
											<select name="전체" id="tab1_table_sel1" style="width: 120px">
											<option value="전체">전체</option>
											<c:forEach var="years" varStatus="status" begin="2000" end="${nowInfo.year}">
											<option value="${status.index}">${status.index}년도</option>
											</c:forEach>
											</select>
										</div>
									
									</p></td>
								</tr>
								<tr>
									<th scope="row">종</th>
									<td><input name="textfield" type="text" id="seach_text1" class="textfield"><label for="seach_text1"></label></td>
								</tr>
								<tr><th colspan="2" scope="col" class="search_btn_area"><a href="#" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					<!-- //종별 조회 -->

					<!-- 종별 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">2016년</span>
							<div class="sys_btn_box">
								<span class="align_right btn_hide"><a href="#" class="excel_btn">엑셀</a><a href="#" class="print_btn btn_type2">프린트</a></span>
							</div>
						</div>
						<table class="aniinfo_add table_view" >
							<caption>종별</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" colspan="2">동물명/날짜</th>
									<th scope="col">1</th>
									<th scope="col">2</th>
									<th scope="col">3</th>
									<th scope="col">4</th>
									<th scope="col">5</th>
									<th scope="col">6</th>
									<th scope="col">7</th>
									<th scope="col">8</th>
									<th scope="col">9</th>
									<th scope="col">10</th>
									<th scope="col">11</th>
									<th scope="col">12</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" rowspan="4" style="vertical-align:middle;">검둥이 원숭이</th>
									<th>수</th>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
								</tr>
								<tr>
									<th>암</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								<tr>
									<th>미상</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								<tr >
									<th>합계</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								<tr>
									<th scope="row" rowspan="4" style="vertical-align:middle;">일본 원숭이</th>
									<th>수</th>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
								</tr>
								<tr>
									<th>암</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								<tr>
									<th>미상</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								<tr >
									<th>합계</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								<tr>
									<th scope="row" rowspan="4" style="vertical-align:middle;">개코 원숭이</th>
									<th>수</th>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
								</tr>
								<tr>
									<th>암</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								<tr>
									<th>미상</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								<tr >
									<th>합계</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
							</tbody>
							<tfoot>
							<tr>
									<th scope="row" rowspan="4" style="vertical-align:middle;">합계</th>
									<th>수</th>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
								</tr>
								<tr>
									<th>암</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								<tr>
									<th>미상</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								<tr >
									<th>합계</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>

							</tfoot>							
						</table>

						<div id="Nwagon1" class="aniinfo_add table_view" style="margin-top:10px;"></div>
						<script>
							var options = {
								'legend': {
									names: ['1일','2일','3일','4일','5일','6일','7일','8일','9일','10일','11일','12일','13일','14일','15일','16일','17일','18일','19일','20일','21일','22일','23일','24일','25일','26일','27일','28일','29일','30일'],
									hrefs: []
								},
								'dataset': {
									title: '종별',
									values: [[3,2,2], [1,2,1], [4,2,1], [2,5,1], [2,3,1], [4,6,1], [1,2,4], [3,6,1],[2,3,1], [4,6,1], [1,2,4], [3,6,1],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]],
									colorset: ['#30a1ce','#DC143C', '#FF8C00'],
									fields:['검둥이 원숭이', '일본 원숭이', '개코 원숭이']
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
					
  					<!-- //종별 -->
					</div>
					<!-- //tab02 -->

					<!-- tab03 -->	
					<div class="tab_cont" id="tab03">
					<!-- 분류명별 조회 -->
					<div class="aniinfo_search_box" style="margin-top:40px;">
                        <table class="aniinfo_search" >
							<caption>분류명별 조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody id="sch_cls1_tbody">
								<tr>
									<th scope="row">기간종류</th>
									<td>
										<p>
										  <label><input type="radio" name="align" value="계절" class="search_radio type1"/>계절</label>
										  <label><input type="radio" name="align" value="월" class="search_radio"/>월</label>
										</p>
									</td>
								</tr>
								<tr>
									<th scope="row">년도</th>
									<td><p>
										<div class="select_box">
											<select name="전체" id="tab1_table_sel1" style="width: 120px">
											<option value="">전체</option>
											<c:forEach var="years" varStatus="status" begin="2000" end="${nowInfo.year}">
											<option value="${status.index}">${status.index}년도</option>
											</c:forEach>
											</select>
										</div>
									
									</p></td>
								</tr>
								<tr>
									<th scope="row">분류명</th>
									<td>
										<div class="select_box">			
											<select name=""sch_anicode1"" id="sch_anicode1">
											<option value="전체">전체</option>
											</select>
										</div>
									</td>
								</tr>
								<tr><th colspan="2" scope="col" class="search_btn_area"><a href="#" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					<!-- //분류명별 조회 -->

					<!-- 분류명별 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">2016년 전체</span>
							<div class="sys_btn_box">
								<span class="align_right btn_hide"><a href="#" class="excel_btn">엑셀</a><a href="#" class="print_btn btn_type2">프린트</a></span>
							</div>
						</div>
						<table class="aniinfo_add table_view" >
							<caption>분류명별</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" colspan="2">동물명/날짜</th>
									<th scope="col">1</th>
									<th scope="col">2</th>
									<th scope="col">3</th>
									<th scope="col">4</th>
									<th scope="col">5</th>
									<th scope="col">6</th>
									<th scope="col">7</th>
									<th scope="col">8</th>
									<th scope="col">9</th>
									<th scope="col">10</th>
									<th scope="col">11</th>
									<th scope="col">12</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" rowspan="4" style="vertical-align:middle;">포유강</th>
									<th>수</th>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
								</tr>
								<tr>
									<th>암</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								<tr>
									<th>미상</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								<tr >
									<th>합계</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								<tr>
									<th scope="row" rowspan="4" style="vertical-align:middle;">조강</th>
									<th>수</th>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
								</tr>
								<tr>
									<th>암</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								<tr>
									<th>미상</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								<tr >
									<th>합계</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								<tr>
									<th scope="row" rowspan="4" style="vertical-align:middle;">기타</th>
									<th>수</th>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
								</tr>
								<tr>
									<th>암</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								<tr>
									<th>미상</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								<tr >
									<th>합계</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
							</tbody>
							<tfoot>
							<tr>
									<th scope="row" rowspan="4" style="vertical-align:middle;">합계</th>
									<th>수</th>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
								</tr>
								<tr>
									<th>암</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								<tr>
									<th>미상</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								<tr >
									<th>합계</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>

							</tfoot>							
						</table>

						<div id="Nwagon2" class="aniinfo_add table_view" style="margin-top:10px;"></div>
						<script>
							var options = {
								'legend': {
									names: ['1일','2일','3일','4일','5일','6일','7일','8일','9일','10일','11일','12일','13일','14일','15일','16일','17일','18일','19일','20일','21일','22일','23일','24일','25일','26일','27일','28일','29일','30일'],
									hrefs: []
								},
								'dataset': {
									title: '분류명별',
									values: [[3,2,2], [1,2,1], [4,2,1], [2,5,1], [2,3,1], [4,6,1], [1,2,4], [3,6,1],[2,3,1], [4,6,1], [1,2,4], [3,6,1],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]],
									colorset: ['#30a1ce','#DC143C', '#FF8C00'],
									fields:['포유강', '조강', '기타']
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
					
  					<!-- //분류명별 -->
					</div>
					<!-- //tab03 -->


					<!-- tab04 -->	
					<div class="tab_cont" id="tab04">
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
										  <label><input type="radio" name="align" value="계절" class="search_radio type1"/>계절</label>
										  <label><input type="radio" name="align" value="월" class="search_radio"/>월</label>
										</p>
									</td>
								</tr>
								<tr>
									<th scope="row">년도</th>
									<td>
										<div class="select_box">			
											<select name=""sch_anicode1"" id="sch_anicode1">
											<option value="전체">전체</option>
											<c:forEach var="years" varStatus="status" begin="2000" end="${nowInfo.year}">
											<option value="${status.index}">${status.index}년도</option>
											</c:forEach>
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
							<span class="table_title">2016년</span>
							<div class="sys_btn_box">
								<span class="align_right btn_hide"><a href="#" class="excel_btn">엑셀</a><a href="#" class="print_btn btn_type2">프린트</a></span>
							</div>
						</div>
						<table class="aniinfo_add table_view" >
							<caption>등급별</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" colspan="2">동물명/날짜</th>
									<th scope="col">1</th>
									<th scope="col">2</th>
									<th scope="col">3</th>
									<th scope="col">4</th>
									<th scope="col">5</th>
									<th scope="col">6</th>
									<th scope="col">7</th>
									<th scope="col">8</th>
									<th scope="col">9</th>
									<th scope="col">10</th>
									<th scope="col">11</th>
									<th scope="col">12</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" rowspan="4" style="vertical-align:middle;">CITES Ⅰ</th>
									<th>수</th>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
								</tr>
								<tr>
									<th>암</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								<tr>
									<th>미상</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								<tr >
									<th>합계</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								<tr>
									<th scope="row" rowspan="4" style="vertical-align:middle;">CITES Ⅱ</th>
									<th>수</th>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
								</tr>
								<tr>
									<th>암</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								<tr>
									<th>미상</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								<tr >
									<th>합계</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								<tr>
									<th scope="row" rowspan="4" style="vertical-align:middle;">CITES Ⅲ</th>
									<th>수</th>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
								</tr>
								<tr>
									<th>암</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								<tr>
									<th>미상</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								<tr >
									<th>합계</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
							</tbody>
							<tfoot>
							<tr>
									<th scope="row" rowspan="4" style="vertical-align:middle;">합계</th>
									<th>수</th>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
								</tr>
								<tr>
									<th>암</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								<tr>
									<th>미상</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>
								<tr >
									<th>합계</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
									<td>0</td>
								</tr>

							</tfoot>							
						</table>

						<div id="Nwagon3" class="aniinfo_add table_view" style="margin-top:10px;"></div>
						<script>
							var options = {
								'legend': {
									names: ['1일','2일','3일','4일','5일','6일','7일','8일','9일','10일','11일','12일','13일','14일','15일','16일','17일','18일','19일','20일','21일','22일','23일','24일','25일','26일','27일','28일','29일','30일'],
									hrefs: []
								},
								'dataset': {
									title: '등급별',
									values: [[3,2,2,8], [1,2,1,5], [4,2,1,7], [2,5,1,13], [2,3,1,15], [4,6,1,10], [1,2,4,8], [3,6,1,9],[2,3,1,6], [4,6,1,11], [1,2,4,7], [3,6,1,9],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]],
									colorset: ['#30a1ce','#DC143C', '#FF8C00','#888'],
									fields:['CITES Ⅰ', 'CITES Ⅱ', 'CITES Ⅲ','합계']
								},
								'chartDiv': 'Nwagon3',
								'chartType': 'multi_column',
								'chartSize': { width: 990, height: 300 },
								'maxValue': 15,
								'increment': 5
							};
//							Nwagon.chart(options);
						</script>
					</div>
					
  					<!-- //등급별 -->
					</div>
					<!-- //tab04 -->



				
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
