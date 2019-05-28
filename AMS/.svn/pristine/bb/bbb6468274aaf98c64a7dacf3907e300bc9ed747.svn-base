<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
    <title>서울대공원 동물관리시스템</title>
</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="200"></td>
  </tr>
  <tr>
    <td align="center">
     <table width="670" border="0" cellpadding="1" cellspacing="1" bgcolor="#bfa980">
      <tr>
        <td height="200" align="center" bgcolor="#FFFFFF">
        <table width="650" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="208"><img src="/images/error.gif"></td>
            <td width="650" align="left">
                <h2>
                    삭제된 사용자키 정보입니다.<br /><br />
			<c:if test="${sessionScope['GHA_KEY'] == ''}">
                    행정포탈 인증후 사용하시기 바랍니다.            
			</c:if>
                </h2>
            </td>
          </tr>
        </table>
        </td>
      </tr>
    </table>
     <table width="670" border="0" cellpadding="1" cellspacing="1" bgcolor="#bfa980">
      <tr>
        <td height="200" align="center" bgcolor="#FFFFFF">
	        <h2>행정포탈 가상링크<BR></h2>
	        <h3>
			GEIT테스트1 <a href="/common/testlogIn.do?ss_gha_key=GEIT000000001">로그인</a><BR>
	        GEIT테스트2 <a href="/common/testlogIn.do?ss_gha_key=GEIT000000002">로그인</a><BR>
	        GEIT테스트3(삭제) <a href="/common/testlogIn.do?ss_gha_key=GEIT000000003">로그인</a><BR>
	        </h3>
        </td>
      </tr>
    </table>
    </td>
  </tr>
</table>
</body>
</html>