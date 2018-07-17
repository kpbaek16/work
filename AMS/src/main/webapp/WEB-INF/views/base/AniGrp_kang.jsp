<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
						<table class="ani_list" > 
							<caption>강그룹</caption>
							<colgroup>
								<col style="width:50%" />
							</colgroup>
							<thead>
								<tr><th scope="col">강<button class="add_btn" type="button">추가</button><button class="all_btn" type="button">전체</button></th></tr>
							</thead>
							<tbody>
								<c:if test="${!empty list}">
								<c:forEach items="${list}" var="list">
								<tr>
									<td><a href="javascript:AniGrp_rowRank('mog','${list.MAC_ANICODE1}','','');">${list.MAC_ANICODE1} - ${list.MAC_NAME}</a></td>
								</tr>
								</c:forEach>
								</c:if>
							</tbody>
						</table>                 