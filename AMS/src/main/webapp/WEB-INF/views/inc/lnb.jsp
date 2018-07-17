<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<script type="text/javascript" src="/js/ui/lnb_slide.js"></script>
<script src="/js/common/json2.js"></script>
<div id="lnb_area">
	<!-- mypage -->
	<section id="mypage">
		<h2>나의정보</h2>
		<ul class="mypage_list">
			<li class="my_img"><img src="/images/my_icon.gif" alt="프로필이미지"></li>
			<li>${sessionScope['ss_gha_username']} 님</li>
			<li>최종접속일자 : <fmt:formatDate value="<%=new Date() %>" pattern="yyyy. MM. dd."/></li>
			<li class="logout_btn"><a href="javascript:fc_logOut();"><img src="/images/logout_icon.png" alt=""> 로그아웃</a></li>
		</ul>
	</section>
	<!-- //mypage -->
	<!-- lnb -->
	<section id="lnb">
		<h2>좌측메뉴</h2>
		<nav class="lnbMenu_wrap">
			<ul class="lnbMenu">
				<li><a href="#" class="selected">기준정보관리</a>
					<ul class="lnbSub_list">
			<c:if test="${sessionScope['ss_auth_grp'] == 'SA'}">
						<li><a href="/base/0101/main.do" class="sub_selected">시스템정보</a></li>
						<li><a href="/base/0102/main.do">공통코드</a></li>
			</c:if>
						<li><a href="/base/0103/main.do">부서/팀</a></li>
			<c:if test="${sessionScope['ss_auth_grp'] == 'SA' or sessionScope['ss_auth_grp'] == 'AM'}">
						<li><a href="/base/0104/main.do">직원</a></li>
			</c:if>
						<li><a href="/base/0105/main.do">동물사</a></li>
						<li><a href="/base/0106/main.do">동물그룹</a></li>
						<li><a href="/base/0107/main.do">동물정보</a></li>
			<c:if test="${sessionScope['ss_auth_grp'] != 'MU'}">
						<li><a href="/base/0108/sub.do">혈액검사항목</a></li>
						<li><a href="/base/0108/main.do">혈액검사기준치</a></li>
						<li><a href="/base/0109/main.do">백신정보</a></li>
						<li><a href="/base/0110/main.do">약품정보</a></li>
			</c:if>
			<c:if test="${sessionScope['ss_auth_grp'] == 'SA' or sessionScope['ss_auth_grp'] == 'AM'}">
						<li><a href="/base/0120/main.do">권한관리</a></li>
			</c:if>
					</ul></li>
				<li><a href="#">전자결재</a>
					<ul class="lnbSub_list">
						<li><a href="/sign/0701/SIGN_INFO.do">문서관리</a></li>
						<li><a href="/sign/0701/CONN_SIGN_INFO.do">연계문서</a></li>
					</ul>
			    </li>
			<c:if test="${sessionScope['ss_auth_grp'] != 'MU' or sessionScope['ss_is_vm'] == 'Y'}">
				<li><a href="#">동물사육업무</a>
					<ul class="lnbSub_list">
					<c:if test="${sessionScope['ss_auth_grp'] != 'JW' and sessionScope['ss_auth_grp'] != 'BW'}">
						<li><a href="/jour/0301/main.do">사육일지</a></li>
						<li><a href="/jour/0303/main.do">번식보고서</a></li>
					</c:if>
						<li><a href="/jour/0304/main.do">폐사보고서</a></li>
					</ul>
				</li>
			</c:if>
			<c:if test="${sessionScope['ss_auth_grp'] == 'SA' or sessionScope['ss_auth_grp'] == 'AM' or sessionScope['ss_auth_grp'] == 'JW' or sessionScope['ss_auth_grp'] == 'BW' or sessionScope['ss_auth_grp'] == 'MM'}">
				<li><a href="#">동물진료업무</a>
					<ul class="lnbSub_list">
						<li><a href="/treat/0401/main.do">보건일지</a></li>
						<li><a href="/treat/0402/JINRYO_RCT_INFO.do">진료요청/접수</a></li>
						<li><a href="/treat/0403/main.do">진료일지</a></li>
						<li><a href="/treat/0404/main.do">처방전</a></li>
						<li><a href="/treat/0405/main.do">마취내역</a></li>
						<li><a href="/treat/0406/main.do">검사관리</a></li>
					</ul>
				</li>
			</c:if>
			<c:if test="${sessionScope['ss_auth_grp'] == 'SA' or sessionScope['ss_auth_grp'] == 'JW' or sessionScope['ss_auth_grp'] == 'BW' or sessionScope['ss_auth_grp'] == 'MM'}">
				<li><a href="#">병리방역업무</a>
					<ul class="lnbSub_list">
			<!-- 병리방역팀(동물병원/종보전연구실) -->
				<c:if test="${sessionScope['ss_teamno'] == '26' or sessionScope['ss_teamno'] == '39'}">
						<li><a href="/prevent/0501/main.do">부검결과서</a></li>
						<!-- <li><a href="/prevent/0501/view0501F.do">검사관리</a></li> -->
				</c:if>
						<li><a href="/prevent/0503/main.do">백신접종관리</a></li>
					</ul>
				</li>
			</c:if>
				<li><a href="#">현황조회</a>
					<ul class="lnbSub_list">
						<li><a href="/stat/0601/main.do">분류군별현황</a></li>
						<li><a href="/stat/0611/main.do">종별현황</a></li>
						<li><a href="/stat/0602/main.do">동물사별현황</a></li>
						<li><a href="/stat/0612/main.do">인식기별현황</a></li>
						<li><a href="/stat/0607/main.do">번식현황</a></li>
			<c:if test="${sessionScope['ss_auth_grp'] == 'SA' or sessionScope['ss_auth_grp'] == 'AM' or sessionScope['ss_auth_grp'] == 'JW' or sessionScope['ss_auth_grp'] == 'BW'}">
						<li><a href="/stat/0608/main.do">폐사현황</a></li>
			</c:if>
						<li><a href="/stat/0605/main.do">보육현황</a></li>
						<li><a href="/stat/0606/main.do">임대현황</a></li>
						<li><a href="/stat/0610/main.do">동물월보</a></li>
						<li><a href="/stat/0609/main.do">반출입현황</a></li>
						<li><a href="/stat/0604/main.do">증감현황</a></li>
					</ul></li>
				<li><a href="#">이력정보</a>
					<ul class="lnbSub_list">
						<li><a href="/his/0701/main.do">동물이력</a></li>
						<li><a href="/his/0702/main.do" id="last_subMenu">직원이력</a></li>
						<li><a href="/his/0703/main.do" id="last_subMenu">동물사이력</a></li>
					</ul></li>
				<li><a href="#">업무정보</a>
					<ul class="lnbSub_list">
						<li><a href="/biz/0202/main_Manual.do">업무별 매뉴얼</a></li>
						<li><a href="/biz/0202/main_Article.do">업무게시판</a></li>
					</ul></li>
			</ul>
		</nav>
	</section>
	<!-- //lnb -->
</div>