<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<meta http-equiv="X-UA-Compatible" content="IE=Edge;" />
<%
if(session.getAttribute("ss_id")==null){
%>
<jsp:forward page="/index.do"></jsp:forward>
<%
}
%>
<script src="/js/html5shiv.js"></script>
<script>
	// 추가/수정/삭제 권한 전역변수
	var gb_ss_menu_pms = {};
	var gb_ss_is_vm = "";
	var gb_ss_auth_grp = '${sessionScope['ss_auth_grp']}';
	var console = window.console || { log:function(){} };
	<c:if test="${sessionScope['ss_menu_pms'] != NULL}">
		gb_ss_menu_pms = ${sessionScope["ss_menu_pms"]};
	</c:if>
	<c:if test="${sessionScope['ss_is_vm'] != NULL}">
		gb_ss_is_vm = '${sessionScope["ss_is_vm"]}';
	</c:if>
	function fn_is_pms_upd(progid){
		var isPmsUpd = false;
		<c:if test="${sessionScope['ss_auth_grp'] == 'SA'}">
			return true;
		</c:if>
 		for(var i=0; i< gb_ss_menu_pms.length; i++){
				console.log(gb_ss_menu_pms[i]);
 			if(progid==gb_ss_menu_pms[i].MUP_PROGID){
 				console.log(gb_ss_menu_pms[i].MUP_PROGID + "::" + gb_ss_menu_pms[i].MUP_UPDLVL);
 				if(gb_ss_menu_pms[i].MUP_UPDLVL=="1"){
	 				var isPmsUpd = true;
	 				break;
 				}
			}
		}
 		return isPmsUpd;
 	}
	function fn_is_vm(){
		if(	gb_ss_is_vm == "Y" ){
			return true;
		}else{
			return false;
		}	
 	}
	$(document).ready(function() {
		// 업무별 매뉴얼(0201) 권한 test
		console.log("0201::MUP_UPDLVL::" + fn_is_pms_upd("0201"));
		console.log("fn_is_vm()::" + fn_is_vm());
	});
	
</script>
<!-- accessibility -->
<ul class="accessibility">
	<li><a href="#">메뉴바로가기</a></li>
	<li><a href="#">본문바로가기</a></li>
	<li><a href="#footer">하단바로가기</a></li>
</ul>
<!-- //accessibility-->
<!-- header -->
<div id="header_wrap">
	<header id="sub_header">
		<h1 id="logo_sub">
			<a href="/index.do"><img src="${pageContext.request.contextPath}/images/logo_sub.gif" alt="서울대공원동물관리시스템"></a>
		</h1>
	</header>
	<%-- <c:if test="${sessionScope['ss_auth_grp'] == 'SA'}">
	GEIT테스트1(시스템관리자) <label style="font-weight: bold;"><a href="/common/ams2logIn.do?ss_gha_key=GEIT000000001">[로그인]</a></label><BR>
	GEIT테스트2(동물복지1과) <label style="font-weight: bold;"><a href="/common/ams2logIn.do?ss_gha_key=GEIT000000002">[로그인]</a></label><BR>
	GEIT테스트3(동물복지2과) <label style="font-weight: bold;"><a href="/common/ams2logIn.do?ss_gha_key=GEIT000000003">[로그인]</a></label><BR>
	GEIT테스트4(종보전연구실-병리방역팀) <label style="font-weight: bold;"><a href="/common/ams2logIn.do?ss_gha_key=GEIT000000004">[로그인]</a></label><BR>
	GEIT테스트5(종보전연구실-진료팀) <label style="font-weight: bold;"><a href="/common/ams2logIn.do?ss_gha_key=GEIT000000005">[로그인]</a></label><BR>
	</c:if> --%>
</div>
<!-- //header -->