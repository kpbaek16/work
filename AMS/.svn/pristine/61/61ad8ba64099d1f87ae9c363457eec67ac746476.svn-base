<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="/css/ui/reset.css">
<!-- <link rel="stylesheet" href="/css/ui/sub_layout.css"> -->
<link rel="stylesheet" href="/css/base/contents.css">
<link rel="stylesheet" href="/css/ui/table.css">

<script src="/js/jquery-1.7.2.min.js"></script>	
<script src="/js/jquery/ui/1.8.18/jquery-ui.min.js"></script>  <!-- 달력 스크립트-->
<script type="text/javascript" src="/js/contents/base.js"></script>
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
			if(data.MAI_BNAME == null){
				$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
			}else if(data.MAI_BNAME != null){
				$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME + "(" + data.MAI_BNAME + ")"); 
			}
			$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).attr('data-val', data.MAI_ANICODE); 
			$("#schRst_tbody div#VVRMNAME_DIV").eq(iRow).html(data.VVRMNAME);
			$("#schRst_tbody div#ANIMAL_GENDER_DIV").eq(iRow).html(data.MAI_GENDER); 
			if(data.AGE == null || data.AGE2 == null){
				$("#schRst_tbody div#ANIMAL_AGE_DIV").eq(iRow).html("나이정보없음"); 
			}else{
				$("#schRst_tbody div#ANIMAL_AGE_DIV").eq(iRow).html(data.AGE + "년" + data.AGE2 + "개월"); 
			}
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
			$("#schRst_tbody div#VVRMNAME_DIV").eq(iRow).html(data.VVRMNAME);
			$("#schRst_tbody div#ANIMAL_GENDER_DIV").eq(iRow).html(data.MAI_GENDER); 
			if(data.AGE == null || data.AGE2 == null){
				$("#schRst_tbody div#ANIMAL_AGE_DIV").eq(iRow).html("나이정보없음"); 
			}else{
				$("#schRst_tbody div#ANIMAL_AGE_DIV").eq(iRow).html(data.AGE + "년" + data.AGE2 + "개월"); 
			}
			$("#schRst_tbody div#RegType_DIV").eq(iRow).html(data.MAI_DETHTYPE);
			
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
			if(data.MAI_BNAME == null){
				$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
			}else if(data.MAI_BNAME != null){
				$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME + "(" + data.MAI_BNAME + ")"); 
			}
			$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).attr('data-val', data.MAI_ANICODE); 
			$("#schRst_tbody div#VVRMNAME_DIV").eq(iRow).html(data.VVRMNAME);
			$("#schRst_tbody div#ANIMAL_GENDER_DIV").eq(iRow).html(data.MAI_GENDER); 
			if(data.AGE == null || data.AGE2 == null){
				$("#schRst_tbody div#ANIMAL_AGE_DIV").eq(iRow).html("나이정보없음"); 
			}else{
				$("#schRst_tbody div#ANIMAL_AGE_DIV").eq(iRow).html(data.AGE + "년" + data.AGE2 + "개월"); 
			}
			$("#schRst_tbody div#RegType_DIV").eq(iRow).html(data.MAI_DETHTYPE);
			
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
	
	if(code == '' & name == ''){
		alert("검색어가 없습니다.");
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
</script>

<style>
#MAC_NAME_DIV {cursor: pointer;}
</style>

<script type="text/javascript">
function animal_select(MAI_ANICODE){
	var sendData = "MAI_ANICODE=" + MAI_ANICODE;
	var targetUrl = "/jour/0304/getAnimalInfo.do";
	$.ajax({
		type : "POST",
		data : sendData,
		url : targetUrl,
		success : function(result) {
			$("#dead_tbody input[name=acode]", parent.opener.document).val(result.MAI_ANICODE);
			$("#dead_tbody input[name=aname]", parent.opener.document).val(result.MAC_NAME);
			$("#dead_tbody input[name=hname]", parent.opener.document).val(result.MAC_SNAME);
			$("#dead_tbody input[name=ename]", parent.opener.document).val(result.MAC_ENAME);
			$("#dead_tbody input[name=vname]", parent.opener.document).val(result.MVI_VVRMNAME);
			$("#dead_tbody input[name=gender]", parent.opener.document).val(result.MAI_GENDER);
			$("#dead_tbody input[name=cities]", parent.opener.document).val(result.MAC_CITES);
			$("#dead_tbody input[name=natmon]", parent.opener.document).val(result.MAC_NATMON);
			$("#dead_tbody input[name=rank]", parent.opener.document).val(result.MAC_RANK);
			
			if(result.AGE == null || result.AGE2 == null){
				$("#dead_tbody input[name=age]", parent.opener.document).val("나이정보없음");
			}else{
				$("#dead_tbody input[name=age]", parent.opener.document).val(result.AGE + "년" + result.AGE2 + "개월");
			}
			self.close();
		},
		error:function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
	});
}

</script>

<title>기본정보 &gt; 동물정보</title>
</head>
<body>
<div id="">

	<!-- container-->
	<div id="container">
	<div id="contents">
	
			<!-- <h2>본문내용</h2> -->
				<!-- contents_title-->
				<div class="title_area">
                    <p class="contents_title" align="center">동물선택</p>
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
									<th scope="row">동물사</th>
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
								<tr><th scope="row">동물명</th>
									<td>
									<input name="schKeyword" type="text" id="schKeyword" class="textfield" style="width:90%"/><label for="schKeyword"></label>
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
					</div>
					<!-- //동물정보조회-->
					
					<!-- 동물정보추가-->
					<div class="aniinfo_add_box">					
						<table class="aniinfo_add" >
						<caption>동물정보내역</caption>
							<colgroup>
								<col style="width:3%;">
								<col style="width:8%;">
								<col style="width:13%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:7%;">
								<col style="width:8%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="num">No</th>
									<th scope="col" id="ani_num">동물번호</th>
									<th scope="col" id="ani_name">동물명</th>
									<th scope="col" id="ani_vvrm">동물사</th>
									<th scope="col" id="ani_sex">성별</th>
									<th scope="col" id="ani_age">나이</th>
									<th scope="col" id="ani_sign">폐사구분</th>					
								</tr>
							</thead>
							<tbody id="schRst_tbody">
								<tr style="display:none">
								<th><div id="INDEX_DIV" data-val=''></div></th>
								<td><div id="ANIMAL_NUMBER_DIV" data-val=''></div></td>
								<td><div id="MAC_NAME_DIV" onclick="javascript:animal_select($(this).attr('data-val'));"></div></td>
								<td><div id="VVRMNAME_DIV" data-val=''></div></td>
								<td><div id="ANIMAL_GENDER_DIV" data-val=''></div></td>
								<td><div id="ANIMAL_AGE_DIV" data-val=''></div></td>
								<td><div id="RegType_DIV" data-val=''></div></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //동물정보추가-->
									
				</div>
				<!-- //contents-->
				</div>
			<!-- //right-->
		</div>
			<!-- //container -->	
			
	</div>
</body>
</html>