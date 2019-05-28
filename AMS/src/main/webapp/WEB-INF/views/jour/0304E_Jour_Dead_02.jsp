<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<script src="/js/html5shiv.js"></script>
<link rel="stylesheet" href="/css/ui/reset.css">
<link rel="stylesheet" href="/css/ui/sub_layout.css">
<link rel="stylesheet" href="/css/base/contents.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> <!-- 달력 css-->
<link rel="stylesheet" href="/css/base/jquery.ui.timepicker.css">
<script src="/js/jquery-1.7.2.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  <!-- 달력 스크립트-->
<script type="text/javascript" src="/js/contents/base.js"></script>
<!-- <script type="text/javascript" src="/js/contents/cal.js"></script> -->
<script src="/js/common/common.js"></script> 
<script src="/js/common/json2.js"></script>
<script src='/js/common/jquery.ui.timepicker.js'></script>

<script type="text/javascript">
/* function search_anicode(){
	 window.open("/jour/0304/search_anicode.do","new","width=1000, height=800,left=500,top=100 ,resizable=yes, scrollbars=no, status=no, location=no, directories=no;");
	} */
	
function animal_select(MAI_ANICODE){
		var sendData = "MAI_ANICODE=" + MAI_ANICODE;
		var targetUrl = "/jour/0304/getAnimalInfo.do";

		$.ajax({
			type : "POST",
			data : sendData,
			url : targetUrl,
			success : function(result) {
						$("#dead_tbody input[name=aname]").val(result.MAC_NAME);
						$("#dead_tbody input[name=vname]").val(result.MVI_VVRMNAME);
						$("#dead_tbody input[name=acode]").val(result.MAI_ANICODE);
						$("#dead_tbody input[name=gender]").val(result.MAI_GENDER);
						$("#dead_tbody input[name=cities]").val(result.MAC_CITES);
						$("#dead_tbody input[name=age]").val(result.AGE +"년" + " " + result.AGE2 + "개월");
						$("#dead_tbody input[name=natmon]").val(result.MAC_NATMON);
						$("#dead_tbody input[name=rank]").val(result.MAC_RANK);
						fn_layer_hide();
			},
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
		});
	}

$(function() {
	$('#pdate').datetimepicker({
		controlType: 'select',
		oneLine: true,
		timeFormat: 'HH:mm'
	});
});

function fn_layer_show() {
	$("#layer01").show();
	$(".layer_popup").show();
	var width_size = $("#layer01").innerWidth()/2;
	$("#layer01").css("margin-left",-width_size);
}

function fn_layer_hide() {
	$(".layer_box").hide();
	$(".layer_popup").hide();
	$("body").css("overflow-y", "auto");
	
	$("#sch_tbody #codeSearch").val("");
	$("#sch_tbody #schKeyword").val("");
	$("#sch_tbody #selbox").val("");
	$("input:radio[name='pyeType']:radio[value='All']").attr("checked",true);
	fc_clearRow("schRst_tbody");
}

function selectPyeAll(result){
 	if(result!=null){
		console.log("test:" + JSON.stringify(result));
		console.log("result.length==>" + result.length);
		$("#schRst_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++)
		{
			var data = result[i];
			fc_addRow("schRst_tbody"); 
			
			var iRow = (i+1);
			
			$("#schRst_tbody div#INDEX_DIV").eq(iRow).html(iRow); 
			$("#schRst_tbody div#ANIMAL_NUMBER_DIV").eq(iRow).html(data.MAI_ANICODE);
			if(data.MAI_BNAME == null){
				$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
			}else if(data.MAI_BNAME != null){
				$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME + "(" + data.MAI_BNAME + ")"); 
			}
			$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).attr('data-val', data.MAI_ANICODE); 
			$("#schRst_tbody div#VVRMNAME_DIV").eq(iRow).html(data.MVI_VVRMNAME);
			$("#schRst_tbody div#ANIMAL_GENDER_DIV").eq(iRow).html(data.MAI_GENDER); 
			$("#schRst_tbody div#RegType_DIV").eq(iRow).html(data.MAI_DETHTYPE);
		}
		$("#schRst_tbody tr:first").attr('style',"display:none");
 	}
 	if(result == 0){
 		alert('조회된 결과가 없습니다.');
 		document.getElementById('schKeyword').value = "";
 		return;
 	}
}

function selectPyeAli(result){
 	if(result!=null){
		console.log("test:" + JSON.stringify(result));
		console.log("result.length==>" + result.length);
		$("#schRst_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("schRst_tbody"); 
			
			var iRow = (i+1);
						
			$("#schRst_tbody div#INDEX_DIV").eq(iRow).html(iRow); 
			$("#schRst_tbody div#ANIMAL_NUMBER_DIV").eq(iRow).html(data.MAI_ANICODE);
			if(data.MAI_BNAME == null){
				$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
			}else if(data.MAI_BNAME != null){
				$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME + "(" + data.MAI_BNAME + ")"); 
			}
			$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).attr('data-val', data.MAI_ANICODE); 
			$("#schRst_tbody div#VVRMNAME_DIV").eq(iRow).html(data.MVI_VVRMNAME);
			$("#schRst_tbody div#ANIMAL_GENDER_DIV").eq(iRow).html(data.MAI_GENDER); 
			$("#schRst_tbody div#RegType_DIV").eq(iRow).html(data.MAI_DETHTYPE);
			
		}
		$("#schRst_tbody tr:first").attr('style',"display:none");
 	}
 	if(result == 0){
 		alert('조회된 결과가 없습니다.');
 		document.getElementById('schKeyword').value = "";
 		return;
 	}
}

function selectPyeDea(result){
 	if(result!=null){
		console.log("test:" + JSON.stringify(result));
		console.log("result.length==>" + result.length);
		$("#schRst_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("schRst_tbody"); 
			
			var iRow = (i+1);
						
			$("#schRst_tbody div#INDEX_DIV").eq(iRow).html(iRow); 
			$("#schRst_tbody div#ANIMAL_NUMBER_DIV").eq(iRow).html(data.MAI_ANICODE);
			if(data.MAI_BNAME == null){
				$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
			}else if(data.MAI_BNAME != null){
				$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME + "(" + data.MAI_BNAME + ")"); 
			}
			$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).attr('data-val', data.MAI_ANICODE); 
			$("#schRst_tbody div#VVRMNAME_DIV").eq(iRow).html(data.MVI_VVRMNAME);
			$("#schRst_tbody div#ANIMAL_GENDER_DIV").eq(iRow).html(data.MAI_GENDER); 
			$("#schRst_tbody div#RegType_DIV").eq(iRow).html(data.MAI_DETHTYPE);
			
		}
		$("#schRst_tbody tr:first").attr('style',"display:none");
 	}
 	if(result == 0){
 		alert('조회된 결과가 없습니다.');
 		document.getElementById('schKeyword').value = "";
 		return;
 	}
}

function fn_base_selectPyeAll(param, callback, retObj) {
	fc_clearRow("schRst_tbody");
	var targetUrl = "/jour/0304/selectAllList.do";
	var param = {
			codeSearch:$("#sch_tbody #codeSearch").val(),
			schKeyword:$("#sch_tbody #schKeyword").val(),
			pyeType : "All",
			selbox : $("#sch_tbody #selbox").val()
	};
	$.getJSON(targetUrl, param, function(result) {
		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

function fn_base_selectPyeAli(param, callback, retObj) {
	fc_clearRow("schRst_tbody");
	var targetUrl = "/jour/0304/selectAliveList.do";
	var param = {
			codeSearch:$("#sch_tbody #codeSearch").val(),
			schKeyword:$("#sch_tbody #schKeyword").val(),
			pyeType : "Alive",
			selbox : $("#sch_tbody #selbox").val()
	};
	$.getJSON(targetUrl, param, function(result) {
		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

function fn_base_selectPyeDea(param, callback, retObj) {
	fc_clearRow("schRst_tbody");
	var targetUrl = "/jour/0304/selectDeathList.do";
	var param = {
			codeSearch:$("#sch_tbody #codeSearch").val(),
			schKeyword:$("#sch_tbody #schKeyword").val(),
			pyeType : "Death",
			selbox : $("#sch_tbody #selbox").val()
			
	};
	$.getJSON(targetUrl, param, function(result) {
		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

function fn_base_search(){
	var code = document.getElementById("codeSearch").value;
	var name = document.getElementById("schKeyword").value;
	var selc = document.getElementById("selbox").value;
	
	if(code == '' & name == '' & selc == ''){
		alert('검색어가 없습니다.');
		return;
	}
	
	var param = {
			pyeType : $('#sch_tbody input:radio[name=pyeType]:checked').val(),
			selbox : $("#sch_tbody #selbox").val()
	};
	console.log(param.pyeType);
	if(param.pyeType=="All"){
		fn_base_selectPyeAll(param, selectPyeAll);
	}else if(param.pyeType=="Alive"){
		fn_base_selectPyeAli("", selectPyeAli);
	}else if(param.pyeType=="Death"){
		fn_base_selectPyeDea("", selectPyeDea);
	}
}

$(document).ready(function() {
	if(fn_is_pms_upd('0304')){
		$(".popent_btn").css("display","");
		$(".popcancel_btn").css("display","");
	}
});
</script>

<%-- 마우스 오버시 커서 활성화 --%>
<style>
#MAC_NAME_DIV {cursor: pointer;}
</style>
	
<title>동물사육 &gt; 폐사보고서</title>
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
			<div id="lnb_area">
				<jsp:include page="/lnb.do"></jsp:include>
			</div>
			<!-- //left-->
			
			<!-- right-->
			<section id="contents_area">
			<h2>본문내용</h2>
				<!-- contents_title-->
				<div class="title_area">
                    <p class="contents_title">폐사보고서</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 동물사육</li>
                        <li>> 폐사보고서</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				
				<!-- contents-->
				<div class="contents_table">
					
					<!-- 문서정보-->
					<div class="aniinfo_add_box">
						<p class="sub_title"> 문서정보</p>	
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
									<th scope="row">문서번호</th><td colspan="3">${dethInfo.PDR_DOCNO }</td>
									
								</tr>
								<tr>
									<th scope="row">구분</th><td>폐사 보고서</td>
									<th scope="row">부서</th><td>${dethInfo.DPTNAME }</td>
								</tr>
								<tr>
									<th scope="row">작성자</th><td>${dethInfo.MUI_NAME }</td>
									<th scope="row">작성일</th><td>${dethInfo.CMN_MAK_DATE}</td>
								</tr>
						   </tbody>
						</table>

					</div>
					<!-- //문서정보-->
					
					<!-- 동물정보 -->
					<div class="aniinfo_add_box">
						<p class="sub_title"> 동물정보</p>	
						<table class="aniinfo_search table_view3" >
							<caption>동물정보</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
                            <tbody id="dead_tbody">
								<tr>
									<th scope="row">동물명</th><td>
									<c:if test="${dethInfo.MAI_BNAME == null}">
									<input type="text" id="aname" name="aname" disabled="disabled" value="${dethInfo.MAC_NAME }"> 
									</c:if>
									<c:if test="${dethInfo.MAI_BNAME != null}">
									<input type="text" id="aname" name="aname" disabled="disabled" value="${dethInfo.MAC_NAME } (${dethInfo.MAI_BNAME})">
									</c:if>
									&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="copy_btn" onclick="javascript:fn_layer_show();">검색</a></td>
									<th scope="row">동물사</th><td>
									<input type="text" id="vname" name="vname" class="textfield" disabled="disabled" value="${dethInfo.VVRMNAME }"></td>
								</tr>
								<tr>
									<th scope="row">동물번호</th><td>
									<input type="text" id="acode" name="acode" class="textfield" disabled="disabled" value="${dethInfo.MAI_ANICODE }"></td>
									<th scope="row">성별</th><td>
									<input type="text" id="gender" name="gender" class="textfield" disabled="disabled" value="${dethInfo.MAI_GENDER }"></td>
								</tr>
								<tr>
									<th scope="row">CITIES</th><td>
									<input type="text" id="cities" name="cities" class="textfield" disabled="disabled" value="${dethInfo.MAC_CITES }">
									</td>
									<th scope="row">나이</th><td>
									<input type="text" id="age" name ="age" class="textfield" disabled="disabled" value="${dethInfo.ONE }년  ${dethInfo.TWO }개월"></td>
								</tr>
								<tr>
									<th scope="row">천연기념물</th><td>
									<input type="text" id="natmon" name ="natmon" class="textfield" disabled="disabled" value="${dethInfo.MAC_NATMON }">
									</td>
									<th scope="row">등급</th><td>
									<input type="text" id="rank" name ="rank" class="textfield" disabled="disabled" value="${dethInfo.MAC_RANK }">
									</td>
								</tr>
						   </tbody>
						</table>
						
					</div>
					<!-- //동물정보-->
					
					<!-- 폐사내용 -->
					<div class="aniinfo_add_box">
						<p class="sub_title"> 폐사내용</p>	
						<table class="aniinfo_search table_view4" >
							<caption>폐사내용</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:85%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">폐사일시</th>
									<td>
									<input type="text" name="pdate" id="pdate" value="${dethInfo.PDR_PSDATE }" class="textfield" style="width: 150px;" />
									</td>
								</tr>
								<tr>
									<th scope="row">폐사장소</th><td><input type="text" value="${dethInfo.PDR_PSPLACE }" class="textfield"></td>
								</tr>
								<tr>
									<th style="width:150px; height:100px;">폐사경위</th>
									<td style="width:850px;"><textarea rows="10" cols="20" style="width:830px;"> ${dethInfo.PDR_DETHPROC }</textarea></td>
								</tr>
								<tr>
									<th scope="row">비고</th><td>
									<input type="text" value="${dethInfo.PDR_CMNT }" class="textfield"></td>
								</tr>
								<tr>
									<th scope="row">부검요청</th>
									<td>
										<p> 
										<label><input type="checkbox" value="1" ${dethInfo.PDR_BUKMREQ == "1" ? "CHECKED" : ""}/>요청</label>
										</p>
									</td>
								</tr>
						   </tbody>
						</table>


					</div>
					<!-- //폐사내용 -->
					
					<!-- 향후계획 -->
					<div class="aniinfo_add_box">
						<p class="sub_title"> 향후계획</p>	
						<div class="plan_box table_view5">
							<textarea rows="4" cols="20" style="width:980px;">${dethInfo.PDR_WAYSCH }</textarea>
						</div>
					</div>
					<!-- //향후계획 -->
					
					<div class="btn_area">
						<a href="javascript:;" class="popent_btn" style="display: none;">저장</a>
						<a href="javascript:history.back();" class="popcancel_btn">목록</a>
						<a href="javascript:;" class="popcancel_btn" style="display: none;">삭제</a>
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
		<div class="layer_box" id="layer01" style="width:1020px; top: 80px; height: 650px;overflow:auto;">
			<div class="layer_tit">동물검색</div>
				<div class="layer_con">
					 <table class="aniinfo_search" >
							<caption>동물정보조회</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:40%;">
								<col style="width:10%;">
								<col style="width:40%;">
							</colgroup>
                            <tbody id="sch_tbody">
								<tr><th scope="row">동물번호</th>
									<td><input name="codeSearch" type="text" id="codeSearch" class="textfield" style="width:90%"/></td>
									<th scope="row">동물사</th>
									<td>
										<div class="select_box">			
											<select name="selbox" id="selbox">
												<option value="">-- 출생 동물사 선택 --</option>
												<c:forEach var="vvrmList" items="${vvrmList }" varStatus="st" >
												<option value="${vvrmList.MVI_VVRMNO}">${vvrmList.MVI_VVRMNAME }</option>
												</c:forEach>
											</select>
										</div>
									</td>
								</tr>
								<tr><th scope="row">동물명</th>
									<td>
									<input name="schKeyword" type="text" id="schKeyword" class="textfield" style="width:90%"/>
									</td>
									<th scope="row">폐사구분</th>
									<td>
										<p>
										  <label><input type="radio" id="pyeType" name="pyeType" value="All" class="search_radio" checked="checked"/>전체</label>
										  <label><input type="radio" id="pyeType" name="pyeType" value="Alive" class="search_radio"/>생존</label>
										  <label><input type="radio" id="pyeType" name="pyeType" value="Death" class="search_radio"/>폐사</label>
										</p>
									</td>
								</tr>
								<tr>
								<tr><th colspan="4" scope="col" class="search_btn_area"><a href="javascript:fn_base_search();" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
						
						<!-- 동물정보추가-->
					<div class="aniinfo_add_box">					
						<table class="aniinfo_add" >
						<caption>동물정보내역</caption>
							<colgroup>
								<col style="width:2%;">
								<col style="width:10%;">
								<col style="width:3%;">
								<col style="width:7%;">
								<col style="width:8%;">
								<col style="width:5%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="num">No</th>
									<th scope="col" id="ani_name">동물명</th>
									<th scope="col" id="ani_sex">성별</th>
									<th scope="col" id="ani_num">동물번호</th>
									<th scope="col" id="ani_vvrm">동물사</th>			
									<th scope="col" id="ani_status">상태</th>					
								</tr>
							</thead>
							<tbody id="schRst_tbody">
								<tr style="display:none">
								<th><div id="INDEX_DIV" data-val=''></div></th>
								<td><div id="MAC_NAME_DIV" onclick="javascript:animal_select($(this).attr('data-val'));"></div></td>
								<td><div id="ANIMAL_GENDER_DIV" data-val=''></div></td>
								<td><div id="ANIMAL_NUMBER_DIV" data-val=''></div></td>
								<td><div id="VVRMNAME_DIV" data-val=''></div></td>
								<td><div id="RegType_DIV" data-val=''></div></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //동물정보추가-->
			</div>
			<a href="javascript:;" class="layer_close" onclick="javascript:fn_layer_hide();">레이어팝업 닫기</a>
		</div>		
	<!-- //#layer01 -->	
	</div>
	<!-- // layer_popup -->

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
