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
<script src="/js/common/json2.js"></script>
<script>
	function selectVvrmHisList(result){
	 	if(result!=null){
	//		console.log("test:" + JSON.stringify(result));
			console.log("result.length==>" + result.length);
			$("#his_tbody tr:first").attr('style',"display:");
			
			for(var i=0; i<result.length; i++){
				var data = result[i];
				
				fc_addRow("his_tbody");
	
				var iRow = (i+1);
				
				$("#his_tbody div#HIS_INDEX_DIV").eq(iRow).attr('data-val',iRow); 
				$("#his_tbody div#HIS_INDEX_DIV").eq(iRow).html(iRow); 
				$("#his_tbody div#MVI_VVRMNAME_DIV").eq(iRow).html(data.MVI_VVRMNAME); 
				$("#his_tbody div#MDI_DPTNAME_DIV").eq(iRow).html(data.MDI_DPTNAME); 
				$("#his_tbody div#TXT_HVI_LOGDATE_DIV").eq(iRow).html(data.TXT_HVI_LOGDATE); 

				$("#his_tbody div#UPD_MUI_NAME_DIV").eq(iRow).html(data.UPD_MUI_NAME); 
				$("#his_tbody div#TXT_HVI_LOGTYPE_DIV").eq(iRow).html(data.TXT_HVI_LOGTYPE); 
				$("#his_tbody div#TXT_HVI_BFR_VL_DIV").eq(iRow).html(data.TXT_HVI_BFR_VL); 
				$("#his_tbody div#TXT_HVI_AFT_VL_DIV").eq(iRow).html(data.TXT_HVI_AFT_VL); 

			}
			
			$("#his_tbody tr:first").attr('style',"display:none");
			$("#his_tbody").append($("#his_tbody tr:last"));
			
	 	}
	}
	function fn_his_selectVvrmHisList(param, callback, retObj) {
		console.log("****fn_his_selectVvrmHisList");
	
		fc_clearRow("his_tbody");
		
		var targetUrl = "/his/0703/selectVvrmHisList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result, param);
			}
		});
	}
	
	function fn_his_User(){
		var param = {
				cal_1 : $("#sch_tbody #cal_1").val(),
				cal_2 : $("#sch_tbody #cal_2").val(),
				sch_mvi_vvrmname : $("#sch_tbody #sch_mvi_vvrmname").val()
		};
		fn_his_selectVvrmHisList(param, selectVvrmHisList);
	}
	
	$(document).ready(function() {
	});

</script>

<title>이력관리 &gt; 동물사이력</title>
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
                    <p class="contents_title">동물사이력</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 이력관리</li>
                        <li>> 동물사이력</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 동물사이력 조회 -->
					<div class="aniinfo_search_box">
                        <table class="aniinfo_search" >
							<caption>동물사이력 조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody id="sch_tbody">
								<tr>
									<th scope="row">변경일자</th>
									<td><p><input type="text" class="calendar1" id="cal_1" value="${calInfo.cal_1}"><label for="cal_1"></label> ~  <input type="text" class="calendar2" id="cal_2" value="${calInfo.cal_2}"><label for="cal_2"></label></p></td>						
								</tr>
								<tr>
									<th scope="row">동물사명</th>
									<td><input name="sch_mvi_vvrmname" type="text" id="sch_mvi_vvrmname" class="textfield"><label for="seach_text1"></label></td>
								</tr>
								<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_his_User();" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					<!-- //동물사이력 조회 -->
					<!-- 동물사이력 표 -->
					<div class="aniinfo_add_box">
						<div class="sys_btn_box" style="margin-bottom:5px;">
						<span><a href="#" class="transform_btn">변환</a><a href="#" class="print_btn btn_type2">프린트</a><a href="#" class="del_btn">삭제</a></span>	
						</div>
						<table class="aniinfo_add" >
						<caption>동물사이력 내역</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:15%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:8%;">
								<col style="width:12%;">
								<col style="width:15%;">
								<col style="width:15%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">No</th>
									<th scope="col" id="th02">동물사명</th>
									<th scope="col" id="th03">부서</th>
									<th scope="col" id="th04">팀</th>
									<th scope="col" id="th05">변경일</th>
									<th scope="col" id="th06">변경자</th>
									<th scope="col" id="th07">구분</th>
									<th scope="col" id="th08">변경전</th>
									<th scope="col" id="th09">변경후</th>
								</tr>
							</thead>
							<tbody id="his_tbody">
								<tr style="display:none">
									<th scope="row" id="n01" headers="th01"><div id="HIS_INDEX_DIV" data-val=''></div></th>
									<td headers="n01 th02"><div id="MVI_VVRMNAME_DIV" data-val=''></div></td>
									<td headers="n01 th03">동물복지1과</td>
									<td headers="n01 th04">복지1팀</td>
									<td headers="n01 th05"><div id="TXT_HVI_LOGDATE_DIV" data-val=''></div></td>
									<td headers="n01 th06"><div id="UPD_MUI_NAME_DIV" data-val=''></div></td>
									<td headers="n01 th07"><div id="TXT_HVI_LOGTYPE_DIV" data-val=''></div></td>
									<td headers="n01 th08"><div id="TXT_HVI_BFR_VL_DIV" data-val=''></div></td>
									<td headers="n01 th09"><div id="TXT_HVI_AFT_VL_DIV" data-val=''></div></td>
								</tr>
								<!--
								<tr>
									<th scope="row" id="n02" headers="th01">2</th>
									<td headers="n02 th02">가금사</td>
									<td headers="n02 th03">동물복지1과</td>
									<td headers="n02 th04">복지1팀</td>
									<td headers="n02 th05">2016-08-30</td>
									<td headers="n02 th06">김길동</td>
									<td headers="n02 th07">팀변경</td>
									<td headers="n02 th08">조류팀</td>
									<td headers="n02 th09">복지1팀</td>
								</tr>
								<tr>
									<th scope="row" id="n03" headers="th01">3</th>
									<td headers="n03 th02">가금사</td>
									<td headers="n03 th03">동물복지1과</td>
									<td headers="n03 th04">조류팀</td>
									<td headers="n03 th05">2016-08-30</td>
									<td headers="n03 th06">김길동</td>
									<td headers="n03 th07">부서변경</td>
									<td headers="n03 th08">동물복지2과</td>
									<td headers="n03 th09">동물복지1과</td>
								</tr>
								<tr>
									<th scope="row" id="n04" headers="th01">4</th>
									<td headers="n04 th02">가금사</td>
									<td headers="n04 th03">동물복지1과</td>
									<td headers="n04 th04">조류팀</td>
									<td headers="n04 th05">2016-08-30</td>
									<td headers="n04 th06">김길동</td>
									<td headers="n04 th07">관리자삭제</td>
									<td headers="n04 th08">이재오</td>
									<td headers="n04 th09"></td>
								</tr>
								<tr>
									<th scope="row" id="n05" headers="th01">5</th>
									<td headers="n05 th02"></td>
									<td headers="n05 th03"></td>
									<td headers="n05 th04"></td>
									<td headers="n05 th05"></td>
									<td headers="n05 th06"></td>
									<td headers="n05 th07"></td>
									<td headers="n05 th08"></td>
									<td headers="n05 th09"></td>
								</tr>
								<tr>
									<th scope="row" id="n06" headers="th01">6</th>
									<td headers="n06 th02"></td>
									<td headers="n06 th03"></td>
									<td headers="n06 th04"></td>
									<td headers="n06 th05"></td>
									<td headers="n06 th06"></td>
									<td headers="n06 th07"></td>
									<td headers="n06 th08"></td>
									<td headers="n06 th09"></td>
								</tr>
								<tr>
									<th scope="row" id="n07" headers="th01">7</th>
									<td headers="n07 th02"></td>
									<td headers="n07 th03"></td>
									<td headers="n07 th04"></td>
									<td headers="n07 th05"></td>
									<td headers="n07 th06"></td>
									<td headers="n07 th07"></td>
									<td headers="n07 th08"></td>
									<td headers="n07 th09"></td>
								</tr>
								<tr>
									<th scope="row" id="n08" headers="th01">8</th>
									<td headers="n08 th02"></td>
									<td headers="n08 th03"></td>
									<td headers="n08 th04"></td>
									<td headers="n08 th05"></td>
									<td headers="n08 th06"></td>
									<td headers="n08 th07"></td>
									<td headers="n08 th08"></td>
									<td headers="n08 th09"></td>
								</tr>
								<tr>
									<th scope="row" id="n09" headers="th01">9</th>
									<td headers="n09 th02"></td>
									<td headers="n09 th03"></td>
									<td headers="n09 th04"></td>
									<td headers="n09 th05"></td>
									<td headers="n09 th06"></td>
									<td headers="n09 th07"></td>
									<td headers="n09 th08"></td>
									<td headers="n09 th09"></td>
								</tr>
								<tr>
									<th scope="row" id="n10" headers="th01">10</th>
									<td headers="n10 th02"></td>
									<td headers="n10 th03"></td>
									<td headers="n10 th04"></td>
									<td headers="n10 th05"></td>
									<td headers="n10 th06"></td>
									<td headers="n10 th07"></td>
									<td headers="n10 th08"></td>
									<td headers="n10 th09"></td>
								</tr>
								-->
								
							</tbody>
						
						</table>
					</div>
					<!-- //동물사이력 표 -->
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
	<div id="footer_wrap">
			<jsp:include page="/footer.do"></jsp:include>
	</div>
	<!-- //footer -->
</div>
</body>
</html>