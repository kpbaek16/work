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
	function selectAniClsTotList(result){
	 	if(result!=null){
	//		console.log("selectAniClsTotList:" + JSON.stringify(result));
			console.log("result.length==>" + result.length);
			
			$("#clsTot_tbody tr:first").attr('style',"display:");
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("clsTot_tbody");
					
				var iRow = (i+1);
				$("#clsTot_tbody div#MAI_ANICLSCODE_DIV").eq(iRow).attr('data-val', data.MAI_ANICLSCODE); 
				$("#clsTot_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
				$("#clsTot_tbody div#MAC_ENAME_DIV").eq(iRow).attr('data-val', data.MAC_ENAME); 
				$("#clsTot_tbody div#CNT_1_MAI_SEX_M_DIV").eq(iRow).html(data.CNT_1_MAI_SEX_M); 
				$("#clsTot_tbody div#CNT_1_MAI_SEX_F_DIV").eq(iRow).html(data.CNT_1_MAI_SEX_F); 
				$("#clsTot_tbody div#CNT_1_MAI_SEX_A_DIV").eq(iRow).html(data.CNT_1_MAI_SEX_A); 
				$("#clsTot_tbody div#CNT_1_MAI_SEX_DIV").eq(iRow).html(data.CNT_1_MAI_SEX); 
				$("#clsTot_tbody div#CNT_2_MAI_SEX_M_DIV").eq(iRow).html(data.CNT_2_MAI_SEX_M); 
				$("#clsTot_tbody div#CNT_2_MAI_SEX_F_DIV").eq(iRow).html(data.CNT_2_MAI_SEX_F); 
				$("#clsTot_tbody div#CNT_2_MAI_SEX_A_DIV").eq(iRow).html(data.CNT_2_MAI_SEX_A); 
				$("#clsTot_tbody div#CNT_2_MAI_SEX_DIV").eq(iRow).html(data.CNT_2_MAI_SEX); 

				if(i!=0){
					$("div#ANILIST_DIV").append($("div#ANIINFO_DIV").html());
				}
			}
			$("#clsTot_tbody tr:first").attr('style',"display:none");
			
			if(result.length > 0){
				$("div#ANI_DIV").attr('style',"display:");
				$("div#ANI_DIV").each(function(i_tot){
					var i_totRow = (i_tot+1);
					$(this).find("div#MAI_ANICLSCODE_DIV").attr('data-val', $("#clsTot_tbody div#MAI_ANICLSCODE_DIV").eq(i_totRow).attr('data-val')); 

					$(this).find("div#TXT_MAC_NAME_DIV").html($("#clsTot_tbody div#MAC_NAME_DIV").eq(i_totRow).html() + "(" + $("#clsTot_tbody div#MAC_ENAME_DIV").eq(i_totRow).attr('data-val') + ")");
					$(this).find("#ani_tot_tbody div#MAC_NAME_DIV").html($("#clsTot_tbody div#MAC_NAME_DIV").eq(i_totRow).html()); 
					$(this).find("#ani_tot_tbody div#CNT_1_MAI_SEX_M_DIV").html($("#clsTot_tbody div#CNT_1_MAI_SEX_M_DIV").eq(i_totRow).html()); 
					$(this).find("#ani_tot_tbody div#CNT_1_MAI_SEX_F_DIV").html($("#clsTot_tbody div#CNT_1_MAI_SEX_F_DIV").eq(i_totRow).html()); 
					$(this).find("#ani_tot_tbody div#CNT_1_MAI_SEX_A_DIV").html($("#clsTot_tbody div#CNT_1_MAI_SEX_A_DIV").eq(i_totRow).html()); 
					$(this).find("#ani_tot_tbody div#CNT_1_MAI_SEX_DIV").html($("#clsTot_tbody div#CNT_1_MAI_SEX_DIV").eq(i_totRow).html()); 
					$(this).find("#ani_tot_tbody div#CNT_2_MAI_SEX_M_DIV").html($("#clsTot_tbody div#CNT_2_MAI_SEX_M_DIV").eq(i_totRow).html()); 
					$(this).find("#ani_tot_tbody div#CNT_2_MAI_SEX_F_DIV").html($("#clsTot_tbody div#CNT_2_MAI_SEX_F_DIV").eq(i_totRow).html()); 
					$(this).find("#ani_tot_tbody div#CNT_2_MAI_SEX_A_DIV").html($("#clsTot_tbody div#CNT_2_MAI_SEX_A_DIV").eq(i_totRow).html()); 
					$(this).find("#ani_tot_tbody div#CNT_2_MAI_SEX_DIV").html($("#clsTot_tbody div#CNT_2_MAI_SEX_DIV").eq(i_totRow).html()); 
				});
				fn_sta_selectAniClsList(selectAniClsList);
			}else{
				$("div#ANI_DIV").attr('style',"display:none");
			}
			
	 	}
	}
	function selectAniClsList(result){
	 	if(result!=null){
	//		console.log("test:" + JSON.stringify(result));
			console.log("result.length==>" + result.length);
			$("#cls_tbody tr:first").attr('style',"display:");
			
			for(var i=0; i<result.length; i++){
				var data = result[i];
				
				fc_addRow("cls_tbody");

				var iRow = (i+1);
				$("#cls_tbody div#MAI_ANICLSCODE_DIV").eq(iRow).attr('data-val', data.MAI_ANICLSCODE); 
				$("#cls_tbody div#CLS_INDEX_DIV").eq(iRow).attr('data-val',iRow); 
//				$("#cls_tbody div#CLS_INDEX_DIV").eq(iRow).html(iRow); 
				$("#cls_tbody div#CLS_INDEX_DIV").eq(iRow).html(data.ANILIST_ROW); 
				$("#cls_tbody div#TXT_MAI_ANICODE_DIV").eq(iRow).html(data.TXT_MAI_ANICODE); 
				$("#cls_tbody div#MAI_ANICODE_DIV").eq(iRow).html(data.MAI_ANICODE); 
				$("#cls_tbody div#MAI_INSIKNO_DIV").eq(iRow).html(data.MAI_INSIKNO); 
				$("#cls_tbody div#TXT_MAI_SEX_DIV").eq(iRow).html(data.TXT_MAI_SEX); 
				$("#cls_tbody div#TXT_MAI_TEAMNO_DIV").eq(iRow).html(data.TXT_MAI_TEAMNO); 
				$("#cls_tbody div#TXT_MAI_VVRMNO_DIV").eq(iRow).html(data.TXT_MAI_VVRMNO); 
				$("#cls_tbody div#TXT_MAI_BIRTHDAY_DIV").eq(iRow).html(data.TXT_MAI_BIRTHDAY); 
				$("#cls_tbody div#TXT_DATE1_DIV").eq(iRow).html(data.TXT_DATE1); 
				$("#cls_tbody div#MAI_REGTYPE_DIV").eq(iRow).html(data.MAI_REGTYPE); 
				$("#cls_tbody div#TXT_DATE2_DIV").eq(iRow).html(data.TXT_DATE2); 
				
				$("div#ANI_DIV").eq(data.ANI_ROW-1).find("#ani_list_tbody").append($("#cls_tbody tr").eq(iRow).clone());
//				console.log($("#ani_list_tbody tr").eq(i).find("div#MAI_ANICLSCODE_DIV").html());
				
			}
			
			$("#cls_tbody tr:first").attr('style',"display:none");
			$("#cls_tbody").append($("#tot_tbody tr:last"));
			
	 	}
	}
	function fn_sta_selectAniClsList(callback, retObj) {
		console.log("****fn_sta_selectAniClsList");
	
		fc_clearRow("cls_tbody");
		
		var targetUrl = "/stat/0611/selectAniClsList.do";
		var param = {
				schClsCode : $("#sch_tbody #schClsCode").val(),
				schMacName : $("#sch_tbody #schMacName").val(),
				schVvrm : $("#sch_tbody #schVvrm").val(),
				cal_1 : $("#sch_tbody #cal_1").val(),
				cal_2 : $("#sch_tbody #cal_2").val(),
				schDethType : $('#sch_tbody input:radio[name=schDethType]:checked').val(),
				schOrder : $('#sch_tbody input:radio[name=schOrder]:checked').val()
		};
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}
	
	function fn_sta_selectAniClsTotList(param, callback, retObj) {
		fc_clearRow("clsTot_tbody");
	
		var targetUrl = "/stat/0611/selectAniClsTotList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}
	
	function fn_sta_selectAniClsSta(){
		$("div#ANILIST_DIV").html("");
		$("div#ANIINFO_DIV #ani_list_tbody tr").each(function(index){
			$(this).remove();
		});

		var param = {
				schClsCode : $("#sch_tbody #schClsCode").val(),
				schMacName : $("#sch_tbody #schMacName").val(),
				schVvrm : $("#sch_tbody #schVvrm").val(),
				cal_1 : $("#sch_tbody #cal_1").val(),
				cal_2 : $("#sch_tbody #cal_2").val(),
				schDethType : $('#sch_tbody input:radio[name=schDethType]:checked').val(),
				schOrder : $('#sch_tbody input:radio[name=schOrder]:checked').val()
		};
		fn_sta_selectAniClsTotList(param, selectAniClsTotList);
	}
	
	$(document).ready(function() {
		getComboVvrm("#sch_tbody #schVvrm");
//		$("div#ANI_DIV").attr('style',"display:none");
	});
</script>

<title>현황/통계 &gt; 종별현황</title>
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
                    <p class="contents_title">종별현황</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 현황/통계</li>
                        <li>> 종별현황</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
				
					<!-- 종별현황 조회 -->
					<div class="aniinfo_search_box">
                        <table class="aniinfo_search" >
							<caption>종별현황 조회</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:40%;">
								<col style="width:10%;">
								<col style="width:40%;">
							</colgroup>
                            <tbody id="sch_tbody">
								<tr>
									<th scope="row">동물 종 번호</th>
									<td><input name="schClsCode	" type="text" id="schClsCode" class="textfield"><label for="seach_text1"></label></td>
									<th scope="row">동물 명칭</th>
									<td><input name="schMacName" type="text" id="schMacName" class="textfield"><label for="seach_text2"></label></td>
														
								</tr>
								<tr>
									<th scope="row">동물사명</th>
									<td>
										<div class="select_box">			
											<select name="schVvrm" id="schVvrm">
											<option value="">동물사명 선택</option>
											</select>
										</div>
									</td>
									<th scope="row">일자</th>
									<td><p><input type="text" class="calendar1" id="cal_1" value="${calInfo.cal_1}"><label for="cal_1"></label> ~ <input type="text" class="calendar1" id="cal_2" value="${calInfo.cal_2}"><label for="cal_2"></label></p></td>
								</tr>
								<tr>
									<th scope="row">폐사구분</th>
									<td>
										<p>
										  <label><input type="radio" name="schDethType" value="" class="search_radio type1"/>전체</label>
										  <label><input type="radio" name="schDethType" value="1" class="search_radio"/>생존</label>
										  <label><input type="radio" name="schDethType" value="2" class="search_radio"/>폐사</label>
										</p>
									</td>
									<th scope="row">정렬방법</th>
									<td>
										<p>
										  <label><input type="radio" name="schOrder" value="MAI_ANICODE" class="search_radio type1"/>동물번호</label>
										  <label><input type="radio" name="schOrder" value="MAC_NAME" class="search_radio"/>동물명칭</label>
										</p>
									</td>
								</tr>
								<tr><th colspan="4" scope="col" class="search_btn_area"><a href="javascript:fn_sta_selectAniClsSta();" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					<!-- //종별현황 조회 -->


					<div class="aniinfo_add_box" style="display:none">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus"><img src="/images/btn_minus.gif" alt=""></a></span>
							<div class="sys_btn_box">
								<span class="align_right btn_hide"><a href="#" class="excel_btn">엑셀</a><a href="#" class="print_btn btn_type2">프린트</a></span>
							</div>
						</div>
						<table class="aniinfo_add table_view" >
							<caption></caption>
							<colgroup>
								<col style="width:3%;">
								<col style="width:8%;">
								<col style="width:10%;">
								<col style="width:5%;">
								<col style="width:23%;">
								<col style="width:12%;">
								<col style="width:8%;">
								<col style="width:8%;">
								<col style="width:8%;">
								<col style="width:8%;">
								<col style="width:7%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="t1th01">No</th>
									<th scope="col" id="t1th02">동물번호</th>
									<th scope="col" id="t1th03">동물별명</th>
									<th scope="col" id="t1th04">성별</th>
									<th scope="col" id="t1th05">관리부서</th>
									<th scope="col" id="t1th06">동물사</th>
									<th scope="col" id="t1th07">번식일</th>
									<th scope="col" id="t1th08">반입일</th>
									<th scope="col" id="t1th09">등록구분</th>
									<th scope="col" id="t1th10">반출일</th>
									<th scope="col" id="t1th11">반출사유</th>
								</tr>
							</thead>
							<tbody id="cls_tbody">
								<tr style="display:none">
									<th scope="row" headers="t1th01">
										<div id="MAI_ANICLSCODE_DIV" data-val=''></div>
										<div id="CLS_INDEX_DIV" data-val=''></div>
									</th>
									<td headers="t1n01 t1th02"><div id="MAI_ANICODE_DIV" data-val=''></div></td>
									<td headers="t1n01 t1th03"><div id="MAI_INSIKNO_DIV" data-val=''></div></td>
									<td headers="t1n01 t1th04"><div id="TXT_MAI_SEX_DIV" data-val=''></div></td>
									<td headers="t1n01 t1th05"><div id="TXT_MAI_TEAMNO_DIV" data-val=''></div></td>
									<td headers="t1n01 t1th06"><div id="TXT_MAI_VVRMNO_DIV" data-val=''></div></td>
									<td headers="t1n01 t1th06"><div id="TXT_MAI_BIRTHDAY_DIV" data-val=''></div></td>
									<td headers="t1n01 t1th08"><div id="TXT_DATE1_DIV" data-val=''></div></td>
									<td headers="t1n01 t1th09"><div id="MAI_REGTYPE_DIV" data-val=''></div></td>
									<td headers="t1n01 t1th10"><div id="TXT_DATE2_DIV" data-val=''></div></td>
									<td headers="t1n01 t1th11"></td>
								</tr>
							
							</tbody>
						</table>
						<table class="aniinfo_add table_view" style="margin-top:10px;" >
							<caption></caption>
							<colgroup>
								<col style="width:19%;">
								<col style="width:9%;">
								<col style="width:9%;">
								<col style="width:9%;">
								<col style="width:9%;">
								<col style="width:9%;">
								<col style="width:9%;">
								<col style="width:9%;">
								<col style="width:9%;">
								<col style="width:9%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="t2th01"  rowspan="2" style="vertical-align:middle;">명칭</th>
									<th scope="colgroup" id="t2th02" colspan="4">생존</th>
									<th scope="colgroup" id="t2th03" colspan="4">폐사</th>
									<th scope="col" id="t2th04" rowspan="2" style="vertical-align:middle;">보육</th>
								</tr>
								<tr>
									<th scope="col" id="t2th02_1">수</th>
									<th scope="col" id="t2th02_2">암</th>
									<th scope="col" id="t2th02_3">미상</th>
									<th scope="col" id="t2th02_4">합계</th>
									<th scope="col" id="t2th03_1">수</th>
									<th scope="col" id="t2th03_2">암</th>
									<th scope="col" id="t2th03_3">미상</th>
									<th scope="col" id="t2th03_4">합계</th>
								</tr>
							</thead>
							<tbody id="clsTot_tbody">
								<tr style="display:none">
									<th scope="row" id="t2n01" headers="t2th01">
									<div id="MAI_ANICLSCODE_DIV" data-val=''></div>
									<div id="MAC_NAME_DIV" data-val=''></div>
									<div id="MAC_ENAME_DIV" data-val=''></div>
									</th>
									<td headers="t2n01 t2th02_1"><div id="CNT_1_MAI_SEX_M_DIV" data-val=''></div></td>
									<td headers="t2n01 t2th02_2"><div id="CNT_1_MAI_SEX_F_DIV" data-val=''></div></td>
									<td headers="t2n01 t2th02_3"><div id="CNT_1_MAI_SEX_A_DIV" data-val=''></div></td>
									<td headers="t2n01 t2th02_4"><div id="CNT_1_MAI_SEX_DIV" data-val=''></div></td>
									<td headers="t2n01 t2th03_1"><div id="CNT_2_MAI_SEX_M_DIV" data-val=''></div></td>
									<td headers="t2n01 t2th03_2"><div id="CNT_2_MAI_SEX_F_DIV" data-val=''></div></td>
									<td headers="t2n01 t2th03_3"><div id="CNT_2_MAI_SEX_A_DIV" data-val=''></div></td>
									<td headers="t2n01 t2th03_4"><div id="CNT_2_MAI_SEX_DIV" data-val=''></div></td>
									<td headers="t2n01 t2th04"><div id="CNT_BOYUK_DIV" data-val=''></div></td>
								</tr>
							</tbody>
						</table>
						
						<div id="Nwagon1" class="aniinfo_add table_view" style="margin-top:10px;"></div>
						<script>
							var options = {
								'legend': {
									names: ['2009','2010','2011','2012','2013','2014','2015','2016'],
									hrefs: []
								},
								'dataset': {
									title: '차트',
									values: [[3,2,3], [1,2,1], [4,2,1], [2,5,1], [2,3,1], [4,6,1], [1,2,4], [3,6,1]],
									colorset: ['#30a1ce','#DC143C', '#FF8C00'],
									fields:['수', '암', '미상']
								},
								'chartDiv': 'Nwagon1',
								'chartType': 'multi_column',
								'chartSize': { width: 990, height: 300 },
								'maxValue': 10,
								'increment': 5
							};
//							Nwagon.chart(options);
						</script>

					</div>
					
					<div id="ANILIST_DIV" style="display:;"></div>

					<div id="ANIINFO_DIV" style="display:;">
						<!-- 검은고니 -->
						<div class="aniinfo_add_box" id="ANI_DIV">
							<div id="MAI_ANICLSCODE_DIV" data-val=''></div>
							<div class="table_title_box">
								<span class="table_title"><a href="#" id="btn_plus2"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus2"><img src="/images/btn_minus.gif" alt=""></a><div id="TXT_MAC_NAME_DIV" data-val=''></div></span>
								<div class="sys_btn_box">
									<span class="align_right btn_hide2"><a href="#" class="excel_btn">엑셀</a><a href="#" class="print_btn btn_type2">프린트</a></span>
								</div>
							</div>
							<table class="aniinfo_add table_view2" >
								<caption></caption>
								<colgroup>
									<col style="width:3%;">
									<col style="width:8%;">
									<col style="width:10%;">
									<col style="width:5%;">
									<col style="width:23%;">
									<col style="width:12%;">
									<col style="width:8%;">
									<col style="width:8%;">
									<col style="width:8%;">
									<col style="width:8%;">
									<col style="width:7%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" id="t3th01">No</th>
										<th scope="col" id="t3th02">동물번호</th>
										<th scope="col" id="t3th03">동물별명</th>
										<th scope="col" id="t3th04">성별</th>
										<th scope="col" id="t3th05">관리부서</th>
										<th scope="col" id="t3th06">동물사</th>
										<th scope="col" id="t3th07">번식일</th>
										<th scope="col" id="t3th08">반입일</th>
										<th scope="col" id="t3th09">등록구분</th>
										<th scope="col" id="t3th10">반출일</th>
										<th scope="col" id="t3th11">반출사유</th>
									</tr>
								</thead>
								<tbody id="ani_list_tbody">
								</tbody>
							</table>
							<table class="aniinfo_add table_view2" style="margin-top:10px;" >
								<caption></caption>
								<colgroup>
									<col style="width:19%;">
									<col style="width:9%;">
									<col style="width:9%;">
									<col style="width:9%;">
									<col style="width:9%;">
									<col style="width:9%;">
									<col style="width:9%;">
									<col style="width:9%;">
									<col style="width:9%;">
									<col style="width:9%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" id="t4th01"  rowspan="2" style="vertical-align:middle;">명칭</th>
										<th scope="colgroup" id="t4th02" colspan="4">생존</th>
										<th scope="colgroup" id="t4th03" colspan="4">폐사</th>
										<th scope="col" id="t4th04" rowspan="2" style="vertical-align:middle;">보육</th>
									</tr>
									<tr>
										<th scope="col" id="t4th02_1">수</th>
										<th scope="col" id="t4th02_2">암</th>
										<th scope="col" id="t4th02_3">미상</th>
										<th scope="col" id="t4th02_4">합계</th>
										<th scope="col" id="t4th03_1">수</th>
										<th scope="col" id="t4th03_2">암</th>
										<th scope="col" id="t4th03_3">미상</th>
										<th scope="col" id="t4th03_4">합계</th>
									</tr>
								</thead>
								<tbody id="ani_tot_tbody">
									<tr>
										<th scope="row" id="t4n01" headers="t4th01"><div id="MAC_NAME_DIV" data-val=''></div></th>
										<td headers="t2n01 t2th02_1"><div id="CNT_1_MAI_SEX_M_DIV" data-val=''></div></td>
										<td headers="t2n01 t2th02_2"><div id="CNT_1_MAI_SEX_F_DIV" data-val=''></div></td>
										<td headers="t2n01 t2th02_3"><div id="CNT_1_MAI_SEX_A_DIV" data-val=''></div></td>
										<td headers="t2n01 t2th02_4"><div id="CNT_1_MAI_SEX_DIV" data-val=''></div></td>
										<td headers="t2n01 t2th03_1"><div id="CNT_2_MAI_SEX_M_DIV" data-val=''></div></td>
										<td headers="t2n01 t2th03_2"><div id="CNT_2_MAI_SEX_F_DIV" data-val=''></div></td>
										<td headers="t2n01 t2th03_3"><div id="CNT_2_MAI_SEX_A_DIV" data-val=''></div></td>
										<td headers="t2n01 t2th03_4"><div id="CNT_2_MAI_SEX_DIV" data-val=''></div></td>
										<td headers="t2n01 t2th04"><div id="CNT_BOYUK_DIV" data-val=''></div></td>
									</tr>
								</tbody>
							</table>
							<div id="Nwagon2" class="aniinfo_add table_view2" style="margin-top:10px;"></div>
							<script>
								var options = {
									'legend': {
										names: ['2009','2010','2011','2012','2013','2014','2015','2016'],
										hrefs: []
									},
									'dataset': {
										title: '차트',
										values: [[3,2,3], [1,2,1], [4,2,1], [2,5,1], [2,3,1], [4,6,1], [1,2,4], [3,6,1]],
										colorset: ['#30a1ce','#DC143C', '#FF8C00'],
										fields:['수', '암', '미상']
									},
									'chartDiv': 'Nwagon2',
									'chartType': 'multi_column',
									'chartSize': { width: 990, height: 300 },
									'maxValue': 10,
									'increment': 5
								};
	//							Nwagon.chart(options);
							</script>
	
						</div>
						
	  					<!-- //검은고니 -->
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
