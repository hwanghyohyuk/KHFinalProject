<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- === BEGIN HEAD ===  -->
<c:import url="../include/user/common/head.jsp"></c:import>
<link href="/everycvs/resources/user/css/event.css" rel="stylesheet" type="text/css">
<c:import url="../include/user/common/headend.jsp"></c:import>
<!-- === END HEAD ===  -->
<!-- === BEGIN HEADER ===  -->
<c:import url="../include/user/common/header.jsp"></c:import>
<!-- === END HEADER === -->
<!-- === BEGIN CONTENT === -->
		<div id="content">
			<div class="container background-white">
				<div class="row margin-vert-30">
					<div class="col-md-12">
						<div id="category">
							<input type="button" class="category" value="진행중 이벤트"
								onClick="location.href='#"> <input type="button"
								class="category" value="종료된 이벤트" onClick="location.href='#">
							<input type="button" class="category" value="이벤트 당첨자"
								onClick="location.href='/everycvs/eventresultlist.do'">
						</div>
						<!-- Filter Buttons -->
						<div class="portfolio-filter-container margin-top-20">
							<ul class="portfolio-filter">
								<li class="portfolio-filter-label label label-primary">
									filter by:</li>
								<li><a href="#" class="portfolio-selected btn btn-default"
									data-filter="*">All</a></li>
								<li><a href="#" class="btn btn-default" data-filter=".GS25">GS25</a>
								</li>
								<li><a href="#" class="btn btn-default" data-filter=".CU">CU</a>
								</li>
								<li><a href="#" class="btn btn-default"
									data-filter=".7ELEVEN">7ELEVEN</a></li>
							</ul>
						</div>
						<!-- End Filter Buttons -->
					</div>
				</div>
			
				<div class="row">
					<div class="col-md-12 portfolio-group no-padding" style="float: left;">
						<!-- Portfolio Item -->
						<div class="col-md-4 portfolio-item margin-bottom-40 GS25">
							<div>
							<!-- 로그인시 상세보기 -->
							<c:if test="${sessionScope.user ne null}">
								<c:forEach items="${event.list}" var="e">
									<figure>
										<a href="/everycvs/eventDetail.do?no=${e.event_no}">
										<img src="/everycvs/resources/uploadfile/image10.jpg" alt="image1">
										<figcaption>
											<input type="hidden" class="margin-top-20" value="${e.event_no}"/>
											<h3 class="margin-top-20">${e.title}</h3>
											<span>시작일:${e.start_date}</span> 
											<br> 
											<span>종료일:${e.end_date}</span>
											<br>
											<span>조회수:${e.readcount}</span>
										</figcaption>
									</figure>
								</c:forEach>
								</a>
							</c:if>
								<c:if test="${sessionScope.user eq null}">
									<c:forEach items="${event.list}" var="e">
								<figure>
								<a href="javascript:alert('로그인을 해야 상세보기 가능합니다.')">
									<img src="/everycvs/resources/uploadfile/image10.jpg" alt="image1">
									<figcaption>
										<input type="hidden" class="margin-top-20" value="${e.event_no}"/>
										<h3 class="margin-top-20">${e.title}</h3>
										<span>이벤트 시작일:${e.start_date}</span> 
										<br> 
										<span>이벤트 종료일:${e.end_date}</span>
									</figcaption>
								</figure>
									</c:forEach>
									</a>
								</c:if>
							</div>
						</div>
						<!-- End Portfolio Item -->	
					</div>
				</div>
				<!-- 페이지인 여기서부터 들어감-->
				
				<!-- 페이지 여기까지 들어가면됨 -->
			</div>
		</div>

<!-- === END CONTENT === -->
<!-- === BEGIN FOOTER === -->
<c:import url="../include/user/common/footer.jsp"></c:import>
<!-- === END FOOTER === -->
<!-- JS -->
<c:import url="../include/user/common/end.jsp"></c:import>
<!-- === END === -->