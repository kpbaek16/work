<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<script type="text/javascript">
function fn_layer_full(){
	$("#full").show();
	$(".layer_popup").show();
	var width_size = $("#full").innerWidth()/2;
	$("#full").css("margin-left",-width_size);
}

function fn_layer_positive(){
	$("#positive").show();
	$(".layer_popup").show();
	var width_size = $("#positive").innerWidth()/2;
	$("#positive").css("margin-left",-width_size);
}

function fn_layer_all(){
	$("#all").show();
	$(".layer_popup").show();
	var width_size = $("#all").innerWidth()/2;
	$("#all").css("margin-left",-width_size);
}
</script>

</head>

<!doctype html>

<div class="tab_cont" id="tab04">
							<!-- 프로그램 운영실적 -->
							<div class="aniinfo_add_box margin_change">
								<div class="table_title_box">
									<span class="table_title">
									<img src="/images/btn_minus.gif" alt="">프로그램 운영실적
									</span>
									<div class="sys_btn_box">
										<span class="align_right btn_hide2">
										<a href="#" class="save_btn" style="display: none;">추가</a>
										<a href="#" class="excel_btn" style="display: none;">저장</a>
										<a href="javascript:;" class="del2_btn" style="display: none;">삭제</a>
										</span>
									</div>
								</div>
								<table class="aniinfo_add table_view_tab4_1">
									<caption>프로그램 운영실적</caption>
									<colgroup>
										<col style="width: 15%;">
										<col style="width: 11%;">
										<col style="width: 7%;">
										<col style="width: 7%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" id="tab4_t1th01" rowspan="2" style="vertical-align: middle;">프로그램명</th>
											<th scope="col" id="tab4_t1th02" rowspan="2" style="vertical-align: middle;">구분</th>
											<th scope="col" id="tab4_t1th03" rowspan="2" style="vertical-align: middle;">금일</th>
											<th scope="col" id="tab4_t1th04" rowspan="2" style="vertical-align: middle;">누계</th>
											<th scope="colgroup" id="tab4_t1th05" colspan="12">월 별 현 황</th>
										</tr>
										<tr>
											<th scope="col" id="tab4_t1th05_1">1월</th>
											<th scope="col" id="tab4_t1th05_2">2월</th>
											<th scope="col" id="tab4_t1th05_3">3월</th>
											<th scope="col" id="tab4_t1th05_4">4월</th>
											<th scope="col" id="tab4_t1th05_5">5월</th>
											<th scope="col" id="tab4_t1th05_6">6월</th>
											<th scope="col" id="tab4_t1th05_7">7월</th>
											<th scope="col" id="tab4_t1th05_8">8월</th>
											<th scope="col" id="tab4_t1th05_9">9월</th>
											<th scope="col" id="tab4_t1th05_10">10월</th>
											<th scope="col" id="tab4_t1th05_11">11월</th>
											<th scope="col" id="tab4_t1th05_12">12월</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row" id="tab4_t1n01" headers="tab4_t1th01" rowspan="2" style="vertical-align: middle;">생태설명회</th>
											<th scope="row" headers="tab4_t1n01 tab4_t1th02">회수</th>
											<td headers="tab4_t1n01 tab4_t1th03">1</td>
											<td headers="tab4_t1n01 tab4_t1th04">36</td>
											<td headers="tab4_t1n01 tab4_t1th05 tab4_t1th05_1">1</td>
											<td headers="tab4_t1n01 tab4_t1th05 tab4_t1th05_2">2</td>
											<td headers="tab4_t1n01 tab4_t1th05 tab4_t1th05_3">3</td>
											<td headers="tab4_t1n01 tab4_t1th05 tab4_t1th05_4">4</td>
											<td headers="tab4_t1n01 tab4_t1th05 tab4_t1th05_5">5</td>
											<td headers="tab4_t1n01 tab4_t1th05 tab4_t1th05_6">6</td>
											<td headers="tab4_t1n01 tab4_t1th05 tab4_t1th05_7">7</td>
											<td headers="tab4_t1n01 tab4_t1th05 tab4_t1th05_8">8</td>
											<td headers="tab4_t1n01 tab4_t1th05 tab4_t1th05_9"></td>
											<td headers="tab4_t1n01 tab4_t1th05 tab4_t1th05_10"></td>
											<td headers="tab4_t1n01 tab4_t1th05 tab4_t1th05_11"></td>
											<td headers="tab4_t1n01 tab4_t1th05 tab4_t1th05_12"></td>
										</tr>
										<tr>
											<th scope="row" headers="tab4_t1n01 tab4_t1th02">인원</th>
											<td headers="tab4_t1n01 tab4_t1th03">100</td>
											<td headers="tab4_t1n01 tab4_t1th04">179</td>
											<td headers="tab4_t1n01 tab4_t1th05 tab4_t1th05_1">10</td>
											<td headers="tab4_t1n01 tab4_t1th05 tab4_t1th05_2">20</td>
											<td headers="tab4_t1n01 tab4_t1th05 tab4_t1th05_3">30</td>
											<td headers="tab4_t1n01 tab4_t1th05 tab4_t1th05_4">40</td>
											<td headers="tab4_t1n01 tab4_t1th05 tab4_t1th05_5">50</td>
											<td headers="tab4_t1n01 tab4_t1th05 tab4_t1th05_6">60</td>
											<td headers="tab4_t1n01 tab4_t1th05 tab4_t1th05_7">70</td>
											<td headers="tab4_t1n01 tab4_t1th05 tab4_t1th05_8">80</td>
											<td headers="tab4_t1n01 tab4_t1th05 tab4_t1th05_9"></td>
											<td headers="tab4_t1n01 tab4_t1th05 tab4_t1th05_10"></td>
											<td headers="tab4_t1n01 tab4_t1th05 tab4_t1th05_11"></td>
											<td headers="tab4_t1n01 tab4_t1th05 tab4_t1th05_12"></td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- //프로그램 운영실적 -->

							<!-- 유해동물포획실적 -->
							<div class="aniinfo_add_box margin_change">
								<div class="table_title_box">
									<span class="table_title">
									<img src="/images/btn_minus.gif" alt="">유해동물포획실적
									</span>
									<div class="sys_btn_box">
										<span class="align_right btn_hide2">
										<a href="#" class="save_btn" style="display: none;">추가</a>
										<a href="#" class="excel_btn" style="display: none;">저장</a>
										<a href="javascript:;" class="del2_btn" style="display: none;">삭제</a>
										</span>
									</div>
								</div>
								</div>
								<table class="aniinfo_add table_view_tab4_1">
									<caption>유해동물포획실적</caption>
									<colgroup>
										<col style="width: 5%;">
										<col style="width: 10%;">
										<col style="width: 7%;">
										<col style="width: 7%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" id="tab2_r1th01" rowspan="2" style="vertical-align: middle;">
											<input type="checkbox"></th>
											<th scope="col" id="tab4_t1th02" rowspan="2" style="vertical-align: middle;">구분</th>
											<th scope="col" id="tab4_t1th03" rowspan="2" style="vertical-align: middle;">금일</th>
											<th scope="colgroup" id="tab4_t1th05" colspan="12">월 별 현 황</th>
											<th scope="col" id="tab4_t1th04" rowspan="2" style="vertical-align: middle;">누계</th>
										</tr>
										<tr>
											<th scope="col" id="tab4_t1th05_1">1월</th>
											<th scope="col" id="tab4_t1th05_2">2월</th>
											<th scope="col" id="tab4_t1th05_3">3월</th>
											<th scope="col" id="tab4_t1th05_4">4월</th>
											<th scope="col" id="tab4_t1th05_5">5월</th>
											<th scope="col" id="tab4_t1th05_6">6월</th>
											<th scope="col" id="tab4_t1th05_7">7월</th>
											<th scope="col" id="tab4_t1th05_8">8월</th>
											<th scope="col" id="tab4_t1th05_9">9월</th>
											<th scope="col" id="tab4_t1th05_10">10월</th>
											<th scope="col" id="tab4_t1th05_11">11월</th>
											<th scope="col" id="tab4_t1th05_12">12월</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							<!-- //유해동물포획실적 -->
							
							<!-- 행동풍부화 추진실적 -->
							<div class="aniinfo_add_box">
								<div class="table_title_box">
									<span class="table_title">
									<img src="/images/btn_minus.gif" alt="">행동풍부화 추진실적
									</span>
									<div class="sys_btn_box">
										<span class="align_right btn_hide2">
										<a href="javascript:fn_layer_full();" class="save_btn" style="display: none;">추가</a>
										<a href="#" class="excel_btn" style="display: none;">저장</a>
										<a href="javascript:;" class="del2_btn" style="display: none;">삭제</a>
										</span>
									</div>
								</div>
								<table class="aniinfo_add table_view_tab4_1" >
								<caption>프로그램 운영실적</caption>
								<colgroup>
									<col style="width:5%;">
									<col style="width:10%;">
									<col style="width:7%;">
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
									<col style="width:5%;">
									<col style="width:5%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" id="tab2_r1th01" rowspan="2" style="vertical-align: middle;">
										<input type="checkbox"></th>
										<th scope="col" id="tab4_t1th01" rowspan="2" style="vertical-align:middle;">대상동물</th>
										<th scope="col" id="tab4_t1th04" rowspan="2" style="vertical-align:middle;">누계</th>
										<th scope="colgroup" id="tab4_t1th05" colspan="12">월 별 현 황</th>
									</tr>
									<tr>
										<th scope="col" id="tab4_t1th05_1">1월</th>
										<th scope="col" id="tab4_t1th05_2">2월</th>
										<th scope="col" id="tab4_t1th05_3">3월</th>
										<th scope="col" id="tab4_t1th05_4">4월</th>
										<th scope="col" id="tab4_t1th05_5">5월</th>
										<th scope="col" id="tab4_t1th05_6">6월</th>
										<th scope="col" id="tab4_t1th05_7">7월</th>
										<th scope="col" id="tab4_t1th05_8">8월</th>
										<th scope="col" id="tab4_t1th05_9">9월</th>
										<th scope="col" id="tab4_t1th05_10">10월</th>
										<th scope="col" id="tab4_t1th05_11">11월</th>
										<th scope="col" id="tab4_t1th05_12">12월</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
							</div>
							<!-- //행동풍부화 추진실적 -->
							
							<!-- 긍정적 강화훈련 추진실적 -->
							<div class="aniinfo_add_box">
								<div class="table_title_box">
									<span class="table_title">
									<img src="/images/btn_minus.gif" alt="">긍정적 강화훈련 추진실적
									</span>
									<div class="sys_btn_box">
										<span class="align_right btn_hide2">
										<a href="javascript:fn_layer_positive();" class="save_btn" style="display: none;">추가</a>
										<a href="#" class="excel_btn" style="display: none;">저장</a>
										<a href="javascript:;" class="del2_btn" style="display: none;">삭제</a>
										</span>
									</div>
								</div>
								<table class="aniinfo_add table_view_tab4_3" >
								<caption>긍정적 강화훈련 추진실적</caption>
								<colgroup>
									<col style="width:5%;">
									<col style="width:10%;">
									<col style="width:7%;">
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
									<col style="width:5%;">
									<col style="width:5%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" id="tab2_r1th01" rowspan="2" style="vertical-align: middle;">
										<input type="checkbox"></th>
										<th scope="col" id="tab4_t1th01" rowspan="2" style="vertical-align:middle;">대상동물</th>
										<th scope="col" id="tab4_t1th04" rowspan="2" style="vertical-align:middle;">누계</th>
										<th scope="colgroup" id="tab4_t1th05" colspan="12">월 별 현 황</th>
									</tr>
									<tr>
										<th scope="col" id="tab4_t1th05_1">1월</th>
										<th scope="col" id="tab4_t1th05_2">2월</th>
										<th scope="col" id="tab4_t1th05_3">3월</th>
										<th scope="col" id="tab4_t1th05_4">4월</th>
										<th scope="col" id="tab4_t1th05_5">5월</th>
										<th scope="col" id="tab4_t1th05_6">6월</th>
										<th scope="col" id="tab4_t1th05_7">7월</th>
										<th scope="col" id="tab4_t1th05_8">8월</th>
										<th scope="col" id="tab4_t1th05_9">9월</th>
										<th scope="col" id="tab4_t1th05_10">10월</th>
										<th scope="col" id="tab4_t1th05_11">11월</th>
										<th scope="col" id="tab4_t1th05_12">12월</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
							</div>
							<!-- //긍정적 강화훈련 추진실적 -->
							
							<!-- 풍부화 및 긍정적 강화훈련 추진내용  -->
							<div class="aniinfo_add_box">
								<div class="table_title_box">
									<span class="table_title">
									<img src="/images/btn_minus.gif" alt="">풍부화 및 긍정적 강화훈련 추진내용
									</span>
									<div class="sys_btn_box">
										<span class="align_right btn_hide2">
										<a href="javascript:fn_layer_all();" class="save_btn" style="display: none;">추가</a>
										<a href="#" class="excel_btn" style="display: none;">저장</a>
										<a href="javascript:;" class="del2_btn" style="display: none;">삭제</a>
										</span>
									</div>
								</div>

								<table class="aniinfo_add table_view_tab4_4">
									<caption>긍정적 강화훈련 추진실적</caption>
									<colgroup>
										<col style="width: 5%;">
										<col style="width: 10%;">
										<col style="width: 10%;">
										<col style="width: 15%;">
										<col style="width: 15%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: 10%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" id="tab2_r1th01" rowspan="2" style="vertical-align: middle;">
											<input type="checkbox"></th>
											<th scope="col" id="tab4_t3th01" rowspan="2" style="vertical-align: middle;">대상동물</th>
											<th scope="col" id="tab4_t3th02" rowspan="2" style="vertical-align: middle;">추진내용</th>
											<th scope="col" id="tab4_t3th03" rowspan="2" style="vertical-align: middle;">적용방법</th>
											<th scope="col" id="tab4_t3th04" rowspan="2" style="vertical-align: middle;">행동발달사항</th>
											<th scope="colgroup" id="tab4_t3th05" colspan="3">실 적</th>
										</tr>
										<tr>
											<th scope="col" id="tab4_t3th05_2">당일</th>
											<th scope="col" id="tab4_t3th05_3">당월</th>
											<th scope="col" id="tab4_t3th05_4">누계</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
							<!-- //풍부화 및 긍정적 강화훈련 추진내용 -->
							
							<!-- 안전미팅 및 인력현황  -->
							<div class="aniinfo_add_box">
								<div class="table_title_box">
									<span class="table_title"> 
									<img src="/images/btn_minus.gif" alt="">안전미팅 및 인력현황
									</span>
									<div class="sys_btn_box">
										<span class="align_right"> 
										<a href="javascript:;" class="info_add_btn" style="display: none;">저장</a>
										</span>
									</div>
								</div>
								
								<table class="aniinfo_add table_view_tab4_4">
									<caption>안전미팅 및 인력현황</caption>
									<colgroup>
										<col style="width: 5%;">
										<col style="width: 10%;">
										<col style="width: 15%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" id="tab4_t3th01" rowspan="2" style="vertical-align: middle;">실시자</th>
											<th scope="col" id="tab4_t3th02" rowspan="2" style="vertical-align: middle;">참석자</th>
											<th scope="col" id="tab4_t3th03" rowspan="2" style="vertical-align: middle;">실시내용</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td headers="tab4_r4n01 tab4_r4th02">
											<input type="text" id="tab4_table4_text1" class="textfield" value=""/></td>
											<td headers="tab4_r4n01 tab4_r4th03">
											<input type="text" id="tab4_table4_text2" class="textfield" value=""/></td>
											<td headers="tab4_r4n01 tab4_r4th04">
											<input type="text" id="tab4_table4_text3" class="textfield" value=""/></td>
										</tr>
									</tbody>
								</table>

							</div>
							<!-- //안전미팅 및 인력현황 -->
							
							<!-- 인력지원 현황  -->
							<div class="aniinfo_add_box">
								<div class="table_title_box">
									<span class="table_title">
									<img src="/images/btn_minus.gif" alt="">인력지원 현황
									</span>
									<div class="sys_btn_box">
										<span class="align_right"> 
										<a href="javascript:;" class="info_add_btn" style="display: none;">저장</a>
										</span>
									</div>
								</div>
								
								<table class="aniinfo_add table_view_tab4_4">
									<caption>인력지원 현황</caption>
									<colgroup>
										<col style="width: 5%;">
										<col style="width: 10%;">
										<col style="width: 15%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" id="tab4_t3th01" rowspan="2" style="vertical-align: middle;">이름</th>
											<th scope="col" id="tab4_t3th02" rowspan="2" style="vertical-align: middle;">인원</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td headers="tab4_r4n01 tab4_r4th02">
											<input type="text" id="tab4_table4_text1" class="textfield" value=""/></td>
										
											<td headers="tab4_r4n01 tab4_r4th03">
											<input type="text" id="tab4_table4_text2" class="textfield" value=""/></td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- //인력지원 현황 -->

							<!-- 휴무자 인수인계 사항  -->
							<div class="aniinfo_add_box">
								<div class="table_title_box">
									<span class="table_title">
									<img src="/images/btn_minus.gif" alt="">휴무자 인수인계 사항
									</span>
									<div class="sys_btn_box">
										<span class="align_right"> 
										<a href="javascript:;" class="info_add_btn" style="display: none;">저장</a>
										</span>
									</div>
								</div>
								
								<table class="aniinfo_add table_view_tab4_4">
									<caption>휴무자 인수인계 사항</caption>
									<colgroup>
										<col style="width: 5%;">
										<col style="width: 10%;">
										<col style="width: 15%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" id="tab4_t3th01" rowspan="2" style="vertical-align: middle;">휴무일</th>
											<th scope="col" id="tab4_t3th02" rowspan="2" style="vertical-align: middle;">휴무자</th>
											<th scope="col" id="tab4_t3th03" rowspan="2" style="vertical-align: middle;">인수 인계 사항</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td headers="tab4_r4n01 tab4_r4th02">
											<input type="text" id="tab4_table4_text1" class="textfield" value=""/></td>
											
											<td headers="tab4_r4n01 tab4_r4th03">
											<input type="text" id="tab4_table4_text2" class="textfield" value=""/></td>
											
											<td headers="tab4_r4n01 tab4_r4th04">
											<input type="text" id="tab4_table4_text3" class="textfield" value="" /></td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- //휴무자 인수인계 사항 -->
						</div>
						
<!-- layer_popup -->
	<div class="layer_popup">	
		<div class="dimm4"></div>
		<!-- #layer04 -->
		<div class="layer_box" id="full" style="top: 80px; height: 650px;">
			<div class="layer_tit">행동풍부화 추진실적</div>
				<div class="layer_con">
					<div class="search_box">
					<table class="search_table" style="width:760px;" >
							<caption>행동풍부화 추진실적</caption>
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
							<caption>행동풍부화 추진실적</caption>
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
		
		<!-- #layer04 -->
		<div class="layer_box" id="positive" style="top: 80px; height: 650px;">
			<div class="layer_tit">긍정적 강화훈련 추진실적</div>
				<div class="layer_con">
					<div class="search_box">
					<table class="search_table" style="width:760px;" >
							<caption>긍정적 강화훈련 추진실적</caption>
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
							<caption>긍정적 강화훈련 추진실적</caption>
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
		
		<!-- #layer04 -->
		<div class="layer_box" id="all" style="top: 80px; height: 650px;">
			<div class="layer_tit">풍부화 및 긍정적 강화훈련 추진내용</div>
				<div class="layer_con">
					<div class="search_box">
					<table class="search_table" style="width:760px;" >
							<caption>풍부화 및 긍정적 강화훈련 추진내용</caption>
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
							<caption>풍부화 및 긍정적 강화훈련 추진내용</caption>
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