<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="ko">
<head>
<link rel="stylesheet" href="/css/ui/reset.css">
<link rel="stylesheet" href="/css/ui/sub_layout.css">
<link rel="stylesheet" href="/css/base/contents.css">
<link rel='stylesheet' href='/css/base/Nwagon.css' type='text/css'>
<script src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/contents/base.js"></script>
<script src='/js/contents/Nwagon.js'></script>
<script src="/js/common/common.js"></script> 
<script src="/js/common/sha256.js"></script> 
<script src="/js/common/json2.js"></script>

<script type="text/javascript">
function selectMainSch(result){
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
			$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
			$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).attr('data-val', data.MAI_ANICODE); 
			$("#schRst_tbody div#ANIMAL_BNAME_DIV").eq(iRow).html(data.MAI_BNAME); 
			$("#schRst_tbody div#ANIMAL_GENDER_DIV").eq(iRow).html(data.MAI_GENDER); 
			$("#schRst_tbody div#ANIMAL_CAGE_DIV").eq(iRow).html(data.MVI_VVRMNAME + "(" + data.MAI_VVRMNO + ")"); 
			$("#schRst_tbody div#ANIMAL_STATUS").eq(iRow).html(data.MAI_CURSTS);
		}
		$("#schRst_tbody tr:first").attr('style',"display:none");
 	}
 	$("#schRst_tbody2 tr:first").attr('style',"display:none");
}

function fn_base_selectMainSch(param, callback, retObj) {
	fc_clearRow("schRst_tbody");
	var targetUrl = "/main/selectMainSch.do";
	var param = {
			schKeyword:$("#sch_tbody #schKeyword").val(),
			schType : "All"
	};
	$.getJSON(targetUrl, param, function(result) {
		/* console.log(JSON.stringify(result)); */
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

function fn_base_selectMainSch2(param, callback, retObj) {
	fc_clearRow("schRst_tbody");
	var targetUrl = "/main/selectMainSch2.do";
	var param = {
			schKeyword:$("#sch_tbody #schKeyword").val(),
			schType : "Name"
	};
	$.getJSON(targetUrl, param, function(result) {
		/* console.log(JSON.stringify(result)); */
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

function fn_base_selectMainSch3(param, callback, retObj) {
	fc_clearRow("schRst_tbody");
	var targetUrl = "/main/selectMainSch3.do";
	var param = {
			schKeyword:$("#sch_tbody #schKeyword").val(),
			schType : "Vvrm"
	};
	$.getJSON(targetUrl, param, function(result) {
		/* console.log(JSON.stringify(result)); */
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

function fn_base_selectMainSch4(param, callback, retObj) {
	fc_clearRow("schRst_tbody");
	var targetUrl = "/main/selectMainSch4.do";
	var param = {
			schKeyword:$("#sch_tbody #schKeyword").val(),
			schType : "Code"
	};
	$.getJSON(targetUrl, param, function(result) {
		/* console.log(JSON.stringify(result)); */
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

 <%--function fn_base_showAnimal(){
	<%-- var sendData = "{ss_id:"<%=(String)session.getAttribute("ss_id")%>"};
	var session = "<%=(String)session.getAttribute("ss_id")%>";
	var sendData = "ss_id="+session;
	var targetUrl = "/main/showAnimal.do";
	alert(sendData);
	
	$.ajax({
		type : "POST",
		data : sendData,
		url : targetUrl, 
		datatype:"json",
		success : function(result) {
			 alert(result.MAC_NAME);
		},
		 complete : function(data) {
               alert('통신완료 data : ' + data.status);
       },
		error:function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
	}); 
} --%>

function fn_AniInfo_view0107E(MAI_AniCode){
	var targetUrl = "/base/0107/view0107E.do";
	location.href = targetUrl + "?MAI_AniCode=" +MAI_AniCode;
}

function fn_base_search(){
	var tt = document.getElementById("schKeyword").value; 	
	var param = {
			schType : $('#sch_tbody input:radio[name=schType]:checked').val()
	};
	console.log(param.schType);
	if(param.schType=="All"){
		fc_clearRow("schRst_tbody2");
		fn_base_selectMainSch(param, selectMainSch);
	}  else if(param.schType=="Name"){
		fc_clearRow("schRst_tbody2");
		fn_base_selectMainSch2(param, selectMainSch);
	}else if(param.schType=="Vvrm"){
		fc_clearRow("schRst_tbody2");
		fn_base_selectMainSch3(param, selectMainSch);
	}
	else if(param.schType=="Code"){
		fc_clearRow("schRst_tbody2");
		fn_base_selectMainSch4(param, selectMainSch);
	}
	if(tt == ''){
		alert('검색어가 없습니다.');
		return;
	}
}
function mainSearch(){
var form = document.myform;
var tt = document.getElementById("mainSearch").value; 	

if(tt == ''){
	alert('검색어가 없습니다.');
	return;
}

form.action="/main/mainSearch.do";
form.submit();
}

$(document).ready(function() {
});
</script>

<style>
#MAC_NAME_DIV {cursor: pointer;}
</style>


<title>Main_관리자</title>
</head>
<body>
<div id="sub_wrap">
	<jsp:include page="/header.do"></jsp:include>

	<div id="container">
		<div id="contents_admin">
			<jsp:include page="/lnb.do"></jsp:include>
			<section id="contents_area">
				<h2>통합검색</h2>
				<form name="myform" method="get" id="myform">
				<div class="search_area" style="margin-top:30px; margin-right:200px">
					<div class="search_box right" id="main">
						<span class="sel_box1">
							<select style="width:120px;" id="optType" name="optType">
							 <option value="All" <c:if test="${'All'==optType }"> selected</c:if>>전체</option>
							 <option value="sayuk" <c:if test="${'sayuk'==optType }"> selected</c:if>>사육일지(미정)</option>
							 <option value="jinryo" <c:if test="${'jinryo'==optType }"> selected</c:if>>진료일지(미정)</option>
							 <option value="bokun" <c:if test="${'bokun'==optType }"> selected</c:if>>보건일지(미정)</option>
							</select>
						</span> 
						<input type="text" name="mainSearch" id="mainSearch" class="textfield" style="width:400px;"/>
						<!-- <input type="submit" class="search_btn" value="조회"> -->
						<a href="javascript:mainSearch();" class="btn_search">검색</a>
					</div>
				</div>
				</form>
				<!-- // search_area -->
				<div class="admin_wrap">
					<h2>결재상황</h2>
					<div class="admin_box">
						<p class="admin_title">진행현황</p>
						<ul class="admin_pay">
							<li><a href="/sign/0701/SIGN_INFO.do?selectDocKind=0&selectKind=2&selectStatus=2"><img src="/images/wait_icon.png" alt=""><p>결재대기</p><p class="text_num">${kjInfo.CNT_X}건</p></a></li>
							<li><a href="/sign/0701/SIGN_INFO.do?selectDocKind=0&selectKind=2&selectStatus=3"><img src="/images/ing_icon.png" alt=""><p>결재진행</p><p class="text_num">${kjInfo.CNT_P}건</p></a></li>
							<li><a href="/sign/0701/SIGN_INFO.do?selectDocKind=0&selectKind=2&selectStatus=4"><img src="/images/end_icon.png" alt=""><p>결재완료</p><p class="text_num">${kjInfo.CNT_E}건</p></a></li>
							<li><a href="/sign/0701/SIGN_INFO.do?selectDocKind=0&selectKind=3"><img src="/images/refer_icon.png" alt=""><p>공람(참조)</p><p class="text_num">${kjInfo.CNT_NOTI}건</p></a></li>
						</ul>
					</div>
					<h2>전자결재 최근글</h2>
					<div class="admin_box">
						<dl>
							<dt id="bg_1">전자결재</dt>
							<dd>
								<ul>
								<c:forEach items="${kjList}" var="kj">
									<li><a href="#">
									<span class="tit">${kj.BSL_DOCCMNT}</span>
									<span class="date">${kj.BSU_KJDATE}</span></a></li>
								</c:forEach>
								</ul>
								<a href="/sign/0701/SIGN_INFO.do" class="btn_more">+ 더보기</a>								
							</dd>
						</dl>
					</div>
					<h2>공지사항 최근글</h2>
					<div class="admin_box" style="margin:0;">
						<dl>
							<dt id="bg_2">공지사항</dt>
							<dd>
								<ul>
								<c:forEach items="${Bizlist }" var="Bizlist">
								<%-- <fmt:parseDate value="${board.CMN_MAK_DATE}" pattern="yyyy-MM-dd HH:mm" var="myDate"/> --%>
									<li>
									<a href="/biz/0202/detailBiz.do?DOCNO=${Bizlist.BBI_DOCNO }&BBSTYPE=${Bizlist.BBI_BBSTYPE}">
									<%-- <span class="tit">${board.BBI_TIT }</span> --%>
									<span class="tit">${Bizlist.BBI_TIT }</span>
									<span class="date">${Bizlist.CMN_MAK_DATE }</span>
									</a>
									</li>
									</c:forEach>
								</ul>
								<a href="/biz/0202/main_Article.do" class="btn_more">+ 더보기</a>									
							</dd>
						</dl>
					</div>
				</div>
			

			<div class="admin_box2">
				<!-- tab_menu -->
				<div class="tab_menu" style="margin-top:0px;">
					<ul>
						<li class="on"><a href="#tab01">동물현황</a></li>
						<li><a href="#tab02">번식현황</a></li>
						<!-- <li><a href="#tab03">폐사현황</a></li> -->
					</ul>
				</div>
				<!-- // tab_menu -->

				<!-- tab01 -->	
				<div class="tab_cont" id="tab01">	
					<h2>그래프</h2>
					<div id="tab1_chart1" class="main_admin aniinfo_add"></div>
					<script>
						var options = {
							'legend':{
								names: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월',],
									},
							'dataset':{
								title:'동물현황 그래프', 
								values:${chartTotAni},
//								values: [[277,147, 66,30,8], [276,153, 66,24,11], [349,192, 45,50,3], [358,186,76,50,10], [348, 185, 76,50,15], [356, 148,83,45,8], [356, 148,83,48,5],[276,153, 66,24,11], [349,162, 45,50,3], [358,186,96,50,10], [408, 185, 86,70,15], [406, 148,83,45,8]],
								colorset: ['#30a1ce','#DC143C', '#FF8C00','#888','#1dbc7e','#DC143C'],
								fields:['곤충강', '양서강', '조강', '파충강', '포유강']
							},
							'chartDiv' : 'tab1_chart1',
							'chartType' : 'line',
							'leftOffsetValue': 50,
							'bottomOffsetValue': 40,
							'chartSize' : {width:950, height:350},
							'minValue' : 0,
							'maxValue' : 10000,
							'increment' : 1000
						};

						Nwagon.chart(options);
					</script>	
					
				</div>
				<!-- //tab01 -->
				<!-- tab02 -->	
				<div class="tab_cont" id="tab02">	
					<h2>그래프</h2>
					<div id="tab2_chart1" class="main_admin aniinfo_add"></div>
					<script>
						var options = {
							'legend':{
								names: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월',],
									},
							'dataset':{
								title:'동물현황 그래프', 
								values:${chartBsAni},
//								values: [[277,147, 66,30,8], [276,153, 66,24,11], [349,192, 45,50,3], [358,186,76,50,10], [348, 185, 76,50,15], [356, 148,83,45,8], [356, 148,83,48,5],[276,153, 66,24,11], [349,162, 45,50,3], [358,186,96,50,10], [408, 185, 86,70,15], [406, 148,83,45,8]],
								colorset: ['#30a1ce','#DC143C', '#FF8C00','#888','#1dbc7e','#DC143C'],
								fields:['곤충강', '양서강', '조강', '파충강', '포유강']
							},
							'chartDiv' : 'tab2_chart1',
							'chartType' : 'line',
							'leftOffsetValue': 50,
							'bottomOffsetValue': 40,
							'chartSize' : {width:950, height:350},
							'minValue' : 0,
							'maxValue' : 500,
							'increment' : 100
						};

						Nwagon.chart(options);
					</script>	
					
				</div>
				<!-- //tab02 -->
				<!-- tab03 -->	
				<!-- <div class="tab_cont" id="tab03">	
					<h2>그래프</h2>
					<div id="tab3_chart1" class="main_admin aniinfo_add"></div>
					<script>
						var options = {
							'legend':{
								names: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월',],
									},
							'dataset':{
								title:'동물현황 그래프', 
								values: [[277,147, 66,30,8], [276,153, 66,24,11], [349,192, 45,50,3], [358,186,76,50,10], [348, 185, 76,50,15], [356, 148,83,45,8], [356, 148,83,48,5],[276,153, 66,24,11], [349,162, 45,50,3], [358,186,96,50,10], [408, 185, 86,70,15], [406, 148,83,45,8]],
								colorset: ['#30a1ce','#DC143C', '#FF8C00','#888','#1dbc7e','#DC143C'],
								fields:['동물수', '천연기념물', 'CITES', '갑을병', '멸종위기']
							},
							'chartDiv' : 'tab3_chart1',
							'chartType' : 'line',
							'leftOffsetValue': 50,
							'bottomOffsetValue': 40,
							'chartSize' : {width:950, height:350},
							'minValue' : 0,
							'maxValue' : 500,
							'increment' : 100
						};

						Nwagon.chart(options);
					</script>	
					
				</div> -->
				<!-- //tab03 -->
				
				<!--  조회 -->
					<div class="aniinfo_search_box main_admin" >
						<table class="aniinfo_search" >
							<caption>조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
							<tbody id="sch_tbody">
								<tr>
									<th scope="row" rowspan="2" style="vertical-align:middle;">동물 검색</th>
									<td>
										<p>
										<label><input type="radio" id="schType" name="schType" value="All" class="search_radio" checked="checked"/>전체</label>
                                  		<label><input type="radio" id="schType" name="schType" value="Name" class="search_radio" />동물명</label>
                                  		<label><input type="radio" id="schType" name="schType" value="Vvrm" class="search_radio" />동물사</label>
                                  		<label><input type="radio" id="schType" name="schType" value="Code" class="search_radio"/>동물번호</label>
										</p>
									</td>
								</tr>
								<tr>
									<td><input name="schKeyword" type="text" id="schKeyword" class="textfield" style="width:90%"/><label for="schKeyword"></label></td>
								</tr>
								<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_base_search();" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					<!-- //조회 -->
					
					<!-- 표 -->
					<table class="aniinfo_add main_admin" >
						<caption>현황</caption>
						<colgroup>
							<col style="width:5%;">
							<col style="width:15%;">
							<col style="width:20%;">
							<col style="width:20%;">
							<col style="width:10%;">
							<col style="width:15%;">
							<col style="width:15%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">No</th>
								<th scope="col">동물번호</th>
								<th scope="col">동물명</th>
								<th scope="col">별명</th>
								<th scope="col">성별</th>
								<th scope="col">동물사</th>
								<th scope="col">상태</th>
							</tr>
						</thead>
						
						<tbody id="schRst_tbody">
							<tr style="display:none">
								<td><div id="INDEX_DIV" data-val=''></div></td>
								<td><div id="ANIMAL_NUMBER_DIV" data-val='' ></div></td>
								<td><div id="MAC_NAME_DIV" data-val='' onclick="javascript:fn_AniInfo_view0107E($(this).attr('data-val'));"></div></td>
								<td><div id="ANIMAL_BNAME_DIV" data-val=''></div></td>
								<td><div id="ANIMAL_GENDER_DIV" data-val=''></div></td>
								<td><div id="ANIMAL_CAGE_DIV" data-val=''></div></td>
								<td><div id="ANIMAL_STATUS" data-val=''></div></td>
							</tr>
						</tbody>
						
						<c:forEach items="${schRstAnimal}" var="sra">
						<tbody id="schRst_tbody2">
						<tr>
							<td>${sra.RNUM }</td>
							<td>${sra.MAI_ANICODE }</td>
							<%-- <td><a href="/base/0107/view0107E.do?MAI_AniCode=${sra.MAI_ANICODE }">${sra.MAC_NAME }</a></td> --%>
							<td><a href	="/base/0107/view0107E.do?MAI_AniCode=${sra.MAI_ANICODE }">${sra.MAC_NAME }</a></td>
							<td>${sra.MAI_BNAME }</td>
							<td>${sra.MAI_GENDER }</td>
							<td>${sra.MVI_VVRMNAME}</td>
							<td>${sra.MAI_CURSTS}</td>
						</tr>
						</tbody>
						</c:forEach>
					</table>
					<!-- //표 -->

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
