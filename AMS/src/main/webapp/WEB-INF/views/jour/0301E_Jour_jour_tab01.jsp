<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<head>
<script type="text/javascript">

function addAnimal(code){
	var sendData = "code=" + code;
	var targetUrl = "/jour/0301/getCheckAnimal.do"; 

	$.ajax({
		type : "POST",
		data : sendData,
		url : targetUrl, 
		datatype:"json",
		success : function(result) {
			 alert(result);
		},
		error:function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
	}); 
}

function fn_layer_chani(){
	$("#chani").show();
	$(".layer_popup").show();
	var width_size = $("#chani").innerWidth()/2;
	$("#chani").css("margin-left",-width_size);
	
	if($('#ch_layer_tbody input:checkbox[id="checkbox"]').is(":checked") == true){
		/*  var $obj = $("input[name='checkbox']");
		  var checkCount = $obj.size();
		  for (var i=0; i<checkCount; i++){
		   if($obj.eq(i).is(":checked")){
		   $obj.eq(i).parent().parent().remove();
		   }
		  } */
		/* $("#test_table").hide(); */
		
		document.getElementById('ch_s_keyword').value = "";
		
		var $obj = $("input[name='checkbox']");
		  var checkCount = $obj.size();
		  for (var i=0; i<checkCount; i++){
		   if($obj.eq(i).is(":checked")){
		   $obj.eq(i).parent().parent().remove();
		   }
		  }
		/* $("input:checkbox[id='checkbox']").attr("disabled", true); */
		/* fc_clearRow('ch_layer_tbody'); */
	} 
} 

 function fn_layer_wtani(){
	$("#wt").show();
	$(".layer_popup").show();
	var width_size = $("#wt").innerWidth()/2;
	$("#wt").css("margin-left",-width_size);
} 

function updateSDJ01_Cmnt(){
	var form = document.cmnt_form;
	
	 var SDJ01_CMNT = document.getElementById("SDJ01_CMNT").value;
	
	if (confirm("저장 하시겠습니까 ?")) {
        form.action = "/jour/0301/updateSDJ01_Cmnt.do";
        form.submit();
    }
}

function fn_layer_hide() {
	$(".layer_box").hide();
	$(".layer_popup").hide();
	$("body").css("overflow-y", "auto");
}

function selectChkBox(frm) {

	var sum = 0;
	var count = frm.checkbox.length;
	  for(var i=0; i < count; i++ ){
	       if(frm.checkbox[i].checked == true ){
	           addSelectBox(frm.checkbox[i].value,frm.checkbox[i].value,frm);
	       }else if(frm.checkbox[i].checked == false){
	    	   addSelectBox(frm.checkbox[i].value,frm.checkbox[i].value,frm);
	       }
	  } 
	}
	
function selectTest(MAI_ANICODE, callback, retObj){
	var param = {
			MAI_ANICODE:MAI_ANICODE
	};
	
	$.ajax({
		type : "POST",
		url : "/jour/0301/selectSydailyCh.do",
		dataType : 'json',
		data : param,
		success : function(data) {
//			alert(JSON.stringify(data));
			console.log(JSON.stringify(data));
			
			$('#ch_table > tbody:last').append(
					'<tr>' +'<td>' + '<input type="checkbox" id="ch_chk" name="ch_chk">'  + '</td>' + 
					'<td>' + data.MAC_NAME + '(' + data.MAI_BNAME + ')'  + '</td>' + '<td>' + '</td>' + 
					'<td>' + '</td>' + 
					'<td>' +  '<input type="text" class="textfield" style="width="10px">'  + '</td>' + 
					'<td>' +  '<input type="text" class="textfield" style="width="10px">'  + '</td>' +
					'<td>' +  '<input type="text" class="textfield" style="width="10px">'  + '</td>' + 
					'<td>' +  '<input type="text" class="textfield" style="width="10px">'  + '</td>' + '</tr>'
			);
			
			if(typeof(callback)=="function"){
				callback.call(retObj, data);
			}
		},
		
		error : function(xmlHttpObj) {
			alert(xmlHttpObj.responseText + '오류가 발생하였습니다.');
		}
	});	
	fn_layer_hide();
}
	
function addSelectBox(MAI_ANICODE)
{	
	selectTest(MAI_ANICODE);
}

// 선택삭제
function deleteSelectedItem(){
	  var $obj = $("input[name='ch_chk']");
	  var checkCount = $obj.size();
	  for (var i=0; i<checkCount; i++){
	   if($obj.eq(i).is(":checked")){
	   $obj.eq(i).parent().parent().remove();
	   // 삭제 눌렀을시 체크박스 해제
	   $("input:checkbox[id='checkbox']").attr("checked", false);
	   }
	  }
	  $("input[name=th_checkAll]").prop("checked", false);
	 }

function ch_Layer_AniSch(result){

	if(result!=null){
		console.log("test:" + JSON.stringify(result));
		console.log("result.length==>" + result.length);
		$("#ch_layer_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("ch_layer_tbody"); 
			$("#test_table").show();
			
			var iRow = (i+1);
			$("#ch_layer_tbody div#INDEX_DIV").eq(iRow).html(iRow); 
			if(data.MAI_BNAME == null){
				$("#ch_layer_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME);
			}
			if(data.MAI_BNAME!= null){
				$("#ch_layer_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME +"(" + data.MAI_BNAME +")"); 
			}
			$("#ch_layer_tbody div#MAI_ANICODE_DIV").eq(iRow).html(data.MAI_ANICODE); 
			$("#ch_layer_tbody div#MAI_GENDER_DIV").eq(iRow).html(data.MAI_GENDER); 
			$('#ch_layer_tbody input:checkbox[id="checkbox"]').eq(iRow).val(data.MAI_ANICODE);

		}
		$("#ch_layer_tbody tr:first").attr('style',"display:none");
 	}
	if(result == 0){
 		alert('조회된 결과가 없습니다.');
 		document.getElementById('ch_s_keyword').value = "";
 		return;
 	}
}

function ch_Layer_AniSch2(result){
	alert('ch_Layer_AniSch2');

	if(result!=null){
		console.log("test:" + JSON.stringify(result));
		console.log("result.length==>" + result.length);
		$("#ch_layer_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("ch_layer_tbody"); 
			$("#test_table").show();
			
			var iRow = (i+1);
			alert(data.MAC_NAME);
			$("#ch_layer_tbody div#INDEX_DIV").eq(iRow).html(iRow); 
			if(data.MAI_BNAME == null){
				$("#ch_layer_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME);
			}
			if(data.MAI_BNAME!= null){
				$("#ch_layer_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME +"(" + data.MAI_BNAME +")"); 
			}
			$("#ch_layer_tbody div#MAI_ANICODE_DIV").eq(iRow).html(data.MAI_ANICODE); 
			$("#ch_layer_tbody div#MAI_GENDER_DIV").eq(iRow).html(data.MAI_GENDER); 
			$('#ch_layer_tbody input:checkbox[id="checkbox"]').eq(iRow).val(data.MAI_ANICODE);

		}
		$("#ch_layer_tbody tr:first").attr('style',"display:none");
 	}
	if(result == 0){
 		alert('조회된 결과가 없습니다.');
 		document.getElementById('ch_s_keyword').value = "";
 		return;
 	}
}
	
function fn_ch_layer_aniList(param, callback, retObj){
	
	fc_clearRow("ch_layer_tbody");
	var targetUrl = "/common/doc/selectLayersch.do";
	
	$.getJSON(targetUrl, param, function(result) {
		/* console.log(JSON.stringify(result)); */
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

function fn_ch_layer_aniList2(param, callback, retObj){
	fc_clearRow("ch_layer_tbody");
	var targetUrl = "/common/doc/selectLayersch2.do";
	
	$.getJSON(targetUrl, param, function(result) {
		/* console.log(JSON.stringify(result)); */
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}
	
function fn_ch_layer_search(){
	var param = {
			ch_schType : $('#ch_s_tbody input:radio[name=ch_schType]:checked').val(),
			ch_s_keyword : $("#ch_s_tbody #ch_s_keyword").val()
	};
	console.log(param.schType);
	
	if(param.ch_s_keyword == ''){
		alert('검색어를 입력해주세요.');
		document.getElementById('ch_s_keyword').focus();
		return;
	}
	
	if(param.ch_schType=="aniName"){
		fn_ch_layer_aniList(param, ch_Layer_AniSch);
	}else if(param.ch_schType=="aniNumber"){
		fc_clearRow("ch_layer_tbody");
		fn_ch_layer_aniList2(param, ch_Layer_AniSch);
	}
}

// 전체선택
function checkAll(){
    if( $("#th_checkAll").is(':checked') ){
      $("input[name=ch_chk]").prop("checked", true);
    }else{
      $("input[name=ch_chk]").prop("checked", false);
    }
}
</script>

</head>

<div class="tab_cont" id="tab01">
							<!-- 동물현황 -->
							<div class="aniinfo_add_box margin_change">
								<div class="table_title_box">
									<span class="table_title"> 
									<img src="/images/btn_minus.gif" alt="">동물현황
									</span>
								</div>
								<table class="aniinfo_search table_view3" >
								<caption>동물현황</caption>
								<colgroup>
									<col style="width:15%;">
									<col style="width:8%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:7%;">
									<col style="width:10%;">
									<col style="width:5%;">
									<col style="width:10%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" id="t3th01" rowspan="3" style="vertical-align:middle;">동물명</th>
										<th scope="col" id="t3th02" rowspan="3" style="vertical-align:middle;">구분</th>
										<th scope="colgroup" id="t3th03" colspan="8">사육현황</th>
										<th scope="colgroup" id="t3th04" colspan="2">변동현황</th>
										<th scope="col" id="t3th05" colspan="3">보육현황</th>
									</tr>
									<tr>
										<th scope="col" id="t3th02_1" colspan="4">어제</th>
										<th scope="col" id="t3th02_2" colspan="4">오늘</th>
										<th scope="col" id="t3th04_1" rowspan="2" style="vertical-align:middle;">증감</th>
										<th scope="col" id="t3th04_2" rowspan="2" style="vertical-align:middle;">사유</th>
										<th scope="col" id="t3th05_1" rowspan="2" style="vertical-align:middle;">반입일</th>
										<th scope="col" id="t3th05_2" rowspan="2" style="vertical-align:middle;">마리수</th>
										<th scope="col" id="t3th05_3" rowspan="2" style="vertical-align:middle;">원수등록일</th>
									</tr>
									<tr>
										<th scope="col" id="t3th02_1_a" class="bg_gray">계</th>
										<th scope="col" id="t3th02_1_b">수</th>
										<th scope="col" id="t3th02_1_c">암</th>
										<th scope="col" id="t3th02_1_d">미상</th>
										<th scope="col" id="t3th02_2_a" class="bg_gray">계</th>
										<th scope="col" id="t3th02_2_b">수</th>
										<th scope="col" id="t3th02_2_c">암</th>
										<th scope="col" id="t3th02_2_d">미상</th>
									</tr>
								</thead>
								<tbody>

									<tr class="text_center">
										<th scope="row">황새</th><th scope="row">군집</th><td class="bg_gray">1</td><td>2</td><td>4</td><td>5</td><td class="bg_gray">6</td><td>2</td><td>4</td><td>5</td><td>1</td><td>번식</td><td>2016-05-20</td><td>1</td><td>2016-07-20</td>
									</tr>
									<tr class="text_center">
										<th scope="row">두루미</th><th scope="row">군집</th><td class="bg_gray">1</td><td>2</td><td>4</td><td>5</td><td class="bg_gray">6</td><td>2</td><td>4</td><td>5</td><td>1</td><td>번식</td><td>2016-05-20</td><td>1</td><td>2016-07-20</td>
									</tr>
							   </tbody>
							   <tfoot>
									<tr class="text_center">
										<th scope="row" colspan="2">합계 (2종)</th><td class="bg_gray">1</td><td>2</td><td>4</td><td>5</td><td class="bg_gray">6</td><td>2</td><td>4</td><td>5</td><td>1</td><td></td><td></td><td>1</td><td></td>
									</tr>
								</tfoot>
							</table>
							</div>
							<!-- //동물현황 -->

							<!-- 동물현황 특이사항 -->
							<div class="aniinfo_add_box">
								<div class="table_title_box">
									<span class="table_title"> 
									<img src="/images/btn_minus.gif" alt="">동물현황 특이사항
									</span>
									<div class="sys_btn_box">
										<span class="align_right"> 
										<a href="javascript:updateSDJ01_Cmnt();" class="info_add_btn" style="display: none;">저장</a>
										</span>
									</div>
								</div>
								<div class="plan_box table_view5">
								<form method="POST" name="cmnt_form" id="cmnt_form">
								<input type="hidden" id="sdj_docno" name="sdj_docno" value="${docInfo.SDJ_DOCNO}" />
								<input type="hidden" id="mai_vvrmno" name="mai_vvrmno" value="${docInfo.SDJ_VVRMNO}" />
								<input type="hidden" id="sdj_jnldate" name="sdj_jnldate" value="${docInfo.TXT_SDJ_JNLDATE}" />
									<p class="plan_text">
										<textarea rows="3" id="SDJ01_CMNT" name="SDJ01_CMNT" style="width: 100%; border: 0; resize: none; padding: 0;">${sdj01Cmnt.SDJ01_CMNT }</textarea>
									</p>
									</form>
								</div>

							</div>
							<!-- //동물현황 특이사항 -->
						
							<!-- 임대현황 -->
							<div class="aniinfo_add_box">
								<div class="table_title_box">
									<span class="table_title"> 
									<img src="/images/btn_minus.gif" alt="">임대현황
									</span>
									<div class="sys_btn_box">
										<span class="align_right"> 
										<a href="javascript:;" class="info_add_btn" style="display: none;">저장</a>
										</span>
									</div>
								</div>
								<form method="POST" name="loan_form" id="loan_form">
								<input type="hidden" id="mai_vvrmno" name="mai_vvrmno" value="${docInfo.SDJ_VVRMNO }" />
								<input type="hidden" id="sdj_jnldate" name="sdj_jnldate" value="${docInfo.TXT_SDJ_JNLDATE }" />
								
								<table class="aniinfo_add table_view4">
									<caption>임대현황</caption>
									<colgroup>
										<col style="width: 5%;">
										<col style="width: 8%;">
										<col style="width: 15%;">
										<col style="width: 10%;">
										<col style="width: 10%;">
										<col style="width: 22%;">
										<col style="width: 22%;">
										<col style="width: 10%;">
										<col style="width: 10%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" id="t4th01">No</th>
											<th scope="col" id="t4th02">구분</th>
											<th scope="col" id="t4th03">동물명</th>
											<th scope="col" id="t4th04">동물번호</th>
											<th scope="col" id="t4th05">임대기관</th>
											<th scope="col" id="t4th06">임대기간</th>
											<th scope="col" id="t4th07">특이사항</th>
										</tr>
									</thead>
				
									<tbody>
									
									<c:forEach var="loanInfo" items="${loanInfo}" varStatus="st">
										<tr>
											<th scope="row" id="t4n01" headers="t4th01">${loanInfo.RNUM }</th>
											<td headers="t4n01 t4th02">${loanInfo.DAIO_IOTYPE }</td>
											<c:if test="${loanInfo.MAI_BNAME == null }">
											<td headers="t4n01 t4th03">${loanInfo.MAC_NAME }</td>
											</c:if>
											<c:if test="${loanInfo.MAI_BNAME != null }">
											<td headers="t4n01 t4th03">${loanInfo.MAC_NAME }(${loanInfo.MAI_BNAME })</td>
											</c:if>
											<td headers="t4n01 t4th04">${loanInfo.DAIO_ANICODE }</td>
											<td headers="t4n01 t4th05">${loanInfo.DAIO_PLACE }</td>
											<td headers="t4n01 t4th05">${loanInfo.DAIO_IODATE } ~ ${loanInfo.DAIO_RENTEDATE }</td>
											<td headers="t4n01 t4th07">
											<input type="text" name="DAIO_CMNT" id="DAIO_CMNT" class="textfield" value="${loanInfo.DAIO_CMNT }"/></td> 
										</tr>
										</c:forEach>
										
									</tbody>
								</table>
								</form>
							</div>

							<!-- 체험 학습용 동물현황 -->
							<div class="aniinfo_add_box">
								<div class="table_title_box">
									<span class="table_title"> 
									<img src="/images/btn_minus.gif" alt="">체험 학습용 동물현황
									</span>
									<div class="sys_btn_box">
										<span class="align_right btn_hide2">
										<a href="javascript:fn_layer_chani();" class="cha_btn" style="display: none;">추가</a>
										<a href="javascript:;" class="excel_btn" style="display: none;">저장</a>
										<a href="javascript:deleteSelectedItem();" class="del2_btn" style="display: none;">삭제</a>
										</span>
									</div>
								</div>

								<table class="aniinfo_add table_view6" id="ch_table">
									<caption>체험 학습용 동물현황</caption>
									<colgroup>
										<col style="width: 5%;">
										<col style="width: 21%;">
										<col style="width: 8%;">
										<col style="width: 8%;">
										<col style="width: 8%;">
										<col style="width: 10%;">
										<col style="width: 25%;">
										<col style="width: 5%;">
										<col style="width: 8%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" id="r6th01" rowspan="2" style="vertical-align: middle;">
											<input type="checkbox" name="th_checkAll" id="th_checkAll" onclick="checkAll();"/></th>
											<th scope="col" id="r6th02" rowspan="2" style="vertical-align: middle;">동물명</th>
											<th scope="col" id="r6th03" colspan="2">마리수</th>
											<th scope="col" id="r6th04" colspan="2">변동현황</th>
											<th scope="col" id="r6th05" rowspan="2" style="vertical-align: middle;">활용내용</th>
											<th scope="col" id="r6th06" rowspan="2" style="vertical-align: middle;">비고</th>
										</tr>
										<tr>
											<th scope="col" id="r6th03_1">어제</th>
											<th scope="col" id="r6th03_2">오늘</th>
											<th scope="col" id="r6th04_1">증감</th>
											<th scope="col" id="r6th04_2">사유</th>
										</tr>
									</thead>
									<tbody id="ch_tbody">
								 <c:forEach var="jnl01ch" items="${jnl01ch}" varStatus="st">
										<tr>
											<th scope="row" id="r6n01" headers="r6th01">${jnl01ch.RNUM }</th>
											
											<td>
											<input type="text" id="chAniname" name="chAniname" class="textfield" value="${jnl01ch.SDJ01C_ANINAME }" style="border: none;width: 100px;"/></td>
											
											<td>
											<input name="textfield" type="text" id="table6_text3" class="textfield" style="width: 50px;text-align: center;border: none;" disabled="disabled" value="${jnl01ch.SDJ01C_ANICNT }"/></td>
											
											<td>${jnl01ch.SDJ01C_ACTCMNT }</td>
											
											<td>
											<input name="textfield" type="text" id="table6_text5" class="textfield" style="width: 50px;text-align: center;" value="${jnl01ch.SDJ01C_PMRESN }"/></td>
											
											<td>
											<input name="textfield" type="text" id="table6_text6" class="textfield" value="${jnl01ch.SDJ01C_ACTCMNT }"/></td>
											
											<td>
											<input name="textfield" type="text" id="table6_text7" class="textfield" value="${jnl01ch.SDJ01C_CMNT }" style="width: 70px;"/></td>
										</tr>
										</c:forEach> 
									</tbody>
								</table>
							</div>
							<!-- //체험 학습용 동물현황 -->

							<!-- 위탁관리 동물현황 -->
							<div class="aniinfo_add_box">
								<div class="table_title_box">
									<span class="table_title"> 
									<img src="/images/btn_minus.gif" alt="">위탁관리 동물현황
									</span>
									<div class="sys_btn_box">
										<span class="align_right btn_hide2">
										<a href="javascript:fn_layer_wtani();" class="cha_btn" style="display: none;">추가</a>
										<a href="javascript:;" class="excel_btn" style="display: none;">저장</a>
										<a href="javascript:;" class="del2_btn" style="display: none;">삭제</a>
										</span>
									</div>
								</div>
					
								<table class="aniinfo_add table_view7">
									<caption>위탁관리 동물현황</caption>
									<colgroup>
									<col style="width:12%;">
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
											<th scope="col" id="t6th01" colspan="1" style="vertical-align: middle;">구분</th>
											<th scope="col" id="t6th03" colspan="4">사육현황</th>
											<th scope="col" id="t6th04" colspan="5">동물상태</th>
											<th scope="col" id="t6th06" rowspan="2" style="vertical-align: middle;">비고</th>
										</tr>

										<tr>
											<th scope="col" id="t6th03_1">동물명</th>
											<th scope="col" id="t6th03_1">계</th>
											<th scope="col" id="t6th03_2">수</th>
											<th scope="col" id="t6th04_1">암</th>
											<th scope="col" id="t6th04_2">미상</th>
											<th scope="col" id="t6th03_1">외관</th>
											<th scope="col" id="t6th03_2">배변</th>
											<th scope="col" id="t6th04_1">채식</th>
											<th scope="col" id="t6th04_2">운동</th>
											<th scope="col" id="t6th04_2">외상</th>
										</tr>
									</thead>
									
									<tbody>
									<c:forEach var="sdj02ae" items="${sdj02ae}" varStatus="st">
										<tr>
											<td>${sdj02ae.MAC_NAME } (${sdj02ae.MAI_ANICODE })</td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td><input type="text" id="SDJ02AE_WK" name="SDJ02AE_WK"  class="textfield" style="width: 50px;text-align: center;" value="${sdj02ae.SDJ02AE_WK }"></td>
											<td><input type="text" id="SDJ02AE_BB" name="SDJ02AE_BB" class="textfield" style="width: 50px;text-align: center;" value="${sdj02ae.SDJ02AE_BB }"></td>
											<td><input type="text" id="SDJ02AE_CS" name="SDJ02AE_CS" class="textfield" style="width: 50px;text-align: center;" value="${sdj02ae.SDJ02AE_CS }"></td>
											<td><input type="text" id="SDJ02AE_UD" name="SDJ02AE_UD" class="textfield" style="width: 50px;text-align: center;" value="${sdj02ae.SDJ02AE_UD }"></td>
											<td><input type="text" id="SDJ02AE_WS" name="SDJ02AE_WS" class="textfield" style="width: 50px;text-align: center;" value="${sdj02ae.SDJ02AE_WS }"></td>
											<td><input type="text" id="SDJ02AE_CMNT" name="SDJ02AE_CMNT" class="textfield" style="width: 50px;text-align: center;" value="${sdj02ae.SDJ02AE_CMNT }"></td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>

						</div>
						<!-- //위생 및 방역관리 -->
						
<!-- layer_popup -->
	<div class="layer_popup">	
		<div class="dimm"></div>
		<!-- #layer04 -->
		<div class="layer_box" id="chani" style="top: 80px; height: 650px;">
			<div class="layer_tit">체험 학습용 동물현황</div>
				<div class="layer_con">
					<div class="search_box">
					<table class="search_table" style="width:760px;" >
							<caption>체험 학습용 동물현황</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody id=ch_s_tbody>
                            <tr>
                                <th scope="row">종류</th>
                                <td>
                                <p>
                                  <label><input type="radio" id="ch_schType" name="ch_schType" value="aniName" class="search_radio" checked/>동물명</label>
                                  <label><input type="radio" id="ch_schType" name="ch_schType" value="aniNumber" class="search_radio"/>동물번호</label>
                                </p>
                                </td>
                            </tr>
                            <tr><th scope="row">검색</th><td>
                            <input type="text" id="ch_s_keyword" name="ch_s_keyword" class="textfield" style="width:90%"/></td></tr>
							<tr><th colspan="2" scope="col" class="search_btn_area">
							<a href="javascript:fn_ch_layer_search();" class="search_btn">조회</a></th></tr>
                            </tbody>
                        </table>
					</div>
					<div class="table_box">
					<div style="width:100%; height:400px; overflow:auto">
					<form id="ch_Form" name="ch_Form">
						<table class="aniinfo_add" style="width:760px; margin-top:20px;" id="test_table" >
							<caption>체험 학습용 동물현황</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:12%;">
								<col style="width:5%;">
								<col style="width:5%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th02_1">No</th>
									<th scope="col" id="th03_2">동물명</th>
									<th scope="col" id="th06_3">동물번호</th>
									<th scope="col" id="th06_4">성별</th>
									<th scope="col" id="th06_5">선택</th>
								</tr>
							</thead>
							<tbody id="ch_layer_tbody">
								<tr style="display:none">
									<td><div id="INDEX_DIV" data-val=''></div></td>
									<td><div id="MAC_NAME_DIV" data-val='' ></div></td>
									<td><div id="MAI_ANICODE_DIV" data-val=''></div></td>
									<td><div id="MAI_GENDER_DIV" data-val=''></div></td>
									<td><input id="checkbox" name="checkbox" type="checkbox"></td>
								</tr>
							</tbody>
						</table>
						</form>
						</div>
					</div>
					<div class="btn_area">
						<a href="javascript:selectChkBox(this.ch_Form);" class="popent_btn">확인</a>
						<a href="javascript:fn_layer_hide();" class="popcancel_btn">취소</a>
					</div>
				</div>
				<a href="#none" class="layer_close">레이어팝업 닫기</a>
		</div>		
		<!-- //#layer04-->
		
		<!-- #layer05 -->
		 <div class="layer_box" id="wt" style="top: 80px; height: 650px;">
			<div class="layer_tit">위탁관리 동물현황</div>
				<div class="layer_con">
					<div class="search_box">
					<table class="search_table" style="width:760px;" >
							<caption>위탁관리 동물현황</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody>
                            <tr>
                                <th scope="row">종류</th>
                                <td>
                                <p>
                                  <label><input type="radio" name="list" value="A" class="search_radio" checked="checked"/>동물명</label>
                                  <label><input type="radio" name="list" value="B" class="search_radio"/>동물번호</label>
                                </p>
                                </td>
                            </tr>
                            <tr><th scope="row">검색</th><td>
                            <input name="textfield" type="text" id="layer04_sch" name="layer04_sch" class="textfield" style="width:90%"/></td></tr>
							<tr><th colspan="2" scope="col" class="search_btn_area">
							<a href="javascript:fn_layer04_search();" class="search_btn">조회</a></th></tr>
                            </tbody>
                        </table>
					</div>
					<div class="table_box">
					<form method="POST" name="layer04_form" id="layer04_form">
					<div style="width:100%; height:400px; overflow:auto">
						<table class="aniinfo_add" style="width:760px; margin-top:20px;" >
							<caption>위탁관리 동물현황</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:12%;">
								<col style="width:5%;">
								<col style="width:5%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th02_1">No</th>
									<th scope="col" id="th03_2">동물명</th>
									<th scope="col" id="th06_3">동물번호</th>
									<th scope="col" id="th06_4">성별</th>
									<th scope="col" id="th06_5">선택</th>
								</tr>
							</thead>
							<tbody>
							
							<c:forEach var="sdj03anilist" items="${sdj03anilist}" varStatus="st">
								<tr>
									<td headers="n01_3 th03_1">${sdj03anilist.RNUM }</td>
									<c:if test="${sdj03anilist.MAI_BNAME == null }">
									<td headers="n01_3 th02_2">${sdj03anilist.MAC_NAME }</td>
									</c:if>
									<c:if test="${sdj03anilist.MAI_BNAME != null }">
									<td headers="n01_3 th02_2">${sdj03anilist.MAC_NAME }(${sdj03anilist.MAI_BNAME })</td>
									</c:if>
									<td headers="n01_3 th02_3">${sdj03anilist.MAI_ANICODE }</td>
									<td headers="n01_3 th02_4">${sdj03anilist.MAI_GENDER }</td>
									<td><a href="javascript:;" class="del2_btn">선택</a></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						</div>
						</form>
					</div>
					
					<div class="btn_area">
						<a href="#none" class="popent_btn" style="display: none;">확인</a>
						<a href="#none" class="popcancel_btn" onclick="javascript:fn_layer_hide();" style="display: none;">취소</a>
					</div>
				</div>
				<a href="#none" class="layer_close">레이어팝업 닫기</a>
		</div>
		<!-- //#layer05-->
	</div>
	<!-- // layer_popup -->