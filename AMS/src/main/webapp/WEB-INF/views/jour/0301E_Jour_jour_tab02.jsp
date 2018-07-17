<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<head>
<script type="text/javascript">

function fn_layer03_search(){
	var form = document.layer03_form;
	var layer03_sch = document.getElementById("layer03_sch").value;
	form.action="/jour/0301/layer03_Search.do";
	form.submit();
	alert(layer03_sch);
}

/* 동물사육관리 수정 */
function updateSDJ02_AniCmnt(){
	var form = document.anicmnt_form;
	var SDJ02_ANICMNT = document.getElementById("SDJ02_ANICMNT").value;
	
	if (confirm("저장 하시겠습니까 ?")) {
        form.action = "/jour/0301/updateSDJ02_AniCmnt.do";
        form.submit();
    }
}

/* 위생 및 방역관리 수정 */
function updateSDJ02_PrvCmnt(){
	var form = document.prvcmnt_form;
	var SDJ02_ANICMNT = document.getElementById("SDJ02_ANICMNT").value;
	
	if (confirm("저장 하시겠습니까 ?")) {
        form.action = "/jour/0301/updateSDJ02_PrvCmnt.do";
        form.submit();
    }
}

/* 안전교육 등 관리 수정 */
function updateSDJ_SafeEdu(){
	var form = document.safety_form;
	var SDJ_SAFE_EDU = document.getElementById("SDJ_SAFE_EDU").value;
	
	if (confirm("저장 하시겠습니까 ?")) {
        form.action = "/jour/0301/updateSDJ_SafeEdu.do";
        form.submit();
    }
}

/* 기타 수정 */
function updateSDJ_Etc(){
	var form = document.etc_form;
	var SDJ_SAFE_ETC = document.getElementById("SDJ_SAFE_ETC").value;
	
	if (confirm("저장 하시겠습니까 ?")) {
        form.action = "/jour/0301/updateSDJ_Etc.do";
        form.submit();
    }
}

/* 이환동물 관리 팝업 */
function fn_layer_ihwan(){
	$("#iwhan").show();
	$(".layer_popup").show();
	var width_size = $("#iwhan").innerWidth()/2;
	$("#iwhan").css("margin-left",-width_size);
}

/* 노령동물 관리 팝업 */
function fn_layer_old(){
	$("#old").show();
	$(".layer_popup").show();
	var width_size = $("#old").innerWidth()/2;
	$("#old").css("margin-left",-width_size);
}

/* 사료관리(종별) */
function fn_layer_saryoj(){
	$("#saryoj").show();
	$(".layer_popup").show();
	var width_size = $("#saryoj").innerWidth()/2;
	$("#saryoj").css("margin-left",-width_size);
}

/* 사료관리(개별) */
function fn_layer_saryog(){
	$("#saryog").show();
	$(".layer_popup").show();
	var width_size = $("#saryog").innerWidth()/2;
	$("#saryog").css("margin-left",-width_size);
}

function fn_layer_hide() {
	$(".layer_box").hide();
	$(".layer_popup").hide();
	$("body").css("overflow-y", "auto");
	
	/* $("#sch_tbody #codeSearch").val("");
	$("#sch_tbody #schKeyword").val("");
	$("#sch_tbody #selbox").val("");
	$("input:radio[name='pyeType']:radio[value='All']").attr("checked",true); */
	fc_clearRow("schRst_tbody");
}

function fn_weigthCheck(object){
    if (object.value.length > object.maxLength){
        object.value = object.value.slice(0, object.maxLength);
    }
}

</script>
</head>

<div class="tab_cont" id="tab02">
							<!-- 동물사육관리 -->
							<div class="aniinfo_add_box margin_change">
								<div class="table_title_box">
									<span class="table_title">	
									<img src="/images/btn_minus.gif" alt="">동물사육관리
									</span>
									<div class="sys_btn_box">
										<span class="align_right btn_hide2">
										<a href="javascript:updateSDJ02_AniCmnt();" class="excel_btn" style="display: none;">저장</a>
										</span>
									</div>
								</div>

								<div class="plan_box table_view_tab2_1">
								<form method="POST" name="anicmnt_form" id="anicmnt_form">
								<input type="hidden" id="sdj_docno" name="sdj_docno" value="${docInfo.SDJ_DOCNO}" />
								<input type="hidden" id="mai_vvrmno" name="mai_vvrmno" value="${docInfo.SDJ_VVRMNO}" />
								<input type="hidden" id="sdj_jnldate" name="sdj_jnldate" value="${docInfo.TXT_SDJ_JNLDATE}" />
									<p class="plan_text">
										<textarea rows="3" id="SDJ02_ANICMNT" name="SDJ02_ANICMNT" style="width: 100%; border: 0; resize: none; padding: 0;">${sdj02aAniprv.SDJ02_ANICMNT }</textarea>
									</p>
									</form>
								</div>

							</div>
							<!-- //동물사육관리 -->

							<!-- 사료관리(종별) -->
							<div class="aniinfo_add_box">
								<div class="table_title_box">
									<span class="table_title">
									<img src="/images/btn_minus.gif" alt="">사료관리(종별)
									</span>
									<div class="sys_btn_box">
										<span class="align_right btn_hide2">
										<a href="javascript:fn_layer_saryoj();" class="save_btn" style="display: none;">추가</a>
										<a href="javascript:;" class="excel_btn" style="display: none;">저장</a>
										<a href="javascript:;" class="del2_btn" style="display: none;">삭제</a>
										</span>
									</div>
								</div>
								<table class="aniinfo_add table_view_tab2_3">
									<caption>사료관리(종별)</caption>
									<colgroup>
										<col style="width: 5%;">
										<col style="width: 10%;">
										<col style="width: 5%;">
										<col style="width: 10%;">
										<col style="width: 10%;">
										<col style="width: 10%;">
										<col style="width: 10%;">
										<col style="width: 10%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" id="tab2_r1th01" rowspan="2" style="vertical-align: middle;">
											<input type="checkbox"></th>
											<th scope="col" id="tab2_r2th02" rowspan="2" style="vertical-align: middle;">동물명</th>
											<th scope="col" id="tab2_r2th03" rowspan="2" style="vertical-align: middle;">두수</th>
											<th scope="colgroup" id="tab2_r2th04" colspan="2">사료기준량(kg)</th>
											<th scope="colgroup" id="tab2_r2th05" colspan="2">사료급여량(kg)</th>
											<th scope="col" id="tab2_r2th06" rowspan="2" style="vertical-align: middle;">기타</th>
										</tr>
										<tr>
											<th scope="col" id="tab2_r2th04_1">총량</th>
											<th scope="col" id="tab2_r2th04_2">종류별</th>
											<th scope="col" id="tab2_r2th05_1">총량</th>
											<th scope="col" id="tab2_r2th05_2">종류별</th>
										</tr>
									</thead>
									
									<tbody>
										<tr>
											<td><input type="checkbox"></td>
											<td headers="tab2_r2n01 tab2_r2th02">
											<input name="textfield" type="text" id="tab2_table3_text1" class="textfield" value="황새" disabled="disabled" style="border: none;"/></td>
											
											<td headers="tab2_r2n01 tab2_r2th03">
											<input name="textfield" type="text" id="tab2_table3_text2" class="textfield2" value="2" /></td>
											
											<td headers="tab2_r2n01 tab2_r2th04_1">
											<input name="textfield" type="text" id="tab2_table3_text3" class="textfield2" value="1" /></td>
											
											<td headers="tab2_r2n01 tab2_r2th04_2">
											<input name="textfield" type="text" id="tab2_table3_text4" class="textfield2" value="2" /></td>
											
											<td headers="tab2_r2n01 tab2_r2th05_1">
											<input name="textfield" type="text" id="tab2_table3_text5" class="textfield2" value="3" /></td>
											
											<td headers="tab2_r2n01 tab2_r2th05_2">
											<input name="textfield" type="text" id="tab2_table3_text6" class="textfield2" value="4" /></td>
											
											<td headers="tab2_r2n01 tab2_r2th06">
											<input name="textfield" type="text" id="tab2_table3_text7" class="textfield" value="1일 3회 (오전/오후)" /></td>
										</tr>
									</tbody>
								</table>

							</div>
							<!-- //사료관리(종별) -->

							<!-- 사료관리(개별) -->
							<div class="aniinfo_add_box">
								<div class="table_title_box">
									<span class="table_title">
									<img src="/images/btn_minus.gif" alt="">사료관리(개별)
									</span>
									<div class="sys_btn_box">
										<span class="align_right btn_hide2">
										<a href="javascript:fn_layer_saryog();" class="save_btn" style="display: none;">추가</a>
										<a href="javascript:;" class="excel_btn" style="display: none;">저장</a>
										<a href="javascript:;" class="del2_btn" style="display: none;">삭제</a>
										</span>
									</div>
								</div>

								<table class="aniinfo_add table_view_tab2_4">
									<caption>사료관리(개별)</caption>
									<colgroup>
										<col style="width: 5%;">
										<col style="width: 10%;">
										<col style="width: 15%;">
										<col style="width: 8%;">
										<col style="width: 8%;">
										<col style="width: 8%;">
										<col style="width: 8%;">
										<col style="width: 10%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" id="tab2_r1th01" rowspan="2" style="vertical-align: middle;">
											<input type="checkbox"></th>
											<th scope="col" id="tab2_r4th02" rowspan="2" style="vertical-align: middle;">동물명</th>
											<th scope="col" id="tab2_r4th03" rowspan="2" style="vertical-align: middle;">동물번호</th>
											<th scope="colgroup" id="tab2_r4th05" colspan="2">사료기준량(kg)</th>
											<th scope="colgroup" id="tab2_r4th06" colspan="2">사료급여량(kg)</th>
											<th scope="col" id="tab2_r4th07" rowspan="2" style="vertical-align: middle;">기타</th>
										</tr>
										<tr>
											<th scope="col" id="tab2_r4th05_1">총량</th>
											<th scope="col" id="tab2_r4th05_2">종류별</th>
											<th scope="col" id="tab2_r4th06_1">총량</th>
											<th scope="col" id="tab2_r4th06_2">종류별</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input type="checkbox"></td>
											<td headers="tab2_r4n01 tab2_r4th02">
											<input name="textfield" type="text" id="tab2_table4_text1" class="textfield" value="황새" disabled="disabled" style="border: none;"/></td>
											
											<td headers="tab2_r4n01 tab2_r4th03">
											<input name="textfield" type="text" id="tab2_table4_text2" class="textfield" value="A1-1-1-1" disabled="disabled" style="border: none;"/></td>
											
											<td headers="tab2_r4n01 tab2_r4th05_1">
											<input name="textfield" type="text" id="tab2_table4_text4" class="textfield2" value="1" /></td>
											
											<td headers="tab2_r4n01 tab2_r4th05_2">
											<input name="textfield" type="text" id="tab2_table4_text5" class="textfield2" value="2" /></td>
											
											<td headers="tab2_r4n01 tab2_r4th06_1">
											<input name="textfield" type="text" id="tab2_table4_text6" class="textfield2" value="3" /></td>
											
											<td headers="tab2_r4n01 tab2_r4th06_2">
											<input name="textfield" type="text" id="tab2_table4_text7" class="textfield2" value="4" /></td>
											
											<td headers="tab2_r4n01 tab2_r4th07">
											<input name="textfield" type="text" id="tab2_table4_text8" class="textfield" value="일 3회 (오전/오후)"/></td>
										</tr> 
								</table>

							</div>
							<!-- //사료관리(개별) -->

							<!-- 이환동물 관리 -->
							<div class="aniinfo_add_box">
								<div class="table_title_box">
									<span class="table_title">
									<img src="/images/btn_minus.gif" alt="">이환동물 관리 
									</span>
									<div class="sys_btn_box">
										<span class="align_right btn_hide2">
										<a href="javascript:fn_layer_ihwan();" class="save_btn" style="display: none;">추가</a>
										<a href="javascript:;" class="excel_btn" style="display: none;">저장</a>
										<a href="javascript:;" class="del2_btn" style="display: none;">삭제</a>
										</span>
									</div>
								</div>
								
								<table class="aniinfo_add table_view_tab2_5">
									<caption>이환동물 관리</caption>
									<colgroup>
										<col style="width: 5%;">
										<col style="width: 10%;">
										<col style="width: 5%;">
										<col style="width: 10%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 10%;">
										<col style="width: 5%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" id="tab2_r1th01" rowspan="2" style="vertical-align: middle;">
											<input type="checkbox"></th>
											<th scope="col" id="tab2_r5th02" rowspan="2" style="vertical-align: middle;">동물명</th>
											<th scope="col" id="tab2_r5th02" rowspan="2" style="vertical-align: middle;">성별</th>
											<th scope="col" id="tab2_r5th03" rowspan="2" style="vertical-align: middle;">동물번호</th>
											<th scope="col" id="tab2_t5th05" rowspan="2" style="vertical-align: middle;">증상</th>
											<th scope="colgroup" id="tab2_r5th05" colspan="5">동물상태</th>
											<th scope="colgroup" id="tab2_r5th06" colspan="2">조치사항</th>
										</tr>
										<tr>
											<th scope="col" id="tab2_r5th05_1">외관</th>
											<th scope="col" id="tab2_r5th05_2">배변</th>
											<th scope="col" id="tab2_r5th05_3">채식</th>
											<th scope="col" id="tab2_r5th05_4">운동</th>
											<th scope="col" id="tab2_r5th05_5">외상</th>
											<th scope="col" id="tab2_r5th06_1">진료투약</th>
											<th scope="col" id="tab2_r5th06_2">특별관리</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input type="checkbox"></td>
											<td headers="tab2_r5n01 tab2_r5th02">
											<input name="textfield" type="text" id="tab2_table5_text1" class="textfield" value="황새" disabled="disabled" style="border: none;"/></td>
											
											<td headers="tab2_r5n01 tab2_r5th02">
											<input name="textfield" type="text" id="tab2_table5_text1" class="textfield" value="수" disabled="disabled" style="border: none;width: 50px"/></td>
											
											<td headers="tab2_r5n01 tab2_r5th03">
											<input name="textfield" type="text" id="tab2_table5_text2" class="textfield" value="A1-1-1-1" disabled="disabled" style="border: none;"/></td>
											
											<td headers="tab2_r5n01 tab2_r5th05_1">
											<input name="textfield" type="text" id="tab2_table5_text4" class="textfield2" value=""/></td>
										
											<td headers="tab2_r5n01 tab2_r5th05_1">
											<input name="textfield" type="text" id="tab2_table5_text4" class="textfield2" value=""/></td>
											
											<td headers="tab2_r5n01 tab2_r5th05_2">
											<input name="textfield" type="text" id="tab2_table5_text5" class="textfield2" value=""/></td>
											
											<td headers="tab2_r5n01 tab2_r5th05_3">
											<input name="textfield" type="text" id="tab2_table5_text6" class="textfield2" value=""/></td>
											
											<td headers="tab2_r5n01 tab2_r5th05_4">
											<input name="textfield" type="text" id="tab2_table5_text7" class="textfield2" value=""/></td>
											
											<td headers="tab2_r5n01 tab2_r5th05_5">
											<input name="textfield" type="text" id="tab2_table5_text8" class="textfield2" value=""/></td>
											
											<td headers="tab2_r5n01 tab2_r5th06_1">
											<input name="textfield" type="text" id="tab2_table5_text9" class="textfield" value=""/></td>
											
											<td headers="tab2_r5n01 tab2_r5th06_2">
											<input name="textfield" type="text" id="tab2_table5_text10" class="textfield" value=""/></td>
										</tr> 
									</tbody>
								</table>
							</div>
							<!-- //이환동물 관리 -->

							<!-- 노령동물 관리 -->
							<div class="aniinfo_add_box">
								<div class="table_title_box">
									<span class="table_title">
									<img src="/images/btn_minus.gif" alt="">노령동물 관리
									</span>
									<div class="sys_btn_box">
										<span class="align_right btn_hide2">
										<a href="javascript:fn_layer_old();" class="save_btn" style="display: none;">추가</a>
										<a href="#" class="excel_btn" style="display: none;">저장</a>
										<a href="javascript:;" class="del2_btn" style="display: none;">삭제</a>
										</span>
									</div>
								</div>
								
								<table class="aniinfo_add table_view_tab2_10">
									<caption>노령동물 관리</caption>
									<colgroup>
										<col style="width: 5%;">
										<col style="width: 10%;">
										<col style="width: 15%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 10%;">
										<col style="width: 10%;">
										<col style="width: 5%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" id="tab2_r1th01" rowspan="2" style="vertical-align: middle;">
											<input type="checkbox"></th>
											<th scope="col" id="tab2_r5th02" rowspan="2" style="vertical-align: middle;">동물명</th>
											<th scope="col" id="tab2_r5th03" rowspan="2" style="vertical-align: middle;">동물번호</th>
											<th scope="col" id="tab2_t5th05" rowspan="2" style="vertical-align: middle;">성별</th>	
											<th scope="col" id="tab2_r5th04" rowspan="2" style="vertical-align: middle;">등록년도</th>										
											<th scope="col" id="tab2_r5th04" rowspan="2" style="vertical-align: middle;">증상</th>
											<th scope="colgroup" id="tab2_r5th05" colspan="4">동물상태</th>
											<th scope="colgroup" id="tab2_r5th06" colspan="2">조치사항</th>
										</tr>
										<tr>
											<th scope="col" id="tab2_r5th05_2">배변</th>
											<th scope="col" id="tab2_r5th05_3">채식</th>
											<th scope="col" id="tab2_r5th05_4">운동</th>
											<th scope="col" id="tab2_r5th05_5">외상</th>
											<th scope="col" id="tab2_r5th06_1">진료투약</th>
											<th scope="col" id="tab2_r5th06_2">특별관리</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input type="checkbox"></td>
											<td headers="tab2_r5n01 tab2_r5th02">
											<input name="textfield" type="text" id="tab2_table5_text1" class="textfield" value="황새" disabled="disabled" style="border: none;"/></td>
											
											<td headers="tab2_r5n01 tab2_r5th03">
											<input name="textfield" type="text" id="tab2_table5_text2" class="textfield" value="A1-1-1-1" disabled="disabled" style="border: none;"/></td>
											
											<td headers="tab2_r5n01 tab2_r5th05_1">
											<input name="textfield" type="text" id="tab2_table5_text4" class="textfield2" value="수" disabled="disabled" style="border: none;"/></td>
											
											<td headers="tab2_r5n01 tab2_r5th05_2">
											<input name="textfield" type="text" id="tab2_table5_text5" class="textfield2" value="1995년" disabled="disabled" style="border: none;"/></td>
											
											<td headers="tab2_r5n01 tab2_r5th04">
											<input name="textfield" type="text" id="tab2_table5_text3" class="textfield" value="" style="width: 50px;"/></td>
											
											<td headers="tab2_r5n01 tab2_r5th05_3">
											<input name="textfield" type="text" id="tab2_table5_text6" class="textfield2" value=""/></td>
											
											<td headers="tab2_r5n01 tab2_r5th05_4">
											<input name="textfield" type="text" id="tab2_table5_text7" class="textfield2" value=""/></td>
											
											<td headers="tab2_r5n01 tab2_r5th05_5">
											<input name="textfield" type="text" id="tab2_table5_text8" class="textfield2" value=""/></td>
											
											<td headers="tab2_r5n01 tab2_r5th06_1">
											<input name="textfield" type="text" id="tab2_table5_text9" class="textfield" value=""/></td>
											
											<td headers="tab2_r5n01 tab2_r5th06_2">
											<input name="textfield" type="text" id="tab2_table5_text10" class="textfield" value=""/></td>
											
											<td headers="tab2_r5n01 tab2_r5th06_2">
											<input name="textfield" type="text" id="tab2_table5_text10" class="textfield" value=""/></td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- //노령동물 관리 -->

							<!-- 체중관리 -->
							<div class="aniinfo_add_box">
								<div class="table_title_box">
									<span class="table_title">
									<img src="/images/btn_minus.gif" alt="">체중관리
									</span>
									<div class="sys_btn_box">
										<span class="align_right"> 
										<a href="javascript:;" class="info_add_btn" style="display: none;">저장</a>
										</span>
									</div>
								</div>

								<table class="aniinfo_add table_view_tab2_6">
									<caption>체중관리</caption>
									<colgroup>
										<col style="width: 5%;">
										<col style="width: 15%;">
										<col style="width: 20%;">
										<col style="width: 10%;">
										<col style="width: 15%;">
										<col style="width: 8%;">
										<col style="width: 10%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" id="tab2_r6th01">No</th>
											<th scope="col" id="tab2_t6th05">동물명</th>
											<th scope="col" id="tab2_r6th02">동물번호</th>
											<th scope="col" id="tab2_r6th03">성별</th>
											<th scope="col" id="tab2_r6th04">측정일</th>
											<th scope="col" id="tab2_t6th05">체중(kg)</th>
											
										</tr>
									</thead>
									<tbody>
									 	<tr>
											<th scope="row" id="tab2_r6n01" headers="tab2_r6th01">1</th>
											
											<td>
											<input name="textfield" type="text" id="tab2_table6_text1" class="textfield" value="황새" disabled="disabled" style="border: none;" /></td>
											
											<td>
											<input name="textfield" type="text" id="tab2_table6_text2" class="textfield" value="A1-1-1-1" disabled="disabled" style="border: none;"/></td>
											
											<td>
											<input name="textfield" type="text" id="tab2_table6_text3" class="textfield" value="수" disabled="disabled" style="border: none;"/></td>
											
											<td>
											<input type="text" id="tab2_table6_text1" class="calendar1" value="2017-05-26">
											</td>
											
											<td>
											<input type="number" id="tab2_table6_text4" class="textfield" style="width: 150px;" oninput="fn_weigthCheck(this);" maxlength="5"/></td>
											
										</tr> 
									</tbody>
								</table>
							</div>
							<!-- //체중관리 -->

							<!-- 위생 및 방역관리 -->
							<div class="aniinfo_add_box">
								<div class="table_title_box">
									<span class="table_title">
									<img src="/images/btn_minus.gif" alt="">위생 및 방역관리
									</span>
									<div class="sys_btn_box">
										<span class="align_right"> 
										<a href="javascript:updateSDJ02_PrvCmnt();" class="info_add_btn" style="display: none;">저장</a>
										</span>
									</div>
								</div>

								<div class="plan_box table_view_tab2_7">
								<form method="POST" name="prvcmnt_form" id="prvcmnt_form">
								<input type="hidden" id="sdj_docno" name="sdj_docno" value="${docInfo.SDJ_DOCNO}" />
								<input type="hidden" id="mai_vvrmno" name="mai_vvrmno" value="${docInfo.SDJ_VVRMNO}" />
								<input type="hidden" id="sdj_jnldate" name="sdj_jnldate" value="${docInfo.TXT_SDJ_JNLDATE}" />
									<p class="plan_text">
										<textarea rows="3" id="SDJ02_PRVCMNT" name="SDJ02_PRVCMNT" style="width: 100%; border: 0; resize: none; padding: 0;">${sdj02aAniprv.SDJ02_PRVCMNT }</textarea>
									</p>
									</form>
								</div>

							</div>
							<!-- //위생 및 방역관리 -->

						<form id="tab3_uploadForm" enctype="multipart/form-data" method="POST" action="/common/file/upload.do">
						<div style="display:none">
							<input type="file" id="file1" name="ani_file" onchange="javascript:fc_chgImgFile(this, $('#ani_img1'));">
							<input type="file" id="file2" name="ani_file" required="required" onchange="javascript:fc_chgImgFile(this, $('#ani_img2'));"/>
							<input type="file" id="file3" name="ani_file" required="required" onchange="javascript:fc_chgImgFile(this, $('#ani_img3'));"/>
							<input type="file" id="file4" name="ani_file" required="required" onchange="javascript:fc_chgImgFile(this, $('#ani_img4'));"/>
							<input type="file" id="file5" name="ani_file" required="required" onchange="javascript:fc_chgImgFile(this, $('#ani_img5'));"/>
						</div>
						<input type="hidden" id="minus_ids" name="minus_ids"/>
						<input type="hidden" id="file_ids" name="file_ids"/>
						<input type="hidden" id="bzseqno_list" name="bzseqno_list"/>
						<div id="fileMap" data-val=''></div>

						<!-- 사육관리 이미지 -->
						<!-- 경로-->
						<c:set var="img1" value="/images/footer_logo.png" />
						<c:set var="img2" value="/images/footer_logo.png" />
						<c:set var="img3" value="/images/footer_logo.png" />
						<c:set var="img4" value="/images/footer_logo.png" />
						<c:set var="img5" value="/images/footer_logo.png" />
						
						<!-- 타이틀-->
						<c:set var="img1_ttl" value="" />
						<c:set var="img2_ttl" value="" />
						<c:set var="img3_ttl" value="" />
						<c:set var="img4_ttl" value="" />
						<c:set var="img5_ttl" value="" />

						<c:forEach var="syFileList" varStatus="status" items="${syFileList}">
						<c:choose>
							<c:when test="${syFileList.BII_BZSEQNO == '1'}">
								<c:if test="${!empty syFileList.BII_IMGFILENM}"><c:set var="img1" value="/${syPath}/${syFileList.BII_IMGFILENM}" /></c:if>
								<c:set var="img1_ttl" value="${syFileList.BII_IMGFILETTL}" />
							</c:when>
							<c:when test="${syFileList.BII_BZSEQNO == 2}">
								<c:if test="${!empty syFileList.BII_IMGFILENM}"><c:set var="img2" value="/${syPath}/${syFileList.BII_IMGFILENM}" /></c:if>
								<c:set var="img2_ttl" value="${syFileList.BII_IMGFILETTL}" />
							</c:when>
							<c:when test="${syFileList.BII_BZSEQNO == 3}">
								<c:if test="${!empty syFileList.BII_IMGFILENM}"><c:set var="img3" value="/${syPath}/${syFileList.BII_IMGFILENM}" /></c:if>
								<c:set var="img3_ttl" value="${syFileList.BII_IMGFILETTL}" />
							</c:when>
							<c:when test="${syFileList.BII_BZSEQNO == 4}">
								<c:if test="${!empty syFileList.BII_IMGFILENM}"><c:set var="img4" value="/${syPath}/${syFileList.BII_IMGFILENM}" /></c:if>
								<c:set var="img4_ttl" value="${syFileList.BII_IMGFILETTL}" />
							</c:when>
							<c:when test="${syFileList.BII_BZSEQNO == 5}">
								<c:if test="${!empty syFileList.BII_IMGFILENM}"><c:set var="img5" value="/${syPath}/${syFileList.BII_IMGFILENM}" /></c:if>
								<c:set var="img5_ttl" value="${syFileList.BII_IMGFILETTL}" />
							</c:when>
						</c:choose>
						</c:forEach>
					
						<div class="aniinfo_add_box">
							<div class="table_title_box">
								<span class="table_title">
									<img src="/images/btn_minus.gif" alt="">사육관리 이미지
									</span>
								<div class="sys_btn_box">
									<span class="align_right">
									<a href="javascript:fn_tab3_save_Img();" class="info_add_btn" style="display: none;">저장</a></span>
								</div>
							</div>
							<table class="aniinfo_search">
								<thead>
									<tr>
										<th scope="col"><img id="ani_img1" src="${img1}" alt="" style="width: 180px; height: 120px;"></th>
										<th scope="col"><img id="ani_img2" src="${img2}" alt="" style="width: 180px; height: 120px;"></th>
										<th scope="col"><img id="ani_img3" src="${img3}" alt="" style="width: 180px; height: 120px;"></th>
										<th scope="col"><img id="ani_img4" src="${img4}" alt="" style="width: 180px; height: 120px;"></th>
										<th scope="col"><img id="ani_img5" src="${img5}" alt="" style="width: 180px; height: 120px;"></th>
									</tr>
								</thead>
							</table>
							<table class="aniinfo_search table_view">
								<caption>대표 이미지</caption>
								<colgroup>
									<col style="width:20%;">
									<col style="width:20%;">
									<col style="width:20%;">
									<col style="width:20%;">
									<col style="width:20%;">								
								</colgroup>
	                            <tbody>
									<tr>
										<td><input type=text id="imgfilettl_1" name="imgfilettl_1" value='${img1_ttl}'></td>
										<td><input type=text id="imgfilettl_2" name="imgfilettl_2" value='${img2_ttl}'></td>
										<td><input type=text id="imgfilettl_3" name="imgfilettl_3" value='${img3_ttl}'></td>
										<td><input type=text id="imgfilettl_4" name="imgfilettl_4" value='${img4_ttl}'></td>
										<td><input type=text id="imgfilettl_5" name="imgfilettl_5" value='${img5_ttl}'></td>
									</tr>
									<tr class="td_btn_box">
										<th scope="col">
										<hover onclick="fc_base_unload_img($('#tab3_uploadForm #file1'), $('#ani_img1'));"><a href="javascript:;"><img src="${pageContext.request.contextPath }/images/ico_minus.png" style="vertical-align:middle"></a></hover>
										<hover onclick="javascript:$('#tab3_uploadForm #file1').click();"><a href="javascript:;"><img src="${pageContext.request.contextPath }/images/ico_plus.png" style="vertical-align:middle"></a></hover></th>
										
										<th scope="col">
										<hover onclick="fc_base_unload_img($('#tab3_uploadForm #file2'), $('#ani_img2'));"><a href="javascript:;"><img src="${pageContext.request.contextPath }/images/ico_minus.png" style="vertical-align:middle"></a></hover>
										<hover onclick="javascript:$('#tab3_uploadForm #file2').click();"><a href="javascript:;"><img src="${pageContext.request.contextPath }/images/ico_plus.png" style="vertical-align:middle"></a></hover></th>
										
										<th scope="col">
										<hover onclick="fc_base_unload_img($('#tab3_uploadForm #file3'), $('#ani_img3'));"><a href="javascript:;"><img src="${pageContext.request.contextPath }/images/ico_minus.png" style="vertical-align:middle"></a></hover>
										<hover onclick="javascript:$('#tab3_uploadForm #file3').click();"><a href="javascript:;"><img src="${pageContext.request.contextPath }/images/ico_plus.png" style="vertical-align:middle"></a></hover></th>
										
										<th scope="col">
										<hover onclick="fc_base_unload_img($('#tab3_uploadForm #file4'), $('#ani_img4'));"><a href="javascript:;"><img src="${pageContext.request.contextPath }/images/ico_minus.png" style="vertical-align:middle"></a></hover>
										<hover onclick="javascript:$('#tab3_uploadForm #file4').click();"><a href="javascript:;"><img src="${pageContext.request.contextPath }/images/ico_plus.png" style="vertical-align:middle"></a></hover></th>
										
										<th scope="col">
										<hover onclick="fc_base_unload_img($('#tab3_uploadForm #file5'), $('#ani_img5'));"><a href="javascript:;"><img src="${pageContext.request.contextPath }/images/ico_minus.png" style="vertical-align:middle"></a></hover>
										<hover onclick="javascript:$('#tab3_uploadForm #file5').click();"><a href="javascript:;"><img src="${pageContext.request.contextPath }/images/ico_plus.png" style="vertical-align:middle"></a></hover></th>
									</tr>
									<tr class="td_btn_box">
										<td><a href="${img1}" class="down_btn" target="_blank">다운로드</a></td>
										<td><a href="${img2}" class="down_btn" target="_blank">다운로드</a></td>
										<td><a href="${img3}" class="down_btn" target="_blank">다운로드</a></td>
										<td><a href="${img4}" class="down_btn" target="_blank">다운로드</a></td>
										<td><a href="${img5}" class="down_btn" target="_blank">다운로드</a></td>
									</tr>
							   </tbody>
							</table>
	
						</div>
						
						<!-- //사육관리 이미지 -->
						</form>

							<!-- 안전교육 등 관리 -->
							<div class="aniinfo_add_box">
								<div class="table_title_box">
									<span class="table_title">
									<img src="/images/btn_minus.gif" alt="">안전교육 등 관리
									</span>
									<div class="sys_btn_box">
										<span class="align_right"> 
										<a href="javascript:updateSDJ_SafeEdu();" class="info_add_btn" style="display: none;">저장</a>
										</span>
									</div>
								</div>

								<div class="plan_box table_view_tab2_9">
								<form method="POST" name="safety_form" id="safety_form">
								<input type="hidden" id="sdj_docno" name="sdj_docno" value="${docInfo.SDJ_DOCNO}" />
								<input type="hidden" id="mai_vvrmno" name="mai_vvrmno" value="${docInfo.SDJ_VVRMNO}" />
								<input type="hidden" id="sdj_jnldate" name="sdj_jnldate" value="${docInfo.TXT_SDJ_JNLDATE}" />
									<p class="plan_text">
										<textarea rows="3" id="SDJ_SAFE_EDU" name="SDJ_SAFE_EDU" style="width: 100%; border: 0; resize: none; padding: 0;">${sdjseCmnt.SDJ_SAFE_EDU }</textarea>
									</p>
									</form>
								</div>
							</div>
							<!-- //안전교육 등 관리 -->

							<!-- 기타 -->
							<div class="aniinfo_add_box">
								<div class="table_title_box">
									<span class="table_title">
									<img src="/images/btn_minus.gif" alt="">기타
									</span>
									<div class="sys_btn_box">
									
										<span class="align_right"> 
										<a href="javascript:updateSDJ_Etc();" class="info_add_btn" style="display: none;">저장</a>
										</span>
									</div>
								</div>

								<div class="plan_box table_view_tab2_12">
								<form method="POST" name="etc_form" id="etc_form">
								<input type="hidden" id="sdj_docno" name="sdj_docno" value="${docInfo.SDJ_DOCNO}" />
								<input type="hidden" id="mai_vvrmno" name="mai_vvrmno" value="${docInfo.SDJ_VVRMNO}" />
								<input type="hidden" id="sdj_jnldate" name="sdj_jnldate" value="${docInfo.TXT_SDJ_JNLDATE}" />
								<p class="plan_text">
								<textarea rows="3" id ="SDJ_SAFE_ETC" name="SDJ_SAFE_ETC" style="width: 100%; border: 0; resize: none; padding: 0;">${sdjseCmnt.SDJ_SAFE_ETC }</textarea>
								</p>
								</form>
								</div> 
							</div>
							<!-- //기타 -->
						</div>
						
<!-- layer_popup -->
	<div class="layer_popup">	
		<div class="dimm3"></div>
		<!-- #layer01 -->
		<div class="layer_box" id="iwhan" style="top: 80px; height: 650px;">
			<div class="layer_tit">이환관리 동물선택</div>
				<div class="layer_con">
					<div class="search_box">
                        <table class="search_table" style="width:760px;" >
							<caption>이환관리 동물선택</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody>
                            <tr>
                                <th scope="row">동물사</th>
                                <td>
                                <select disabled="disabled">
                                <option>${docInfo.MVI_VVRMNAME }</option>
                                </select>
                                </td>
                            </tr>
                            </tbody>
                        </table>
					</div>
					<div class="table_box">
					<div style="width:100%; height:400px; overflow:auto;">
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
									<th scope="col" id="p3th01_1">No</th>
									<th scope="col" id="p3th02_1">분류명</th>
									<th scope="col" id="p3th03_1">동물명</th>
									<th scope="col" id="p3th05_1">동물번호</th>
									<th scope="col" id="p3th04_1">성별</th>
									<th scope="col" id="p3th06_1">이환관리</th>
								</tr>
							</thead>
							<tbody id="ae_tbody">
							<c:forEach var="ae_popup" items="${ae_popup}" varStatus="st">
								<tr>
									<th scope="row" id="p3n01_1" headers="p3th01_1">${ae_popup.RNUM}</th>
									<td headers="p3n01_1 p3th02_1">${ae_popup.CLS1_NAME }</td>
									<td headers="p3n01_1 p3th03_1">${ae_popup.MAC_NAME }(${ae_popup.MAI_BNAME })</td>
									<td headers="p3n01_1 p3th04_1">${ae_popup.MAI_ANICODE }</td>
									<td headers="p3n01_1 p3th05_1">${ae_popup.MAI_GENDER }</td>
									<td headers="p3n01_1 p3th06_1"><input type="checkbox" id="sel3_chk"><label for="sel3_chk"></label></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						</div>
					</div>
					<div class="btn_area">
						<a href="#none" class="popent_btn btn_type2">확인</a>
						<a href="#none" class="popcancel_btn btn_type2" onclick="javascript:fn_layer_hide();">취소</a>
					</div>
				</div>
				<a href="#none" class="layer_close" onclick="javascript:fn_layer_hide();">레이어팝업 닫기</a>
		</div>	
		<!-- layer01 -->
		
		<!-- #layer02 -->
		<div class="layer_box" id="old" style="top: 80px; height: 650px;">
			<div class="layer_tit">노령관리 동물선택</div>
				<div class="layer_con">
					<div class="search_box">
                        <table class="search_table" style="width:760px;" >
							<caption>노령관리 동물선택</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody>
                            <tr>
                                <th scope="row">동물사</th>
                                <td>
                                <select disabled="disabled">
                                <option>${docInfo.MVI_VVRMNAME }</option>
                                </select>
                                </td>
                            </tr>
                            </tbody>
                        </table>
					</div>
					<div class="table_box">
					<div style="width:100%; height:400px; overflow:auto">
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
									<th scope="col" id="p3th01_1">No</th>
									<th scope="col" id="p3th02_1">분류명</th>
									<th scope="col" id="p3th03_1">동물명</th>
									<th scope="col" id="p3th05_1">동물번호</th>
									<th scope="col" id="p3th04_1">성별</th>
									<th scope="col" id="p3th06_1">이환관리</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="ae_popup" items="${ae_popup}" varStatus="st">
								<tr>
									<th scope="row" id="p3n01_1" headers="p3th01_1">${ae_popup.RNUM}</th>
									<td headers="p3n01_1 p3th02_1">${ae_popup.CLS1_NAME }</td>
									<td headers="p3n01_1 p3th03_1">${ae_popup.MAC_NAME }(${ae_popup.MAI_BNAME })</td>
									<td headers="p3n01_1 p3th04_1">${ae_popup.MAI_ANICODE }</td>
									<td headers="p3n01_1 p3th05_1">${ae_popup.MAI_GENDER }</td>
									<td headers="p3n01_1 p3th06_1"><input type="checkbox" id="sel3_chk"><label for="sel3_chk"></label></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						</div>
					</div>
					<div class="btn_area">
						<a href="#none" class="popent_btn btn_type2">확인</a>
						<a href="#none" class="popcancel_btn btn_type2" onclick="javascript:fn_layer_hide();">취소</a>
					</div>
				</div>
				<a href="#none" class="layer_close" onclick="javascript:fn_layer_hide();">레이어팝업 닫기</a>
		</div>	
		<!-- layer02 -->
		
		<!-- #layer03 -->
		<div class="layer_box" id="saryoj" style="top: 80px; height: 650px;overflow:auto;">
			<div class="layer_tit">사료관리(종별)</div>
				<div class="layer_con">
					<div class="search_box">
					<table class="search_table" style="width:760px;" >
							<caption>사료관리(종별)</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody>
                            <tr><th scope="row">검색</th><td>
                            <input name="textfield" type="text" id="layer03_sch" name="layer03_sch" class="textfield" style="width:90%"/></td></tr>
							<tr><th colspan="2" scope="col" class="search_btn_area">
							<a href="javascript:fn_layer03_search();" class="search_btn">조회</a></th></tr>
                            </tbody>
                        </table>
					</div>
					<div class="table_box">
					<form method="POST" name="layer03_form" id="layer03_form">
					<div style="width:100%; height:400px; overflow:auto">
						<table class="aniinfo_add" style="width:760px; margin-top:20px;" >
							<caption>사료관리(종별)</caption>
							<colgroup>
								<col style="width:8%;">
								<col style="width:10%;">
								<col style="width:5%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th02_3">종 번호</th>
									<th scope="col" id="th03_3">종 이름</th>
									<th scope="col" id="th06_3">선택</th>
								</tr>
							</thead>
							<tbody>
							
							<c:forEach var="sdj03species" items="${sdj03species}" varStatus="st">
								<tr>
									<td headers="n01_3 th03_1">${sdj03species.MAC_ANICLSCODE }</td>
									<td headers="n01_3 th02_2">${sdj03species.MAC_NAME }</td>
									<td headers="n01_3 th06_3"><input type="checkbox" id="sel_chk"><label for="sel_chk"></label></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						</div>
						</form>
					</div>
					
					<div class="btn_area">
						<a href="#none" class="popent_btn btn_type2">확인</a>
						<a href="#none" class="popcancel_btn btn_type2" onclick="javascript:fn_layer_hide();">취소</a>
					</div>
				</div>
				<a href="#none" class="layer_close">레이어팝업 닫기</a>
		</div>		
		<!-- //#layer03-->
		
		<!-- #layer04 -->
		<div class="layer_box" id="saryog" style="top: 80px; height: 650px;">
			<div class="layer_tit">사료관리(개별)</div>
				<div class="layer_con">
					<div class="search_box">
					<table class="search_table" style="width:760px;" >
							<caption>사료관리(개별)</caption>
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
							<caption>사료관리(개별)</caption>
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
									<td headers="n01_3 th02_2">${sdj03anilist.MAC_NAME }(${sdj03anilist.MAI_BNAME })</td>
									<td headers="n01_3 th02_3">${sdj03anilist.MAI_ANICODE }</td>
									<td headers="n01_3 th02_4">${sdj03anilist.MAI_GENDER }</td>
									<td headers="n01_3 th06_5"><input type="checkbox" id="sel_chk"><label for="sel_chk"></label></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						</div>
						</form>
					</div>
					
					<div class="btn_area">
						<a href="#none" class="popent_btn btn_type2">확인</a>
						<a href="#none" class="popcancel_btn btn_type2" onclick="javascript:fn_layer_hide();">취소</a>
					</div>
				</div>
				<a href="#none" class="layer_close">레이어팝업 닫기</a>
		</div>		
		<!-- //#layer04-->
	</div>
	<!-- // layer_popup --> 