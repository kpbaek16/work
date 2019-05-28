<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge;"/>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<script src="/js/jquery-1.7.2.min.js"></script> <!-- Lnb 스크립트-->
<script src="/js/common/sha256.js"></script> <!-- Lnb 스크립트-->
<script src="/js/common/common.js"></script> <!-- Lnb 스크립트-->
<script type="text/javascript" src="/js/contents/base.js"></script>
<script src='/js/contents/Nwagon.js'></script>
<script src="/js/html5shiv.js"></script>
<script src="/js/common/json2.js"></script>
<link rel="stylesheet" href="/css/ui/reset.css">
<link rel="stylesheet" href="/css/style_index.css">
<link rel="stylesheet" href="/css/ui/sub_layout.css">
<link rel="stylesheet" href="/css/ui/layer.css">
<link rel="stylesheet" href="/css/ui/modal.css">
<link rel="stylesheet" href="/css/base/contents.css">
<link rel='stylesheet' href='/css/base/Nwagon.css' type='text/css'>


<!-- 모달 스크립트  -->
<script type="text/javascript">
$( document ).ready( function() {
    $('.modal').addClass('loaded');
    $('.btn-close').click( function() {
    	$('.modal').removeClass('loaded');
    	});	
    
    $('#btn_ok').click( function () {
    	var pwd = document.getElementById("pwd").value;
    	var form = document.myform;
    	
    	if(form.ss_userid.value=="") {
    		   alert("아이디는 필수 입력입니다.");
    		   form.ss_userid.focus();
    		   return;
    	}
    	
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
        						/*  obj.style.color = ""; */
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
function login(){
	var form = document.loginForm;
	var uid = document.getElementById("userid").value;
	var lpwd = document.getElementById("lpwd").value;
	
	var validate = function validate(data){
		if(data!=null){
			if("${sessionScope['ss_userid']}" == null || "${sessionScope['${ss_msu_aprv_yn}']}" !="Y"){
		 		location.replace("/main/L_Main_Admin.do");
			}else{
				location.replace("/index.do");
			}
			return;
	 	}else if(form.userid.value==""){
	 		 alert("아이디는 필수 입력입니다.");
    		   form.ss_userid.focus();
    		   return;
	 	}else if(form.lpwd.value==""){
	    	   alert("비밀번호는 필수 입력입니다.");
	    	   form.lpwd.focus();
	    	   return;
	 	}
	 	else if(!/^[a-zA-Z0-9]{8,15}$/.test(lpwd)){
	   		  alert('비밀번호는 숫자와 영문자 조합으로 8~15자리를 사용해야 합니다.');
	   		  form.lpwd.focus();
	   		  return;
	   		  }
	 	else if (uid.length < 6 || uid.length > 20) {
		    alert("아이디는 6자 이상, 20자 이하여야합니다.");
		    form.uid.focus()
		    return;
		}
	 	else if (/[^a-z0-9]+|^([a-z]+|[0-9]+)$/i.test(uid)) {
			   alert("아이디는 영문, 숫자 조합으로 구성하여야합니다.");
			   form.uid.focus()
			   return;
		}
	 	else{
	 		alert("아이디 또는 비밀번호를 다시 확인하세요. 등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.");
	 	}
	}

	fc_logInAjax($("#userid").val(), $("#lpwd").val(), validate);
}

$(document).ready(function() {
	
});
</script>

<title>Main_사육담당자 및 팀장</title> 	
</head>

<body>
<div id="sub_wrap">
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
                  <input type="hidden" id="ss_id" name="ss_id" value="${sessionScope['ss_gha_key']}"/>
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
                  <input type="button" value="확인" class="btn" id="btn_ok">
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
                    <a href="#" class="btn-close" aria-hidden="true">x</a>
                </div>
                
                <div class="modal-body">
                  <form method="post" action="index.html" name="myform2">
                  <input type="hidden" id="ss_id" name="ss_id" value="${sessionScope['ss_id']}"/>
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
        
<div id="index_wrap">
	<div id="index_header_wrap">
		<!--상단영역시작-->
		<header>
			<h1 id="logo_index">
				<a href="/main/L_Main_User.do"><img src="/images/logo_index.png" alt="서울대공원동물관리시스템"></a>
			</h1>
			
			<form action="self_certification.do" id="loginForm" name="loginForm" method="POST">
				<div id="login_box">
					<!-- 	<h2>로그인영역</h2> -->
					<ul id="login">
						<li><input class="input_text" id="userid" name="userid" type="text" title="아이디입력" placeholder="아이디" maxlength="20" style='ime-mode: disabled'></li>
						<li><input class="input_text" id="lpwd" name="lpwd" type="password" title="비밀번호입력" placeholder="비밀번호"></li>
					</ul>
					<button type="button" onclick="login();">
						<img src="/images/login_text.gif" alt="로그인">
					</button>
				</div>
			</form>
		</header>
		</div>
		<!--비주얼영역시작-->
		<section id="main_visual">
			<div id="visual_wrap">
				<div id="visual">
					<img src="/images/visual_img.gif" alt="이달의동물">
				</div>
			</div>
		</section>
		<!--하단영역시작-->

<jsp:include page="/footer.do"></jsp:include>
		</div>
</div>

</body>
</html>