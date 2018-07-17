<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
</head>
<body>
<table id="sub_wrap"><tr><td>
	<table id="container"><tr><td>
		<table id="contents"><tr><td>
				<!-- contents_title-->
				<div class="title_area">
                    <p class="contents_title">폐사보고서</p>
				</div>
				<table class="contents_table"><tr><td>
					<!-- 결재-->
					<div class="aniinfo_add_box" >
						<span class="table_title">결재</span>
						<table class="aniinfo_add" style="width: 700px;">
							<thead>
								<tr>
									<th style="width:5%;" scope="col" id="th01">No</th>
									<th style="width:10%;" scope="col" id="th02">구분</th>
									<th style="width:10%;"  scope="col" id="th03">순서</th>
									<th style="width:15%;"  scope="col" id="th04">이름</th>
									<th style="width:20%;"  scope="col" id="th05">부서</th>
									<th style="width:15%;"  scope="col" id="th06">직책</th>
									<th style="width:15%;"  scope="col" id="th07">결재</th>
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
					<div class="aniinfo_add_box" >
						<span class="table_title">문서정보</span>
						<table class="aniinfo_search"  style="width: 700px;">
                            <tbody>
								<tr>
									<th scope="row" style="width:15%;">문서번호</th>
									<td colspan="3" style="width:35%;">${dethInfo.PDR_DOCNO }</td>
								</tr>
								<tr>
									<th scope="row" style="width:15%;">작성자</th>
									<td style="width:35%;">${dethInfo.MUI_NAME }</td>
									<th scope="row" style="width:15%;" >부서</th>
									<td style="width:35%;">${dethInfo.DPTNAME }</td>
								</tr>
								<tr>
									<th scope="row" style="width:15%;">구분</th>
									<td style="width:35%;">폐사보고서</td>
									<th scope="row" style="width:35%;">작성일</th>
									<td style="width:35%;">${dethInfo.CMN_MAK_DATE}</td>
								</tr>
						   </tbody>
						</table>
					</div>
					<div style="height: 20px;"></div>
					<div class="aniinfo_add_box">
						<span class="table_title">동물정보</span>
						<table class="aniinfo_search"  style="width: 700px;">
                            <tbody>
								<tr>
									<th scope="row" style="width:15%;">동물명(종)</th><td>${dethInfo.MAC_NAME }</td>
									<th scope="row" style="width:35%;">동물사</th><td>${dethInfo.VVRMNAME }</td>
								</tr>
								<tr>
									<th scope="row" style="width:15%;">성별</th><td>${dethInfo.MAI_GENDER }</td>
									<th scope="row" style="width:35%;">나이</th><td>${dethInfo.ONE }년  ${dethInfo.TWO }개월</td>
								</tr>									
						   </tbody>
						</table>
					</div>
					<div style="height: 20px;"></div>
					<div class="aniinfo_add_box">
						<span class="table_title">폐사내용</span>
						<table class="aniinfo_search" style="width: 700px;">
                            <tbody>
								<tr>
									<th scope="row" style="width:15%;">폐사일시</th>
									<td style="width:85%;">${dethInfo.PDR_PSDATE }</td>
								</tr>
								<tr>
									<th scope="row" style="width:15%;">폐사장소</th>
									<td style="width:85%;">${dethInfo.PDR_PSPLACE }</td>
								</tr>
								<tr>
									<th scope="row" style="width:15%;">폐사경위</th>
									<td style="width:85%;">${dethInfo.PDR_DETHPROC }</td>
								</tr>
								<tr>
									<th scope="row" style="width:15%;">비고</th>
									<td style="width:85%;">${dethInfo.PDR_CMNT }</td>
								</tr>
								<tr>
									<th scope="row" style="width:15%;">요청</th>
									<td style="width:85%;">
										<p> 
										<c:if test="${dethInfo.PDR_BUKMREQ == '1'}"><label>부검요청</label></c:if>
										<c:if test="${dethInfo.PDR_BUKMREQ == '0'}"><label>표본제작요청</label></c:if>
										</p>
									</td>
								</tr>
						   </tbody>
						</table>
					</div>
					<div style="height: 20px;"></div>
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">향후계획</span>
						</div>
						<div class="plan_box table_view5">
							<p class="plan_text">${dethInfo.PDR_WAYSCH }</p>
						</div>
					</div>
				</td></tr></table>
		</td></tr></table>
	</td></tr></table>
</td></tr></table>
</body>
</html>
