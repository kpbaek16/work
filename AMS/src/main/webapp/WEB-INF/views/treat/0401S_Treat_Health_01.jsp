<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
<head>
<link rel="stylesheet" href="/css/ui/reset.css">
<link rel="stylesheet" href="/css/ui/sub_layout.css">
<link rel="stylesheet" href="/css/base/contents.css">
<link rel="stylesheet" href="/css/jquery/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> <!-- 달력 css-->
<script src="/js/jquery-1.7.2.min.js"></script>
<script src="/js/jquery/ui/1.8.18/jquery-ui.min.js"></script>  <!-- 달력 스크립트-->
<script type="text/javascript" src="/js/contents/base.js"></script>
<script type="text/javascript" src="/js/contents/cal.js"></script>
<script src="/js/common/common.js"></script> 
<script src="/js/common/json2.js"></script>
<script>
	function selectDayJnlList(result){
	 	if(result!=null){
			console.log("selectDayJnlList:" + JSON.stringify(result));
			$("#jnl_tbody tr:first").attr('style',"display:");
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("jnl_tbody");
				
				var iRow = (i+1);
				$("#jnl_tbody div#JNL_INDEX_DIV").eq(iRow).html(iRow); 
				$("#jnl_tbody div#JBJ_DOCNO_DIV").eq(iRow).attr('data-val', data.JBJ_DOCNO); 
				$("#jnl_tbody div#SIGN_DOCNO_DIV").eq(iRow).attr('data-val', data.JBJ_DOCNO); 
				$("#jnl_tbody div#JNLDATE_DIV").eq(iRow).attr('data-val', data.JBJ_DOCNO); 
				$("#jnl_tbody div#JNLDATE_DIV").eq(iRow).html(data.JNLDATE); 
				$("#jnl_tbody div#MUI_NAME_DIV").eq(iRow).html(data.MUI_NAME); 
				$("#jnl_tbody div#CNT_CLS_JN_DIV").eq(iRow).html(data.CNT_CLS_JN); 
				$("#jnl_tbody div#CNT_ANI_JN_DIV").eq(iRow).html(data.CNT_ANI_JN); 
				$("#jnl_tbody div#CNT_CLS_7_DIV").eq(iRow).html(data.CNT_CLS_7); 
				$("#jnl_tbody div#CNT_ANI_7_DIV").eq(iRow).html(data.CNT_ANI_7); 
				$("#jnl_tbody div#CNT_CLS_5_DIV").eq(iRow).html(data.CNT_CLS_5); 
				$("#jnl_tbody div#CNT_ANI_5_DIV").eq(iRow).html(data.CNT_ANI_5); 
				$("#jnl_tbody div#CNT_KY_DIV").eq(iRow).attr('data-val', data.JBJ_DOCNO); 
				$("#jnl_tbody div#CNT_KY_DIV").eq(iRow).html(data.CNT_KY); 
				$("#jnl_tbody div#PROCSTS_DIV").eq(iRow).html(data.PROCSTS); 
			}
			$("#jnl_tbody tr:first").attr('style',"display:none");
	 	}
	}
	function fn_treat_selectDayJnlList(param, callback, retObj) {
	
		fc_clearRow("jnl_tbody");
	
		var targetUrl = "/treat/0401/selectDayJnlList.do";
		$.getJSON(targetUrl, param, function(result) {
	//		console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}
	function fn_treat_search(){
		var param = {
				cal_1 : $("#sch_tbody #cal_1").val(),
				cal_2 : $("#sch_tbody #cal_2").val()
		};
		console.log(param);
		fn_treat_selectDayJnlList(param, selectDayJnlList);
	}	
	
	function fn_treat_search(){
		var param = {
				cal_1 : $("#sch_tbody #cal_1").val(),
				cal_2 : $("#sch_tbody #cal_2").val()
		};
		console.log(param);
		fn_treat_selectDayJnlList(param, selectDayJnlList);
	}
	
	function fn_treat_view0401E(JBJ_DOCNO){
		var targetUrl = "/treat/0401/view0401E.do";
		location.href = targetUrl + "?docno=" +JBJ_DOCNO;
	}
	
	
	/* function fn_treat_view0401E1(sdj_docno){
		var targetUrl = "/treat/0401/view0401E1.do";
		location.href = targetUrl + "?docno=" +sdj_docno;
	}
	
	function fn_treat_view0401E2(sdj_docno){
		var targetUrl = "/treat/0401/view0401E2.do";
		location.href = targetUrl + "?docno=" +sdj_docno;
	}
	
	function fn_treat_view0401E3(sdj_docno){
		var targetUrl = "/treat/0401/view0401E3.do";
		location.href = targetUrl + "?docno=" +sdj_docno;
	} */
	
	function fn_treat_view0701S(jbj_docno){
		var targetUrl = "/sign/0701/insSIGN.do";
		location.href = targetUrl + "?DOCTYPE=2&DOCNO=" +jbj_docno;
	}	
	$(document).ready(function() {
	});
</script>

<title>동물진료 &gt; 보건일지</title>
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
                    <p class="contents_title">보건일지</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 동물진료</li>
                        <li>> 보건일지</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 일자 조회 -->
					<div class="aniinfo_search_box">
                        <table class="aniinfo_search" >
							<caption>일자 조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody id="sch_tbody">
								<tr>
									<th scope="row">일자</th>
									<td><p><input type="text" class="calendar1" id="cal_1" value="${calInfo.cal_1}"><label for="cal_1"></label> ~ <input type="text" class="calendar1" id="cal_2" value="${calInfo.cal_2}"><label for="cal_2"></label></p></td>
								</tr>
								<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_treat_search();" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div> 
					<!-- //일자 조회 -->
					<!-- 보건일지 표 -->
					<div class="aniinfo_add_box">
						<!-- <p><a href="#" class="info_add_btn">추가</a></p> -->						
						<table class="aniinfo_add">
						<caption>번식보고서</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:7%;">
								<col style="width:8%;">
								<col style="width:7%;">
								<col style="width:8%;">
								<col style="width:7%;">
								<col style="width:8%;">
								<col style="width:8%;">
								<col style="width:8%;">
								<col style="width:7%;">
								<col style="width:7%;">
							</colgroup>
							<thead >
								<tr>
									<th scope="col" id="th01" rowspan="2" style="vertical-align:middle;">No</th>
									<th scope="col" id="th02" rowspan="2" style="vertical-align:middle;">일자</th>
									<th scope="col" id="th03" rowspan="2" style="vertical-align:middle;">작성자</th>
									<th scope="colgroup" id="th04" colspan="2" >진료</th>
									<th scope="colgroup" id="th05" colspan="2" >폐사</th>
									<th scope="colgroup" id="th06" colspan="2" >입원</th>
									<th scope="col" id="th07" rowspan="2" style="vertical-align:middle;">검사건수</th>
									<th scope="col" id="th08" rowspan="2" style="vertical-align:middle;">결재상태</th>
									<th scope="col" id="th08" rowspan="2" style="vertical-align:middle;">결재</th>
									<th scope="col" id="th09" rowspan="2" style="vertical-align:middle;">복사</th>
								</tr>
								<tr>
									<th scope="col" id="a">종수</th>
									<th scope="col" id="b">동물수</th>
									<th scope="col" id="c">종수</th>
									<th scope="col" id="d">동물수</th>
									<th scope="col" id="e">종수</th>
									<th scope="col" id="f">동물수</th>

								</tr>
							</thead>
							<tbody id="jnl_tbody">
								<tr style="display:none">
									<th scope="row" id="n01" headers="th01"><div id="JNL_INDEX_DIV" data-val=''></div></th>
									<td headers="n01 th02"><div id="JNLDATE_DIV"></div></td>
									<td headers="n01 th03"><div id="MUI_NAME_DIV" data-val=''></div></td>
									<td headers="n01 th04 a"><div id="CNT_CLS_JN_DIV" data-val=''></div></td>
									<td headers="n01 th04 b"><div id="CNT_ANI_JN_DIV"></div></td>
									<td headers="n01 th05 c"><div id="CNT_CLS_7_DIV" data-val=''></div></td>
									<td headers="n01 th05 d"><div id="CNT_ANI_7_DIV"></div></td>
									<td headers="n01 th06 e"><div id="CNT_CLS_5_DIV" data-val=''></div></td>
									<td headers="n01 th06 f"><div id="CNT_ANI_5_DIV"></div></td>
									<td headers="n01 th07"><div id="CNT_KY_DIV"></div></td>
									<td headers="n01 th08"><div id="PROCSTS_DIV" data-val=''></div></td>
									<td headers="n01 th09"><a href="#"><div id="SIGN_DOCNO_DIV" data-val='' onclick="javascript:fn_treat_view0701S($(this).attr('data-val'));" class="copy_btn">결재</div></a></td>
									<td headers="n01 th09"><a href="#"><div id="JBJ_DOCNO_DIV" data-val='' onclick="javascript:fn_treat_view0401E($(this).attr('data-val'));" class="copy_btn">복사</div></a></td>
								</tr>
							</tbody>
						
						</table>
					</div>
					<!-- //보건일지 표 -->
					<!-- pagination -->
					<div class="pagination">
						<a href="#" class="page first"></a>
						<a href="#" class="page prev"></a>
						<a href="#" class="on">1</a>
						<a href="#">2</a>
						<a href="#">3</a>
						<a href="#">4</a>
						<a href="#">5</a>
						<!--
						<a href="#">6</a>
						<a href="#">7</a>
						<a href="#">8</a>
						<a href="#">9</a>
						<a href="#">10</a>
						-->
						<a href="#" class="page next"></a>
						<a href="#" class="page last"></a>
					</div>
					<!-- //pagination -->						
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