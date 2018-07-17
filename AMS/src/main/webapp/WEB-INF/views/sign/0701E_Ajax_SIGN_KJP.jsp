<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="java.util.*" %>
<table  id="KJP_TABLE" class="aniinfo_add table_view" >
							<caption>결재</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:15%;">
								<col style="width:20%;">
								<col style="width:15%;">
								<col style="width:15%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">No</th>
									<th scope="col" id="th02">구분</th>
									<th scope="col" id="th03">순서</th>
									<th scope="col" id="th04">이름</th>
									<th scope="col" id="th05">부서</th>
									<th scope="col" id="th06">직책</th>
									<th scope="col" id="th07">결재</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="KJP_LIST" items="${KJP_LIST}" varStatus="st">
									<tr>
										<th scope="row" id="n01" headers="th01">${KJP_LIST.SEQ}</th>
										<td headers="n01 th02">
											<c:if test="${KJP_LIST.T_DT == 'RCV'}">
												수신
											</c:if>
											<c:if test="${KJP_LIST.T_DT == 'NOTI'}">
												참조
											</c:if>
										</td>
										<td headers="n01 th03">${KJP_LIST.T_DT1}</td>
										<td headers="n01 th04">${KJP_LIST.T_DT2}</td>
										<td headers="n01 th05">${KJP_LIST.T_DT6}</td>
										<td headers="n01 th06">${KJP_LIST.T_DT8}</td>
										<td headers="n01 th07"></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>