<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="java.util.*" %>
							<input type="hidden" id="page" name="page" value="${page}" />
							<c:forEach var="Commentlist" items="${Commentlist}" varStatus="st">
							<ul	class="comment_list">
								<li id = "li_tag${st.count}">
									<span class="comment_name">${Commentlist.CMN_MAK_NAME}(${Commentlist.TEAMNO})</span>
									<span class="comment_time">${Commentlist.CMN_MAK_DATE}</span>
									<c:if test="${USER_ID == Commentlist.CMN_MAK_ID}">
									<a id = "a_update${st.count}" href="javascript:update('${st.count}');" class="co_cha_btn" data-val='${Commentlist.BBC_SEQ}'>수정</a><a id = "a_del${st.count}" href="javascript:delComment('${DOCNO}','${Commentlist.BBC_SEQ}');" class="co_del_btn">삭제</a>
									</c:if>
									<p id = "p_tag${st.count}">${Commentlist.BBC_CTNT}</p>							
								</li>	
							</ul>
							</c:forEach>
							<div class="comment_write">
								<span style="font-weight:bold;">${USER_NAME}</span>
								<p>
									<textarea rows="5" name="comment_cmnt" id="comment_cmnt" style="width:100%; border: 0; resize: none; padding:10px 5px; font-size:13px; color:#555; line-height:20px; text-align:left;"></textarea>
								</p>
								<a href="javascript:insComment('${DOCNO}');" class="co_save_btn">저장</a>
							</div>
							<!-- pagination -->
							<div class="pagination">
								<a href="javascript:search_index(1);" class="page first"></a>
								<a href="javascript:search_index(${page-1});" class="page prev"></a>
								<c:forEach var="x" begin="${BizFirstPage}" end="${BizLastPage}" step="1">
									<c:if test="${x == page}">
										<a href="#" class="on">${x}</a>
									</c:if>
									<c:if test="${x != page}">
										<a href="javascript:search_index(${x},'${DOCNO}');">${x}</a>
									</c:if>
								</c:forEach> 
								<a href="javascript:search_index(${page+1});" class="page next"></a>
								<a href="javascript:search_index(${BizTotalPage});" class="page last"></a>
							</div>
							<!-- //pagination -->