<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div style="font-size:30px;width:1000px;text-align:center;font-family:-윤고딕360">동물 자력 카드</div>
<table cellpadding="0" cellspacing="0"><tr>
    <td>
    <table border="1" class="Ani_Card" style="width:250px" cellpadding="0" cellspacing="0">
        <tr>
            <th style="text-align:center;width:50%">동물 등록 정보</th>
            <td style="text-align:center;width:50%">${aniInfo.MAI_ANICODE}</td>
        </tr>
    </table>
    </td>
    </tr>
    <tr>
    <td valign="top">
    <table style="width:250px;height:540px" cellpadding="0" cellspacing="0"><tr><td>
    <table border="1" id="aab" class="Ani_Card" style="width:100%;height:100%" cellpadding="0" cellspacing="0">
    <tr>
        <th style="text-align:center" colspan="2">사진</th>
    </tr>
    <tr>
    <td style="text-align:center;height:205px" colspan="2" id="img_box">
        </td>
    </tr>
    <tr>
        <th style="text-align:center" colspan="2">상세정보</th>
    </tr>
    <tr>
        <th style="width:40%;text-align:center">성   별</th>
        <td style="width:60%;text-align:center">${aniInfo.MAI_GENDER }</td>
    </tr>
    <tr>
        <th style="width:40%;text-align:center">Chip No</th>
        <td style="width:60%;text-align:center">${aniInfo.MAI_CHIPTYPE }</td>
    </tr>
    <tr>
        <th style="width:40%;text-align:center">Ring No</th>
        <td style="width:60%;text-align:center">${aniInfo.MAI_RINGTYPE }</td>
    </tr>
    <tr>
        <th style="width:40%;text-align:center">Ear No</th>
        <td style="width:60%;text-align:center">${aniInfo.MAI_EARTYPE }</td>
    </tr>
    <tr>
        <th style="width:40%;text-align:center">별    명</th>
        <td style="width:60%;text-align:center">${aniInfo.MAI_BNAME }</td>
    </tr>
    <tr>
        <th style="width:40%;text-align:center">출 생 지</th>
        <td style="width:60%;text-align:center">${aniInfo.MAI_BIRTHPLC }</td>
    </tr>
    <tr>
        <th style="width:40%;text-align:center">부</th>
        <td style="width:60%;text-align:center">${aniInfo.MAI_FTANINO }</td>
    </tr>
    <tr>
        <th style="width:40%;text-align:center">모</th>
        <td style="width:60%;text-align:center">${aniInfo.MAI_MMANINO }</td>
    </tr>
    <tr>
        <th style="width:40%;text-align:center">생년월일</th>
        <td style="width:60%;text-align:center">${aniInfo.MAI_BIRTHDAY }</td>
    </tr>
    <tr>
        <th style="width:40%;text-align:center">원수 등록일</th>
        <td style="width:60%;text-align:center">${aniInfo.MAI_OSREGDATE }</td>
    </tr>
    </table>
    </td></tr></table>
    </td>
    <td valign="top">
    <table style="width:750px;height:540px" cellpadding="0" cellspacing="0"><tr><td>
    <table class="Ani_Card" border="1" style="width:100%;height:30%" cellpadding="0" cellspacing="0" id="table1">
    <tr>
        <th style="text-align:center" colspan="6">동물 기본 정보</th>
    </tr>
    <tr>
        <th style="width:13%;text-align:center">동물명</th>
        <td style="width:20%;text-align:center">${aniInfo.MAC_NAME }</td>
        <th style="width:13%;text-align:center">영 명</th>
        <td style="width:20%;text-align:center">${aniInfo.MAC_ENAME }</td>
        <th style="width:14%;text-align:center">학 명</th>
        <td style="width:20%;text-align:center;font-style:italic">${aniInfo.MAC_SNAME }</td>
    </tr>
    <tr>
        <th style="width:13%;text-align:center">강/목/과</th>
        <td style="text-align:center" colspan = "3">${aniInfo.CLS1_NAME } / ${aniInfo.CLS2_NAME } / ${aniInfo.CLS3_NAME }</td>
        <th style="width:14%;text-align:center">CITES</th>
        <td style="width:20%;text-align:center">${aniInfo.MAC_CITES }</td>
    </tr>
    <tr>
        <th style="width:13%;text-align:center">Rank</th>
        <td style="width:20%;text-align:center">${aniInfo.MAC_RANK }</td>
        <th style="width:13%;text-align:center">천연기념물</th>
        <td style="width:20%;text-align:center">${aniInfo.MAC_NATMON }</td>
        <th style="width:14%;text-align:center">종류</th>
        <td style="width:20%;text-align:center">${aniInfo.MAC_ORGPLACE }</td>
    </tr>
    <tr>
        <th style="text-align:center" colspan="6">관리 부서 정보</th>
    </tr>
    <tr>
        <th style="width:13%;text-align:center">관리과</th>
        <td style="width:20%;text-align:center">${aniInfo.MDI_DPTNAME }</td>
        <th style="width:13%;text-align:center">관리팀</th>
        <td style="width:20%;text-align:center">${aniInfo.MTI_TEAMNAME }</td>
        <th style="width:14%;text-align:center">동물사</th>
        <td style="width:20%;text-align:center">${aniInfo.MVI_VVRMNAME }</td>
    </tr>
    </table>
    <table class="Ani_Card" border="1" style="width:100%;height:70%" cellpadding="0" cellspacing="0" id="table2">
    <tr>
        <th style="text-align:center" colspan="2">반입정보</th>
        <th style="text-align:center" colspan="2">상세정보</th>
    </tr>
    <tr>
    <c:forEach var="banipInfo" items="${banipInfo }">	
        <th style="width:13%;text-align:center">반입일자</th>
        <td style="width:37%;text-align:center">${banipInfo.DAIO_IODATE }</td>
        </c:forEach>
        <th style="width:13%;text-align:center">최종상태</th>
        <td style="width:37%;text-align:center">${aniInfo.MAI_CURSTS }</td>
    </tr>
    <tr>
     <c:forEach var="banipInfo" items="${banipInfo }">	
        <th style="width:13%;text-align:center">반입사유</th>
        <td style="width:37%;text-align:center">${banipInfo.DAIO_RESN }</td>
          </c:forEach>
        <th style="width:13%;text-align:center">등록구분</th>
        <td style="width:37%;text-align:center">${aniInfo.MAI_REGTYPE }</td>
    </tr>
    <tr>
    <c:forEach var="banipInfo" items="${banipInfo }">	
        <th style="width:13%;text-align:center">반입시 나이</th>
        <td style="width:37%;text-align:center">${banipInfo.DAIO_AGE }</td>
        </c:forEach>
        <th style="width:13%;text-align:center">분만여부</th>
        <td style="width:37%;text-align:center"><span>
        
        
        </span></td>
    </tr>
    <tr>
     <c:forEach var="banipInfo" items="${banipInfo }">
        <th style="width:13%;text-align:center">반입처</th>
        <td style="width:37%;text-align:center">${banipInfo.DAIO_PLACE }</td>
         </c:forEach>
        <th style="width:13%;text-align:center">원수예정일자</th>
        <td style="width:37%;text-align:center">${aniInfo.MAI_OSREGDATE }</td>
    </tr>
    <tr>
        <th style="width:13%;text-align:center"></th>
        <td style="width:37%;text-align:center"></td>
        <th style="text-align:center" colspan="2">개체의 특성</th>
    </tr>
    <tr>
        <th style="text-align:center" colspan="2">반출정보</th>
        <td style="text-align:center" colspan="2" rowspan="8">${aniInfo.MAI_CMNT }</td>
    </tr>
    <tr>
    <c:forEach var="banipInfo" items="${banipInfo }">
        <th style="width:13%;text-align:center">반출일자</th>
        <td style="width:37%;text-align:center">${banipInfo.DAIO_RENTEDATE }</td>
        </c:forEach>
    </tr>
     
    <tr>
        <th style="width:13%;text-align:center">반출사유</th>
        <td style="width:37%;text-align:center"></td>
    </tr>
    <tr>
        <th style="width:13%;text-align:center">반출시 나이</th>
        <td style="width:37%;text-align:center"></td>
    </tr>
    <tr>
        
        <th style="width:13%;text-align:center">폐체 처리</th>
        <td style="width:37%;text-align:center"></td>
    </tr>
    <tr>
        <th style="width:13%;text-align:center">반 출 처</th>
        <td style="width:37%;text-align:center"> </td>
    </tr>
    <tr>
        <th style="width:13%;text-align:center">사육년수</th>
        <td style="width:37%;text-align:center"></td>
    </tr>
    <tr>
        <th style="width:13%;text-align:center"></th>
        <td style="width:37%;text-align:center"></td>
    </tr>
    </table>
    </td></tr></table>
</td></tr></table>
<table style="width:1000px; ">
    <tr>
        <td style="width:1000px;text-align:center" >
        <a href="javascript:window.print()" class="save2_btn">프린트하기</a>
        </td>
    </tr>
</table>