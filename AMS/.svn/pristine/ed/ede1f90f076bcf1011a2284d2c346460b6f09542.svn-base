<!doctype html>
<html lang="ko">
<head>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<script src="/js/jquery-1.7.2.min.js"></script> <!-- Lnb 스크립트-->
<script src="/js/common/sha256.js"></script> <!-- Lnb 스크립트-->
<script src="/js/common/common.js"></script> <!-- Lnb 스크립트-->
<script src="/js/html5shiv.js"></script>
<link rel="stylesheet" href="/css/ui/reset.css">
<link rel="stylesheet" href="/css/ui/sub_layout.css">
<link rel="stylesheet" href="/css/ui/layer.css">
<link rel="stylesheet" href="/css/ui/modal.css">
<link rel="stylesheet" href="/css/base/contents.css">
<script type="text/javascript" src="/js/contents/base.js"></script>
<link rel='stylesheet' href='/css/base/Nwagon.css' type='text/css'>
<script src='/js/contents/Nwagon.js'></script>

<!-- 모달 스크립트  -->
<script type="text/javascript">
$( document ).ready( function() {
    $('.modal').addClass('loaded');
    $('.btn-close').click( function() {
    	$('.modal').removeClass('loaded');
    	});	
    $('#btn_ok').click( function fnm_regUser() {
    	/* var name = document.getElementById("txtName").value; */
    	var pwd = document.getElementById("pwd").value;
    	var form = document.myform;
    	
    	if(form.ss_userid.value=="") {
    		   alert("아이디는 필수 입력입니다.");
    		   form.ss_userid.focus();
    		   return;
    	}
    	/* if(form.name.value == null)
    	{
   		 alert("이름이 공란입니다.");
 		   return;
   	} */
    	  if(form.pwd.value=="") {
    	   alert("비밀번호는 필수 입력입니다.");
    	   form.pwd.focus();
    	   return;
    	  }
    	  
    	  if(form.txtPasswordConfirm.value==""){
    		  alert("비밀번호를 다시 한번 입력해 주세요.");
    		   form.txtPasswordConfirm.focus();
    		   return;
    	  }
    	  if($("input[name=pwd]").val() != $("input[name=txtPasswordConfirm]").val()){
    		  alert('비밀번호가 일치하지 않습니다.');
    		  return;
    	  }
    	  if(!/^[a-zA-Z0-9]{8,15}$/.test(pwd)){
    		  alert('비밀번호는 숫자와 영문자 조합으로 8~15자리를 사용해야 합니다.');
    		  form.pwd.focus();
    		  return;
    		  }
    	  if(/(\w)\1\1\1/.test(pwd)){
    		  alert('비밀번호에 111같은 문자를 4번 이상 사용하실 수 없습니다.');
    		  return;
    		  }

    	fc_regUserInfo($("input[name=ss_id]").val(),$("input[name=ss_userid]").val(),$("input[name=pwd]").val());
    	$('.modal').removeClass('loaded');
    	});
    $('#btn_ok2').click( function fnm_crSysUsr() {
    	var pwd2 = document.getElementById("pwd2").value;
    	var form2 = document.myform2;
    	
    	if(form2.pwd2.value=="") {
     	   alert("비밀번호는 필수 입력입니다.");
     	   form2.pwd2.focus();
     	   return;
     	  }
    	
    	 if(form2.cpwd.value==""){
   		  alert("비밀번호를 다시 한번 입력해 주세요.");
   		   form2.cpwd.focus();
   		   return;
   	  }
    	 if($("input[name=pwd2]").val() != $("input[name=cpwd]").val()){
   		  alert('비밀번호가 일치하지 않습니다.');
   		  return;
   	  }
    	 if(!/^[a-zA-Z0-9]{8,15}$/.test(pwd2)){
   		  alert('비밀번호는 숫자와 영문자 조합으로 8~15자리를 사용해야 합니다.');
   		  form2.pwd2.focus();
   		  return;
   		  }
   	  if(/(\w)\1\1\1/.test(pwd2)){
   		  alert('비밀번호에 111같은 문자를 4번 이상 사용하실 수 없습니다.');
   		  return;
   		  }
    	
   	fc_createSysUser($("input[name=ss_id]").val(),$("input[name=userid]").val(),$("input[name=pwd2]").val());
    	$('.modal').removeClass('loaded');
    	});
});
</script> 

<!-- 비밀번호 관련 -->
<script type="text/javascript">
	function ps(){
if (this.myform.password.type="password")
box.innerHTML="<input type=\"html\" name=\"password\" size=\"20\" value="+this.myform.password.value+">";
}
</script>

<!-- 아이디 검증 스크립트 -->
<script type="text/javascript">
	function validate() {
        var ss_userid = document.getElementById("ss_userid").value;
        var form = document.myform;

        $.ajax(
        		{
        			type : "GET",
        			data : "ss_userid="+ss_userid,
        			url : "/common/idCheck.do",
        			success : function(data)
        			{
        				if($.trim(data) == "Y")
        					{
        					alert(""+ss_userid+"은(는) 사용이 불가능한 ID입니다.");
        					document.getElementById('ss_userid').style.border = "solid 2px red";
        					document.getElementById("btn_ok").disabled = true;
        					form.ss_userid.focus();
        					return;
        					}
        				else
        				{
        					if (ss_userid.length < 6 || ss_userid.length > 20) {
        					    alert("아이디는 6자 이상, 20자 이하여야합니다.");
        					}
        					else if (/[^a-z0-9]+|^([a-z]+|[0-9]+)$/i.test(ss_userid)) {
        					   alert("아이디는 영문, 숫자 조합으로 구성하여야합니다.");
        					}
        					else{
        						alert('사용 가능한 아이디 입니다.');
        						 document.getElementById('ss_userid').style.border = "";
        						 document.getElementById("btn_ok").disabled = false;
        						 obj.style.color = "";
        					}
        				}
        			},
        			error:function(request,status,error){
        				alert("code:"+request.status+"\n"+"error:"+error);
        			},
        });
        }
</script>

<!-- 레이어 스크립트 -->
<script type="text/javascript">
function wrapWindowByMask(){
        // 화면의 높이와 너비를 변수로 만듭니다.
        var maskHeight = $(document).height();
        var maskWidth = $(window).width();
 
        // 마스크의 높이와 너비를 화면의 높이와 너비 변수로 설정합니다.
        $('.mask').css({'width':maskWidth,'height':maskHeight});
 
        // fade 애니메이션 : 1초 동안 검게 됐다가 80%의 불투명으로 변합니다.
        $('.mask').fadeIn(1000);
        $('.mask').fadeTo("slow",0.8);
 
        // 레이어 팝업을 가운데로 띄우기 위해 화면의 높이와 너비의 가운데 값과 스크롤 값을 더하여 변수로 만듭니다.
        var left = ( $(window).scrollLeft() + ( $(window).width() - $('.window').width()) / 2 );
        var top = ( $(window).scrollTop() + ( $(window).height() - $('.window').height()) / 2 );
 
        // css 스타일을 변경합니다.
       	$('.window').css({'left':left,'top':top, 'position':'absolute'});

        // 레이어 팝업을 띄웁니다.
        $('.window').show();
    }
 
    $(document).ready(function(){
         window.onload = wrapWindowByMask;
 
        // 닫기(close)를 눌렀을 때 작동합니다.
        $('.window .close').click(function (e) {
            e.preventDefault();
            $('.mask, .window').hide();
        });
 
        // 뒤 검은 마스크를 클릭시에도 모두 제거하도록 처리합니다.
        $('.mask').click(function () {
            $(this).hide();
            $('.window').hide();
        });
    });
</script>

<script type="text/javascript">
function selectMainSch(result){
 	if(result!=null){
		console.log("test:" + JSON.stringify(result));
		console.log("result.length==>" + result.length);
		$("#schRst_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("schRst_tbody"); 
			
			var iRow = (i+1);
			
			$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).attr('data-val', iRow); 			
			$("#schRst_tbody div#RNUM_DIV").eq(iRow).html(data.RNUM);
			$("#schRst_tbody div#ANIMAL_NUMBER_DIV").eq(iRow).html(data.MAI_ANICODE);
			$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
			$("#schRst_tbody div#ANIMAL_BNAME_DIV").eq(iRow).html(data.MAI_BNAME); 
			$("#schRst_tbody div#ANIMAL_GENDER_DIV").eq(iRow).html(data.MAI_GENDER); 
			$("#schRst_tbody div#ANIMAL_CAGE_DIV").eq(iRow).html(data.MAI_VVRMNO); 
			$("#schRst_tbody div#ANIMAL_STATUS").eq(iRow).html(data.MAI_CURSTS);
		}
		$("#schRst_tbody tr:first").attr('style',"display:none");
 	}
}

function fn_base_selectMainSch(param, callback, retObj) {
	fc_clearRow("schRst_tbody");
	var targetUrl = "/main/selectMainSch.do";
	var param = {
			schKeyword:$("#sch_tbody #schKeyword").val(),
			clsType : "1"
	};
	$.getJSON(targetUrl, param, function(result) {
		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

/* function fn_main_search(){
	var tt = document.getElementById("mainSearch").value; 
	var param = {
			mainSearch : $("#sch_tbody #mainSearch").val(),
			optType : $().va(),
			
	};
	
	
	
	if(tt == ''){
		alert('검색어가 없습니다.');
		return;
	}
	
} */

function fn_base_search(){
	var tt = document.getElementById("schKeyword").value; 	
	var param = {
			schType : $('#sch_tbody input:radio[name=schType]:checked').val()
	};
	console.log(param.schType);
	if(param.schType=="All"){
		fn_base_selectMainSch(param, selectMainSch);
	} else if(param.schType=="Name"){
		fc_clearRow("schRst_tbody");
		fn_base_selectMainSch2("", selectMainSch2);
	}else if(param.schType=="Vvrm"){
		fc_clearRow("schRst_tbody");
		fn_base_selectMainSch3("", selectMainSch3);
	}else if(param.schType=="Status"){
		fc_clearRow("schRst_tbody");
		fn_base_selectMainSch4("", selectMainSch4);
	}
	if(tt == ''){
		alert('검색어가 없습니다.');
		return;
	}
}
$(document).ready(function() {
});
</script>


<title>Main_사육담당자 및 팀장</title> 	
</head>

<body>
<div id="sub_wrap">
<jsp:include page="/header.do"></jsp:include>
	<!-- container-->
	<div id="container">
		<div id="contents_admin">
			<!-- left-->
			<div id="lnb_area">
			<jsp:include page="/lnb.do"></jsp:include>
			</div>
			
			 <!-- Modal(1) -->
			 <c:if test="${ss_userid == NULL}">
			 <%-- <c:if test="${ss_msu_aprv_yn == 'Y'}"> --%>
         <div class="modal" id="modal-one" aria-hidden="true">
        
            <div class="modal-dialog">
                <div class="modal-header">
                    <p>계정등록</p>
                    <P>동물관리시스템 아이디와 비밀번호를 등록하세요</p>
					<P>계정등록 화면은 최초 접속 1회에 한하여 나타납니다.</p>
                    <a href="#" class="btn-close" aria-hidden="true">x</a>
                </div>
                
                <div class="modal-body">
                  <form method="post" action="index.html" name="myform" >
                  <input type="hidden" id="ss_id" name="ss_id" value="${ss_gha_key }"/>
                  <table id="mytable">
                  
                  <tr>
                  <td align="left" >이름 </td>
                  <td>
                  <input type="text" id=txtName name="txtName" readonly="readonly" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"  value ="${ss_gha_username }" />
                  </td>
                  </tr>
                  
                  <tr>
                  <td align="left" >부서 </td>
                  <td>
                  <input type="text" id="txtDpt" name="txtDpt" readonly="readonly" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" value="${ss_gha_dptname }"  />
                  </td>
                  </tr>
                  
                  <tr>
                  <td align="left" >아이디 </td>
                  <td>
                  <input type="text" id="ss_userid" name="ss_userid" maxlength="20" style="ime-mode: disabled;"/>
                  </td>
                  <td>
                  <input type="button" value="중복체크" onclick="validate()" style="WIDTH: 60pt;" />
                  </td>
                  </tr>
                  
                  <tr>
                  <td align="left">비밀번호 </td>
                  <td>
                  <input type="password" id="pwd" name="pwd"/> 
                  </td>
                  </tr>
                  
                  <tr>
                  <td align="left">비밀번호 확인 </td>
                  <td>
                  <input type="password" id="txtPasswordConfirm" name = "txtPasswordConfirm"  />
                  </td>
                  
                  </tr>
                  </table>
                  
                  <div class="modal-footer">
                  <input type="button" value="확인" class="btn" id="btn_ok" onclick="fnm_regUser();">
                  </div>
                  </form>
                   </div>
            </div>
        </div>	
        </c:if>
        
                 <!-- Modal(2) -->
       <c:if test="${ss_msu_aprv_yn == 'N'}">
         <div class="modal" id="modal-two" aria-hidden="true">
            <div class="modal-dialog">
            
                <div class="modal-header">
                    <p>비밀번호 등록</p>
                    <P>비밀번호를 초기화 하였습니다.</p>
					<P>비밀번호를 다시 등록하세요.</p>
                    <a href="#" class="btn-close" aria-hidden="true"></a>
                </div>
                
                <div class="modal-body">
                  <form method="post" action="index.html" name="myform2">
                  <input type="hidden" id="ss_id" name="ss_id" value="${ss_gha_key }"/>
                  <table id="mytable2">
                  
                  <tr>
                   <td align="left" >이름 </td>
                   <td>
                   <input type="text" id=txtName name="txtName" readonly="readonly" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"  value ="${ss_gha_username }" />
                   </td>
                   </tr>
                   
                   <tr>
                   <td align="left" >부서 </td>
                   <td>
                   <input type="text" id="txtDpt" name="txtDpt" readonly="readonly" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" value="${ss_gha_dptname }"  />
                   </td>
                   </tr>
                   
                   <tr>
                   <td align="left" >아이디 </td>
                   <td>
                   <input type="text" id="userid" name="userid" readonly="readonly" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" value="${ss_userid }"/>
                   </td>
                   </tr>

                   <tr>
                   <td align="left">비일번호 </td>
                   <td>
                   <input type="password" id="pwd2" name="pwd2" /> 
                   </td>
                   </tr>
                   
                   <tr>
                   <td align="left">비밀번호 확인 </td>
                   <td>
                   <input type="password" id="cpwd" name = "cpwd"  />
                   </td>
                   </tr>
                   </table>
                   
                   <div class="modal-footer">
                   <input type="button" value="확인" class="btn" id="btn_ok2" onclick="fnm_crSysUsr();">
                   </div>
                   </form>
                </div>
            </div>
        </div>		 
        
        </c:if>
        
			<section id="contents_area">
			<!-- contents-->
				<!-- search_area -->
				<h2>통합검색</h2>
				<div class="search_area" style="margin-top:30px; margin-right:200px">
				<form method="post" action="/main/mainSearch.do">
					<div class="search_box right">
						<span class="sel_box1">
							<select style="width:120px;" title="검색조건 선택">
								<option>통합검색</option>
								<option id="optType" value="title">제목</option>
								<option id="optType" value="content">내용</option>
							</select>
						</span> 
						<input name="mainSearch" type="text" id="mainSearch" class="textfield" style="width:400px;"/>
						<input type="submit" value="검색" class="search_btn">
					</div>
					</form>
				</div>
				<!-- // search_area -->
				<div class="admin_wrap">
					<h2>결재상황</h2>
					<div class="admin_box">
						<p class="admin_title">진행현황</p>
						<ul class="admin_pay">
							<li><a href="#none"><img src="/images/wait_icon.png" alt=""><p>결재대기</p><p class="text_num">${kjInfo.CNT_X}건</p></a></li>
							<li><a href="#none"><img src="/images/ing_icon.png" alt=""><p>결재진행</p><p class="text_num">${kjInfo.CNT_P}건</p></a></li>
							<li><a href="#none"><img src="/images/end_icon.png" alt=""><p>결재완료</p><p class="text_num">${kjInfo.CNT_E}건</p></a></li>
							<li><a href="#none"><img src="/images/refer_icon.png" alt=""><p>공람(참조)</p><p class="text_num">${kjInfo.CNT_NOTI}건</p></a></li>
						</ul>
					</div>
					<h2>전자결재 최근글</h2>
					<div class="admin_box">
						<dl>
							<dt id="bg_1">전자결재</dt>
							<dd>
								<ul>
								<c:forEach items="${kjList}" var="kj">
									<li><a href="#none"><span class="tit">${kj.BDC_DOCCMNT}</span><span class="date">${kj.BRN_KJDATE}</span></a></li>
								</c:forEach>
								</ul>
								<a href="#none" class="btn_more">+ 더보기</a>								
							</dd>
						</dl>
					</div>
					<h2>공지사항 최근글</h2>
					<div class="admin_box" style="margin:0;">
						<dl>
							<dt id="bg_2">공지사항</dt>
							<dd>
								<ul>
								<c:forEach items="${gb }" var="board">
								<%-- <fmt:parseDate value="${board.CMN_MAK_DATE}" pattern="yyyy-MM-dd HH:mm:ss.S" var="myDate"/> --%>
								<%-- <fmt:formatDate value="${board.CMN_MAK_DATE} }" pattern="yyyy.MM.dd"/> --%>
									<li>
									<a href="#none">
									<span class="tit">${board.BBI_TIT }</span>
									<span class="date">${board.CMN_MAK_DATE }</span>
									</a>
									</li>
									</c:forEach>
								</ul>
								<a href="/biz/0202/main_Article.do" class="btn_more">+ 더보기</a>								
							</dd>
						</dl>
					</div>
				</div>
				
			<div class="admin_box2">
				<!-- tab_menu -->
				<div class="tab_menu" style="margin-top:0px;">
					<ul>
						<li class="on"><a href="#tab01">동물현황</a></li>
						<li><a href="#tab02">번식현황</a></li>
						<li><a href="#tab03">폐사현황</a></li>
					</ul>
				</div>
				<!-- // tab_menu -->

				<!-- tab01 -->	
				<div class="tab_cont" id="tab01">	
					<h2>그래프</h2>
					<div id="tab1_chart1" class="main_admin aniinfo_add"></div>
					<script>
						var options = {
							'legend':{
								names: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월',],
									},
							'dataset':{
								title:'동물현황 그래프', 
								values: [[277,147, 66,30,8], [276,153, 66,24,11], [349,192, 45,50,3], [358,186,76,50,10], [348, 185, 76,50,15], [356, 148,83,45,8], [356, 148,83,48,5],[276,153, 66,24,11], [349,162, 45,50,3], [358,186,96,50,10], [408, 185, 86,70,15], [406, 148,83,45,8]],
								colorset: ['#30a1ce','#DC143C', '#FF8C00','#888','#1dbc7e','#DC143C'],
								fields:['동물수', '천연기념물', 'CITES', '갑을병', '멸종위기']
							},
							'chartDiv' : 'tab1_chart1',
							'chartType' : 'line',
							'leftOffsetValue': 50,
							'bottomOffsetValue': 40,
							'chartSize' : {width:950, height:350},
							'minValue' : 0,
							'maxValue' : 500,
							'increment' : 100
						};

						Nwagon.chart(options);
					</script>	
					<!--  조회 -->
					<div class="aniinfo_search_box main_admin" >
						<table class="aniinfo_search" >
							<caption>조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
							<tbody id="sch_tbody">
								<tr>
									<th scope="row" rowspan="2" style="vertical-align:middle;">동물 검색</th>
									<td>
										<p>
										<label><input type="radio" id="schType" name="schType" value="All" class="search_radio" checked="checked"/>전체</label>
                                  		<label><input type="radio" id="schType" name="schType" value="Name" class="search_radio" />명칭</label>
                                  		<label><input type="radio" id="schType" name="schType" value="Vvrm" class="search_radio" />동물사</label>
										</p>
									</td>
								</tr>
								<tr>
									<td><input name="schKeyword" type="text" id="schKeyword" class="textfield" style="width:90%"/><label for="schKeyword"></label></td>
								</tr>
								<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_base_search();" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					<!-- //조회 -->

					<!-- 표 -->
					<table class="aniinfo_add main_admin" >
						<caption>현황</caption>
						<colgroup>
							<col style="width:5%;">
							<col style="width:15%;">
							<col style="width:20%;">
							<col style="width:20%;">
							<col style="width:10%;">
							<col style="width:15%;">
							<col style="width:15%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">No</th>
								<th scope="col">동물번호</th>
								<th scope="col">동물명칭</th>
								<th scope="col">별명</th>
								<th scope="col">성별</th>
								<th scope="col">동물사</th>
								<th scope="col">상태</th>
							</tr>
						</thead>
						<tbody id="schRst_tbody">
							<tr>
								<td><div id="RNUM_DIV" data-val=''></div></td>
								<td><div id="ANIMAL_NUMBER_DIV" data-val=''></div></td>
								<td><div id="MAC_NAME_DIV" data-val=''></div></td>
								<td><div id="ANIMAL_BNAME_DIV" data-val=''></div></td>
								<td><div id="ANIMAL_GENDER_DIV" data-val=''></div></td>
								<td><div id="ANIMAL_CAGE_DIV" data-val=''></div></td>
								<td><div id="ANIMAL_STATUS" data-val=''></div></td>
							</tr>
						</tbody>
					</table>
					<!-- //표 -->

				</div>
				<!-- //tab01 -->
				<!-- tab02 -->	
				<div class="tab_cont" id="tab02">	
					<h2>그래프</h2>
					<div id="tab2_chart1" class="main_admin aniinfo_add"></div>
					<script>
						var options = {
							'legend':{
								names: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월',],
									},
							'dataset':{
								title:'동물현황 그래프', 
								values: [[277,147, 66,30,8], [276,153, 66,24,11], [349,192, 45,50,3], [358,186,76,50,10], [348, 185, 76,50,15], [356, 148,83,45,8], [356, 148,83,48,5],[276,153, 66,24,11], [349,162, 45,50,3], [358,186,96,50,10], [408, 185, 86,70,15], [406, 148,83,45,8]],
								colorset: ['#30a1ce','#DC143C', '#FF8C00','#888','#1dbc7e','#DC143C'],
								fields:['동물수', '천연기념물', 'CITES', '갑을병', '멸종위기']
							},
							'chartDiv' : 'tab2_chart1',
							'chartType' : 'line',
							'leftOffsetValue': 50,
							'bottomOffsetValue': 40,
							'chartSize' : {width:950, height:350},
							'minValue' : 0,
							'maxValue' : 500,
							'increment' : 100
						};

						Nwagon.chart(options);
					</script>	
					<!--  조회 -->
					<div class="aniinfo_search_box main_admin" >
						<table class="aniinfo_search" >
							<caption>조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
							 <tbody id="sch_tbody">
								<tr>
									<th scope="row" rowspan="2" style="vertical-align:middle;">동물종 검색</th>
									<td>
										<p>
										  <label><input type="radio" name="align" value="전체" class="search_radio type1"/>전체</label>
										  <label><input type="radio" name="align" value="부서" class="search_radio"/>부서</label>
										</p>
									</td>
								</tr>
								<tr>
									<td><input name="schKeyword" type="text" id="schKeyword" class="textfield"><label for="seach_text2"></label></td>
								</tr>
								<tr><th colspan="2" scope="col" class="search_btn_area"><a href="#" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					<!-- //조회 -->

					<!-- 표 -->
					<table class="aniinfo_add main_admin" >
						<caption>현황</caption>
						<colgroup>
							<col style="width:5%;">
							<col style="width:15%;">
							<col style="width:20%;">
							<col style="width:20%;">
							<col style="width:10%;">
							<col style="width:15%;">
							<col style="width:15%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">No</th>
								<th scope="col">동물번호</th>
								<th scope="col">동물명칭</th>
								<th scope="col">별명</th>
								<th scope="col">성별</th>
								<th scope="col">동물사</th>
								<th scope="col">상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>100001</td>
								<td>시베리아호랑이</td>
								<td>호돌이</td>
								<td>수</td>
								<td>동물복지1과</td>
								<td>정상</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>100001</td>
								<td>시베리아호랑이</td>
								<td>호돌이</td>
								<td>수</td>
								<td>동물복지1과</td>
								<td>정상</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>100001</td>
								<td>시베리아호랑이</td>
								<td>호돌이</td>
								<td>수</td>
								<td>동물복지1과</td>
								<td>정상</td>
							</tr>
							<tr>
								<th scope="row">4</th>
								<td>100001</td>
								<td>시베리아호랑이</td>
								<td>호돌이</td>
								<td>수</td>
								<td>동물복지1과</td>
								<td>정상</td>
							</tr>
							<tr>
								<th scope="row">5</th>
								<td>100001</td>
								<td>시베리아호랑이</td>
								<td>호돌이</td>
								<td>수</td>
								<td>동물복지1과</td>
								<td>정상</td>
							</tr>
						</tbody>
					</table>
					<!-- //표 -->

				</div>
				<!-- //tab02 -->
				<!-- tab03 -->	
				<div class="tab_cont" id="tab03">	
					<h2>그래프</h2>
					<div id="tab3_chart1" class="main_admin aniinfo_add"></div>
					<script>
						var options = {
							'legend':{
								names: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월',],
									},
							'dataset':{
								title:'동물현황 그래프', 
								values: [[277,147, 66,30,8], [276,153, 66,24,11], [349,192, 45,50,3], [358,186,76,50,10], [348, 185, 76,50,15], [356, 148,83,45,8], [356, 148,83,48,5],[276,153, 66,24,11], [349,162, 45,50,3], [358,186,96,50,10], [408, 185, 86,70,15], [406, 148,83,45,8]],
								colorset: ['#30a1ce','#DC143C', '#FF8C00','#888','#1dbc7e','#DC143C'],
								fields:['동물수', '천연기념물', 'CITES', '갑을병', '멸종위기']
							},
							'chartDiv' : 'tab3_chart1',
							'chartType' : 'line',
							'leftOffsetValue': 50,
							'bottomOffsetValue': 40,
							'chartSize' : {width:950, height:350},
							'minValue' : 0,
							'maxValue' : 500,
							'increment' : 100
						};

						Nwagon.chart(options);
					</script>	
					<!--  조회 -->
					<div class="aniinfo_search_box main_admin" >
						<table class="aniinfo_search" >
							<caption>조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" rowspan="2" style="vertical-align:middle;">동물종 검색</th>
									<td>
										<p>
										  <label><input type="radio" name="align" value="전체" class="search_radio type1"/>전체</label>
										  <label><input type="radio" name="align" value="부서" class="search_radio"/>부서</label>
										</p>
									</td>
								</tr>
								<tr>
									<td><input name="textfield" type="text" id="seach_text3" class="textfield"><label for="seach_text3"></label></td>
								</tr>
								<tr><th colspan="2" scope="col" class="search_btn_area"><a href="#" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					<!-- //조회 -->

					<!-- 표 -->
					<table class="aniinfo_add main_admin" >
						<caption>현황</caption>
						<colgroup>
							<col style="width:5%;">
							<col style="width:15%;">
							<col style="width:20%;">
							<col style="width:20%;">
							<col style="width:10%;">
							<col style="width:15%;">
							<col style="width:15%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">No</th>
								<th scope="col">동물번호</th>
								<th scope="col">동물명칭</th>
								<th scope="col">별명</th>
								<th scope="col">성별</th>
								<th scope="col">동물사</th>
								<th scope="col">상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>100001</td>
								<td>시베리아호랑이</td>
								<td>호돌이</td>
								<td>수</td>
								<td>동물복지1과</td>
								<td>정상</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>100001</td>
								<td>시베리아호랑이</td>
								<td>호돌이</td>
								<td>수</td>
								<td>동물복지1과</td>
								<td>정상</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>100001</td>
								<td>시베리아호랑이</td>
								<td>호돌이</td>
								<td>수</td>
								<td>동물복지1과</td>
								<td>정상</td>
							</tr>
							<tr>
								<th scope="row">4</th>
								<td>100001</td>
								<td>시베리아호랑이</td>
								<td>호돌이</td>
								<td>수</td>
								<td>동물복지1과</td>
								<td>정상</td>
							</tr>
							<tr>
								<th scope="row">5</th>
								<td>100001</td>
								<td>시베리아호랑이</td>
								<td>호돌이</td>
								<td>수</td>
								<td>동물복지1과</td>
								<td>정상</td>
							</tr>
						</tbody>
					</table>
					<!-- //표 -->

				</div>
				<!-- //tab03 -->
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