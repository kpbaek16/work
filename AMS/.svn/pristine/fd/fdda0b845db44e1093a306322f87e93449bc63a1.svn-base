<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
function goBack() {
    window.history.back();
}	

	function selectUserKjpList(result){
	 	if(result!=null){
			console.log("test:" + JSON.stringify(result));
			console.log("teamTable.length==>" + result.length);
			$("#kjp_tbody tr:first").attr('style',"display:");
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("kjp_tbody");
				
				var iRow = (i+1);
				$("#kjp_tbody div#KJP_INDEX_DIV").eq(iRow).html(iRow); 
				$("#kjp_tbody div#MCC_S_NAME_DIV").eq(iRow).html(data.MCC_S_NAME); 
				$("#kjp_tbody div#MUK_KJSEQ_DIV").eq(iRow).html(data.MUK_KJSEQ); 
				$("#kjp_tbody div#MUI_NAME_DIV").eq(iRow).html(data.MUI_NAME); 
				$("#kjp_tbody div#MDI_DPTNAME_DIV").eq(iRow).html(data.MDI_DPTNAME); 
				$("#kjp_tbody div#TXT_MUI_JCCODE_DIV").eq(iRow).html(data.TXT_MUI_JCCODE); 
				$("#kjp_tbody div#MUI_DPTLVLNAME_DIV").eq(iRow).attr('data-val', data.MUI_DPTLVLNAME); 
			}
			$("#kjp_tbody tr:first").attr('style',"display:none");
	 	}
	}

	function fn_treat_selectUserKjpList(param, callback, retObj) {
		fc_clearRow("kjp_tbody");
	
		var targetUrl = "/treat/0401/selectUserKjpList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}
	
	function selectUserRcvTypeList(result){
	 	if(result!=null){
			console.log("test:" + JSON.stringify(result));
			console.log("teamTable.length==>" + result.length);
			$("#rcv_tbody tr:first").attr('style',"display:");
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("rcv_tbody");
				
				var iRow = (i+1);
				$("#rcv_tbody div#RCV_INDEX_DIV").eq(iRow).html(iRow); 
				$("#rcv_tbody div#RCV_DEL_DIV").eq(iRow).attr('data-val', iRow); 

				$("#rcv_tbody div#MUK_KJID_DIV").eq(iRow).attr('data-val', data.MUK_KJID); 
				$("#rcv_tbody div#MUI_NAME_DIV").eq(iRow).html(data.MUI_NAME); 
				$("#rcv_tbody div#MDI_DPTNAME_DIV").eq(iRow).html(data.MDI_DPTNAME); 
				$("#rcv_tbody div#MTI_TEAMNAME_DIV").eq(iRow).html(data.MTI_TEAMNAME); 
				$("#rcv_tbody div#TXT_MUI_JCCODE_DIV").eq(iRow).html(data.TXT_MUI_JCCODE); 
			}
			$("#rcv_tbody tr:first").attr('style',"display:none");
	 	}
	}
	
	function selectUserNotiTypeList(result){
	 	if(result!=null){
			console.log("test:" + JSON.stringify(result));
			console.log("teamTable.length==>" + result.length);
			$("#noti_tbody tr:first").attr('style',"display:");
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("noti_tbody");
				
				var iRow = (i+1);
				$("#noti_tbody div#NOTI_INDEX_DIV").eq(iRow).html(iRow); 
				$("#noti_tbody div#NOTI_DEL_DIV").eq(iRow).attr('data-val', iRow); 
				
				$("#noti_tbody div#MUK_KJID_DIV").eq(iRow).attr('data-val', data.MUK_KJID); 
				$("#noti_tbody div#MUI_NAME_DIV").eq(iRow).html(data.MUI_NAME); 
				$("#noti_tbody div#MDI_DPTNAME_DIV").eq(iRow).html(data.MDI_DPTNAME); 
				$("#noti_tbody div#MTI_TEAMNAME_DIV").eq(iRow).html(data.MTI_TEAMNAME); 
				$("#noti_tbody div#TXT_MUI_JCCODE_DIV").eq(iRow).html(data.TXT_MUI_JCCODE); 
			}
			$("#noti_tbody tr:first").attr('style',"display:none");
	 	}
	}
	
	function fn_treat_selectUserRcvTypeList(param, callback, retObj) {
		param.muk_rcvtype = 'RCV';
		fc_clearRow("rcv_tbody");

		var targetUrl = "/treat/0401/selectUserRcvTypeList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function fn_treat_selectUserNotiTypeList(param, callback, retObj) {
		param.muk_rcvtype = 'NOTI';
		fc_clearRow("noti_tbody");

		var targetUrl = "/treat/0401/selectUserRcvTypeList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function fn_pop_selectUserRcvTypeList(){
		var param = {
			muk_rcvtype : ""
		};
		fn_treat_selectUserRcvTypeList(param, selectUserRcvTypeList);
		fn_treat_selectUserNotiTypeList(param, selectUserNotiTypeList);
	}

	function fn_pop_deleteUserRcvType(rcvType, targetRow){
		if(!confirm("삭제하시겠습니까?")){
			return;	
		}
		var muk_kjid = "";
		if(rcvType=="NOTI"){
			muk_kjid = $("#noti_tbody div#MUK_KJID_DIV").eq(targetRow).attr('data-val');
		}else if(rcvType=="RCV"){
			muk_kjid = $("#rcv_tbody div#MUK_KJID_DIV").eq(targetRow).attr('data-val');
		}
		var param = {
				muk_kjid : muk_kjid
		};

		var targetUrl = "/treat/0401/deleteUserRcvType.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
		fn_pop_selectUserRcvTypeList();
	}
	
	$(document).ready(function() {
		var data = {
				sch_dptno : ""
		};
		fn_treat_selectUserKjpList(data, selectUserKjpList);
	});
	
</script>

<title>동물진료 &gt; 보건일지</title>
</head>
<body>
<div id="sub_wrap">

	<!-- header -->
	<jsp:include page="/header.do"></jsp:include>
	<!-- //header -->
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
                    <p class="contents_title">보건일지</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 동물진료</li>
                        <li>> 보건일지</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 결재-->
					<div class="aniinfo_add_box" style="margin-top:0px;">
						<div class="table_title_box">
							<span class="table_title">
							<a href="#" id="btn_minus"><img src="/images/btn_minus.gif" alt=""></a>
							<a href="#" id="btn_minus"><img src="/images/btn_minus.gif" alt=""></a>결재</span>
							<div class="sys_btn_box">
								<span class="align_right btn_hide"><a href="#layer01" class="cha_btn layer_open" onclick="javascript:fn_pop_selectUserRcvTypeList();">수정</a></span>
							</div>
						</div>
						<table class="aniinfo_add table_view" >
							<caption>결재</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:15%;">
								<col style="width:20%;">
								<col style="width:15%;">
								<col style="width:15%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">No</th>
									<th scope="col" id="th02">구분</th>
									<th scope="col" id="th03">순서</th>
									<th scope="col" id="th04">이름</th>
									<th scope="col" id="th05">부서</th>
									<th scope="col" id="th06">직책</th>
									<th scope="col" id="th07">결재</th>
								</tr>
							</thead>
							<tbody id="kjp_tbody">
								<tr>
									<th scope="row" id="n01" headers="th01"><div id="KJP_INDEX_DIV" data-val=''></div></th>
									<td headers="n01 th02"><div id="MCC_S_NAME_DIV" data-val=''></div></td>
									<td headers="n01 th03"><div id="MUK_KJSEQ_DIV" data-val=''></div></td>
									<td headers="n01 th04"><div id="MUI_NAME_DIV" data-val=''></div></td>
									<td headers="n01 th05"><div id="MDI_DPTNAME_DIV" data-val=''></div></td>
									<td headers="n01 th06"><div id="TXT_MUI_JCCODE_DIV" data-val=''></div><div id="MUI_DPTLVLNAME_DIV" data-val=''></div></td>
									<td headers="n01 th07"></td>
								</tr>
								<tr>
									<th scope="row" id="n02" headers="th01">2</th>
									<td headers="n02 th02">수신</td>
									<td headers="n02 th03">2</td>
									<td headers="n02 th04">홍길동</td>
									<td headers="n02 th05">동물복지1과</td>
									<td headers="n02 th06">주임</td>
									<td headers="n02 th07"></td>
								</tr>
							</tbody>
						</table>
					
					</div>
					<!-- //결재-->
					
					<!-- 문서정보-->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">
							<a href="#" id="btn_minus"><img src="/images/btn_minus.gif" alt=""></a>문서정보</span>
							</div>
						<table class="aniinfo_search table_view2" >
							<caption>문서정보</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">문서번호</th><td colspan="3">PS20160719-00001</td>
								</tr>
								<tr>
									<th scope="row">작성자</th><td>홍길동</td><th scope="row">부서</th><td>동물복지과</td>
								</tr>
								<tr>
									<th scope="row">구분</th><td>보건일지</td><th scope="row">작성일</th><td>2016-06-01</td>
								</tr>
								<tr>
									<th scope="row">날씨</th><td>흐림</td><th scope="row"></th><td></td>
								</tr>
						   </tbody>
						</table>

						<table class="aniinfo_search table_remove2" >
							<caption>문서정보</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">문서번호</th>
									<td colspan="3"><input name="textfield" type="text" id="table2_text1" class="textfield" value="PS20160719-00001"/><label for="table2_text1"></label></td>
								</tr>
								<tr>
									<th scope="row">작성자</th><td><input name="textfield" type="text" id="table2_text2" class="textfield" value="홍길동"/><label for="table2_text2"></label></td>
									<th scope="row">부서</th><td><input name="textfield" type="text" id="table2_text3" class="textfield" value="동물복지과"/><label for="table2_text3"></label></td>
								</tr>
								<tr>
									<th scope="row">구분</th><td><input name="textfield" type="text" id="table2_text4" class="textfield" value="보건일지"/><label for="table2_text4"></label></td>
									<th scope="row">작성일</th><td><input name="textfield" type="text" id="table2_text5" class="textfield" value="2016-06-01"/><label for="table2_text5"></label></td>
								</tr>
								<tr>
									<th scope="row">날씨</th><td><input name="textfield" type="text" id="table2_text6" class="textfield" value="흐림"/><label for="table2_text6"></label></td>
									<th scope="row"></th><td><input name="textfield" type="text" id="table2_text7" class="textfield" value=""/><label for="table2_text7"></label></td>
								</tr>
								
						   </tbody>
						</table>

					</div>
					<!-- //문서정보-->
					
					<!-- 진료현황 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
									<span class="table_title"> <a href="#" id="btn_minus5"><img
											src="/images/btn_minus.gif" alt=""></a> <a href="#" id="#"><img
											src="/images/btn_minus.gif" alt=""></a>진료현황
									</span>
								</div>
						<table class="aniinfo_add table_view3" >
							<caption>진료현황</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:13%;">
								<col style="width:10%;">
								<col style="width:13%;">
								<col style="width:10%;">
								<col style="width:13%;">
								<col style="width:21%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="t3th01" rowspan="2" style="vertical-align:middle;">항목</th>
									<th scope="colgroup" id="t3th02" colspan="2">진료</th>
									<th scope="colgroup" id="t3th03" colspan="2">폐사</th>
									<th scope="colgroup" id="t3th04" colspan="2">입원</th>
									<th scope="col" id="t3th05" rowspan="2" style="vertical-align:middle;">임상병리검사</th>																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																					
								</tr>
								<tr>
									<th scope="col" id="t3_a">종수</th>
									<th scope="col" id="t3_b">동물수</th>
									<th scope="col" id="t3_c">종수</th>
									<th scope="col" id="t3_d">동물수</th>
									<th scope="col" id="t3_e">종수</th>
									<th scope="col" id="t3_f">동물수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="t3n01" headers="t3th01">현황</th>
									<td headers="t3n01 t3th02 t3_a">1</td>
									<td headers="t3n01 t3th02 t3_b">2</td>
									<td headers="t3n01 t3th03 t3_c">3</td>
									<td headers="t3n01 t3th03 t3_d">4</td>
									<td headers="t3n01 t3th04 t3_e">5</td>
									<td headers="t3n01 t3th04 t3_f">6</td>
									<td headers="t3n01 t3th05">7 건</td>
								</tr>
							</tbody>
						
						</table>
					</div>
					<!-- //진료현황 -->
					
					<!-- 동물사방역 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
									<span class="table_title"> <a href="#" id="btn_minus5"><img
											src="/images/btn_minus.gif" alt=""></a>동물사방역
									</span>
									<div class="sys_btn_box">
										<span class="align_right"> 
										<input type="button" class="save_btn" value="저장"> 
											<a href="#" class="cancel_btn">취소</a> 
										</span>
									</div>
								</div>
						
						<div class="plan_box table_view4">
							<p class="plan_text">구제역 및 AI 특별방역 실시</p>
						</div>
						<div class="plan_box table_remove4">
							<p class="plan_text">
							<textarea rows="3" name="contents" style="width:100%; border: 0; resize: none; padding:0;">구제역 및 AI 특별방역 실시</textarea></p>
						</div>

					</div>
					<!-- //동물사방역 -->
					
					<br><br>
					
					<!-- 진료내역 -->
					<div class="aniinfo_add_box" style="margin-top:0px;">
						<div class="table_title_box">
									<span class="table_title"> <a href="#" id="btn_minus5"><img
											src="/images/btn_minus.gif" alt=""></a>진료내역
									</span>
								</div>
						<table class="aniinfo_add table_view" >
							<caption>진료내역</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:12%;">
								<col style="width:14%;">
								<col style="width:9%;">
								<col style="width:5%;">
								<col style="width:9%;">
								<col style="width:13%;">
								<col style="width:8%;">
								<col style="width:25%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">No</th>
									<th scope="col" id="th02">진료번호</th>
									<th scope="col" id="th03">동물명</th>
									<th scope="col" id="th04">동물번호</th>
									<th scope="col" id="th05">성별</th>
									<th scope="col" id="th06">동물사</th>
									<th scope="col" id="th07">병명</th>
									<th scope="col" id="th08">진료의</th>
									<th scope="col" id="th09">진료내용</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="n01" headers="th01">1</th>
									<td headers="n01 th02">JR-20160720</td>
									<td headers="n01 th03">아프리카포큐파일</td>
									<td headers="n01 th04">1234567</td>
									<td headers="n01 th05">암</td>
									<td headers="n01 th06">야행관</td>
									<td headers="n01 th07">좌인염식욕저하</td>
									<td headers="n01 th08">홍길동</td>
									<td headers="n01 th09"></td>
								</tr>
								<tr>
									<th scope="row" id="n02" headers="th01">2</th>
									<td headers="n02 th02"></td>
									<td headers="n02 th03"></td>
									<td headers="n02 th04"></td>
									<td headers="n02 th05"></td>
									<td headers="n02 th06"></td>
									<td headers="n02 th07"></td>
									<td headers="n02 th08"></td>
									<td headers="n02 th09"></td>
								</tr>
								<tr>
									<th scope="row" id="n03" headers="th01">3</th>
									<td headers="n03 th02"></td>
									<td headers="n03 th03"></td>
									<td headers="n03 th04"></td>
									<td headers="n03 th05"></td>
									<td headers="n03 th06"></td>
									<td headers="n03 th07"></td>
									<td headers="n03 th08"></td>
									<td headers="n03 th09"></td>
								</tr>
								<tr>
									<th scope="row" id="n04" headers="th01">4</th>
									<td headers="n04 th02"></td>
									<td headers="n04 th03"></td>
									<td headers="n04 th04"></td>
									<td headers="n04 th05"></td>
									<td headers="n04 th06"></td>
									<td headers="n04 th07"></td>
									<td headers="n04 th08"></td>
									<td headers="n04 th09"></td>
								</tr>
								<tr>
									<th scope="row" id="n05" headers="th01">5</th>
									<td headers="n05 th02"></td>
									<td headers="n05 th03"></td>
									<td headers="n05 th04"></td>
									<td headers="n05 th05"></td>
									<td headers="n05 th06"></td>
									<td headers="n05 th07"></td>
									<td headers="n05 th08"></td>
									<td headers="n05 th09"></td>
								</tr>
								
							</tbody>
						</table>
					</div>
					<!-- //진료내역 -->
		
					<!-- 금일폐사 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
									<span class="table_title"> <a href="#" id="btn_minus5"><img
											src="/images/btn_minus.gif" alt=""></a>금일폐사
									</span>
								</div>
						<table class="aniinfo_add table_view2" >
							<caption>금일폐사</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:12%;">
								<col style="width:14%;">
								<col style="width:9%;">
								<col style="width:5%;">
								<col style="width:9%;">
								<col style="width:13%;">
								<col style="width:25%;">
								<col style="width:8%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="t2th01">No</th>
									<th scope="col" id="t2th02">폐사보고서</th>
									<th scope="col" id="t2th03">동물명</th>
									<th scope="col" id="t2th04">동물번호</th>
									<th scope="col" id="t2th05">성별</th>
									<th scope="col" id="t2th06">동물사</th>
									<th scope="col" id="t2th07">나이</th>
									<th scope="col" id="t2th08">폐사경위</th>
									<th scope="col" id="t2th09">부검요청</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="t2n01" headers="t2th01">1</th>
									<td headers="t2n01 t2th02">JR-20160720</td>
									<td headers="t2n01 t2th03">아프리카포큐파일</td>
									<td headers="t2n01 t2th04">1234567</td>
									<td headers="t2n01 t2th05">암</td>
									<td headers="t2n01 t2th06">야행관</td>
									<td headers="t2n01 t2th07">1 년 1 개월</td>
									<td headers="t2n01 t2th08">혈액검사, 약물 투여</td>
									<td headers="t2n01 t2th09"></td>
								</tr>
								<tr>
									<th scope="row" id="t2n02" headers="t2th01">2</th>
									<td headers="t2n02 t2th02"></td>
									<td headers="t2n02 t2th03"></td>
									<td headers="t2n02 t2th04"></td>
									<td headers="t2n02 t2th05"></td>
									<td headers="t2n02 t2th06"></td>
									<td headers="t2n02 t2th07"></td>
									<td headers="t2n02 t2th08"></td>
									<td headers="t2n02 t2th09"></td>
								</tr>
								<tr>
									<th scope="row" id="t2n03" headers="t2th01">3</th>
									<td headers="t2n03 t2th02"></td>
									<td headers="t2n03 t2th03"></td>
									<td headers="t2n03 t2th04"></td>
									<td headers="t2n03 t2th05"></td>
									<td headers="t2n03 t2th06"></td>
									<td headers="t2n03 t2th07"></td>
									<td headers="t2n03 t2th08"></td>
									<td headers="t2n03 t2th09"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //금일폐사 -->
					
					<!-- 입원동물 -->
					<div class="aniinfo_add_box">
						<span class="table_title"> <a href="#" id="btn_minus5"><img src="/images/btn_minus.gif" alt=""></a>입원동물
									</span>
						<table class="aniinfo_add table_view3" >
							<caption>입원동물</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:12%;">
								<col style="width:14%;">
								<col style="width:9%;">
								<col style="width:5%;">
								<col style="width:9%;">
								<col style="width:13%;">
								<col style="width:8%;">
								<col style="width:25%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="t3th01">No</th>
									<th scope="col" id="t3th02">진료번호</th>
									<th scope="col" id="t3th03">동물명</th>
									<th scope="col" id="t3th04">동물번호</th>
									<th scope="col" id="t3th05">성별</th>
									<th scope="col" id="t3th06">동물사</th>
									<th scope="col" id="t3th07">병명</th>
									<th scope="col" id="t3th08">진료의</th>
									<th scope="col" id="t3th09">비고</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="t3n01" headers="t3th01">1</th>
									<td headers="t3n01 t3th02">JR-20160720</td>
									<td headers="t3n01 t3th03">아프리카포큐파일</td>
									<td headers="t3n01 t3th04">1234567</td>
									<td headers="t3n01 t3th05">암</td>
									<td headers="t3n01 t3th06">야행관</td>
									<td headers="t3n01 t3th07">좌인염식욕저하</td>
									<td headers="t3n01 t3th08">김길동</td>
									<td headers="t3n01 t3th09"></td>
								</tr>
								<tr>
									<th scope="row" id="t3n02" headers="t3th01">2</th>
									<td headers="t3n02 t3th02"></td>
									<td headers="t3n02 t3th03"></td>
									<td headers="t3n02 t3th04"></td>
									<td headers="t3n02 t3th05"></td>
									<td headers="t3n02 t3th06"></td>
									<td headers="t3n02 t3th07"></td>
									<td headers="t3n02 t3th08"></td>
									<td headers="t3n02 t3th09"></td>
								</tr>
								<tr>
									<th scope="row" id="t3n03" headers="t3th01">3</th>
									<td headers="t3n03 t3th02"></td>
									<td headers="t3n03 t3th03"></td>
									<td headers="t3n03 t3th04"></td>
									<td headers="t3n03 t3th05"></td>
									<td headers="t3n03 t3th06"></td>
									<td headers="t3n03 t3th07"></td>
									<td headers="t3n03 t3th08"></td>
									<td headers="t3n03 t3th09"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //입원동물 -->
					
					<br><br>
					
					<!-- 임상병리검사 -->
					<div class="aniinfo_add_box" style="margin-top:0px;">
						<div class="table_title_box">
							<span class="table_title"> <a href="#" id="btn_minus5"><img src="/images/btn_minus.gif" alt=""></a>임상병리검사 </span>
						</div>
						<table class="aniinfo_add table_view" >
							<caption>임상병리검사</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:15%;">
								<col style="width:15%;">
								<col style="width:12%;">
								<col style="width:5%;">
								<col style="width:11%;">
								<col style="width:12%;">
								<col style="width:25%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">No</th>
									<th scope="col" id="th02">검사번호</th>
									<th scope="col" id="th03">동물명</th>
									<th scope="col" id="th04">동물번호</th>
									<th scope="col" id="th05">성별</th>
									<th scope="col" id="th06">동물사</th>
									<th scope="col" id="th07">나이</th>
									<th scope="col" id="th08">검사명</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="n01" headers="th01">1</th>
									<td headers="n01 th02">JR-20160720</td>
									<td headers="n01 th03">아프리카포큐파일</td>
									<td headers="n01 th04">1234567</td>
									<td headers="n01 th05">암</td>
									<td headers="n01 th06">야행관</td>
									<td headers="n01 th07">1 년 1 개월</td>
									<td headers="n01 th08"></td>
								</tr>
								<tr>
									<th scope="row" id="n02" headers="th01">2</th>
									<td headers="n02 th02"></td>
									<td headers="n02 th03"></td>
									<td headers="n02 th04"></td>
									<td headers="n02 th05"></td>
									<td headers="n02 th06"></td>
									<td headers="n02 th07"></td>
									<td headers="n02 th08"></td>
								</tr>
								<tr>
									<th scope="row" id="n03" headers="th01">3</th>
									<td headers="n03 th02"></td>
									<td headers="n03 th03"></td>
									<td headers="n03 th04"></td>
									<td headers="n03 th05"></td>
									<td headers="n03 th06"></td>
									<td headers="n03 th07"></td>
									<td headers="n03 th08"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //임상병리검사 -->

					<!-- 임상병리검사 예약 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title"> 
							<a href="#" id="btn_minus5"><img src="/images/btn_minus.gif" alt=""></a>임상병리검사 예약  </span>
						</div>
						<table class="aniinfo_add table_view2">
							<caption>임상병리검사 예약</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:15%;">
								<col style="width:15%;">
								<col style="width:12%;">
								<col style="width:5%;">
								<col style="width:11%;">
								<col style="width:12%;">
								<col style="width:25%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="t2th01">No</th>
									<th scope="col" id="t2th02">검사명</th>
									<th scope="col" id="t2th03">동물명</th>
									<th scope="col" id="t2th04">동물번호</th>
									<th scope="col" id="t2th05">성별</th>
									<th scope="col" id="t2th06">동물사</th>
									<th scope="col" id="t2th07">나이</th>
									<th scope="col" id="t2th08">비고</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="t2n01" headers="t2th01">1</th>
									<td headers="t2n01 t2th02">혈액검사</td>
									<td headers="t2n01 t2th03">아프리카포큐파일</td>
									<td headers="t2n01 t2th04">1234567</td>
									<td headers="t2n01 t2th05">암</td>
									<td headers="t2n01 t2th06">야행관</td>
									<td headers="t2n01 t2th07">1 년 1 개월</td>
									<td headers="t2n01 t2th08"></td>
								</tr>
								<tr>
									<th scope="row" id="t2n02" headers="t2th01">2</th>
									<td headers="t2n02 t2th02">혈액생화학검사</td>
									<td headers="t2n02 t2th03">아프리카포큐파일</td>
									<td headers="t2n02 t2th04">1234567</td>
									<td headers="t2n02 t2th05">암</td>
									<td headers="t2n02 t2th06">야행관</td>
									<td headers="t2n02 t2th07">1 년 1 개월</td>
									<td headers="t2n02 t2th08"></td>
								</tr>
								<tr>
									<th scope="row" id="t2n03" headers="t2th01">3</th>
									<td headers="t2n03 t2th02"></td>
									<td headers="t2n03 t2th03"></td>
									<td headers="t2n03 t2th04"></td>
									<td headers="t2n03 t2th05"></td>
									<td headers="t2n03 t2th06"></td>
									<td headers="t2n03 t2th07"></td>
									<td headers="t2n03 t2th08"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //임상병리검사 예약 -->		
							
					<!-- 특기사항 -->
					<div class="aniinfo_add_box" style="margin-bottom:30px;">
						<div class="table_title_box">
							<span class="table_title"> 
							<a href="#" id="btn_minus5"><img src="/images/btn_minus.gif" alt=""></a>특기사항 </span>
						</div>
						
						<div class="plan_box table_view3">
							<p class="plan_text">
							${cntInfo.JBJ_CMNT }
							</p>
							</div>

					</div>
					<!-- //특기사항 -->

					<div class="btn_area">
						<input type="button" value="저장" class="popent_btn btn_type2">
						<input type="button" onclick="goBack()" value="목록" class="popcancel_btn btn_type2">
						<input type="button" value="삭제" class="popcancel_btn btn_type2">
					</div>

				</div>
				<!-- //contents-->
			</section>
			<!-- //right-->
		</div>

	

	<!-- layer_popup -->
	<div class="layer_popup">	
		<div class="dimm"></div>
		<!-- #layer01 -->
		<div class="layer_box" id="layer01" style="width:800px;">
			<div class="layer_tit">결재 정보</div>
				<div class="layer_con">					
					<div class="table_box">
						<p class="sub_title" style="margin-bottom:10px;">수신<a href="#layer02" class="table_add_btn layer_open popnext_je" style="margin-top:-5px; text-indent:0;">추가</a></p>
						<table class="aniinfo_add" style="width:760px;" >
							<caption>결재정보 수신</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:15%;">
								<col style="width:25%;">
								<col style="width:20%;">
								<col style="width:15%;">
								<col style="width:15%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01_1">No</th>
									<th scope="col" id="th02_1">이름</th>
									<th scope="col" id="th03_1">부서</th>
									<th scope="col" id="th04_1">팀</th>
									<th scope="col" id="th05_1">직책</th>
									<th scope="col" id="th06_1">선택</th>
								</tr>
							</thead>
							<tbody id="rcv_tbody">
								<tr style="display:none">
									<th scope="row" id="n01_1" headers="th01_1"><div id="RCV_INDEX_DIV" data-val=''></div></th>
									<td headers="n01_1 th02_1"><div id="MUK_KJID_DIV" data-val=''></div><div id="MUI_NAME_DIV" data-val=''></div></td>
									<td headers="n01_1 th03_1"><div id="MDI_DPTNAME_DIV" data-val=''></div></td>
									<td headers="n01_1 th04_1"><div id="MTI_TEAMNAME_DIV" data-val=''></div></td>
									<td headers="n01_1 th05_1"><div id="TXT_MUI_JCCODE_DIV" data-val=''></div></td>
									<td headers="n01_1 th06_1"><a href="#" class="del2_btn btn_type2"><div onclick="javascript:fn_pop_deleteUserRcvType('RCV', $(this).attr('data-val'));" id="RCV_DEL_DIV" data-val=''>삭제</div></a></td>
								</tr>
								
							</tbody>
						</table>
					</div>
					<!-- pagination -->
					<div class="pagination" style="margin-top:10px;">
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

					<div class="table_box"  style="margin-top:20px;">
						<p class="sub_title" style="margin-bottom:10px;">참조<a href="#layer02" class="table_add_btn layer_open popnext_je" style="margin-top:-5px; text-indent:0;">추가</a></p>
						<table class="aniinfo_add" style="width:760px;" >
							<caption>결재 정보 참조</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:15%;">
								<col style="width:25%;">
								<col style="width:20%;">
								<col style="width:15%;">
								<col style="width:15%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01_2">No</th>
									<th scope="col" id="th02_2">이름</th>
									<th scope="col" id="th03_2">부서</th>
									<th scope="col" id="th04_2">팀</th>
									<th scope="col" id="th05_2">직책</th>
									<th scope="col" id="th06_2">선택</th>
								</tr>
							</thead>
							<tbody id="noti_tbody">
								<tr style="display:none">
									<th scope="row" id="n02_2" headers="th02_2"><div id="NOTI_INDEX_DIV" data-val=''></div></th>
									<td headers="n01_2 th02_2"><div id="MUK_KJID_DIV" data-val=''></div><div id="MUI_NAME_DIV" data-val=''></div></td>
									<td headers="n01_2 th03_2"><div id="MDI_DPTNAME_DIV" data-val=''></div></td>
									<td headers="n01_2 th04_2"><div id="MTI_TEAMNAME_DIV" data-val=''></div></td>
									<td headers="n01_2 th05_2"><div id="TXT_MUI_JCCODE_DIV" data-val=''></div></td>
									<td headers="n01_2 th06_2"><a href="#" class="del2_btn btn_type2"><div id="NOTI_DEL_DIV" data-val='' onclick="javascript:fn_pop_deleteUserRcvType('NOTI', $(this).attr('data-val'));">삭제</div></a></td>
								</tr>
							
							</tbody>
						</table>
					</div>
					<!-- pagination -->
					<div class="pagination" style="margin-top:10px;">
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


					<div class="btn_area">
						<a href="#none" class="popent_btn btn_type2">확인</a>
						<a href="#none" class="popcancel_btn btn_type2">취소</a>
					</div>
				</div>
				<a href="#none" class="layer_close">레이어팝업 닫기</a>
		</div>		
		<!-- //#layer01-->
		<!-- #layer02 -->
		<div class="layer_box" id="layer02" style="width:800px;">
			<div class="layer_tit">직원목록</div>
				<div class="layer_con">
					<div class="search_box">
                        <table class="search_table" style="width:760px;" >
							<caption>직원목록</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody>
                            <tr>
                                <th scope="row">종류</th>
                                <td>
                                <p>
                                  <label><input type="radio" name="list" value="A" class="search_radio" />이름</label>
                                  <label><input type="radio" name="list" value="B" class="search_radio"/>팀</label>
								  <label><input type="radio" name="list" value="c" class="search_radio"/>부서</label>
                                </p>
                                </td>
                            </tr>
                            <tr><th scope="row">검색</th><td><input name="textfield" type="text" id="popseach_text2" class="textfield" style="width:90%"/><label for="popseach_text2"></label></td></tr>
							<tr><th colspan="2" scope="col" class="search_btn_area"><a href="#" class="search_btn">조회</a></th></tr>
                            </tbody>
                        </table>
					</div>
					<div class="table_box">
						<table class="aniinfo_add" style="width:760px; margin-top:20px;" >
							<caption>종 정보</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:15%;">
								<col style="width:25%;">
								<col style="width:20%;">
								<col style="width:15%;">
								<col style="width:15%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01_3">No</th>
									<th scope="col" id="th02_3">이름</th>
									<th scope="col" id="th03_3">부서</th>
									<th scope="col" id="th04_3">팀</th>
									<th scope="col" id="th05_3">직책</th>
									<th scope="col" id="th06_3">선택</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="n01_3" headers="th01_3">1</th>
									<td headers="n01_3 th02_3">김길동</td>
									<td headers="n01_3 th03_3">동물복지2과</td>
									<td headers="n01_3 th04_3"></td>
									<td headers="n01_3 th05_3">과장</td>
									<td headers="n01_3 th06_3"><input type="checkbox" id="sel_chk"><label for="sel_chk"></label></td>
								</tr>
								<tr>
									<th scope="row" id="n02_3" headers="th01_3">2</th>
									<td headers="n02_3 th02_3">김길동</td>
									<td headers="n02_3 th03_3">동물복지2과</td>
									<td headers="n02_3 th04_3"></td>
									<td headers="n02_3 th05_3">과장</td>
									<td headers="n02_3 th06_3"><input type="checkbox" id="sel_chk2"><label for="sel_chk2"></label></td>
								</tr>
								<tr>
									<th scope="row" id="n03_3" headers="th01_3">3</th>
									<td headers="n03_3 th02_3"></td>
									<td headers="n03_3 th03_3"></td>
									<td headers="n03_3 th04_3"></td>
									<td headers="n03_3 th05_3"></td>
									<td headers="n03_3 th06_3"></td>
								</tr>
								<tr>
									<th scope="row" id="n04_3" headers="th01_3">4</th>
									<td headers="n04_3 th02_3"></td>
									<td headers="n04_3 th03_3"></td>
									<td headers="n04_3 th04_3"></td>
									<td headers="n04_3 th05_3"></td>
									<td headers="n04_3 th06_3"></td>
								</tr>
								<tr>
									<th scope="row" id="n05_3" headers="th01_3">5</th>
									<td headers="n05_3 th02_3"></td>
									<td headers="n05_3 th03_3"></td>
									<td headers="n05_3 th04_3"></td>
									<td headers="n05_3 th05_3"></td>
									<td headers="n05_3 th06_3"></td>
								</tr>
								
							</tbody>
						</table>
					</div>

					<!-- pagination -->
					<div class="pagination"  style="margin-top:10px;">
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
					
					<div class="btn_area">
						<a href="#none" class="popadd_btn btn_type2">추가</a>
						<a href="#none" class="popcancel_btn btn_type2">취소</a>
					</div>
				</div>
				<a href="#none" class="layer_close">레이어팝업 닫기</a>
		</div>		
		<!-- //#layer02-->

	</div>
	<!-- // layer_popup -->


	</div>
	<!-- //container -->
	<!-- footer -->
	<jsp:include page="/footer.do"></jsp:include>
	<!-- //footer -->
</div>
</body>
</html>
