<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
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
<script src="/js/common/fileupload.js"></script>

<script type="text/javascript">
function numkeyCheck(e) { 
	var keyValue = event.keyCode; 
	if( ((keyValue >= 48) && (keyValue <= 57)) ) 
		return true; 
	else return false; 
	}
</script>

<script type="text/javascript">
function error(){
	alert('페이지 수정중입니다.');
}

</script>

<title>기본정보 &gt; 동물정보</title>
</head>
<body>
<div id="sub_wrap">
	<!-- header -->
    <div id="header_wrap">
	<jsp:include page="/header.do"></jsp:include>
	</div>
	<!-- //header -->
	<!-- container-->
	<div id="container">
		<div id="contents">
			<!-- left-->
			<div id="lnb_area">
				<jsp:include page="/lnb.do"></jsp:include>
			</div>
			<!-- //left-->
			<!-- right-->
			<section id="contents_area">
			<h2>본문내용</h2>
				<!-- contents_title-->
				<div class="title_area">
                    <p class="contents_title">군집정보</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 기본정보</li>
                        <li>> 군집정보</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 그룹 정보-->
					<div class="aniinfo_search_box">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus">
							<img src="/images/btn_minus.gif" alt=""></a>그룹정보</span>
						</div>
						<table class="aniinfo_search table_view" >
							<caption>그룹정보</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">동물명</th><td>타조 (B1-1-3)</td><th scope="row">영명</th><td>South African Ostrich</td>
								</tr>
								<tr>
									<th scope="row">동물그룹명</th><td>조강 – 타조목 - 타조과</td><th scope="row">학명</th><td>Struthio camelus</td>
								</tr>
								<tr>
									<th scope="row">CITES</th><td>해당없음</td><th scope="row">천연기념물</th><td>0</td>
								</tr>
								<tr>
									<th scope="row">멸종위기</th><td>해당없음</td><th scope="row">전략종</th><td>해당없음</td>
								</tr>
								<tr>
									<th scope="row">등급</th><td>해당없음</td><th scope="row">원산지</th><td>토종</td>
								</tr>
								<tr>
									<th scope="row">군집구분</th><td>군집</td><th scope="row">군집 개체수</th><td>10 마리</td>
								</tr>
								<tr>
									<th scope="row">임신기간</th><td>1 년</td><th scope="row">평균수명</th><td>10 년</td>
								</tr>
						   </tbody>
						</table>
					</div>
					<!-- //그룹 정보-->
					&nbsp;&nbsp;&nbsp;
					<div class="table_title_box">
							<span class="table_title">
							<a href="#" id="btn_plus2"><img src="/images/btn_plus.gif" alt=""></a>
							<a href="#" id="btn_minus2"><img src="/images/btn_minus.gif" alt=""></a>기본정보</span>
						</div>
						<table class="aniinfo_search table_view2" >
							<caption>기본정보</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">등록구분</th><td></td>
									<th scope="row">현재 상태</th><td></td>
								</tr>
								<tr>
									<th scope="row">관리부서(관리팀)</th><td>${aniInfo.TEAMNAME }</td>
									<th scope="row">동물사</th><td>${aniInfo.VVRMNAME }</td>
								</tr>
								<tr>
									<th style="height:80px">특이사항</th><td style="text-align:left" colspan="3"></td>
								</tr>
						   </tbody>
						</table>
						
						&nbsp;&nbsp;&nbsp;
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus3"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus3">
							<img src="/images/btn_minus.gif" alt=""></a>반입</span>
					
						</div>
						<table class="aniinfo_search table_view3" >
							<caption>반입</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">구분</th><td>반입</td>
									<th scope="row">사유</th><td>구입</td>
								</tr>
								<tr>
									<th scope="row">일자</th><td>2017.05.16</td>
									<th scope="row">반출입처</th><td>공작마을</td>
								</tr>
								<tr>
									<th scope="row">개체수</th><td>10</td>
									<th scope="row"></th><td></td>
								</tr>
						   </tbody>
						</table>
						
						&nbsp;&nbsp;&nbsp;
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus4"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus4">
							<img src="/images/btn_minus.gif" alt=""></a>반출</span>
					
						</div>
						<table class="aniinfo_search table_view4" >
							<caption>반출</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">구분</th><td>반출</td>
									<th scope="row">사유</th><td>폐사</td>
								</tr>
								<tr>
									<th scope="row">일자</th><td>2017.05.30</td>
									<th scope="row">반출입처</th><td>가금사</td>
								</tr>
								<tr>
									<th scope="row">개체수</th><td>5</td>
									<th scope="row">성별</th><td>미상</td>
								</tr>
						   </tbody>
						</table>
						
						&nbsp;&nbsp;&nbsp;
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus5"><img src="/images/btn_plus.gif" alt=""></a>
							<a href="#" id="btn_minus5"><img src="/images/btn_minus.gif" alt=""></a>개체수 조정</span>
							<div class="sys_btn_box">
								<span class="align_right btn_hide"><a href="#" class="cha_btn layer_open" onclick="javascript:error();">수정</a></span>
							</div>
						</div>
						<table class="aniinfo_add table_view" >
							<caption>반출입 정보</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:15%;">
								<col style="width:15%;">
								<col style="width:13%;">
								<col style="width:10%;">
								<col style="width:17%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">연번</th>
									<th scope="col" id="th02">구분</th>
									<th scope="col" id="th03">일자</th>
									<th scope="col" id="th04">사유</th>
									<th scope="col" id="th05">조정개체수</th>
									<th scope="col" id="th06">보유개체수</th>
									<th scope="col" id="th07">동물사</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="n01" headers="th01">1</th>
									<td headers="n01 th02">반입</td>
									<td headers="n01 th03">2016.07.01</td>
									<td headers="n01 th04">구매</td>
									<td headers="n01 th05"><input type="text" value="10" style="text-align: center; padding-right:1px"/></td>
									<td headers="n01 th06">3</td>
									<td headers="n01 th07">공작마을</td>
								</tr>
								<tr>
									<th scope="row" id="n02" headers="th01">2</th>
									<td headers="n02 th02">반출</td>
									<td headers="n02 th03">2016.07.02</td>
									<td headers="n02 th04">폐사</td>
									<td headers="n01 th05"><input type="text" name=id onKeyPress="return numkeyCheck(event)" value="5" style="text-align: center; padding-right:1px"/></td>
									<td headers="n02 th06">5</td>
									<td headers="n02 th07">가금사</td>
								</tr>
							</tbody>
						</table>
						
						&nbsp;&nbsp;&nbsp;
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus6"><img src="/images/btn_plus.gif" alt=""></a>
							<a href="#" id="btn_minus6"><img src="/images/btn_minus.gif" alt=""></a>개체수</span>
						</div>
						<table class="aniinfo_add table_view6" >
							<caption>반출입 정보</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:15%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">공작마을</th>
									<th scope="col" id="th02">가금사</th>
									<th scope="col" id="th03">총 개체수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td headers="n01 th01">20</td>
									<td headers="n01 th02">5</td>
									<td headers="n01 th03">25</td>
								</tr>
							</tbody>
						</table>
							
						&nbsp;&nbsp;&nbsp;
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus7"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus7">
							<img src="/images/btn_minus.gif" alt=""></a>대표 이미지</span>
						</div>
						<table class="aniinfo_search table_view7" >
							<caption>대표 이미지</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:20%;">
								<col style="width:20%;">
								<col style="width:20%;">
								<col style="width:20%;">								
							</colgroup>
							<thead>
								<tr>
									<th scope="col"><img src="/images/bird.jpg" alt="새"></th>
									<th scope="col"><img src="/images/bird.jpg" alt="새"></th>
									<th scope="col"><img src="/images/bird.jpg" alt="새"></th>
									<th scope="col"><img src="/images/bird.jpg" alt="새"></th>
									<th scope="col"><img src="/images/bird.jpg" alt="새"></th>
								</tr>
							</thead>
                            <tbody>
								<tr>
									<td>간단한설명</td>
									<td>간단한설명</td>
									<td>간단한설명</td>
									<td>간단한설명</td>
									<td>간단한설명</td>
								</tr>
								<tr class="td_btn_box">
									<td><a href="#" class="down_btn">다운로드</a></td>
									<td><a href="#" class="down_btn">다운로드</a></td>
									<td><a href="#" class="down_btn">다운로드</a></td>
									<td><a href="#" class="down_btn">다운로드</a></td>
									<td><a href="#" class="down_btn">다운로드</a></td>
								</tr>
								
						   </tbody>
						</table>
						
						&nbsp;&nbsp;&nbsp;
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus8"><img src="/images/btn_plus.gif" alt=""></a>
							<a href="#" id="btn_minus8"><img src="/images/btn_minus.gif" alt=""></a>반출입 정보</span>
						</div>
						<table class="aniinfo_add table_view8" >
							<caption>반출입 정보</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:23%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:40%;">
								<col style="width:12%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">No</th>
									<th scope="col" id="th02">파일명</th>
									<th scope="col" id="th03">등록일</th>
									<th scope="col" id="th04">등록자</th>
									<th scope="col" id="th05">내용</th>
									<th scope="col" id="th06">다운로드</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="n01" headers="th01">1</th>
									<td headers="n01 th02" class="text_left">수입허가증1.doc</td>
									<td headers="n01 th03">2016.07.01</td>
									<td headers="n01 th04">홍길동</td>
									<td headers="n01 th05" class="text_left">간단한설명</td>
									<td headers="n01 th06"><a href="#" class="down_btn">다운로드</a></td>
								</tr>
								<tr>
									<th scope="row" id="n02" headers="th01">2</th>
									<td headers="n02 th02" class="text_left">수입허가증1.doc</td>
									<td headers="n02 th03">2016.07.01</td>
									<td headers="n02 th04">홍길동</td>
									<td headers="n02 th05" class="text_left">간단한설명</td>
									<td headers="n02 th06"><a href="#" class="down_btn">다운로드</a></td>
								</tr>
								<tr>
									<th scope="row" id="n03" headers="th01">2</th>
									<td headers="n03 th02" class="text_left">수입허가증1.doc</td>
									<td headers="n03 th03">2016.07.01</td>
									<td headers="n03 th04">홍길동</td>
									<td headers="n03 th05" class="text_left">간단한설명</td>
									<td headers="n03 th06"><a href="#" class="down_btn">다운로드</a></td>
								</tr>
							</tbody>
						</table>
						
				</div>
				<!-- //contents-->
			</section>
			<!-- //right-->
		</div>

	</div>
	<!-- //container -->
	<!-- footer -->
	<div id="footer_wrap">
		<jsp:include page="/footer.do"></jsp:include>
	</div>
	<!-- //footer -->
</div>
</body>
</html>
