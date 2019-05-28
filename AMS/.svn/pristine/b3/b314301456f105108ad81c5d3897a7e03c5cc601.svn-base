<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/style_index.css">
<script src="/js/jquery-1.7.2.min.js"></script>
<script src="/js/common/common.js"></script>
<script src="/js/common/sha256.js"></script>
<script src="/js/common/json2.js"></script>
<script src="/js/html5shiv.js"></script>
<script type="text/javascript">
//var console = window.console || { log:function(){} };
</script>

<title>서울대공원동물관리시스템</title>
</head>

<style type="text/css">
.input[type=text] {
	-webkit-ime-mode: disabled;
	-moz-ime-mode: disabled;
	-ms-ime-mode: disabled;
	ime-mode: disabled;
}
</style>

<script type="text/javascript">
	function login(){
		var form = document.loginForm;
		var uid = document.getElementById("userid").value;
		var pwd = document.getElementById("pwd").value;
		var validate = function validate(data){
			if(data!=null){
				
				if(data.MSU_USERID == null || data.MSU_APRV_YN !="Y"){
			 		location.replace("/main/L_Main_User.do");
				}else{
					location.replace("/index.do");
				}
				return ;
		 	}else if(form.userid.value==""){
		 		 alert("아이디는 필수 입력입니다.");
	    		   form.ss_userid.focus();
	    		   return;
		 	}else if(form.pwd.value==""){
		    	   alert("비밀번호는 필수 입력입니다.");
		    	   form.pwd.focus();
		    	   return;
		 	}
		 	else if(!/^[a-zA-Z0-9]{8,15}$/.test(pwd)){
		   		  alert('비밀번호는 숫자와 영문자 조합으로 8~15자리를 사용해야 합니다.');
		   		  form.pwd.focus();
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

		fc_logInAjax($("#userid").val(), $("#pwd").val(), validate);
	}
</script>
<body>
	<div id="index_wrap">
	<div id="index_header_wrap">
		<!--상단영역시작-->
		<c:if test="${ss_gha_key != NULL }">
		<header>
			<h1 id="logo_index">
				<a href="/main/L_Main_User.do"><img src="/images/logo_index.png" alt="서울대공원동물관리시스템"></a>
			</h1>
			
			
			<form action="self_certification.do" id="loginForm" name="loginForm" method="POST">
				<div id="login_box">
					<!-- 	<h2>로그인영역</h2> -->
					<ul id="login">
						<li><input class="input_text" id="userid" name="userid" type="text" title="아이디입력" placeholder="아이디" maxlength="20" style='ime-mode: disabled'></li>
						<li><input class="input_text" id="pwd" name="pwd" type="password" title="비밀번호입력" placeholder="비밀번호"></li>
					</ul>
					<button type="button" onclick="login();">
						<img src="${pageContext.request.contextPath}/images/login_text.gif" alt="로그인">
					</button>
					<!--<div id="login_btn"><img src="../images/login_text.gif" alt="로그인"></div>-->
				</div>
			</form>
		</header>
		</c:if>
		
		<c:if test="${ss_gha_key == NULL }">
		<header>
			<h1 id="logo_index">
				<img src="/images/logo_index.png" alt="서울대공원동물관리시스템">
			</h1>
			
			
			<form action="self_certification.do" id="loginForm" name="loginForm" method="POST">
				<div id="login_box">
					<!-- 	<h2>로그인영역</h2> -->
					<ul id="login">
						<li><input class="input_text" id="userid" name="userid" type="text" title="아이디입력" placeholder="아이디" maxlength="20" style='ime-mode: disabled'></li>
						<li><input class="input_text" id="pwd" name="pwd" type="password" title="비밀번호입력" placeholder="비밀번호"></li>
					</ul>
					<button type="button" onclick="login();">
						<img src="${pageContext.request.contextPath}/images/login_text.gif" alt="로그인">
					</button>
					<!--<div id="login_btn"><img src="../images/login_text.gif" alt="로그인"></div>-->
				</div>
			</form>
		</header>
		</c:if>
		
		</div>
		<!--비주얼영역시작-->
		<section id="main_visual">
			 <h2>테스트 영역<br>
			최종반영일: 2017.08.11.(사육일지)<br>
			GEIT테스트1(시스템관리자) <a href="/common/ams2logIn.do?ss_gha_key=GEIT000000001">로그인</a><BR>
	        GEIT테스트2(사육관리팀장) <a href="/common/ams2logIn.do?ss_gha_key=GEIT000000002">로그인</a><BR>
	        GEIT테스트3(동물사관리자) <a href="/common/ams2logIn.do?ss_gha_key=GEIT000000003">로그인</a><BR>
	        GEIT테스트4(종보전연구실-병리방역팀) <a href="/common/ams2logIn.do?ss_gha_key=GEIT000000004">로그인</a><BR>
	        GEIT테스트5(종보전연구실-진료팀) <a href="/common/ams2logIn.do?ss_gha_key=GEIT000000005">로그인</a><BR>
	        GEIT테스트6(동물정보담당자) <a href="/common/ams2logIn.do?ss_gha_key=GEIT000000006">로그인</a><BR>
			</h2>	
			<%--이 주석은 소스보기에서 안보임 --%>
			<div id="visual_wrap">
				<div id="visual">
					<img src="${pageContext.request.contextPath}/images/visual_img.gif" alt="이달의동물">
				</div>
			</div>
		</section>
		
		<!--하단영역시작-->
		<jsp:include page="/footer.do"></jsp:include>
		</div>
</body>
</html>
