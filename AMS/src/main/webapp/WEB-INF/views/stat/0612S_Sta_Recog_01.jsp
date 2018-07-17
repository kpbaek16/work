<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="/css/ui/reset.css">
<link rel="stylesheet" href="/css/ui/sub_layout.css">
<link rel="stylesheet" href="/css/base/contents.css">
<link rel='stylesheet' href='/css/base/Nwagon.css' type='text/css'>
<link rel="stylesheet" href="/css/jquery/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> <!-- 달력 css-->
<script src="/js/jquery-1.7.2.min.js"></script>
<script src="/js/jquery/ui/1.8.18/jquery-ui.min.js"></script>  <!-- 달력 스크립트-->
<script type="text/javascript" src="/js/contents/base.js"></script>
<script type="text/javascript" src="/js/contents/cal.js"></script>
<script src="/js/common/common.js"></script>
<script src='/js/contents/Nwagon.js'></script>
<script src="/js/common/json2.js"></script>


<title>현황/통계 &gt; 인식기별현황</title>
</head>
<body>
<div id="sub_wrap">

	<jsp:include page="/header.do"></jsp:include>
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
                    <p class="contents_title">인식기별현황</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 현황/통계</li>
                        <li>> 인식기별현황</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 인식기별현황 조회 -->
					<div class="aniinfo_search_box">
                        <table class="aniinfo_search" >
							<caption>인식기별현황 조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">일자</th>
									<td><p><input type="text" class="calendar3" id="cal_1"><label for="cal_1"></label></p></td>
								</tr>
								
								<tr><th colspan="2" scope="col" class="search_btn_area"><a href="#" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					<!-- //인식기별현황 조회 -->

					<!-- 인식기별현황표 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">							
							<div class="sys_btn_box">
								<span class="align_right btn_hide"><a href="#" class="excel_btn">엑셀</a><a href="#" class="print_btn btn_type2">프린트</a></span>
							</div>
						</div>
						<table class="aniinfo_add table_view" >
							<caption>[동물교실] 자연학습팀</caption>
							<colgroup>
								<col style="width:6%;">
								<col style="width:17%;">
								<col style="width:17%;">
								<col style="width:12%;">
								<col style="width:12%;">
								<col style="width:12%;">
								<col style="width:12%;">
								<col style="width:12%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" rowspan="2" style="vertical-align:middle;">No</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">인식기</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">분류명</th>
									<th scope="colgroup" colspan="4">동물 수</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">보육</th>
								</tr>
								<tr>
									<th scope="col">수</th>
									<th scope="col">암</th>
									<th scope="col">미상</th>
									<th scope="col">합계</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" rowspan="4" style="vertical-align:middle;">1</th>
									<td rowspan="4" style="vertical-align:middle;">조강</td>
									<td>Chip</td>
									<td>0</td>
									<td>0</td>
									<td>12</td>
									<td>12</td>
									<td>0</td>
								</tr>
								<tr>
									<td>Ring</td>
									<td>0</td>
									<td>0</td>
									<td>2</td>
									<td>2</td>
									<td>0</td>
								</tr>
								<tr>
									<td>이표</td>
									<td>0</td>
									<td>0</td>
									<td>12</td>
									<td>12</td>
									<td>0</td>
								</tr>
								<tr>
									<td>기타</td>
									<td>3</td>
									<td>10</td>
									<td>0</td>
									<td>12</td>
									<td>0</td>
								</tr>
								<tr>
									<th scope="row"  colspan="3">[조강] 소계</th>
									<td>1</td>
									<td>2</td>
									<td>3</td>
									<td>4</td>
									<td>5</td>
								</tr>
								<tr>
									<th scope="row" rowspan="4" style="vertical-align:middle;">2</th>
									<td rowspan="4" style="vertical-align:middle;">포유강</td>
									<td>Chip</td>
									<td>0</td>
									<td>0</td>
									<td>12</td>
									<td>12</td>
									<td>0</td>
								</tr>
								<tr>
									<td>Ring</td>
									<td>0</td>
									<td>0</td>
									<td>2</td>
									<td>2</td>
									<td>0</td>
								</tr>
								<tr>
									<td>이표</td>
									<td>0</td>
									<td>0</td>
									<td>12</td>
									<td>12</td>
									<td>0</td>
								</tr>
								<tr>
									<td>기타</td>
									<td>3</td>
									<td>10</td>
									<td>0</td>
									<td>12</td>
									<td>0</td>
								</tr>
								<tr>
									<th scope="row"  colspan="3">[포유강] 소계</th>
									<td>1</td>
									<td>2</td>
									<td>3</td>
									<td>4</td>
									<td>5</td>
								</tr>
								<tr>
									<th scope="row" rowspan="4" style="vertical-align:middle;">3</th>
									<td rowspan="4" style="vertical-align:middle;">파충류</td>
									<td>Chip</td>
									<td>0</td>
									<td>0</td>
									<td>12</td>
									<td>12</td>
									<td>0</td>
								</tr>
								<tr>
									<td>Ring</td>
									<td>0</td>
									<td>0</td>
									<td>2</td>
									<td>2</td>
									<td>0</td>
								</tr>
								<tr>
									<td>이표</td>
									<td>0</td>
									<td>0</td>
									<td>12</td>
									<td>12</td>
									<td>0</td>
								</tr>
								<tr>
									<td>기타</td>
									<td>3</td>
									<td>10</td>
									<td>0</td>
									<td>12</td>
									<td>0</td>
								</tr>
								<tr>
									<th scope="row"  colspan="3">[파충류] 소계</th>
									<td>1</td>
									<td>2</td>
									<td>3</td>
									<td>4</td>
									<td>5</td>
								</tr>
								<tr>
									<th scope="row" rowspan="4" style="vertical-align:middle;">4</th>
									<td rowspan="4" style="vertical-align:middle;">양서류</td>
									<td>Chip</td>
									<td>0</td>
									<td>0</td>
									<td>12</td>
									<td>12</td>
									<td>0</td>
								</tr>
								<tr>
									<td>Ring</td>
									<td>0</td>
									<td>0</td>
									<td>2</td>
									<td>2</td>
									<td>0</td>
								</tr>
								<tr>
									<td>이표</td>
									<td>0</td>
									<td>0</td>
									<td>12</td>
									<td>12</td>
									<td>0</td>
								</tr>
								<tr>
									<td>기타</td>
									<td>3</td>
									<td>10</td>
									<td>0</td>
									<td>12</td>
									<td>0</td>
								</tr>
								<tr>
									<th scope="row"  colspan="3">[양서류] 소계</th>
									<td>1</td>
									<td>2</td>
									<td>3</td>
									<td>4</td>
									<td>5</td>
								</tr>
								<tr>
									<th scope="row" rowspan="4" style="vertical-align:middle;">5</th>
									<td rowspan="4" style="vertical-align:middle;">기타</td>
									<td>Chip</td>
									<td>0</td>
									<td>0</td>
									<td>12</td>
									<td>12</td>
									<td>0</td>
								</tr>
								<tr>
									<td>Ring</td>
									<td>0</td>
									<td>0</td>
									<td>2</td>
									<td>2</td>
									<td>0</td>
								</tr>
								<tr>
									<td>이표</td>
									<td>0</td>
									<td>0</td>
									<td>12</td>
									<td>12</td>
									<td>0</td>
								</tr>
								<tr>
									<td>기타</td>
									<td>3</td>
									<td>10</td>
									<td>0</td>
									<td>12</td>
									<td>0</td>
								</tr>
								<tr>
									<th scope="row"  colspan="3">[기타] 소계</th>
									<td>1</td>
									<td>2</td>
									<td>3</td>
									<td>4</td>
									<td>5</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<th scope="row" rowspan="4" colspan="2" style="vertical-align:middle;">합계</th>
									<td>Chip</td>
									<td>0</td>
									<td>0</td>
									<td>12</td>
									<td>12</td>
									<td>0</td>
								</tr>
								<tr>
									<td>Ring</td>
									<td>0</td>
									<td>0</td>
									<td>2</td>
									<td>2</td>
									<td>0</td>
								</tr>
								<tr>
									<td>이표</td>
									<td>0</td>
									<td>0</td>
									<td>12</td>
									<td>12</td>
									<td>0</td>
								</tr>
								<tr>
									<td>기타</td>
									<td>3</td>
									<td>10</td>
									<td>0</td>
									<td>12</td>
									<td>0</td>
								</tr>
								
							</tfoot>
						</table>
					</div>					
					<!-- //인식기별현황표 -->

					<!-- 인식기별현황차트 -->
						
						<div id="chart1" class="chart_style table_view">조강</div>
						<script>
							
							var options = {
								'dataset': {
									title: 'Web accessibility status',
									values:[12, 15, 13, 4],
									colorset: ['#30a1ce', '#DC143C', '#FF8C00', '#999'],
									fields: ['Chip', 'Ring',  '이표', '기타'] 
								},
								'donut_width' : 60, 
								'core_circle_radius':0,
								'chartDiv': 'chart1',
								'chartType': 'pie',
								'chartSize': {width:310, height:180}
							};

							Nwagon.chart(options);
						</script>
						<div id="chart2" class="chart_style table_view">포유강</div>
						<script>
							
							var options = {
								'dataset': {
									title: 'Web accessibility status',
									values:[6, 4, 8, 15],
									colorset: ['#30a1ce', '#DC143C', '#FF8C00', '#999'],
									fields: ['Chip', 'Ring',  '이표', '기타'] 
								},
								'donut_width' : 60, 
								'core_circle_radius':0,
								'chartDiv': 'chart2',
								'chartType': 'pie',
								'chartSize': {width:310, height:180}
							};

							Nwagon.chart(options);
						</script>
						<div id="chart3" class="chart_style table_view">파충류</div>
						<script>
							
							var options = {
								'dataset': {
									title: 'Web accessibility status',
									values:[10, 7, 2, 9],
									colorset: ['#30a1ce', '#DC143C', '#FF8C00', '#999'],
									fields: ['Chip', 'Ring',  '이표', '기타'] 
								},
								'donut_width' : 60, 
								'core_circle_radius':0,
								'chartDiv': 'chart3',
								'chartType': 'pie',
								'chartSize': {width:310, height:180}
							};

							Nwagon.chart(options);
						</script>
						<div id="chart4" class="chart_style table_view">양서류</div>
						<script>
							
							var options = {
								'dataset': {
									title: 'Web accessibility status',
									values:[8, 5, 10, 4],
									colorset: ['#30a1ce', '#DC143C', '#FF8C00', '#999'],
									fields: ['Chip', 'Ring',  '이표', '기타'] 
								},
								'donut_width' : 60, 
								'core_circle_radius':0,
								'chartDiv': 'chart4',
								'chartType': 'pie',
								'chartSize': {width:310, height:180}
							};

							Nwagon.chart(options);
						</script>
						<div id="chart5" class="chart_style table_view">기타</div>
						<script>
							
							var options = {
								'dataset': {
									title: 'Web accessibility status',
									values:[10, 5, 3, 5],
									colorset: ['#30a1ce', '#DC143C', '#FF8C00', '#999'],
									fields: ['Chip', 'Ring',  '이표', '기타'] 
								},
								'donut_width' : 60, 
								'core_circle_radius':0,
								'chartDiv': 'chart5',
								'chartType': 'pie',
								'chartSize': {width:310, height:180}
							};

							Nwagon.chart(options);
						</script>

										
					<!-- //인식기별현황차트 -->					

					

					
				</div>
				<!-- //contents-->
			</section>
			<!-- //right-->
		</div>
	</div>
	<!-- //container -->	
 	<!-- footer -->
	<jsp:include page="/footer.do"></jsp:include>
	<!-- //footer -->

</div>
</body>

					

</html>
