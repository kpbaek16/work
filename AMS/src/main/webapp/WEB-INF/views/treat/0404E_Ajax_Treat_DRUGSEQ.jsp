<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="java.util.*" %>
					<div class="table_box">
						<table class="aniinfo_search" style="width:760px; margin-top:20px;" >
							<caption>처방약정보</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:20%;">
								<col style="width:30%;">
								<col style="width:13%;">
								<col style="width:13%;">
								<col style="width:14%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">약품그룹</th>
									<th scope="col">약품명칭</th>
									<th scope="col">구분</th>
									<th scope="col">단위</th>
									<th scope="col">용도</th>
								</tr>
							</thead>
							<tbody>
								<c:set var="GRPNAME" value=""/>
								<c:forEach var="DRUGList" items="${DRUGList}" varStatus="st">
								<c:choose>
								<c:when test="${DRUGList.MDI_DRUGCODE_SEQ == 0}">
									<c:set var="GRPNAME" value="${DRUGList.MDI_NAME}"/>
								</c:when>
								<c:otherwise>
								<tr>
									<td><a href="javascript:DRUG_CHK('${DRUGList.MDI_DRUGCODE}');">${DRUGList.MDI_DRUGCODE}</a></td>
									<td><a href="javascript:DRUG_CHK('${DRUGList.MDI_DRUGCODE}');">${GRPNAME}</a></td>
									<td><a href="javascript:DRUG_CHK('${DRUGList.MDI_DRUGCODE}');">${DRUGList.MDI_NAME}</a></td>
									<td><a href="javascript:DRUG_CHK('${DRUGList.MDI_DRUGCODE}');">${DRUGList.TYPENAME}</a></td>
									<td><a href="javascript:DRUG_CHK('${DRUGList.MDI_DRUGCODE}');">${DRUGList.UNITNAME}</a></td>
									<td><a href="javascript:DRUG_CHK('${DRUGList.MDI_DRUGCODE}');">${DRUGList.MDI_PURPOSE}</a></td>
								</tr>
								</c:otherwise>
								</c:choose>
								</c:forEach>
							</tbody>
						</table>
					</div>

					<!-- pagination -->
					<div class="pagination">
						<a href="javascript:search_index(1,${TotalPage});" class="page first"></a>
						<a href="javascript:search_index(${page-1},${TotalPage});" class="page prev"></a>
						<c:forEach var="x" begin="${FirstPage}" end="${LastPage}" step="1">
							<c:if test="${x == page}">
								<a href="#" class="on">${x}</a>
							</c:if>
							<c:if test="${x != page}">
								<a href="javascript:search_index(${x},${TotalPage});">${x}</a>
							</c:if>
						</c:forEach> 
						<a href="javascript:search_index(${page+1},${TotalPage});" class="page next"></a>
						<a href="javascript:search_index(${TotalPage},${TotalPage});" class="page last"></a>
					</div>
					<!-- //pagination -->