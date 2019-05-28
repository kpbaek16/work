<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<head>
<script type="text/javascript">
function fn_layer_st(){
	$("#st").show();
	$(".layer_popup").show();
	var width_size = $("#st").innerWidth()/2;
	$("#st").css("margin-left",-width_size);
}

/* 동물사 온도 수정 */
function updateSVG_Temp(){
	var form = document.svg_temp;
	
	 var SVG_IN_HTMPT = document.getElementById("SVG_IN_HTMPT").value;
	 var SVG_IN_LTMPT = document.getElementById("SVG_IN_LTMPT").value;
	 var SVG_OUT_HTMPT = document.getElementById("SVG_OUT_HTMPT").value;
	 var SVG_OUT_LTMPT = document.getElementById("SVG_OUT_LTMPT").value;
	
	if (confirm("저장 하시겠습니까 ?")) {
       form.action = "/jour/0301/updateSVG_Temp.do";
       form.submit();
   }
}

/* 내외 순찰실적 수정 */
function updateSDJ_Sj(){
	var form = document.sj_form;
	
	 var SDJS_IN_TM = document.getElementById("SDJS_IN_TM").value;
	 var SDJS_IN_S = document.getElementById("SDJS_IN_S").value;
	 var SDJS_IN_WL_YN = document.getElementById("SDJS_IN_WL_YN").value;
	 var SDJS_IN_CMNT = document.getElementById("SDJS_IN_CMNT").value;
	
	 var SDJS_OUT_TM = document.getElementById("SDJS_OUT_TM").value;
	 var SDJS_OUT_S = document.getElementById("SDJS_OUT_S").value;
	 var SDJS_OUT_WL_YN = document.getElementById("SDJS_OUT_WL_YN").value;
	 var SDJS_OUT_CMNT = document.getElementById("SDJS_OUT_CMNT").value;
	
	if (confirm("저장 하시겠습니까 ?")) {
      form.action = "/jour/0301/updateSDJ_Sj.do";
      form.submit();
  }
}

/* 시설점검 특이사항 수정 */
function updateSDJS_Ss_Cmnt(){
	var form = document.sdjs_ss_cmnt;
	
	 var SDJS_SS_CMNT = document.getElementById("SDJS_SS_CMNT").value;
	
	if (confirm("저장 하시겠습니까 ?")) {
      form.action = "/jour/0301/updateSDJS_Ss_Cmnt.do";
      form.submit();
  }
}
/* 시설점검 개선사항 수정 */
function updateSDJS_Sc_Cmnt(){
	var form = document.sdjs_sc_cmnt;
	
	 var SDJS_SC_CMNT = document.getElementById("SDJS_SC_CMNT").value;
	
	if (confirm("저장 하시겠습니까 ?")) {
     form.action = "/jour/0301/updateSDJS_Sc_Cmnt.do";
     form.submit();
 }
}

/* 시설안전점검 수정 */
function updateSDJ03_SJ(){
	var form = document.safety_form;
	
	 var SDJS_SC_CMNT = document.getElementById("SDJS_SC_CMNT").value;
	
	if (confirm("저장 하시겠습니까 ?")) {
    form.action = "/jour/0301/updateSDJ03_SJ.do";
    form.submit();
}

}

function fn_maxLengthCheck(object){
	/* 정규식 테스트
	var regNumber = /^[0-9]*$/; */
	
    if (object.value.length > object.maxLength){
        object.value = object.value.slice(0, object.maxLength);
    }    
    else if(object.value>=46 || object.value<=-30.9)
    {
    	alert('온도 허용범위는 영하 30.0 부터 영상 45.9 까지 입니다.');
    	object.value = '';
    	return;
    }
}
</script>

</head>
<!doctype html>
<div class="tab_cont" id="tab03">
							<!-- 동물사 온도 -->
							<div class="aniinfo_add_box">
								<div class="table_title_box">
									<span class="table_title">
									<img src="/images/btn_minus.gif" alt="">동물사 온도
									</span>
									<div class="sys_btn_box">
										<span class="align_right btn_hide2">
										<a href="javascript:updateSVG_Temp();" class="save_btn" style="display: none;">저장</a>
										</span>
									</div>
								</div>
								<form method="POST" name="svg_temp" id="svg_temp">
									<input type="hidden" id="sdj_docno" name="sdj_docno" value="${docInfo.SDJ_DOCNO}" />
									<input type="hidden" id="mai_vvrmno" name="mai_vvrmno" value="${docInfo.SDJ_VVRMNO}" />
									<input type="hidden" id="sdj_jnldate" name="sdj_jnldate" value="${docInfo.TXT_SDJ_JNLDATE}" />
								<table class="aniinfo_search table_view_tab2_1">
									<caption>동물사 온도</caption>
									<colgroup>
										<col style="width: 15%;">
										<col style="width: 35%;">
										<col style="width: 15%;">
										<col style="width: 35%;">
									</colgroup>
									<tbody>
									<tr>
										<th scope="row">내실(최고)</th>
										<td><input type="number" class="textfield" id="SVG_IN_HTMPT" name="SVG_IN_HTMPT" oninput="fn_maxLengthCheck(this);" maxlength="5" value="${svgtemp.SVG_IN_HTMPT }" style="width: 150px;"> ℃</td>
										<th scope="row">외부(최고)</th>
										<td><input type="number" class="textfield" id="SVG_IN_LTMPT" name="SVG_IN_LTMPT" oninput="fn_maxLengthCheck(this);" maxlength="5" value="${svgtemp.SVG_IN_LTMPT }" style="width: 150px;"> ℃</td>
									</tr>
									<tr>
										<th scope="row">내실(최저)</th>
										<td><input type="number" class="textfield" id="SVG_OUT_HTMPT" name="SVG_OUT_HTMPT" oninput="fn_maxLengthCheck(this);" maxlength="5" value="${svgtemp.SVG_OUT_HTMPT }" style="width: 150px;"> ℃</td>
										<th scope="row">외부(최저)</th>
										<td><input type="number" class="textfield" id="SVG_OUT_LTMPT" name="SVG_OUT_LTMPT" oninput="fn_maxLengthCheck(this);" maxlength="5" value="${svgtemp.SVG_OUT_LTMPT }" style="width: 150px;" > ℃</td>									</tr>
									</tbody>
								</table>
								</form>
							</div>
							<!-- //동물사 온도 -->
							
							<!-- 동물생태 점검 -->
							<div class="aniinfo_add_box">
								<div class="table_title_box">
									<span class="table_title">
									<img src="/images/btn_minus.gif" alt="">동물생태 점검
									</span> 
									<div class="sys_btn_box">
										<span class="align_right btn_hide2">
										<a href="javascript:fn_layer_st();" class="save_btn" style="display: none;">추가</a>
										<a href="javascript:;" class="excel_btn" style="display: none;">저장</a> 
										<a href="javascript:;" class="del2_btn" style="display: none;">삭제</a>
										</span>
									</div>
								</div>

								<table class="aniinfo_add table_view_tab2_2">
									<caption>동물생태 점검</caption>
									<colgroup>
										<col style="width: 5%;">
										<col style="width: 10%;">
										<col style="width: 15%;">
										<col style="width: 15%;">
										<col style="width: 8%;">
										<col style="width: 20%;">
										<col style="width: 20%;">
										<col style="width: 15%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" id="tab2_r1th01" style="vertical-align: middle;">
											<input type="checkbox"></th>
											<th scope="col" id="tab2_r1th02">구분</th>
											<th scope="col" id="tab2_r1th03">동물명</th>
											<th scope="col" id="tab2_r1th04">동물번호</th>
											<th scope="col" id="tab2_r1th05">성별</th>
											<th scope="col" id="tab2_r1th06">특이사항</th>
											<th scope="col" id="tab2_r1th07">조치사항</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="jnl02sp" items="${jnl02sp}" varStatus="st">
										<tr>
											<th scope="row" id="tab2_r1n01" headers="tab2_r1th01">${jnl02sp.RNUM}</th>
											
											<td>${jnl02sp.SDJ02SP_BZCLS3 }</td>
												
											<c:if test="${jnl02sp.MAI_BNAME == null }">
											<td>${jnl02sp.MAC_NAME }</td>
											</c:if>
											
											<c:if test="${jnl02sp.MAI_BNAME != null }">
											<td>${jnl02sp.MAC_NAME }(${jnl02sp.MAI_BNAME})</td>
											</c:if>
											
											<td>${jnl02sp.SDJ02SP_ANICODE }</td>
											
											<td>${jnl02sp.MAI_GENDER }</td>
											
											<td>
											<input type="text" name="sporg" id="sporg" class="textfield" value="${jnl02sp.SDJ02SP_ORGCMNT }" /></td>
											
											<td>
											<input type="text" name="sppro" id="sppro" class="textfield" value="${jnl02sp.SDJ02SP_PROCCMNT }" /></td>
										</tr>
										</c:forEach>
									</tbody>
								</table>

							</div>
							<!-- //동물생태 점검 -->
					
							<!-- 시설안전점검 -->
							<div class="aniinfo_add_box">
								<div class="table_title_box">
									<span class="table_title"> 
									<img src="/images/btn_minus.gif" alt="">시설안전점검
									</span>
									<div class="sys_btn_box">
										<span class="align_right btn_hide2">
										<c:choose>
										 <c:when test="${fn:length(jnl03sj) eq 0}">
										<a href="javascript:updateSDJ03_SJ();" class="save_btn" style="display: none;">저장</a>
										</c:when>
										<c:when test="${fn:length(jnl03sj) != 0}">
										<a href="javascript:updateSDJ03_SJ2();" class="save_btn" style="display: none;">저장</a>
										</c:when>
										</c:choose>
										</span>
									</div>
								</div>
								
								<form method="POST" name="safety_form" id="safety_form">
								<input type="hidden" id="sdj_docno" name="sdj_docno" value="${docInfo.SDJ_DOCNO}" />
								<input type="hidden" id="mai_vvrmno" name="mai_vvrmno" value="${docInfo.SDJ_VVRMNO}" />
								<input type="hidden" id="sdj_jnldate" name="sdj_jnldate" value="${docInfo.TXT_SDJ_JNLDATE}" />
								<table class="aniinfo_add table_view_tab3_2">
									<caption>시설안전점검</caption>
									<colgroup>
									<col style="width: 15%;">
									<col style="width: 15%;">
									<col style="width: 25%;">
									<col style="width: 25%;">
									<col style="width: 15%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" id="tab3_r2th02">점검사항</th>
											<th scope="col" id="tab3_r2th03">이상유무</th>
											<th scope="col" id="tab3_r2th04">이상내용</th>
											<th scope="col" id="tab3_r2th05">조치결과</th>
											<th scope="col" id="tab3_r2th06">비고</th>
										</tr>
									</thead>

									<tbody>
									<c:forEach var="jnl03sj" items="${jnl03sj}" varStatus="st">
									<tr>			 
									 <td>${jnl03sj.SDJ03SJ_SSNAME }</td>
									 <td>
									 <c:choose>
										<c:when test="${jnl03sj.SDJ03SJ_SSRSLT eq '정상'}">
										<label>
										<input type="radio" id="SDJ03SJ_SSRSLT" name="SDJ03SJ_SSRSLT" value="Y" class="search_radio" checked="checked"/>정상
										<input type="radio" id="SDJ03SJ_SSRSLT" name="SDJ03SJ_SSRSLT" value="N" class="search_radio"/>이상</label>
										</c:when>
										<c:when test="${jnl03sj.SDJ03SJ_SSRSLT eq '이상'}">
										<label>
										<input type="radio" id="SDJ03SJ_SSRSLT" name="SDJ03SJ_SSRSLT" value="Y" class="search_radio"/>정상
										<input type="radio" id="SDJ03SJ_SSRSLT" name="SDJ03SJ_SSRSLT" value="N" class="search_radio" checked="checked"/>이상</label>
										</c:when>
										</c:choose>
									 </td>
									 <td>
									 <input type="text" name="SDJ03SJ_NGCntnt" id="SDJ03SJ_NGCntnt" class="textfield" value="${jnl03sj.SDJ03SJ_NGCNTNT }"/>
									 </td>
									 <td>
									  <input type="text" name="SDJ03SJ_ProcCmnt" id="SDJ03SJ_ProcCmnt" class="textfield" value="${jnl03sj.SDJ03SJ_PROCCMNT }"/>
									 </td>
									 <td><input type="text" name="SDJ03SJ_CMNT" id="SDJ03SJ_CMNT" class="textfield" value="${jnl03sj.SDJ03SJ_CMNT }"/></td>	
									 </tr>
									  </c:forEach> 
									  
									  <c:choose>
									  <c:when test="${fn:length(jnl03sj) eq 0}">
									 <tr>
									 <td><input type="text" value="잠금장치" style="border: none; text-align: center;" disabled="disabled" class="textfield"></td>
									 <td>
										<input type="radio" id="SDJ03SJ_SSRSLT1" name="SDJ03SJ_SSRSLT1" value="정상" class="search_radio"/>정상
										<input type="radio" id="SDJ03SJ_SSRSLT1" name="SDJ03SJ_SSRSLT1" value="이상" class="search_radio"/>이상
									 </td>
									 <td><input type="text" class="textfield" id="SDJ03SJ_NGCNTNT" name="SDJ03SJ_NGCNTNT"></td>
									 <td><input type="text" class="textfield" id="SDJ03SJ_PROCCMNT" name="SDJ03SJ_PROCCMNT"></td>
									 <td><input type="text" class="textfield" id="SDJ03SJ_CMNT" name="SDJ03SJ_CMNT"></td>
									 </tr>
									 <tr>
									  <td><input type="text" value="안전철망" style="border: none; text-align: center;" disabled="disabled" class="textfield"></td>
									 <td>
										<input type="radio" id="SDJ03SJ_SSRSLT2" name="SDJ03SJ_SSRSLT2" value="정상" class="search_radio"/>정상
										<input type="radio" id="SDJ03SJ_SSRSLT2" name="SDJ03SJ_SSRSLT2" value="이상" class="search_radio"/>이상
									 </td>
									 <td><input type="text" class="textfield" id="SDJ03SJ_NGCNTNT" name="SDJ03SJ_NGCNTNT"></td>
									 <td><input type="text" class="textfield" id="SDJ03SJ_PROCCMNT" name="SDJ03SJ_PROCCMNT"></td>
									 <td><input type="text" class="textfield" id="SDJ03SJ_CMNT" name="SDJ03SJ_CMNT"></td>
									 </tr>
									 <tr>
									  <td><input type="text" value="환기시설" style="border: none; text-align: center;" disabled="disabled" class="textfield"></td>
									 <td>
										<input type="radio" id="SDJ03SJ_SSRSLT3" name="SDJ03SJ_SSRSLT3" value="정상" class="search_radio"/>정상
										<input type="radio" id="SDJ03SJ_SSRSLT3" name="SDJ03SJ_SSRSLT3" value="이상" class="search_radio"/>이상
									 </td>
									 <td><input type="text" class="textfield" id="SDJ03SJ_NGCNTNT" name="SDJ03SJ_NGCNTNT"></td>
									 <td><input type="text" class="textfield" id="SDJ03SJ_PROCCMNT" name="SDJ03SJ_PROCCMNT"></td>
									 <td><input type="text" class="textfield" id="SDJ03SJ_CMNT" name="SDJ03SJ_CMNT"></td>
									 </tr>
									 <tr>
									 <td><input type="text" value="보육시설" style="border: none; text-align: center;" disabled="disabled" class="textfield"></td>
									 <td>
										<input type="radio" id="SDJ03SJ_SSRSLT4" name="SDJ03SJ_SSRSLT4" value="정상" class="search_radio"/>정상
										<input type="radio" id="SDJ03SJ_SSRSLT4" name="SDJ03SJ_SSRSLT4" value="이상" class="search_radio"/>이상
									 </td>
									 <td><input type="text" class="textfield" id="SDJ03SJ_NGCNTNT" name="SDJ03SJ_NGCNTNT"></td>
									 <td><input type="text" class="textfield" id="SDJ03SJ_PROCCMNT" name="SDJ03SJ_PROCCMNT"></td>
									 <td><input type="text" class="textfield" id="SDJ03SJ_CMNT" name="SDJ03SJ_CMNT"></td>
									 </tr>
									 <tr>
									 <td><input type="text" value="전기전책" style="border: none; text-align: center;" disabled="disabled" class="textfield"></td>
									 <td>
										<input type="radio" id="SDJ03SJ_SSRSLT5" name="SDJ03SJ_SSRSLT5" value="정상" class="search_radio"/>정상
										<input type="radio" id="SDJ03SJ_SSRSLT5" name="SDJ03SJ_SSRSLT5" value="이상" class="search_radio"/>이상
									 </td>
									 <td><input type="text" class="textfield" id="SDJ03SJ_NGCNTNT" name="SDJ03SJ_NGCNTNT"></td>
									 <td><input type="text" class="textfield" id="SDJ03SJ_PROCCMNT" name="SDJ03SJ_PROCCMNT"></td>
									 <td><input type="text" class="textfield" id="SDJ03SJ_CMNT" name="SDJ03SJ_CMNT"></td>
									 </tr>
									  </c:when>
									  </c:choose>
									</tbody>
								</table>	
								</form>
							</div>
							<!-- //시설안전점검 -->

							<!-- 내외 순찰실적 -->
							<div class="aniinfo_add_box">
								<div class="table_title_box">
									<span class="table_title">
									<img src="/images/btn_minus.gif" alt="">내외 순찰실적
									</span>
									<div class="sys_btn_box">
										<span class="align_right btn_hide2">
										<a href="javascript:updateSDJ_Sj();" class="save_btn" style="display: none;">저장</a>
										</span>
									</div>
								</div>
								
								<form method="POST" name="sj_form" id="sj_form">
									<input type="hidden" id="sdj_docno" name="sdj_docno" value="${docInfo.SDJ_DOCNO}" />
									<input type="hidden" id="mai_vvrmno" name="mai_vvrmno" value="${docInfo.SDJ_VVRMNO}" />
									<input type="hidden" id="sdj_jnldate" name="sdj_jnldate" value="${docInfo.TXT_SDJ_JNLDATE}" />
								<table class="aniinfo_add table_view_tab3_5">
									<caption>내외 순찰실적</caption>
									<colgroup>
										<col style="width: 5%;">
										<col style="width: 20%;">
										<col style="width: 13%;">
										<col style="width: 15%;">
										<col style="width: 40%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" id="tab3_r5th01">No</th>
											<th scope="col" id="tab3_r5th02">시간</th>
											<th scope="col" id="tab3_r5th03">이상유무</th>
											<th scope="col" id="tab3_r5th04">순찰자</th>
											<th scope="col" id="tab3_r5th05">특이사항</th>
										</tr>
									</thead>
									<tbody>
									<tr>
										<th scope="row" id="tab3_r5n01" headers="tab3_r5th01">내부</th>
										<td><input type="text" id="SDJS_IN_TM" name="SDJS_IN_TM" class="textfield" value="${sdjsj.SDJS_IN_TM }"></td>
										<td>
										<c:choose>
										<c:when test="${sdjsj.SDJS_IN_WL_YN eq 'Y'}">
										<label>
										<input type="radio" id="SDJS_IN_WL_YN" name="SDJS_IN_WL_YN" value="Y" class="search_radio" checked="checked"/>정상
										<input type="radio" id="SDJS_IN_WL_YN" name="SDJS_IN_WL_YN" value="N" class="search_radio"/>이상</label>
										</c:when>
										<c:when test="${sdjsj.SDJS_IN_WL_YN eq 'N'}">
										<label>
										<input type="radio" id="SDJS_IN_WL_YN" name="SDJS_IN_WL_YN" value="Y" class="search_radio"/>정상
										<input type="radio" id="SDJS_IN_WL_YN" name="SDJS_IN_WL_YN" value="N" class="search_radio" checked="checked"/>이상</label>
										</c:when>
										<c:when test="${fn:length(sdjsj.SDJS_IN_WL_YN) eq 0}">
										<label>
										<input type="radio" id="SDJS_IN_WL_YN" name="SDJS_IN_WL_YN" value="Y" class="search_radio"/>정상
										<input type="radio" id="SDJS_IN_WL_YN" name="SDJS_IN_WL_YN" value="N" class="search_radio"/>이상</label>
										</c:when>
										</c:choose>
										</td>
										<td>
										<input type="text" id="SDJS_IN_S" name="SDJS_IN_S" class="textfield" value="${sdjsj.SDJS_IN_S }" style="width: 100px;"/></td>
										<td>
										<input type="text" id="SDJS_IN_CMNT" name="SDJS_IN_CMNT" class="textfield" value="${sdjsj.SDJS_IN_CMNT }" /></td>
										</tr> 
										
										<tr>	
										<th scope="row" id="tab3_r5n01" headers="tab3_r5th01">외부</th>
										<td><input type="text" id="SDJS_OUT_TM" name="SDJS_OUT_TM" class="textfield" value="${sdjsj.SDJS_OUT_TM }"></td>
										<td>
										<c:choose>
										<c:when test="${sdjsj.SDJS_OUT_WL_YN eq 'Y'}">
										<label>
										<input type="radio" id="SDJS_OUT_WL_YN" name="SDJS_OUT_WL_YN" value="Y" class="search_radio" checked="checked"/>정상
										<input type="radio" id="SDJS_OUT_WL_YN" name="SDJS_OUT_WL_YN" value="N" class="search_radio"/>이상</label>
										</c:when>
										<c:when test="${sdjsj.SDJS_OUT_WL_YN eq 'N'}">
										<label>
										<input type="radio" id="SDJS_OUT_WL_YN" name="SDJS_OUT_WL_YN" value="Y" class="search_radio"/>정상
										<input type="radio" id="SDJS_OUT_WL_YN" name="SDJS_OUT_WL_YN" value="N" class="search_radio" checked="checked"/>이상</label>
										</c:when>
										<c:when test="${fn:length(sdjsj.SDJS_OUT_WL_YN) eq 0}">
										<label>
										<input type="radio" id="SDJS_OUT_WL_YN" name="SDJS_OUT_WL_YN" value="Y" class="search_radio"/>정상
										<input type="radio" id="SDJS_OUT_WL_YN" name="SDJS_OUT_WL_YN" value="N" class="search_radio"/>이상</label>
										</c:when>
										</c:choose>
										</td>
										<td>
										<input type="text" id="SDJS_OUT_S" name="SDJS_OUT_S" class="textfield" value="${sdjsj.SDJS_OUT_S }" style="width: 100px;"/></td>
										<td>
										<input type="text" id="SDJS_OUT_CMNT" name="SDJS_OUT_CMNT" class="textfield" value="${sdjsj.SDJS_OUT_CMNT }" /></td>
										</tr>
									</tbody>
								</table>
								</form>
							</div>
							<!-- //내외 순찰실적 -->
							
							<!-- 시설점검 특이사항 -->
							<div class="aniinfo_add_box">
								<div class="table_title_box">
									<span class="table_title">
									<img src="/images/btn_minus.gif" alt="">시설점검 특이사항
									</span>
									<div class="sys_btn_box">
										<span class="align_right btn_hide2">
										<a href="javascript:updateSDJS_Ss_Cmnt();" class="save_btn" style="display: none;">저장</a>
										</span>
									</div>
								</div>

								<div class="plan_box table_view_tab3_3">
								<form method="POST" name="sdjs_ss_cmnt" id="sdjs_ss_cmnt">
									<input type="hidden" id="sdj_docno" name="sdj_docno" value="${docInfo.SDJ_DOCNO}" />
									<input type="hidden" id="mai_vvrmno" name="mai_vvrmno" value="${docInfo.SDJ_VVRMNO}" />
									<input type="hidden" id="sdj_jnldate" name="sdj_jnldate" value="${docInfo.TXT_SDJ_JNLDATE}" />
									<p class="plan_text">
										<textarea rows="3" id="SDJS_SS_CMNT" name="SDJS_SS_CMNT" style="width: 100%; border: 0; resize: none; padding: 0;">${sdjsj.SDJS_SS_CMNT }</textarea>
									</p>
									</form>
								</div>

							</div>
							<!-- //시설점검 특이사항 -->
							
							<!-- 시설점검 개선사항 -->
							<div class="aniinfo_add_box">
								<div class="table_title_box">
									<span class="table_title">
									<img src="/images/btn_minus.gif" alt="">시설점검 개선사항
									</span>
									<div class="sys_btn_box">
										<span class="align_right btn_hide2">
										<a href="javascript:updateSDJS_Sc_Cmnt();" class="save_btn" style="display: none;">저장</a>
										</span>
									</div>
								</div>

								<div class="plan_box table_view_tab3_4">
									<form method="POST" name="sdjs_sc_cmnt" id="sdjs_sc_cmnt">
									<input type="hidden" id="sdj_docno" name="sdj_docno" value="${docInfo.SDJ_DOCNO}" />
									<input type="hidden" id="mai_vvrmno" name="mai_vvrmno" value="${docInfo.SDJ_VVRMNO}" />
									<input type="hidden" id="sdj_jnldate" name="sdj_jnldate" value="${docInfo.TXT_SDJ_JNLDATE}" />
									<p class="plan_text">
										<textarea rows="3" id="SDJS_SC_CMNT" name="SDJS_SC_CMNT" style="width: 100%; border: 0; resize: none; padding: 0;">${sdjsj.SDJS_SC_CMNT }</textarea>
									</p>
									</form>
								</div>
							</div>
							<!-- //시설점검 개선사항 -->
						
							<!-- 시설관리 이미지 -->
							
						<form id="tab2_uploadForm" enctype="multipart/form-data" method="POST" action="/common/file/upload.do">
						<div style="display:none">
							<input type="file" id="file1" name="ani_file" onchange="javascript:fc_chgImgFile(this, $('#tab2_img1'));">
							<input type="file" id="file2" name="ani_file" required="required" onchange="javascript:fc_chgImgFile(this, $('#tab2_img2'));"/>
							<input type="file" id="file3" name="ani_file" required="required" onchange="javascript:fc_chgImgFile(this, $('#tab2_img3'));"/>
							<input type="file" id="file4" name="ani_file" required="required" onchange="javascript:fc_chgImgFile(this, $('#tab2_img4'));"/>
							<input type="file" id="file5" name="ani_file" required="required" onchange="javascript:fc_chgImgFile(this, $('#tab2_img5'));"/>
						</div>
						<input type="hidden" id="minus_ids" name="minus_ids"/>
						<input type="hidden" id="file_ids" name="file_ids"/>
						<input type="hidden" id="bzseqno_list" name="bzseqno_list"/>
						<div id="fileMap" data-val=''></div>
							
						<!-- 경로-->
						<c:set var="ss_img1" value="/images/footer_logo.png" />
						<c:set var="ss_img2" value="/images/footer_logo.png" />
						<c:set var="ss_img3" value="/images/footer_logo.png" />
						<c:set var="ss_img4" value="/images/footer_logo.png" />
						<c:set var="ss_img5" value="/images/footer_logo.png" />
						
						<!-- 타이틀-->
						<c:set var="ss_img1_ttl" value="" />
						<c:set var="ss_img2_ttl" value="" />
						<c:set var="ss_img3_ttl" value="" />
						<c:set var="ss_img4_ttl" value="" />
						<c:set var="ss_img5_ttl" value="" />

						<c:forEach var="ssFileList" varStatus="status" items="${ssFileList}">
						<c:choose>
							<c:when test="${ssFileList.BII_BZSEQNO == '1'}">
								<c:if test="${!empty ssFileList.BII_IMGFILENM}"><c:set var="ss_img1" value="/${ssPath}/${ssFileList.BII_IMGFILENM}" /></c:if>
								<c:set var="ss_img1_ttl" value="${ssFileList.BII_IMGFILETTL}" />
							</c:when>
							<c:when test="${ssFileList.BII_BZSEQNO == 2}">
								<c:if test="${!empty ssFileList.BII_IMGFILENM}"><c:set var="ss_img2" value="/${ssPath}/${ssFileList.BII_IMGFILENM}" /></c:if>
								<c:set var="ss_img2_ttl" value="${ssFileList.BII_IMGFILETTL}" />
							</c:when>
							<c:when test="${ssFileList.BII_BZSEQNO == 3}">
								<c:if test="${!empty ssFileList.BII_IMGFILENM}"><c:set var="ss_img3" value="/${ssPath}/${ssFileList.BII_IMGFILENM}" /></c:if>
								<c:set var="ss_img3_ttl" value="${ssFileList.BII_IMGFILETTL}" />
							</c:when>
							<c:when test="${ssFileList.BII_BZSEQNO == 4}">
								<c:if test="${!empty ssFileList.BII_IMGFILENM}"><c:set var="ss_img4" value="/${ssPath}/${ssFileList.BII_IMGFILENM}" /></c:if>
								<c:set var="ss_img4_ttl" value="${ssFileList.BII_IMGFILETTL}" />
							</c:when>
							<c:when test="${ssFileList.BII_BZSEQNO == 5}">
								<c:if test="${!empty ssFileList.BII_IMGFILENM}"><c:set var="ss_img5" value="/${ssPath}/${ssFileList.BII_IMGFILENM}" /></c:if>
								<c:set var="ss_img5_ttl" value="${ssFileList.BII_IMGFILETTL}" />
							</c:when>
						</c:choose>
						</c:forEach>

						<div class="aniinfo_add_box">
	
							<div class="table_title_box">
								<span class="table_title">
								<img src="/images/btn_minus.gif" alt="">시설점검 이미지</span>
								<div class="sys_btn_box">

									<span class="align_right">
									<a href="javascript:fn_tab2_save_Img();" class="save_btn" style="display: none;">저장</a></span>
								</div>
							</div>
							<table class="aniinfo_search">
								<thead>
									<tr>
										<th scope="col"><img id="tab2_img1" src="${ss_img1}" alt="" style="width: 180px; height: 120px;"></th>
										<th scope="col"><img id="tab2_img2" src="${ss_img2}" alt="" style="width: 180px; height: 120px;"></th>
										<th scope="col"><img id="tab2_img3" src="${ss_img3}" alt="" style="width: 180px; height: 120px;"></th>
										<th scope="col"><img id="tab2_img4" src="${ss_img4}" alt="" style="width: 180px; height: 120px;"></th>
										<th scope="col"><img id="tab2_img5" src="${ss_img5}" alt="" style="width: 180px; height: 120px;"></th>
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
										<td><input type=text id="imgfilettl_1" name="imgfilettl_1" value='${ss_img1_ttl}'></td>
										<td><input type=text id="imgfilettl_2" name="imgfilettl_2" value='${ss_img2_ttl}'></td>
										<td><input type=text id="imgfilettl_3" name="imgfilettl_3" value='${ss_img3_ttl}'></td>
										<td><input type=text id="imgfilettl_4" name="imgfilettl_4" value='${ss_img4_ttl}'></td>
										<td><input type=text id="imgfilettl_5" name="imgfilettl_5" value='${ss_img5_ttl}'></td>
									</tr>
									<tr class="td_btn_box">
										<th scope="col">
										<hover onclick="fc_base_unload_img($('#tab2_uploadForm #file1'), $('#tab2_img1'));"><a href="javascript:;"><img src="${pageContext.request.contextPath }/images/ico_minus.png" style="vertical-align:middle"></a></hover>
										<hover onclick="javascript:$('#tab2_uploadForm #file1').click();"><a href="javascript:;"><img src="${pageContext.request.contextPath }/images/ico_plus.png" style="vertical-align:middle"></a></hover></th>
										
										<th scope="col">
										<hover onclick="fc_base_unload_img($('#tab2_uploadForm #file2'), $('#tab2_img2'));"><a href="javascript:;"><img src="${pageContext.request.contextPath }/images/ico_minus.png" style="vertical-align:middle"></a></hover>
										<hover onclick="javascript:$('#tab2_uploadForm #file2').click();"><a href="javascript:;"><img src="${pageContext.request.contextPath }/images/ico_plus.png" style="vertical-align:middle"></a></hover></th>
										
										<th scope="col">
										<hover onclick="fc_base_unload_img($('#tab2_uploadForm #file3'), $('#tab2_img3'));"><a href="javascript:;"><img src="${pageContext.request.contextPath }/images/ico_minus.png" style="vertical-align:middle"></a></hover>
										<hover onclick="javascript:$('#tab2_uploadForm #file3').click();"><a href="javascript:;"><img src="${pageContext.request.contextPath }/images/ico_plus.png" style="vertical-align:middle"></a></hover></th>
										
										<th scope="col">
										<hover onclick="fc_base_unload_img($('#tab2_uploadForm #file4'), $('#tab2_img4'));"><a href="javascript:;"><img src="${pageContext.request.contextPath }/images/ico_minus.png" style="vertical-align:middle"></a></hover>
										<hover onclick="javascript:$('#tab2_uploadForm #file4').click();"><a href="javascript:;"><img src="${pageContext.request.contextPath }/images/ico_plus.png" style="vertical-align:middle"></a></hover></th>
										
										<th scope="col">
										<hover onclick="fc_base_unload_img($('#tab2_uploadForm #file5'), $('#tab2_img5'));"><a href="javascript:;"><img src="${pageContext.request.contextPath }/images/ico_minus.png" style="vertical-align:middle"></a></hover>
										<hover onclick="javascript:$('#tab2_uploadForm #file5').click();"><a href="javascript:;"><img src="${pageContext.request.contextPath }/images/ico_plus.png" style="vertical-align:middle"></a></hover></th>
									</tr>
									<tr class="td_btn_box">
										<td><a href="${ss_img1}" class="down_btn" target="_blank">다운로드</a></td>
										<td><a href="${ss_img2}" class="down_btn" target="_blank">다운로드</a></td>
										<td><a href="${ss_img3}" class="down_btn" target="_blank">다운로드</a></td>
										<td><a href="${ss_img4}" class="down_btn" target="_blank">다운로드</a></td>
										<td><a href="${ss_img5}" class="down_btn" target="_blank">다운로드</a></td>
									</tr>
							   </tbody>
							</table>
	
						</div>
						<!-- //시설관리 이미지 -->
						</form>
						</div>
<!-- layer_popup -->
	<div class="layer_popup">	
		<div class="dimm2"></div>
		<!-- #layer04 -->
		<div class="layer_box" id="st" style="top: 80px; height: 650px;">
			<div class="layer_tit">동물생태점검</div>
				<div class="layer_con">
					<div class="search_box">
					<table class="search_table" style="width:760px;" >
							<caption>동물생태점검</caption>
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
							<caption>동물조회</caption>
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