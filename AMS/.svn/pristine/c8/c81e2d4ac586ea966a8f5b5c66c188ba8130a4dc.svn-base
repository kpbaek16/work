<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script> 
<script src="/js/jquery-1.7.2.min.js"></script>
<script src="/js/html5shiv.js"></script>
<link rel="stylesheet" href="/css/ui/reset.css">
<link rel="stylesheet" href="/css/ui/sub_layout.css">
<link rel="stylesheet" href="/css/base/contents.css">
<script type="text/javascript" src="/js/contents/base.js"></script>
<script src="/js/common/common.js"></script> 
<script src="/js/common/json2.js"></script>

<script type="text/javascript">
function selectVcnList(result){
 	if(result!=null){
		console.log("test:" + JSON.stringify(result));
		console.log("result.length==>" + result.length);
		$("#vcn_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("vcn_tbody"); 
			
			var iRow = (i+1);
			$("#vcn_tbody div#MVI_VCNNAME_DIV").eq(iRow).attr('data-val', iRow); 
			$("#vcn_tbody div#MVI_VCNNAME_DIV").eq(iRow).html(data.MVI_VCNNAME + "(" + data.MVI_PRODNAME + ")"); 
			$("#vcn_tbody div#MVI_VCNNO_DIV").eq(iRow).attr('data-val', data.MVI_VCNNO); 
		}
		$("#vcn_tbody tr:first").attr('style',"display:none");
 	}
}

function selectProdList(result){
 	if(result!=null){
		console.log("test:" + JSON.stringify(result));
		console.log("result.length==>" + result.length);
		$("#vcn_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("vcn_tbody"); 
			
			var iRow = (i+1);
			$("#vcn_tbody div#MVI_VCNNAME_DIV").eq(iRow).attr('data-val', iRow); 
			$("#vcn_tbody div#MVI_VCNNAME_DIV").eq(iRow).html(data.MVI_VCNNAME + "(" + data.MVI_PRODNAME + ")"); 
			$("#vcn_tbody div#MVI_VCNNO_DIV").eq(iRow).attr('data-val', data.MVI_VCNNO); 
		}
		$("#vcn_tbody tr:first").attr('style',"display:none");
 	}
}

function selectVcnInfo(MVI_VCNNO, callback, retObj){
	var param = {
			MVI_VCNNO:MVI_VCNNO
	};
	$.ajax({
		type : "POST",
		url : "/base/0109/selectVcnInfo.do",
		dataType : 'json',
		data : param,
		success : function(data) {
//			alert(JSON.stringify(data));
			console.log(JSON.stringify(data));
			$("#vcn_tbody_info div#MVI_VCNNO_DIV").html(data.MVI_VCNNO); 
			$("#vcn_tbody_info #MVI_VCNNAME").val(data.MVI_VCNNAME);
			$("#vcn_tbody_info #MVI_PRODNAME").val(data.MVI_PRODNAME);
			$("#vcn_tbody_info #MVI_UNIT").val(data.MVI_UNIT);
			$("#vcn_tbody_info #MVI_INWAY").val(data.MVI_INWAY);
			if(typeof(callback)=="function"){
				callback.call(retObj, data);
			}
		},
		error : function(xmlHttpObj) {
			alert(xmlHttpObj.responseText + '오류가 발생하였습니다.');
		}
	});	
}

function fn_base_selectVcnList(param, callback, retObj) {
	fc_clearRow("vcn_tbody");
	var param = {
			schKeyword:$("#sch_tbody #schKeyword").val(),
			schType : "vcn"
	};
	
	var targetUrl = "/base/0109/selectVcnList.do";
	$.getJSON(targetUrl, param, function(result) {
		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

function fn_base_selectProdList(param, callback, retObj) {
	fc_clearRow("vcn_tbody");
	var param = {
			schKeyword:$("#sch_tbody #schKeyword").val(),
			schType : "prod"
	};
	
	var targetUrl = "/base/0109/selectProdList.do";
	$.getJSON(targetUrl, param, function(result) {
		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

function fn_base_selectVcnInfo(targetRow){
	console.log("targetRow====>" + targetRow);
	var param = {
			MVI_VCNNO:$("#vcn_tbody div#MVI_VCNNO_DIV").eq(targetRow).attr('data-val')
	};
	var validate = function validate(data){
		if(data!=null){
	 		return;
		}else{
	 	}
	}
	selectVcnInfo(param.MVI_VCNNO, validate);
	ShowTable('drug_table');
}	

function fn_base_search(){
	var param = {
			schType : $('#sch_tbody input:radio[name=schType]:checked').val(),
	};
	console.log(param.schType);
	if(param.schType=="vcn"){
		fn_base_selectVcnList(param, selectVcnList);
	}else if(param.schType=="prod"){
		fc_clearRow("vcn_tbody");
		fn_base_selectProdList("", selectProdList);
	}
}	
$(document).ready(function() {
	if(fn_is_pms_upd(0109)){
		$(".add_btn").css("display","");
		$(".save_btn").css("display","");
		$(".cancel_btn").css("display","");
		$(".popent_btn").css("display","");
		$(".popcancel_btn").css("display","");
	}
});

function ShowTable(wtable) {
	eval(wtable).style.display="";
	}

function HideTable(wtable) {
	eval(wtable).style.display="none";
}

function fn_layer_show() {
	$(".layer_box").show();
	$(".layer_popup").show();
	var width_size = $(".layer_box").innerWidth()/2;
	$(".layer_box").css("margin-left",-width_size);
	$('.layer_popup').css("position","fixed");
	$('.layer_box').css("position","fixed");
}

function fn_layer_hide() {
	$(".layer_box").hide();
	$(".layer_popup").hide();
	$("body").css("overflow-y", "auto");
	$("#vcn_layer #vcn_name").val("");
	$("#vcn_layer #prd_name").val("");
}

</script>

<title>기본정보 &gt; 백신정보</title>
</head>
<body>
	<!-- header -->
	<div id="sub_wrap">
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
                    <p class="contents_title">백신정보</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 기본정보</li>
                        <li>> 백신정보</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				
				<!-- contents-->
				<div class="contents_table">
					<!-- 분류검색표-->
					<div class="search_box">
                        <table class="search_table" >
							<caption>백신정보조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody id="sch_tbody">
                            <tr>
                                <th scope="row">분류 구분</th>
                                <td>
                                <p>
                                  <label><input type="radio" id="schType" name="schType" value="vcn" class="search_radio" checked="checked"/>백신명</label>
                                  <label><input type="radio" id="schType" name="schType" value="prod" class="search_radio" />상품명</label>
                                </p>
                                </td>
                            </tr>
                            <tr><th scope="row">분류 명칭</th><td><input name="schKeyword" type="text" id="schKeyword" class="textfield" style="width:90%"/></td></tr>
							<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_base_search();" class="search_btn">조회</a></th></tr>
                            </tbody>
                        </table>
					</div>
					<!-- //분류검색표-->
					
					<!-- 백신 관리-->
					<div class="table_wrap">
						<!-- 백신 관리표-->
						<p class="sub_title">백신 관리</p>					
						<table class="ani_list category category03" style="width:350px;">
							<caption>백신명</caption>
							<colgroup>
								<col style="width:100%;" />
							</colgroup>
							<thead>
								<tr><th scope="col">백신명
								<a href="javascript:;" onclick="javascript:fn_layer_show();" class="add_btn" style="display: none;">추가</a>
							</thead>
							<tbody id="vcn_tbody">
								<tr style="display:none" onClick="fc_HighLightTR(this, '#c9cc99','cc3333');">
									<td>
										<div id="MVI_VCNNO_DIV" data-val=''></div>
										<a href="javascript:;">
										<div id="MVI_VCNNAME_DIV" data-val='' onclick="javascript:fn_base_selectVcnInfo($(this).attr('data-val'));"></div>
										</a>
									</td>
								</tr>
							</tbody>
						</table>
						<!-- //백신 관리표-->
						
						<!-- 백신 관리상세정보표-->
						<div class="ani_info_box">
							<form action="updateVcnInfo.do" method="POST">
							<table class="ani_info infotable" id="drug_table" style="display:none;"> 
								<caption>약품 관리상세정보</caption>
								<colgroup>
									<col style="width:30%" />
									<col style="width:70%"/>
								</colgroup>
								<thead>
									<tr><th colspan="2" scope="col"><span class="info_title">상세정보</span>
									<a href="javascript:;" class="save_btn" style="display: none;">저장</a>
									<a href="javascript:;" class="cancel_btn" style="display: none;">취소</a>
								</thead>
								<tbody id="vcn_tbody_info">
									<tr><th scope="row">백신번호</th><td><div id="MVI_VCNNO_DIV" data-val=''></div></td></tr>
									<tr><th scope="row">백신명</th><td><input type="text" name="MVI_VCNNAME" id="MVI_VCNNAME" class="textfield"/></td></tr>
									<tr><th scope="row">상품명</th><td><input type="text" name="MVI_PRODNAME" id="MVI_PRODNAME" class="textfield"/></td></tr>
									<tr><th scope="row">단위</th>
										<td>			
											<select name="MVI_UNIT" id="MVI_UNIT">
											<option value="">-- 약품단위 선택 --</option>
											<c:forEach var="unitList" items="${unitList }" varStatus="st">
											<option value="${unitList.MCC_S_CODE}">${unitList.MCC_S_NAME }</option>
											</c:forEach>
											</select>
										</td>
									</tr>
									<tr><th scope="row">투여 방법</th>
										<td>	
											<select name="MVI_INWAY" id="MVI_INWAY">
											<option value="1">-- 투여 방법 선택 --</option>	
											<c:forEach var="inwayList" items="${inwayList }" varStatus="st">
											<option value="${inwayList.MCC_S_CODE}">${inwayList.MCC_S_NAME }</option>
											</c:forEach>
											</select>
										</td>
										</tr>
								</tbody>
							</table>
							</form>
							<!-- //상세정보기본-->
						</div>
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
			<div class="layer_tit">백신 추가</div>
				<div class="layer_con">
					<div class="search_box">
                        <table class="aniinfo_search table_view" style="width:760px;" >
							<caption>백신 추가</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
							
                            <tbody id="vcn_layer">
								<tr>
									<th scope="row">백신 접종 번호</th><td>${test.MAXNUM}</td>
								</tr>
								<tr>
									<th scope="row">백신 접종 명칭</th><td><input type="text" class="textfield" style="width:50%" id='vcn_name'></td>
								</tr>
								<tr>
									<th scope="row">백신 상품 명칭</th><td><input type="text" class="textfield" style="width:50%" id='prd_name'></td>
								</tr>
								<tr>
								<th scope="row">단위</th>
										<td>			
											<select name="MVI_UNIT_layer" id="MVI_UNIT_layer">
											<option value="">-- 약품단위 선택 --</option>
											<c:forEach var="unitList" items="${unitList }" varStatus="st">
											<option value="${unitList.MCC_S_CODE}">${unitList.MCC_S_NAME }</option>
											</c:forEach>
											</select>
										</td></tr>
								<tr>
								<th scope="row">투여 방법</th>
										<td>	
											<select name="MVI_Inway_layer" id="MVI_Inway_layer">
											<option value="">-- 투여 방법 선택 --</option>	
											<c:forEach var="inwayList" items="${inwayList }" varStatus="st">
											<option value="${inwayList.MCC_S_CODE}">${inwayList.MCC_S_NAME }</option>
											</c:forEach>
											</select>
										</td></tr>
                            </tbody>
                        </table>
					</div>
					
					<div class="btn_area">
					<a href="#javascript:;" class="popent_btn" style="display: none; ">저장</a>&nbsp;
					<a href="javascript:fn_layer_hide();" class="popcancel_btn" style="display: none; ">취소</a>
					</div>
				</div>
				<a href="#none" class="layer_close" onclick="javascript:fn_layer_hide();">레이어팝업 닫기</a>
		</div>		
		<!-- //#layer01-->
	</div>
	<!-- // layer_popup -->
		
	</div>
	<!-- //container -->
	
	<!-- footer -->
	<div id="footer_wrap">
	<jsp:include page="/footer.do"></jsp:include>
	</div>
	<!-- //footer -->
</body>
</html>
