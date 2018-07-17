<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

<script>
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
			$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
			$("#schRst_tbody div#ANIMAL_GENDER_DIV").eq(iRow).html(data.MAI_GENDER); 
			$("#schRst_tbody div#TEAMNAME_DIV").eq(iRow).html(data.MTI_TEAMNAME); 
			$("#schRst_tbody div#VVRMNAME_DIV").eq(iRow).html(data.MVI_VVRMNAME);
			$("#schRst_tbody div#RegType_DIV").eq(iRow).html(data.MAI_REGTYPE +"/" +data.MAI_DETHTYPE);
			$("#schRst_tbody div#BANCHUL_DIV").eq(iRow).html(data.DAIO_IOTYPE);
			$("#schRst_tbody div#BANCHULDATE_DIV").eq(iRow).html(data.MAI_DETHDATE);
			$("#schRst_tbody div#BANCHULRESN_DIV").eq(iRow).html(data.DAIO_RESN);
			$("#schRst_tbody div#MAI_ANICODE_DIV").eq(iRow).attr('data-val', data.MAI_ANICODE); 
			
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
			$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
			$("#schRst_tbody div#ANIMAL_GENDER_DIV").eq(iRow).html(data.MAI_GENDER); 
			$("#schRst_tbody div#TEAMNAME_DIV").eq(iRow).html(data.MTI_TEAMNAME); 
			$("#schRst_tbody div#VVRMNAME_DIV").eq(iRow).html(data.MVI_VVRMNAME);
			$("#schRst_tbody div#RegType_DIV").eq(iRow).html(data.MAI_REGTYPE +"/" +data.MAI_DETHTYPE);
			$("#schRst_tbody div#BANCHUL_DIV").eq(iRow).html(data.DAIO_IOTYPE);
			$("#schRst_tbody div#BANCHULDATE_DIV").eq(iRow).html(data.MAI_DETHDATE);
			$("#schRst_tbody div#BANCHULRESN_DIV").eq(iRow).html(data.DAIO_RESN);
			$("#schRst_tbody div#MAI_ANICODE_DIV").eq(iRow).attr('data-val', data.MAI_ANICODE); 
			
		}
		$("#schRst_tbody tr:first").attr('style',"display:none");
 	}
 	if(result == 0){
 		alert('조회된 결과가 없습니다.');
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
			$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
			$("#schRst_tbody div#ANIMAL_GENDER_DIV").eq(iRow).html(data.MAI_GENDER); 
			$("#schRst_tbody div#TEAMNAME_DIV").eq(iRow).html(data.MTI_TEAMNAME); 
			$("#schRst_tbody div#VVRMNAME_DIV").eq(iRow).html(data.MVI_VVRMNAME);
			$("#schRst_tbody div#RegType_DIV").eq(iRow).html(data.MAI_REGTYPE +"/" +data.MAI_DETHTYPE);
			$("#schRst_tbody div#BANCHUL_DIV").eq(iRow).html(data.DAIO_IOTYPE);
			$("#schRst_tbody div#BANCHULDATE_DIV").eq(iRow).html(data.MAI_DETHDATE);
			$("#schRst_tbody div#BANCHULRESN_DIV").eq(iRow).html(data.DAIO_RESN);
			$("#schRst_tbody div#MAI_ANICODE_DIV").eq(iRow).attr('data-val', data.MAI_ANICODE); 
			
		}
		$("#schRst_tbody tr:first").attr('style',"display:none");
 	}
 	if(result == 0){
 		alert('조회된 결과가 없습니다.');
 		return;
 	}
}

function fn_base_selectPyeAll(param, callback, retObj) {
	fc_clearRow("schRst_tbody");
	var targetUrl = "/base/0107/selectAllList.do";
	var param = {
			codeSearch:$("#sch_tbody #codeSearch").val(),
			schKeyword:$("#sch_tbody #schKeyword").val(),
			daioPlace:$("#sch_tbody #daioPlace").val(),
			pyeType : "All",
			cal_1 : $("#sch_tbody #cal_1").val(),
			cal_2 : $("#sch_tbody #cal_2").val(),
			cal_3 : $("#sch_tbody #cal_3").val(),
			cal_4 : $("#sch_tbody #cal_4").val(),
			cal_5 : $("#sch_tbody #cal_5").val(),
			cal_6 : $("#sch_tbody #cal_6").val(),
			selbox : $("#sch_tbody #selbox").val(),
			sortType : $('#sch_tbody input:radio[name=sortType]:checked').val(),
			del_chk : $('#sch_tbody input:radio[name=del_chk]:checked').val(),
			gunzip : $('#sch_tbody input:radio[name=gunzip]:checked').val()
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
	var targetUrl = "/base/0107/selectAliveList.do";
	var param = {
			codeSearch:$("#sch_tbody #codeSearch").val(),
			schKeyword:$("#sch_tbody #schKeyword").val(),
			daioPlace:$("#sch_tbody #daioPlace").val(),
			pyeType : "Alive",
			cal_1 : $("#sch_tbody #cal_1").val(),
			cal_2 : $("#sch_tbody #cal_2").val(),
			cal_3 : $("#sch_tbody #cal_3").val(),
			cal_4 : $("#sch_tbody #cal_4").val(),
			cal_5 : $("#sch_tbody #cal_5").val(),
			cal_6 : $("#sch_tbody #cal_6").val(),
			selbox : $("#sch_tbody #selbox").val(),
			sortType : $('#sch_tbody input:radio[name=sortType]:checked').val(),
			del_chk : $('#sch_tbody input:radio[name=del_chk]:checked').val(),
			gunzip : $('#sch_tbody input:radio[name=gunzip]:checked').val()
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
	var targetUrl = "/base/0107/selectDeathList.do";
	var param = {
			codeSearch:$("#sch_tbody #codeSearch").val(),
			schKeyword:$("#sch_tbody #schKeyword").val(),
			daioPlace:$("#sch_tbody #daioPlace").val(),
			pyeType : "Death",
			cal_1 : $("#sch_tbody #cal_1").val(),
			cal_2 : $("#sch_tbody #cal_2").val(),
			cal_3 : $("#sch_tbody #cal_3").val(),
			cal_4 : $("#sch_tbody #cal_4").val(),
			cal_5 : $("#sch_tbody #cal_5").val(),
			cal_6 : $("#sch_tbody #cal_6").val(),
			selbox : $("#sch_tbody #selbox").val(),
			sortType : $('#sch_tbody input:radio[name=sortType]:checked').val(),
			del_chk : $('#sch_tbody input:radio[name=del_chk]:checked').val(),
			gunzip : $('#sch_tbody input:radio[name=gunzip]:checked').val()
			
	};
	$.getJSON(targetUrl, param, function(result) {
		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

function fn_AniInfo_view0107E(MAI_AniCode){
	var targetUrl = "/base/0107/view0107E.do";
	location.href = targetUrl + "?MAI_AniCode=" +MAI_AniCode;
}

function fn_base_search(){
	 /* var sch1 = document.getElementById("codeSearch").value;
	 var sch2 = document.getElementById("schKeyword").value;
	 var sch3 = document.getElementById("daioPlace").value; */
	 
	var param = {
			pyeType : $('#sch_tbody input:radio[name=pyeType]:checked').val(),
			sortType : $('#sch_tbody input:radio[name=sortType]:checked').val(),
			del_chk : $('#sch_tbody input:radio[name=del_chk]:checked').val(),
			// cal_1 ~ 2 : 번식일자, cal_3 ~ 4 : 반입일자, cal_5 ~ 6 : 반출일자
			cal_1 : $("#sch_tbody #cal_1").val(),
			cal_2 : $("#sch_tbody #cal_2").val(),
			cal_3 : $("#sch_tbody #cal_3").val(),
			cal_4 : $("#sch_tbody #cal_4").val(),
			cal_5 : $("#sch_tbody #cal_5").val(),
			cal_6 : $("#sch_tbody #cal_6").val(),
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
</script>

<title>임시동물</title>
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
                    <p class="contents_title">임시동물</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 기본정보</li>
                        <li>> 동물정보</li>
                        <li>> 임시동물</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 동물정보조회-->
					<div class="aniinfo_search_box">
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
									<td><input name="codeSearch" type="text" id="codeSearch" class="textfield" style="width:90%"/><label for="codeSearch"></label></td>
									<th scope="row">동물사명</th>
									<td>
										<div class="select_box">			
											<select name="selbox" id="selbox">
											<option value="1" selected="selected">전체</option>
											<option value="2">박제실</option>
											<option value="3">사료실</option>
											<option value="4">곤충관</option>
											<option value="5">동물교실</option>
											<option value="6">나비온실</option>
											<option value="7">돌고래쇼장</option>
											<option value="8">해양관</option>
											<option value="9">홍학사</option>
											<option value="10">동물한마당</option>
											<option value="11">동물농장</option>
											<option value="12">열대조류관</option>
											<option value="13">큰물새장</option>
											<option value="14">황새마을</option>
											<option value="15">맹금사</option>
											<option value="16">공작마을</option>
											<option value="17">사슴사</option>
											<option value="18">제1AF관</option>
											<option value="19">제2AF관</option>
											<option value="20">동양관</option>
											<option value="21">낙타사</option>
											<option value="22">여우사</option>
											<option value="23">맹수사</option>
											<option value="24">우리숲우리동물관</option>
											<option value="25">곰사</option>
											<option value="26">남미관</option>
											<option value="27">종보전교육관</option>
											<option value="28">들소사</option>
											<option value="29">번식장</option>
											<option value="30">가금사</option>
											<option value="31">동물병원</option>
											<option value="32">꼬마동물사</option>
											</select>
										</div>
									</td>
								</tr>
								<tr><th scope="row">동물명칭</th>
									<td>
									<input name="schKeyword" type="text" id="schKeyword" class="textfield" style="width:90%"/><label for="schKeyword"></label>
									</td>
									<th scope="row">반입처</th>
									<td><input name="daioPlace" type="text" id="daioPlace" class="textfield" style="width:90%"/><label for="seach_text2"></label></td>
								</tr>
								<tr><th scope="row">번식일자</th>
									<td><p><input type="text" class="calendar1" id="cal_1" name="cal_1" ><label for="cal_1"></label> ~  <input type="text" class="calendar2" id="cal_2" name="cal_2"><label for="cal_2"></label></p></td>
									<th scope="row">폐사구분</th>
									<td>
										<p>
										  <label><input type="radio" id="pyeType" name="pyeType" value="All" class="search_radio" checked="checked"/>전체</label>
										  <label><input type="radio" id="pyeType" name="pyeType" value="Alive" class="search_radio"/>생존</label>
										  <label><input type="radio" id="pyeType" name="pyeType" value="Death" class="search_radio"/>폐사</label>
										</p>
									</td>
								</tr>
								<tr><th scope="row">반입일자</th>
									<td><p><input type="text" class="calendar1" id="cal_3" ><label for="cal_3"></label> ~ <input type="text" class="calendar2" id="cal_4" ><label for="cal_4"></label></p></td>
									<th scope="row">삭제구분</th>
									<td>
										 <label><input type="radio" id="del_chk" name="del_chk" value="mipo" class="search_radio" checked="checked"/>미포함</label>
										 <label><input type="radio" id="del_chk" name="del_chk" value="poham" class="search_radio"/>포함(삭제 데이터를 포함합니다.)</label>
									</td>
								</tr>
								<tr><th scope="row">반출일자</th>
									<td><p><input type="text" class="calendar1" id="cal_5"><label for="cal_5"></label> ~ <input type="text" class="calendar2" id="cal_6"><label for="cal_6"></label></p></td>
									<th scope="row">정렬방법</th>
									<td>
										<p>
										  <label><input type="radio" name="sortType" value="number" class="search_radio type1" checked="checked" />동물번호</label>
										  <label><input type="radio" name="sortType" value="name" class="search_radio"/>동물명</label>
										  <label><input type="radio" name="sortType" value="bunsik" class="search_radio"/>번식일</label>
										  <label><input type="radio" name="sortType" value="banip" class="search_radio"/>반입일</label>
										  <label><input type="radio" name="sortType" value="banchul" class="search_radio"/>반출일</label>
										</p>
									</td>
								</tr>
								<tr>
								<th scope="row">군집구분</th>
									<td>
										<label><input type="radio" id="gunzip" name="gunzip" value="gn" class="search_radio" checked="checked"/>단일개체</label>
										 <label><input type="radio" id="gunzip" name="gunzip" value="gy" class="search_radio" />군집</label>
										 
									</td>
								</tr>
								<tr><th colspan="4" scope="col" class="search_btn_area"><a href="javascript:fn_base_search();" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					<!-- //동물정보조회-->
										
					<!-- 동물정보추가-->
					<div class="aniinfo_add_box">
						<div class="sys_btn_box" style="margin-bottom:5px;">
						<span><a href="aniGruop_add.do" class="excel_btn">추가</a></span>	
						</div>
						
						<table class="aniinfo_add" >
						<caption>동물정보내역</caption>
							<colgroup>
								<col style="width:3%;">
								<col style="width:8%;">
								<col style="width:13%;">
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:8%;">
								<!-- <col style="width:8%;"> -->
								<col style="width:6%;">
								<col style="width:8%;">
								<col style="width:15%;">
								<col style="width:7%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="num">No</th>
									<th scope="col" id="ani_num">동물번호</th>
									<th scope="col" id="ani_name">동물명칭</th>
									<th scope="col" id="ani_sex">성별</th>
									<th scope="col" id="admin">관리팀</th>
									<th scope="col" id="ani_home">동물사</th>
									<th scope="col" id="ani_sign">등록구분</th>
									<!-- <th scope="col" id="ani_die">폐사구분</th> -->
									<th scope="col" id="inout">반출입</th>
									<th scope="col" id="inout_d">반출일</th>
									<th scope="col" id="inout_r">반출사유</th>
									<th scope="col" id="ani_copy">보기</th>								
								</tr>
							</thead>
							<tbody id="schRst_tbody">
								<tr style="display:none">
								<th><div id="INDEX_DIV" data-val=''></div></th>
								<td><div id="ANIMAL_NUMBER_DIV" data-val=''></div></td>
								<td><div id="MAC_NAME_DIV" data-val=''></div></td>
								<td><div id="ANIMAL_GENDER_DIV" data-val=''></div></td>
								<td><div id="TEAMNAME_DIV" data-val=''></div></td>
								<td><div id="VVRMNAME_DIV" data-val=''></div></td>
								<td><div id="RegType_DIV" data-val=''></div></td>
								<!-- <td><div id="DethType_DIV" data-val=''></div></td> -->
								<td><div id="BANCHUL_DIV"></div></td>
								<td><div id="BANCHULDATE_DIV"></div></td>
								<td><div id="BANCHULRESN_DIV"></div></td>
								<td><a href="#"><div id="MAI_ANICODE_DIV" data-val='' onclick="javascript:fn_AniInfo_view0107E($(this).attr('data-val'));" class="copy_btn">조회</div></a></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //동물정보추가-->
					
					<!-- pagination -->
					<div class="pagination">
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
				</div>
				<!-- //contents-->
			</section>
			<!-- //right-->
		</div>
			<!-- //container -->	
	</div>
 	<!-- footer -->
	<jsp:include page="/footer.do"></jsp:include>
	<!-- //footer -->
</div>
</body>
</html>