<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="java.util.*" %>
<div class="table_box">
						<table class="aniinfo_search" style="width:760px; margin-top:20px;" >
							<caption>동물정보</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:20%;">
								<col style="width:15%;">
								<col style="width:15%;">
								<col style="width:10%;">
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:10%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">No</th>
									<th scope="col">동물번호</th>
									<th scope="col">동물종명(별명)</th>
									<th scope="col">영명</th>
									<th scope="col">학명</th>
									<th scope="col">동물사</th>
									<th scope="col">성별</th>
									<th scope="col">나이</th>
									<th scope="col">폐사구분</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="AniList" items="${AniList}" varStatus="st">
								<tr>
									<td><a href="javascript:Ani_CHK('${AniList.MAI_ANICODE}','${AniList.MAC_NAME}', '${AniList.MAI_BNAME}','${AniList.VVRMNAME}','${AniList.SEXNAME}','${AniList.CURAGE}');">${AniList.SEQ}</a></td>
									<td><a href="javascript:Ani_CHK('${AniList.MAI_ANICODE}','${AniList.MAC_NAME}', '${AniList.MAI_BNAME}','${AniList.VVRMNAME}','${AniList.SEXNAME}','${AniList.CURAGE}');">${AniList.MAI_ANICODE}</a></td>
									<td>
										<a href="javascript:Ani_CHK('${AniList.MAI_ANICODE}','${AniList.MAC_NAME}', '${AniList.MAI_BNAME}','${AniList.VVRMNAME}','${AniList.SEXNAME}','${AniList.CURAGE}');">
										<c:choose>
											<c:when test="${AniList.MAI_BName != ''}">
												${AniList.MAC_NAME}(${AniList.MAI_BNAME})
											</c:when>
											<c:otherwise>
												${AniList.MAC_NAME}
											</c:otherwise>
										</c:choose>
										</a>
									</td>
									<td><a href="javascript:Ani_CHK('${AniList.MAI_ANICODE}','${AniList.MAC_NAME}', '${AniList.MAI_BNAME}','${AniList.VVRMNAME}','${AniList.SEXNAME}','${AniList.CURAGE}');">${AniList.MAC_ENAME}</a></td>
									<td style="font-style:italic"><a href="javascript:Ani_CHK('${AniList.MAI_ANICODE}','${AniList.MAC_NAME}', '${AniList.MAI_BNAME}','${AniList.VVRMNAME}','${AniList.SEXNAME}','${AniList.CURAGE}');">${AniList.MAC_SNAME}</a></td>
									<td><a href="javascript:Ani_CHK('${AniList.MAI_ANICODE}','${AniList.MAC_NAME}', '${AniList.MAI_BNAME}','${AniList.VVRMNAME}','${AniList.SEXNAME}','${AniList.CURAGE}');">${AniList.VVRMNAME}</a></td>
									<td><a href="javascript:Ani_CHK('${AniList.MAI_ANICODE}','${AniList.MAC_NAME}', '${AniList.MAI_BNAME}','${AniList.VVRMNAME}','${AniList.SEXNAME}','${AniList.CURAGE}');">${AniList.SEXNAME}</a></td>
									<td><a href="javascript:Ani_CHK('${AniList.MAI_ANICODE}','${AniList.MAC_NAME}', '${AniList.MAI_BNAME}','${AniList.VVRMNAME}','${AniList.SEXNAME}','${AniList.CURAGE}');">${AniList.CURAGE}</a></td>
									<td><a href="javascript:Ani_CHK('${AniList.MAI_ANICODE}','${AniList.MAC_NAME}', '${AniList.MAI_BNAME}','${AniList.VVRMNAME}','${AniList.SEXNAME}','${AniList.CURAGE}');">${AniList.MAI_DETHTYPE}</a></td>
								</tr>
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