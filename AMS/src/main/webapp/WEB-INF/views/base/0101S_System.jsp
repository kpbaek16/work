<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="java.util.*" %>
<!doctype html>
<html lang="ko">

<head>
<script src="/js/jquery-1.7.2.min.js"></script>
<script src="/js/common/sha256.js"></script> <!-- Lnb 스크립트-->
<script src="/js/common/common.js"></script>
<script type="text/javascript" src="/js/contents/base.js"></script>
<script src='/js/contents/Nwagon.js'></script>
<script src="/js/common/json2.js"></script>
<link rel="stylesheet" href="/css/base/test.css">
<link rel="stylesheet" href="/css/ui/reset.css">
<link rel="stylesheet" href="/css/ui/sub_layout.css">
<link rel="stylesheet" href="/css/ui/layer.css">
<link rel="stylesheet" href="/css/ui/modal.css">
<link rel="stylesheet" href="/css/base/contents.css">
<link rel='stylesheet' href='/css/base/Nwagon.css' type='text/css'>
	
<script>
function updateDptUse(){
	/* 
	$("input[type='checkbox']").val();
	/*  var tt = document.getElementById("cmn").value; */
	/*  var value = $('#cmn').val();
	var tt = "${DptList }";
	
	 alert(value);
	 alert(tt);
	 alert(jsonObj);
	
	  */
	  var para2 = [];
        $("input[name='cmn']:checked").each(function(i) {
        para2.push($(this).val());
        });
       
        var postData = { "para1": "para1", "cmn": para2 };
   
        $.ajax({
               url:'test_page.asp',
               type:'post',
               timeout:1000,
               data:postData,
               traditional: true,
               error:function(){
                     alert('네트워크가 불안정합니다.');
               },
               success:function(obj){
                     alert (obj);
               }
        });
}

$(document).ready(function() {
});
</script>
<script type="text/javascript">
	function system_info_update(){
		var form = document.systemForm;
		var usystem_name = document.getElementById("usystem_name").value;
		var ulogo_name = document.getElementById("ulogo_name").value;
		var uupload_path = document.getElementById("uupload_path").value;
		
		if(usystem_name == null){
			alert('공백');
		}
		form.submit();
	}
</script>
	<title>기본정보 &gt;시스템관리</title>
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
	                    <p class="contents_title">시스템정보</p>
	                    <ol class="location">
	                        <li><img src="/images/home_icon.gif" alt="home"></li>
	                        <li>> 기본정보</li>
	                        <li>> 시스템정보</li>
	                    </ol>
					</div>
					<!-- //contents_title-->
					
					<!-- contents-->
					<div class="contents_table">
						<!-- 시스템정보-->
						<div class="aniinfo_search_box">
							<div class="table_title_box">
								<span class="table_title">
								<img src="/images/btn_minus.gif" alt="">시스템정보</span>
								<div class="sys_btn_box">
									<!-- <input type="button" class="save_btn" onclick="system_info_update();" value="저장"> -->
									<a href="javascript:system_info_update();" class="save_btn">저장</a>
									<a href="main.do" class="cancel_btn">취소</a>
								</div>
							</div>
							
						<!-- 시스템정보-->
						<form id="systemForm" name="systemForm" method="POST" action="System_Info_Update.do">
							 <table class="aniinfo_search table_view" >
								<caption>시스템정보</caption>
								<colgroup>
									<col style="width:10%;">
									<col style="width:40%;">
									<col style="width:10%;">
									<col style="width:40%;">
								</colgroup>
	                            <tbody>
									<tr>
										<th scope="row">시스템명</th>
									<td><input type="text" id="usystem_name" name="usystem_name"  class="textfield" style="width: 80%" value="${SystemInfo.MSC_AMS_NAME}"/></td>
										<th scope="row">로고파일명</th>
									<td>
									<input type="text" id="ulogo_name" name="ulogo_name" class="textfield" style="width: 80%" value="${SystemInfo.MSC_LOGONM}"/></td>
									</tr>
									<tr>
										<th scope="row">업로드폴더</th>
										<td><input type="text" name="uupload_path" id="uupload_path"  class="textfield" style="width:80%" value="${SystemInfo.MSC_UPLOADPATH}"/></td>
										<th scope="row"></th><td></td>
									</tr>
							   </tbody>
							</table>
							</form >
						</div>
						<!-- //시스템정보수정-->
						
						<!-- 행정포탈 부서정보-->
						<div class="aniinfo_add_box">
							<div class="table_title_box">
								<span class="table_title">
								<img src="/images/btn_minus.gif" alt="">행정포탈 부서정보</span>
								<div class="sys_btn_box">
									<span class="align_right2">
									<a href="javascript:updateDptUse();" class="save_btn">저장</a></span>
								</div>
							</div>
							<form id="dptForm" name="dptForm" method="POST" action="dpt_update.do">
							<table class="aniinfo_add table_view2" >
								<caption>행정포탈 부서정보</caption>
								<colgroup>
									<col style="width:10%;">
									<col style="width:30%;">
									<col style="width:30%;">
									<col style="width:30%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" id="num">No</th>
										<th scope="col" id="code_num">부서코드</th>
										<th scope="col" id="admin_name">부서명</th>
										<th scope="col" id="use_check">사용여부</th>
									</tr>
								</thead>
								<tbody id="dpt_tbody">
								<c:forEach items="${DptList }" var="dpt">
									<tr><th scope="row" id="n01" headers="num">${dpt.RNUM }</th>
									<td id="mdi_linkno">${dpt.MDI_LINKNO }</td>
									<td id="dptname">${dpt.MDI_DPTNAME }</td>
									<td><input type="checkbox" id="cmn" name="cmn" value="Y" ${dpt.CMN_DEL_STS == "Y" ? "CHECKED" : ""}/></td>
									
									</tr>
									</c:forEach>
								</tbody>
							</table>
							</form>
							
						<%-- 	<table class="aniinfo_add table_remove2" >
							<caption>행정포탈 부서정보</caption>
								<colgroup>
									<col style="width:10%;">
									<col style="width:30%;">
									<col style="width:30%;">
									<col style="width:30%;">
								<thead>
									<tr>
										<th scope="col" id="num2">No</th>
										<th scope="col" id="code_num2">부서코드</th>
										<th scope="col" id="admin_name2">부서명</th>
										<th scope="col" id="use_check2">사용</th>
									</tr>
								</thead>

							 	<tbody id="dpt_tbody_U">
								<c:forEach items="${DptList }" var="dpt" varStatus="status2">		
									<tr><th scope="row" id="n01_1" headers="num2">${dpt.RNUM }</th>
										<td headers="n01_1 code_num2">${dpt.MDI_LINKNO }</td>
										<td headers="n01_1 admin_name2">${dpt.MDI_DPTNAME }</td>
										<td headers="n01_1 th04_1" >
										
										<input type="checkbox" id="bditem_chk_yn" name="bditem_chk_yn" /><label for="bditem_chk_yn"></label></td>
									</tr>
									</c:forEach>
								</tbody> 
							</table> --%>
						</div>
						<!-- //행정포탈 부서정보-->		
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
