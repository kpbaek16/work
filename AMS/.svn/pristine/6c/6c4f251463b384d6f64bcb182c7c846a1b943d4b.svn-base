<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

function selectInspctMgr(result){
 	if(result!=null){
		console.log("selectInspctMgr:" + JSON.stringify(result));
		$("#ins_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("ins_tbody");
			
			var iRow = (i+1);	

			$("#ins_tbody div#PRES_INDEX_DIV").eq(iRow).html(iRow); 
			$("#ins_tbody div#JJDKY_KSType_DIV").eq(iRow).html(data.JJDKY_KSTYPE);
			$("#ins_tbody div#JJDKY_JRNO_DIV").eq(iRow).html(data.JJJ_DOCNO); 
			$("#ins_tbody div#JJDKY_KSDateYY_DIV").eq(iRow).html(data.JJDKY_KSDATEYY);
			$("#ins_tbody div#JJDKY_KSNO_DIV").eq(iRow).html(data.JJDKY_KSNO);
			if(data.JJDKY_KSNO == '혈액검사'){
				$("#ins_tbody div#JJDK_STS_DIV").eq(iRow).attr('data-val', data.JJJ_DOCNO);
				$("#ins_tbody div#JJDK_STS_DIV").eq(iRow).attr('data-val2', data.MAI_ANICLSCODE);
				$("#ins_tbody div#JJDK_STS_DIV").eq(iRow).attr('data-val3', data.JJDKY_DOCNO);
			}
			if(data.JJDKY_KSNO == '세균검사'){
				$("#ins_tbody div#JJDK_STS_DIV").eq(iRow).attr('data-val', data.JJJ_DOCNO);
				$("#ins_tbody div#JJDK_STS_DIV").eq(iRow).attr('data-val2', data.JJDKY_DOCNO);
			}
			if(data.JJDKY_KSNO == '진균검사'){
				$("#ins_tbody div#JJDK_STS_DIV").eq(iRow).attr('data-val', data.JJJ_DOCNO);
				$("#ins_tbody div#JJDK_STS_DIV").eq(iRow).attr('data-val2', data.JJDKY_DOCNO);
			}
			if(data.JJDKY_KSNO == '항생제감수성검사'){
				$("#ins_tbody div#JJDK_STS_DIV").eq(iRow).attr('data-val', data.JJJ_DOCNO);
				$("#ins_tbody div#JJDK_STS_DIV").eq(iRow).attr('data-val2', data.JJJ_RCNO);
			}
			$("#ins_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME);
			$("#ins_tbody div#MAI_ANICODE_DIV").eq(iRow).html(data.MAI_ANICODE);
			$("#ins_tbody div#MTI_TEAMNAME_DIV").eq(iRow).html(data.MTI_TEAMNAME);
		}
		$("#ins_tbody tr:first").attr('style',"display:none");
 	}
}

function selectInspctMgrJinryo(result){
 	if(result!=null){
		console.log("selectInspctMgrJinryo:" + JSON.stringify(result));
		$("#ins_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("ins_tbody");
			
			var iRow = (i+1);
			
			$("#ins_tbody div#PRES_INDEX_DIV").eq(iRow).html(iRow); 
			$("#ins_tbody div#JJDKY_KSType_DIV").eq(iRow).html(data.JJDKY_KSTYPE);
			$("#ins_tbody div#JJDKY_JRNO_DIV").eq(iRow).html(data.JJJ_DOCNO); 
			$("#ins_tbody div#JJDKY_KSDateYY_DIV").eq(iRow).html(data.JJDKY_KSDATEYY);
			$("#ins_tbody div#JJDKY_KSNO_DIV").eq(iRow).html(data.JJDKY_KSNO);
			if(data.JJDKY_KSNO == '혈액검사'){
				$("#ins_tbody div#JJDK_STS_DIV").eq(iRow).attr('data-val', data.JJJ_DOCNO);
				$("#ins_tbody div#JJDK_STS_DIV").eq(iRow).attr('data-val2', data.MAI_ANICLSCODE);
				$("#ins_tbody div#JJDK_STS_DIV").eq(iRow).attr('data-val3', data.JJDKY_DOCNO);
			}
			if(data.JJDKY_KSNO == '세균검사'){
				$("#ins_tbody div#JJDK_STS_DIV").eq(iRow).attr('data-val', data.JJJ_DOCNO);
				$("#ins_tbody div#JJDK_STS_DIV").eq(iRow).attr('data-val2', data.JJDKY_DOCNO);
			}
			if(data.JJDKY_KSNO == '진균검사'){
				$("#ins_tbody div#JJDK_STS_DIV").eq(iRow).attr('data-val', data.JJJ_DOCNO);
				$("#ins_tbody div#JJDK_STS_DIV").eq(iRow).attr('data-val2', data.JJDKY_DOCNO);
			}
			if(data.JJDKY_KSNO == '항생제감수성검사'){
				$("#ins_tbody div#JJDK_STS_DIV").eq(iRow).attr('data-val', data.JJJ_DOCNO);
				$("#ins_tbody div#JJDK_STS_DIV").eq(iRow).attr('data-val2', data.JJJ_RCNO);
			}
			$("#ins_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME);
			$("#ins_tbody div#MAI_ANICODE_DIV").eq(iRow).html(data.MAI_ANICODE);
			$("#ins_tbody div#MTI_TEAMNAME_DIV").eq(iRow).html(data.MTI_TEAMNAME);
		}
		$("#ins_tbody tr:first").attr('style',"display:none");
 	}
}

function selectInspctMgrBukum(result){
 	if(result!=null){
		console.log("selectInspctMgrBukum:" + JSON.stringify(result));
		$("#ins_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("ins_tbody");
			
			var iRow = (i+1);
			$("#ins_tbody div#PRES_INDEX_DIV").eq(iRow).html(iRow); 
			$("#ins_tbody div#JJDKY_KSType_DIV").eq(iRow).html(data.JJDKY_KSTYPE);
			$("#ins_tbody div#JJDKY_JRNO_DIV").eq(iRow).html(data.JJJ_DOCNO); 
			$("#ins_tbody div#JJDKY_KSDateYY_DIV").eq(iRow).html(data.JJDKY_KSDATEYY);
			$("#ins_tbody div#JJDKY_KSNO_DIV").eq(iRow).html(data.JJDKY_KSNO);
			if(data.JJDKY_KSNO == '혈액검사'){
				$("#ins_tbody div#JJDK_STS_DIV").eq(iRow).attr('data-val', data.JJJ_DOCNO);
				$("#ins_tbody div#JJDK_STS_DIV").eq(iRow).attr('data-val2', data.MAI_ANICLSCODE);
				$("#ins_tbody div#JJDK_STS_DIV").eq(iRow).attr('data-val3', data.JJDKY_DOCNO);
			}
			if(data.JJDKY_KSNO == '세균검사'){
				$("#ins_tbody div#JJDK_STS_DIV").eq(iRow).attr('data-val', data.JJJ_DOCNO);
				$("#ins_tbody div#JJDK_STS_DIV").eq(iRow).attr('data-val2', data.JJDKY_DOCNO);
			}
			if(data.JJDKY_KSNO == '진균검사'){
				$("#ins_tbody div#JJDK_STS_DIV").eq(iRow).attr('data-val', data.JJJ_DOCNO);
				$("#ins_tbody div#JJDK_STS_DIV").eq(iRow).attr('data-val2', data.JJDKY_DOCNO);
			}
			if(data.JJDKY_KSNO == '항생제감수성검사'){
				$("#ins_tbody div#JJDK_STS_DIV").eq(iRow).attr('data-val', data.JJJ_DOCNO);
				$("#ins_tbody div#JJDK_STS_DIV").eq(iRow).attr('data-val2', data.JJJ_RCNO);
			}
			$("#ins_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME);
			$("#ins_tbody div#MAI_ANICODE_DIV").eq(iRow).html(data.MAI_ANICODE);
			$("#ins_tbody div#MTI_TEAMNAME_DIV").eq(iRow).html(data.MTI_TEAMNAME);
		}
		$("#ins_tbody tr:first").attr('style',"display:none");
 	}
}

function fn_treat_selectInspctMgr(param, callback, retObj) {
	fc_clearRow("ins_tbody");
	var targetUrl = "/treat/0406/selectInspctMgr.do";
	$.getJSON(targetUrl, param, function(result) {
//		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

function fn_treat_selectInspctMgrJinryo(param, callback, retObj) {
	fc_clearRow("ins_tbody");
	var targetUrl = "/treat/0406/selectInspctMgrJinryo.do";
	$.getJSON(targetUrl, param, function(result) {
//		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

function fn_treat_selectInspctMgrBukum(param, callback, retObj) {
	fc_clearRow("ins_tbody");
	var targetUrl = "/treat/0406/selectInspctMgrBukum.do";
	$.getJSON(targetUrl, param, function(result) {
//		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

function fn_treat_view0406E(JJJ_DOCNO,MAI_ANICLSCODE, JJDKY_DOCNO ){
	var targetUrl = "/prevent/0501/view0501K01.do";
	location.href = targetUrl + "?docno=" +JJJ_DOCNO+"&"+"code=" + MAI_ANICLSCODE +"&"+"docno2=" + JJDKY_DOCNO;
}

// 혈액검사
function select_K01(JJJ_DOCNO,MAI_ANICLSCODE, JJDKY_DOCNO ){
	var targetUrl = "/prevent/0501/view0501K01.do";
	location.href = targetUrl + "?docno=" +JJJ_DOCNO+"&"+"code=" + MAI_ANICLSCODE +"&"+"docno2=" + JJDKY_DOCNO;
}

// 세균검사
function select_K02(JJJ_DOCNO, JJDKY_DOCNO ){
	var targetUrl = "/prevent/0501/view0501K02.do";
	location.href = targetUrl + "?docno=" +JJJ_DOCNO+"&"+"docno2=" + JJDKY_DOCNO;
}

// 진균검사
function select_K03(JJJ_DOCNO, JJDKY_DOCNO){
	/* var targetUrl = "/treat/0406/view0406E.do"; */
	var targetUrl = "/prevent/0501/view0501K03.do";
	location.href = targetUrl + "?docno=" +JJJ_DOCNO +"&"+"docno2=" + JJDKY_DOCNO;
}

// 항생제감수성검사
function select_K04(JJJ_DOCNO, JJJ_RCNO){
	var targetUrl = "/prevent/0501/view0501K04.do";
	location.href = targetUrl + "?docno=" +JJJ_DOCNO +"&"+"docno2=" + JJJ_RCNO;
}

function fn_treat_search(){
	var param = {
			cal_1 : $("#sch_tbody #cal_1").val(),
			cal_2 : $("#sch_tbody #cal_2").val(),	
			jinryoNum:$("#sch_tbody #jinryoNum").val(),
			aniName:$("#sch_tbody #aniName").val(),
			aniNum:$("#sch_tbody #aniNum").val(),
			schType : $('#sch_tbody input:radio[name=schType]:checked').val(),
			schType2 : $('#sch_tbody input:radio[name=schType2]:checked').val()
	};
	console.log(param);
	if(param.schType=="all"){
		fc_clearRow("ins_tbody");
		fn_treat_selectInspctMgr(param, selectInspctMgr);
	}else if(param.schType=="jinryo"){
		fc_clearRow("ins_tbody");
		fn_treat_selectInspctMgrJinryo(param, selectInspctMgrJinryo);
	}else if(param.schType=="bukum"){
		fc_clearRow("ins_tbody");
		fn_treat_selectInspctMgrBukum(param, selectInspctMgrBukum);
	}
}	
</script>

<title>동물진료 &gt; 검사관리</title>
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
                    <p class="contents_title">검사관리</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 동물진료</li>
                        <li>> 검사관리</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 분류검색표-->
					<div class="search_box">
                        <table class="aniinfo_search" >
							<caption>처방전 조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody id="sch_tbody">
								<tr>
									<th scope="row">일자</th>
									<td><p><input type="text" class="calendar1" id="cal_1" value="${calInfo.cal_1}"><label for="cal_1"></label> ~  
									<input type="text" class="calendar2" id="cal_2" value="${calInfo.cal_2}"><label for="cal_2"></label></p></td>						
								</tr>
								<tr>
									<th scope="row">진료번호</th>
									<td><input name="jinryoNum" type="text" id="jinryoNum" class="textfield"><label for="jinryoNum"></label></td>
								</tr>
								<tr>
									<th scope="row">동물명</th>
									<td><input name="aniName" type="text" id="aniName" class="textfield"><label for="aniName"></label></td>
								</tr>
								<tr>
									<th scope="row">동물번호</th>
									<td><input name="aniNum" type="text" id="aniNum" class="textfield"><label for="aniNum"></label></td>
								</tr>
								<tr>
									<th scope="row">검사구분</th>
									<td>
										<p>
										<label><input type="radio" id="schType" name="schType" value="all" class="search_radio" checked="checked"/>전체</label>
										<label><input type="radio" id="schType" name="schType" value="jinryo" class="search_radio"/>진료</label>
										<label><input type="radio" id="schType" name="schType" value="bukum" class="search_radio"/>부검</label>
										</p>
									</td>
								</tr>
								<tr>
									<th scope="row">검사종류</th>
									<td>
										<p>
										  <label><input type="radio" id="schType2" name="schType2" value="all" class="search_radio type1" checked="checked"/>전체</label>
										  <label><input type="radio" id="schType2" name="schType2" value="blood" class="search_radio"/>혈액검사</label>
										  <label><input type="radio" id="schType2" name="schType2" value="virus" class="search_radio"/>세균검사</label>
										  <label><input type="radio" id="schType2" name="schType2" value="msd" class="search_radio"/>진균검사</label>
										  <label><input type="radio" id="schType2" name="schType2" value="vaccine" class="search_radio"/>항생제감수성검사</label>
										  <label><input type="radio" id="schType2" name="schType2" value="kiseng" class="search_radio"/>기생충검사</label>
										  <label><input type="radio" id="schType2" name="schType2" value="jamhyul" class="search_radio"/>잠혈반응검사</label>
										  <label><input type="radio" id="schType2" name="schType2" value="pcr" class="search_radio"/>PCR검사</label>
										  <label><input type="radio" id="schType2" name="schType2" value="pee" class="search_radio"/>소변검사</label></br>
										  <label><input type="radio" id="schType2" name="schType2" value="xray" class="search_radio"/>X-Ray</label>
										  <label><input type="radio" id="schType2" name="schType2" value="ultrasound" class="search_radio"/>초음파검사</label>
										</p>
									</td>
								</tr>
								<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_treat_search();" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					<!-- //분류검색표-->
					
					<!-- 검사정보 일람-->
					<div class="table_wrap">
						<!-- 검사정보 항목 표-->
						<p class="sub_title">검사정보 일람</p>	
						<table class="aniinfo_add" >
						
						<caption>처방전 내역</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:6%;">
								<col style="width:12%;">
								<col style="width:10%;">
								<col style="width:12%;">
								<col style="width:8%;">
								<col style="width:15%;">
								<col style="width:10%;">
								<col style="width:9%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">No</th>
									<th scope="col" id="th02">구분</th>
									<th scope="col" id="th03">진료번호</th>
									<th scope="col" id="th04">예약일자</th>
									<th scope="col" id="th05">검사종류</th>
									<th scope="col" id="th06">완료상태</th>
									<th scope="col" id="th07">동물명</th>
									<th scope="col" id="th08">동물번호</th>
									<th scope="col" id="th09">관리부서</th>
								</tr>
							</thead>
							<tbody id="ins_tbody">
								<tr style="display:none">
									<th scope="row" id="n01" headers="th01"><div id="PRES_INDEX_DIV"></div></th>
									<td><div id="JJDKY_KSType_DIV"></div></td>
									<td><div id="JJDKY_JRNO_DIV"></div></td>
									<td><div id="JJDKY_KSDateYY_DIV"></div></td>
									<td><div id="JJDKY_KSNO_DIV"></div></td>
									<td><a href="#"><div id="JJDK_STS_DIV" onclick="javascript:select_K01($(this).attr('data-val'),$(this).attr('data-val2'),$(this).attr('data-val3'));" class="search_btn">결과입력</div></a></td>
									<td><div id="MAC_NAME_DIV"></div></td>
									<td><div id="MAI_ANICODE_DIV"></div></td>
									<td><div id="MTI_TEAMNAME_DIV"></div></td>
								</tr>
							</tbody>
						</table>				
						<!-- //그룹항목표-->
						</div>
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