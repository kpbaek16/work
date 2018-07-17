<!doctype html>
<html lang="ko">
<head>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="java.util.*" %>

<script src="/js/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" href="/css/ui/reset.css">
<link rel="stylesheet" href="/css/ui/sub_layout.css">
<link rel="stylesheet" href="/css/base/contents.css">
<script type="text/javascript" src="/js/contents/base.js"></script>
<script src="/js/common/common.js"></script> 
<script src="/js/common/json2.js"></script>

<title>기본정보 &gt; 부서/팀</title>
</head>

<script type="text/javascript">
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
}

function fn_layer_hide() {
	$(".layer_box").hide();
	$(".layer_popup").hide();
	$("body").css("overflow-y", "auto");
}

function selectDeptInfo(MDI_LINKNO, callback, retObj){
	var param = {MDI_LINKNO:MDI_LINKNO};
	$.ajax({
		type : "POST",
		url : "/base/0103/selectDeptInfo.do",
		dataType : 'json',
		data : param,
		success : function(data) {
//			alert(JSON.stringify(data));
			console.log(JSON.stringify(data));
			$("#dptinfo_tbody div#MDI_LINKNO").html(data.MDI_LINKNO); 
			$("#dptinfo_tbody #MDI_DPTNAME").val(data.MDI_DPTNAME); 
			$("#dpt_layer div#dpt_number").html(data.MDI_LINKNO +"("+data.MDI_DPTNAME+")");
			$("#dpt_layer div#dpt_number").eq(iRow).attr('data-val', data.MDI_LINKNO); 
			
			if(typeof(callback)=="function"){
				callback.call(retObj, data);
			}
		},
		error : function(xmlHttpObj) {
			alert(xmlHttpObj.responseText + '오류가 발생하였습니다.');
		}
	});	
	HideTable('team_table_update');
}	

function selectTeamInfo(teamno, callback, retObj){
	var param = {teamno:teamno};
	$.ajax({
		type : "POST",
		url : "/base/0103/selectTeamInfo.do",
		dataType : 'json',
		data : param,
		success : function(data) {
//			alert(JSON.stringify(data));
			console.log(JSON.stringify(data));
			$("#teaminfo_tbody div#MTI_TEAMNO").html(data.MTI_TEAMNO); 
			$("#teaminfo_tbody #MTI_TEAMNAME").val(data.MTI_TEAMNAME);
			
			if(typeof(callback)=="function"){
				callback.call(retObj, data);
			}
		},
		error : function(xmlHttpObj) {
			alert(xmlHttpObj.responseText + '오류가 발생하였습니다.');
		}
	});	
}
 
 function selectTeamList(result){
	 	if(result!=null){
			console.log("selectTeamList:" + JSON.stringify(result));
			$("#team_tbody tr:first").attr('style',"display:");
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("team_tbody"); 

				var iRow = (i+1);
				$("#team_tbody div#TEAMNAME_DIV").eq(iRow).html(data.MTI_TEAMNAME); 
				$("#team_tbody div#TEAMNAME_DIV").eq(iRow).attr('data-val', data.MTI_TEAMNO); 
			}
			$("#team_tbody tr:first").attr('style',"display:none");
			
			/* if(result == 0){
		 		alert('조회된 결과가 없습니다.');
		 		document.getElementById('schKeyword').value = "";
			} */
	 	}
	}

function selectDeptList(result){
	 	if(result!=null){
			console.log("selectDeptList:" + JSON.stringify(result));
			console.log("result.length==>" + result.length);
			$("#dept_tbody tr:first").attr('style',"display:");
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("dept_tbody"); 

				var iRow = (i+1);
				$("#dept_tbody div#DPTNAME_DIV").eq(iRow).attr('data-val', iRow); 
				$("#dept_tbody div#DPTNAME_DIV").eq(iRow).html(data.MDI_DPTNAME); 
				$("#dept_tbody div#DPTNAME_DIV").eq(iRow).attr('data-val', data.MDI_LINKNO); 
				$("#dept_tbody td#MDI_LINKNO_DIV").eq(iRow).attr('data-val', data.MDI_LINKNO); 
				
			}
			$("#dept_tbody tr:first").attr('style',"display:none");
			
			/* if(result == 0){
		 		alert('조회된 결과가 없습니다.');
		 		document.getElementById('schKeyword').value = "";
			} */
	 	}
	}

function fn_base_selectDeptList(param, callback, retObj) {
	fc_clearRow("dept_tbody");
	
	var targetUrl = "/base/0103/selectDeptList.do";
	$.getJSON(targetUrl, param, function(result) {
		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

function fn_base_selectTeamList(dptno, callback, retObj) {
	console.log("dptno====>" + dptno);
	fc_clearRow("team_tbody");

	var targetUrl = "/base/0103/selectTeamList.do";
	var param = {
			schType : $('#sch_tbody input:radio[name=schType]:checked').val(),
			schKeyword : $("#sch_tbody #schKeyword").val(),
			dptno:dptno
	};
	$.getJSON(targetUrl, param, function(result) {
		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}
 function fn_base_selectDeptInfo(targetRow){
		console.log("targetRow====>" + targetRow);
		var param = {
				MDI_LINKNO:targetRow
		};
		var validate = function validate(data){
			if(data!=null){
		 		return;
			}else{
		 	}
		}
		selectDeptInfo(param.MDI_LINKNO, validate);
		ShowTable('dpt_table_update');
	}	
 
function fn_base_selectTeamInfo(targetObj){
	console.log("data-val====>" + $(targetObj).attr('data-val'));
	var param = {
			teamno : $(targetObj).attr('data-val')
		};
	var validate = function validate(data){
		if(data!=null){
	 		return;
		}else{
	 	}
	}
	selectTeamInfo(param.teamno, validate); 
	HideTable('dpt_table_update');
}	 

function fn_layer_show() {
	$(".layer_box").show();
	$(".layer_popup").show();
	var width_size = $(".layer_box").innerWidth()/2;
	$(".layer_box").css("margin-left",-width_size);
}

function fn_base_search(){
	var param = {
			schType : $('#sch_tbody input:radio[name=schType]:checked').val(),
			schKeyword : $("#sch_tbody #schKeyword").val()
	};
	console.log(param.schType);
	if(param.schType=="dept"){
		fn_base_selectDeptList(param, selectDeptList);
	}else if(param.schType=="team"){
		fc_clearRow("dept_tbody");
		fn_base_selectTeamList("", selectTeamList)
	}
}

$(document).ready(function() {
	HideTable('team_table_update');		
	
	if(fn_is_pms_upd(0103)){
		$(".add_btn").css("display","");
		$(".save_btn").css("display","");
		$(".cancel_btn").css("display","");
		$(".popent_btn").css("display","");
		$(".popcancel_btn").css("display","");
		
		$("#MDI_DPTNAME").css("border","");
		$("#MTI_TEAMNAME").css("border","");
	}
});

</script>
	<!-- header -->
	<div id="sub_wrap">
	<jsp:include page="/header.do"></jsp:include>
	</div>
	<!-- header -->

	<!-- container-->
	<div id="container">
		<div id="contents">
		
			<!-- left-->
			<div id="lnb_area">
			<jsp:include page="/lnb.do"></jsp:include>
			</div>
			<!-- left-->
			
			<!-- right-->
			<section id="contents_area">
			<h2>본문내용</h2>
				<!-- contents_title-->
				<div class="title_area">
                    <p class="contents_title">부서/팀</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home" style="margin-top: 10px;"></li>
                        <li>> 기본정보</li>
                        <li>> 부서/팀</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 분류검색표-->
					<div class="search_box">
                        <table class="search_table" >
							<caption>분류구분 조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody id="sch_tbody">
                            <tr>
                                <th scope="row">분류구분</th>
                                <td>
                                <p>
                                  <label><input type="radio" id="schType" name="schType" value="dept" class="search_radio" checked/>부서</label>
                                  <label><input type="radio" id="schType" name="schType" value="team" class="search_radio"/>팀</label>
                                </p>
                                </td>
                            </tr>
                            <tr><th scope="row">분류 명칭</th><td><input name="schKeyword" type="text" id="schKeyword" class="textfield" style="width:90%"/></td></tr>
							<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_base_search();" class="search_btn">조회</a></th></tr>
                        </table>
					</div>
					<!-- //분류검색표-->
					
					<!-- 부서관리-->
					<div class="table_wrap">
						<!-- 부서관리표-->
						<p class="sub_title">부서관리</p>					
						<table class="ani_list" id="dpt_table">
							<caption>부서</caption>
							<colgroup>
							<col style="width:100%" /> 
							</colgroup>
							<thead>
								<tr><th scope="col">부서</th></tr>
							</thead>
							<tbody id="dept_tbody">
								<tr style="display:none" onClick="fc_HighLightTR(this, '#c9cc99','cc3333');">
										<td id="MDI_LINKNO_DIV" data-val='' onclick="javascript:fn_base_selectDeptInfo($(this).attr('data-val'));">
											<a href="javascript:;">
											<div id="DPTNAME_DIV" data-val='' onclick="javascript:fn_base_selectTeamList($(this).attr('data-val'), selectTeamList);"></div></a>																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																														</div></a>
										</td>
									</tr>
							</tbody>
						</table>
						
						<div>							
							<table class="ani_list" id="team_table">
								<caption>팀</caption>
								<colgroup>
								 	<col style="width:100%" /> 
								</colgroup>
								<!-- <div id="test" data-val='' onclick="javascript:test($(this).attr('data-val'));">추가</div> -->
									<thead>
									<tr><th scope="col">팀
									<a href="javascript:fn_layer_show();" class="add_btn" style="display: none;">추가</a></th></tr>
								</thead>
								<tbody id="team_tbody">
								<tr style="display:none" onClick="fc_HighLightTR(this, '#c9cc99','cc3333');">
										<td onclick="ShowTable('team_table_update');">
											<a href="javascript:;">
											<div id="TEAMNAME_DIV" data-val='' onclick="javascript:fn_base_selectTeamInfo(this);"></div></a>																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																														</div></a>
										</td>
									</tr>
								</tbody>
							</table>							
						</div>						
						</div>
						<!-- //부서관리표-->

						<!-- 상세정보표-->
						<div class="ani_info_box">
							<table class="ani_info infotable" id="dpt_table_update" style="display:none;" >
								<caption>부서 관리상세정보</caption>
								<colgroup>
									<col style="width:30%" />
									<col style="width:70%"/>
								</colgroup>
								<thead>
									<tr><th colspan="2" scope="col"><span class="info_title">상세정보</span>
									<a href="javascript:;" class="save_btn" style="display: none;">저장</a>
									<a href="javascript:;" class="cancel_btn" style="display: none;">취소</a>
									</th></tr>
								</thead>
								<tbody id="dptinfo_tbody">
								<tr><th scope="row">부서번호</th><td><div id="MDI_LINKNO" data-val=''></div></td></tr>
								<tr><th scope="row">부서이름</th><td><input type="text" name="MDI_DPTNAME" id="MDI_DPTNAME" class="textfield" style="border: thin;"/></td></tr>
								</tbody>
							</table>	

							<!-- 상세정보-->
							<table class="ani_info infotable" id='team_table_update'> 
								<caption>팀 관리상세정보</caption>
								<colgroup>
									<col style="width:30%" />
									<col style="width:70%"/>
								</colgroup>
								<thead>
									<tr><th colspan="2" scope="col"><span class="info_title">상세정보</span>
									<a href="javascript:;" class="save_btn" style="display: none;">저장</a>
									<a href="javascript:;" class="cancel_btn" style="display: none;">취소</a>
									</th></tr>
								</thead>
								<tbody id="teaminfo_tbody">
									<tr><th scope="row">팀번호</th><td><div id= "MTI_TEAMNO" data-val='' ></div></td></tr>
									<tr><th scope="row">팀명</th><td><input type="text" name = "MTI_TEAMNAME" id="MTI_TEAMNAME" class="textfield" style="border: thin;"/></td></tr>
								</tbody>
							</table>	
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
			<div class="layer_tit">팀 추가</div>
				<div class="layer_con">
					<div class="search_box">
                        <table class="aniinfo_search table_view" style="width:760px;" >
							<caption>팀 추가</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
                            <tbody id="dpt_layer">
								<tr>
									<th scope="row">부서번호</th><td><div id="dpt_number" data-val=''></div></td>
								</tr>
								<tr>
									<th scope="row">팀번호</th><td>${test.MAXNUM }</td>
								</tr>
								<tr>
									<th scope="row">팀 이름</th><td><input type="text" class="textfield" style="width:50%">
								</td>
								</tr>
                            </tbody>
                        </table>
					</div>
					
					<div class="btn_area">
					<a href="javascript:;" class="popent_btn" style="display: none;">확인</a>
					<a href="javascript:;" class="popcancel_btn" style="display: none;" onclick="javascript:fn_layer_hide();">취소</a>
					</div>
				</div>
				<a href="javascript:;" class="layer_close" onclick="javascript:fn_layer_hide();">레이어팝업 닫기</a>
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