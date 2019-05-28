<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
						<table class="ani_list" > 
							<caption>강그룹</caption>
							<colgroup>
								<col style="width:50%" />
							</colgroup>
							<thead>
								<tr><th scope="col">강<button class="all_btn" type="button">전체</button></th></tr>
							</thead>
							<tbody>
								<c:if test="${!empty list}">
								<c:forEach items="${list}" var="list">
								<c:if test="${kangCnt > '1' or (kangCnt <= '1' and !empty list.KANG_NAME)}">
								<tr>
									<td><a href="javascript:AniGrp_rowRank('mog','${list.MAC_ANICODE1}','','');"><c:if test="${!empty list.KANG_NAME}">${list.MAC_ANICODE1} - ${list.KANG_NAME}</c:if></a></td>
								</tr>
								</c:if>
								</c:forEach>
								</c:if>
							</tbody>
						</table>                    
						<table class="ani_list" > 
							<caption>목그룹</caption>
							<colgroup>
								<col style="width:50%" />
							</colgroup>
							<thead>
								<tr><th scope="col">목<button class="all_btn" type="button">전체</button></th></tr>
							</thead>
							<tbody>
								<c:if test="${!empty list}">
								<c:forEach items="${list}" var="list">
								<c:if test="${mogCnt > '1' or (mogCnt <= '1' and !empty list.MOG_NAME)}">
								<tr>
									<td><a href="javascript:AniGrp_rowRank('gwa','${list.MAC_ANICODE1}','${list.MAC_ANICODE2}','');"><c:if test="${!empty list.MOG_NAME}">${list.MAC_ANICODE2} - ${list.MOG_NAME}</c:if></a></td>
								</tr>
								</c:if>
								</c:forEach>
								</c:if>
							</tbody>
						</table>  
						<table class="ani_list" > 
							<caption>과그룹</caption>
							<colgroup>
								<col style="width:50%" />
							</colgroup>
							<thead>
								<tr><th scope="col">과<button class="add_btn" type="button">추가</button></th></tr>
							</thead>
							<tbody>
								<c:if test="${!empty list}">
								<c:forEach items="${list}" var="list">
								<tr>
									<td><a href="javascript:AniGrp_rowRank('jong','${list.MAC_ANICODE1}','${list.MAC_ANICODE2}','${list.MAC_ANICODE3}');">${list.MAC_ANICODE3} - ${list.MAC_NAME}</a></td>
								</tr>
								</c:forEach>
								</c:if>
							</tbody>
						</table>         