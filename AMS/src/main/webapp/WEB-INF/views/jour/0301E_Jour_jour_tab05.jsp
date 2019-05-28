<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<head>
<script type="text/javascript">
function updateSDJ05_Msg() {
    var form = document.sdj05Msg;
    
    var SDJ05_CMNTETC = document.getElementById("SDJ05_CMNTETC").value;
    var SDJ05_RSLTETC = document.getElementById("SDJ05_RSLTETC").value;
    var SDJ05_ETCETC = document.getElementById("SDJ05_ETCETC").value;
    
    if (confirm("저장 하시겠습니까 ?")) {
        form.action = "/jour/0301/updateSDJ05_Msg.do";
        form.submit();
    }
}

</script>

</head>

<div class="tab_cont" id="tab05">
							<!-- 지시사항 -->
							<div class="aniinfo_add_box margin_change">
							<form method="POST" name="sdj05Msg" id="sdj05Msg">
							<input type="hidden" id="sdj_docno" name="sdj_docno" value="${docInfo.SDJ_DOCNO}" />
							<input type="hidden" id="mai_vvrmno" name="mai_vvrmno" value="${docInfo.SDJ_VVRMNO}" />
							<input type="hidden" id="sdj_jnldate" name="sdj_jnldate" value="${docInfo.TXT_SDJ_JNLDATE}" />
							
								<div class="table_title_box">
									<span class="table_title">
									<img src="/images/btn_minus.gif" alt="">지시사항
									</span>
									<div class="sys_btn_box">
										<span class="align_right"> 
										<a href="javascript:;" class="save_btn" onclick="updateSDJ05_Msg();" style="display: none;">저장</a>
										</span>
									</div>
								</div>
								
								<table class="aniinfo_search table_view_tab5_1">
									<colgroup>
										<col style="width: 15%;">
										<col style="width: 55%;">
										<col style="width: 15%;">
										<col style="width: 15%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">지시내용</th>
											<th scope="col">처리결과</th>
											<th scope="col">비고</th>
										</tr>

									</thead>
									<tbody>
										<tr>
											<th scope="row">지시사항</th>
											<td><input type="text" id="SDJ05_CMNTETC" name="SDJ05_CMNTETC" class="textfield" value="${sdj05Msg.SDJ05_CMNTETC }"/></td>
											<td><input type="text" id="SDJ05_RSLTETC" name="SDJ05_RSLTETC" class="textfield" value="${sdj05Msg.SDJ05_RSLTETC }"/></td>
											<td><input type="text" id="SDJ05_ETCETC" name="SDJ05_ETCETC" class="textfield" value="${sdj05Msg.SDJ05_ETCETC }"/></td>
										</tr>
									</tbody>
								</table>
								</form>
							</div>
						<!-- //지시사항 -->
					</div>