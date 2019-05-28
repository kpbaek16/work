<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="java.util.*" %>
<c:choose>
<c:when test="${type == 'RCV'}">
				<div class="table_box">
					<p class="sub_title" style="margin-bottom:10px;">수신<a href="javascript:pop_User('RCV');" class="table_add_btn" style="margin-top:-5px; text-indent:0;">추가</a></p>
					<table class="aniinfo_add" style="width:760px;" >
						<caption>결재정보 수신</caption>
						<colgroup>
							<col style="width:10%;">
							<col style="width:15%;">
							<col style="width:25%;">
							<col style="width:20%;">
							<col style="width:15%;">
							<col style="width:15%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col" id="th01_1">No</th>
								<th scope="col" id="th02_1">이름</th>
								<th scope="col" id="th03_1">팀</th>
								<th scope="col" id="th04_1">부서</th>
								<th scope="col" id="th05_1">직책</th>
								<th scope="col" id="th06_1">선택</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="KJP_LIST" items="${KJP_LIST}" varStatus="st">
								<tr>
									<th scope="row" id="n01" headers="th01">${KJP_LIST.SEQ}</th>
									<td headers="n01 th03">${KJP_LIST.T_DT2}</td>
									<td headers="n01 th04">${KJP_LIST.T_DT4}</td>
									<td headers="n01 th05">${KJP_LIST.T_DT6}</td>
									<td headers="n01 th06">${KJP_LIST.T_DT8}</td>
									<td headers="n01 th07"><a href="javascript:DelUser('${KJP_LIST.T_K2}','RCV');" class="del2_btn">삭제</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
</c:when>
<c:otherwise>
				<div class="table_box"  style="margin-top:20px;">
					<p class="sub_title" style="margin-bottom:10px;">참조<a href="javascript:pop_User('NOTI');" class="table_add_btn" style="margin-top:-5px; text-indent:0;">추가</a></p>
					<table class="aniinfo_add" style="width:760px;" >
						<caption>결재 정보 참조</caption>
						<colgroup>
							<col style="width:10%;">
							<col style="width:15%;">
							<col style="width:25%;">
							<col style="width:20%;">
							<col style="width:15%;">
							<col style="width:15%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col" id="th01_2">No</th>
								<th scope="col" id="th02_2">이름</th>
								<th scope="col" id="th03_2">부서</th>
								<th scope="col" id="th04_2">팀</th>
								<th scope="col" id="th05_2">직책</th>
								<th scope="col" id="th06_2">선택</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="KJP_LIST" items="${KJP_LIST}" varStatus="st">
								<tr>
									<th scope="row" id="n01" headers="th01">${KJP_LIST.SEQ}</th>
									<td headers="n01 th03">${KJP_LIST.T_DT2}</td>
									<td headers="n01 th04">${KJP_LIST.T_DT4}</td>
									<td headers="n01 th05">${KJP_LIST.T_DT6}</td>
									<td headers="n01 th06">${KJP_LIST.T_DT8}</td>
									<td headers="n01 th07"><a href="javascript:DelUser('${KJP_LIST.T_K2}','NOTI');" class="del2_btn">삭제</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
</c:otherwise>
</c:choose>
				<!-- pagination -->
				<div class="pagination">
					<a href="javascript:search_index(${page},'${type}',${TotalPage});" class="page first"></a>
					<a href="javascript:search_index(${page-1},'${type}',${TotalPage});" class="page prev"></a>
					<c:forEach var="x" begin="${FirstPage}" end="${LastPage}" step="1">
						<c:if test="${x == page}">
							<a href="#" class="on">${x}</a>
						</c:if>
						<c:if test="${x != page}">
							<a href="javascript:search_index(${x},'${type}',${TotalPage});">${x}</a>
						</c:if>
					</c:forEach> 
					<a href="javascript:search_index(${page+1},'${type}',${TotalPage});" class="page next"></a>
					<a href="javascript:search_index(${TotalPage},'${type}',${TotalPage});" class="page last"></a>
				</div>