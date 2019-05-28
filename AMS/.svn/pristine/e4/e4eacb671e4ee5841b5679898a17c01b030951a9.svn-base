<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
</head>
<body>
<table id="sub_wrap"><tr><td>
	<!-- //header -->
	<!-- container-->
	<table id="container"><tr><td>
		<table id="contents"><tr><td>
				<!-- contents_title-->
				<div class="title_area">
                    <p class="contents_title">번식보고서</p>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<table class="contents_table"><tr><td>
					<!-- 결재-->
					<div class="aniinfo_add_box">
						<span class="table_title">결재</span>
						<table class="aniinfo_add" style="width: 700px;">
							<thead>
								<tr>
									<th style="width:5%;" scope="col" id="th01">No</th>
									<th style="width:10%;" scope="col" id="th02">구분</th>
									<th style="width:10%;" scope="col" id="th03">순서</th>
									<th style="width:15%;" scope="col" id="th04">이름</th>
									<th style="width:20%;" scope="col" id="th05">부서</th>
									<th style="width:15%;" scope="col" id="th06">직책</th>
									<th style="width:15%;" scope="col" id="th07">결재</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="n01" headers="th01">1</th>
									<td headers="n01 th02">수신</td>
									<td headers="n01 th03">1</td>
									<td headers="n01 th04">홍길동</td>
									<td headers="n01 th05">동물복지1과</td>
									<td headers="n01 th06">과장</td>
									<td headers="n01 th07"></td>
								</tr>
								<tr>
									<th scope="row" id="n02" headers="th01">2</th>
									<td headers="n02 th02">수신</td>
									<td headers="n02 th03">2</td>
									<td headers="n02 th04">홍길동</td>
									<td headers="n02 th05">동물복지1과</td>
									<td headers="n02 th06">주임</td>
									<td headers="n02 th07"></td>
								</tr>
								<tr>
									<th scope="row" id="n03" headers="th01">3</th>
									<td headers="n03 th02">참조</td>
									<td headers="n03 th03">1</td>
									<td headers="n03 th04">홍길동</td>
									<td headers="n03 th05">동물복지1과</td>
									<td headers="n03 th06">사원</td>
									<td headers="n03 th07"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div style="height: 20px;"></div>
					<!-- 문서정보-->
					<div class="aniinfo_add_box">
						<span class="table_title">문서정보</span>
						<table class="aniinfo_search"  style="width: 700px;">
                           <tbody>
								<tr>
									<th scope="row" style="width:15%;">문서번호</th>
									<td colspan="3" style="width:35%;">${burnInfo.BBR_DOCNO }</td>
								</tr>
								<tr>
									<th scope="row" style="width:15%;">작성자</th>
									<td style="width:35%;">${burnInfo.MUI_NAME }</td>
									<th scope="row" style="width:15%;">부서</th>
									<td style="width:35%;">${burnInfo.DPTNAME }</td>
								</tr>
								<tr>
									<th scope="row" style="width:15%;">구분</th>
									<td style="width:35%;">번식보고서</td>
									<th scope="row" style="width:15%;">작성일</th>
									<td style="width:35%;">${burnInfo.CMN_MAK_DATE}</td>
								</tr>
						   </tbody>
						</table>
					</div>
					<!-- //문서정보-->
					<div style="height: 20px;"></div>
					<!-- 동물정보 -->
					<div class="aniinfo_add_box">
						<span class="table_title">동물정보</span>
						<table class="aniinfo_search"  style="width: 700px;">
                            <tbody>
								<tr>
									<th scope="row" style="width:15%;">동물명(종)</th>
									<td style="width:35%;">${burnInfo.BBR_ANINAME }</td>
									<th scope="row" style="width:15%;">동물사</th>
									<td style="width:35%;">${burnInfo.MVI_VVRMNAME }</td>
								</tr>
								<tr>
									<th scope="row" style="width:15%;">번식일시</th>
									<td colspan="3" style="width:35%;">${burnInfo.BBR_BSDATE }</td>
								</tr>
								<tr>
									<th scope="row" style="width:15%;">마리수(수)</th>
									<td style="width:35%;">${burnInfo.BBR_MALECNT }</td>
									<th scope="row" style="width:15%;">마리수(암)</th>
									<td style="width:35%;">${burnInfo.BBR_FEMALECNT }</td>
								</tr>
								<tr>
									<th scope="row" style="width:15%;">사산수(수)</th>
									<td style="width:35%;">-</td>
									<th scope="row" style="width:15%;">사산수(암)</th>
									<td style="width:35%;">-</td>
								</tr>
								<tr>
									<th scope="row" style="width:15%;">건강상태</th>
									<td colspan="3" style="width:35%;">${burnInfo.BBR_BIRTHSTS }</td>
								</tr>
						   </tbody>
						</table>	
					</div>
					<!-- //동물정보-->
					<div style="height: 20px;"></div>
					<!-- 부모정보 -->
					<div class="aniinfo_add_box">
						<span class="table_title">부모정보</span>
						<table class="aniinfo_search"  style="width: 700px;">
							<thead>
								<tr>
									<th style="width:10%;" scope="col" id="t4th01">구분</th>
									<th style="width:15%;" scope="col" id="t4th02">동물번호</th>
									<th style="width:15%;" scope="col" id="t4th03">동물명</th>
									<th style="width:15%;" scope="col" id="t4th04">동물사</th>
									<th style="width:15%;" scope="col" id="t4th05">인식번호</th>
									<th style="width:30%;" scope="col" id="t4th06">비고</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="t4n01" headers="t4th01">부</th>
									<td headers="t4n01 t4th02">${burnInfo.BBR_FTHANICODE }</td>
									<td headers="t4n01 t4th03"></td>
									<td headers="t4n01 t4th04"></td>
									<td headers="t4n01 t4th05"></td>
									<td headers="t4n01 t4th06"></td>
								</tr>
								<tr>
									<th scope="row" id="t4n02" headers="t4th01">모</th>
									<td headers="t4n02 t4th02">${burnInfo.BBR_MTHANICODE }</td>
									<td headers="t4n02 t4th03"></td>
									<td headers="t4n02 t4th04"></td>
									<td headers="t4n02 t4th05"></td>
									<td headers="t4n02 t4th06"></td>
								</tr>
							</tbody>
						
						</table>			
					</div>
					<!-- //부모정보 -->
					<div style="height: 20px;"></div>
					<!-- 향후계획 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">향후계획</span>
						</div>

						<div class="plan_box table_view5">
							<p class="plan_text">${burnInfo.BBR_PLNCMNT }</p>
						</div>
					</div>
					<!-- //향후계획 -->
			</td></tr></table>
				<!-- //contents-->
		</td></tr></table>
	</td></tr></table>
	</td></tr></table>
</body>
</html>
