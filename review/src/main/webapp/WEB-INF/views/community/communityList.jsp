<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../header.jsp" />

    
    <div class="hero-wrap js-fullheight" style="background-image: url('images/bg_4.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">COMMUNITY BOARD</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section bg-light">
      <div class="container">
     
      <form method="post" action="" name="freeboardList">
					<h4>COMMUNITY BOARD</h4>

					  <div style="float: right">
					  <a href="communityInsert.vw"><input type="button" value="글 쓰기" class="btn btn-primary py-3 px-5" ></a>

              </div>
              <br><br><br>
					<div class="table-responsive">
						<table class="table">
							<tr class="success" align="center">
								<th width="5%">번호</th>
								<th width="55%">글 제목</th>
								<th width="20%">작성자</th>
								<th width="5%">HIT</th>
								<th width="20%">작성일</th>
							</tr>

							<c:if test="${empty communityAll or communityAll.size()==0 }">
								<tr>
									<td colspan="5" class="text-center"><h3>게시글이 없습니다</h3></td>
								</tr>
							</c:if>

							<c:forEach items="${communityAll}" var="communityDTO">
								<tr>
									<%-- 글번호 아님! 주의!!	<td align="center">${communityDTO.number}</td> --%>
									<td align="center"><c:out value="${number}"/></td>
									<c:set var="number" value="${number-1}"/>
									
									<td><a href="communityDetail.vw?cno=${communityDTO.cno}">${communityDTO.subject}</a></td>
									<td align="center"><a href="freeboardDetail.vw?cno=${communityDTO.cno}">${communityDTO.mid}</a></td>
									<td align="center">${boardDTO.hit}</td>
									<td align="center"><fmt:formatDate type="date"	value="${communityDTO.indate}" /></td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<br><br><br>


			<div class="row mt-1">
				<div class="col text-center">
					<div class="block-27">
						<c:if test="${count>0 }">
							<ul>
								<%--이전페이지 --%>
								<c:if test="${startPage>10 }">
									<li><a href="community.vw?pageNum=${startPage-10}">&lt;</a></li>
								</c:if>
								
								<%--페이지처리 --%>
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<li><a href="community.vw?pageNum=${i}">${i}</a></li>
								</c:forEach>

								<%--다음 페이지 --%>
								<c:if test="${endPage<pageCount }">
									<li><a href="community.vw?pageNum=${startPage+10}">&gt;</a></li>
								</c:if>
							</ul>
						</c:if>
					</div>
				</div>
			</div>


<P>전체 글 갯수 :${count}</P>


			<!-- 게시글 검색 -->
         <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <input type="text" name="key" placeholder="게시글 검색">
						<input class="btnfind" type="button" value="검색" onclick="productSearch()">
            </div>
          </div>
        </div>
        
      
			</form>
        
      </div>
      
    </section>

<jsp:include page="../footer.jsp" />    
    