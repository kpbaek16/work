<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="java.util.*" %>
<div class="table_box">
						<table class="aniinfo_add" style="width:760px; margin-top:20px;" >
							<caption>종 정보</caption>
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
									<th scope="col" id="th01_3">No</th>
									<th scope="col" id="th02_3">이름</th>
									<th scope="col" id="th03_3">부서</th>
									<th scope="col" id="th04_3">팀</th>
									<th scope="col" id="th05_3">직책</th>
									<th scope="col" id="th06_3">선택</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="USER_LIST" items="${USER_LIST}" varStatus="st">
								<tr>
									<th scope="row" id="n01_3" headers="th01_3">${USER_LIST.SEQ}</th>
									<td headers="n01_3 th02_3">${USER_LIST.MUI_NAME}</td>
									<td headers="n01_3 th03_3">${USER_LIST.MDI_DPTNAME}</td>
									<td headers="n01_3 th04_3">${USER_LIST.MTI_TEAMNAME}</td>
									<td headers="n01_3 th05_3">${USER_LIST.MUI_JCCODE_NAME}</td>
									<td headers="n01_3 th06_3">
									<c:if test="${USER_LIST.CHK == '0'}">
										<a id="atag_User${USER_LIST.SEQ}" href="javascript:AddUser('${USER_LIST.MUI_ID}','atag_User${USER_LIST.SEQ}');" class="del2_btn">추가</a>
									</c:if>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

					<!-- pagination -->
					<div class="pagination">
					<a href="javascript:USER_search_index(${page},${TotalPage});" class="page first"></a>
					<a href="javascript:USER_search_index(${page-1},${TotalPage});" class="page prev"></a>
					<c:forEach var="x" begin="${FirstPage}" end="${LastPage}" step="1">
						<c:if test="${x == page}">
							<a href="#" class="on">${x}</a>
						</c:if>
						<c:if test="${x != page}">
							<a href="javascript:USER_search_index(${x},${TotalPage});">${x}</a>
						</c:if>
					</c:forEach> 
					<a href="javascript:USER_search_index(${page+1},${TotalPage});" class="page next"></a>
					<a href="javascript:USER_search_index(${TotalPage},${TotalPage});" class="page last"></a>
					</div>
					<!-- //pagination -->	