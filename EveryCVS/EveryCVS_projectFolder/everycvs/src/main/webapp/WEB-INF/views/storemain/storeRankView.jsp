<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- === BEGIN HEAD ===  -->
<c:import url="../include/user/common/head.jsp"></c:import>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<c:url var="sptop3" value="sptop3.do" />
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "${sptop3}",
			type : "get",
			dataType : "json",
			success : function(data) {
				$('#toplist').html();
			}
		});
	});

	$(function() {
		$.ajax({
			url : "${spnew3}",
			type : "get",
			dataType : "json",
			success : function(data) {
				$('#newlist').html();
			}
		});
	});
</script>
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
				<div class="row">
					<div class="col-sm-6">
						<h2>
							<strong>${sessionScope.store.brand_name}&nbsp;${sessionScope.store.store_name}</strong><br>
							<small>${sessionScope.store.road_address}</small>
						</h2>
					</div>
					<div class="col-sm-1" style="margin-left: 350px;">
						<br> <a href="splist.do"><button type="button"
								class="btn btn-primary btn-sm">지점상품 전체보기</button></a>
					</div>
				</div>
				<br> <br>
				<c:if test="${list ne null }">
				<div class="row">
					<!-- 인기상품 -->
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h5 class="panel-title">
									<strong>인기상품</strong>
								</h5>
							</div>
							<div id="collapse-One" class="accordion-body collapse in"
								id="toplist">
								<div class="panel-body">
									<div class="row">
										<c:forEach var="sp" items="${requestScope.list}">
											<div class="col-md-4">
												<img src="/everycvs/resources/user/img/fillers/filler1.jpg"
													alt="filler image">
												<h5 align="center">
													<strong>${sp.product_name}</strong>
												</h5>
												<h6 align="center"><fmt:formatNumber value="${sp.price}" pattern="#,###"/>원</h6>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 신상품 -->
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h5 class="panel-title">
									<strong>신상품</strong>
								</h5>
							</div>
							<div id="collapse-One" class="accordion-body collapse in"
								id="newlist">
								<div class="panel-body">
									<div class="row">
										<c:forEach var="sp" items="${requestScope.list2}">
											<div class="col-md-4">
												<img src="/everycvs/resources/user/img/fillers/filler1.jpg"
													alt="filler image">
												<h5 align="center">
													<strong>${sp.product_name}</strong>
												</h5>
												<h6 align="center"><fmt:formatNumber value="${sp.price}" pattern="#,###"/>원</h6>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<!-- 할인상품 -->
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h5 class="panel-title">
									<strong>할인상품</strong>
								</h5>
							</div>
							<div style="overflow-x:hidden; width:480px; height:195px;">
								<div id="collapse-One" class="accordion-body collapse in">
									<div class="panel-body">
										<div class="row">
											<c:forEach var="sp" items="${requestScope.list3}">
												<div class="col-md-4">
													<img src="/everycvs/resources/user/img/fillers/filler1.jpg"
														alt="filler image">
													<h5 align="center">
														<strong>${sp.product_name}</strong>
													</h5>
													<c:choose>
														<c:when test="${sp.discount_no==4}">
															<h6 align="center">
																<fmt:formatNumber value="${sp.price}" pattern="#,###"/>원 -> 
																<fmt:formatNumber value="${sp.discount_info}" pattern="#,###"/>원
															</h6>
															<h6 align="center" style="color: red;">${sp.discount_name}</h6>
														</c:when>
														<c:otherwise>
															<h6 align="center"><fmt:formatNumber value="${sp.price}" pattern="#,###"/>원 </h6>
															<h6 align="center" style="color: red;">${sp.discount_name}</h6>
														</c:otherwise>
													</c:choose>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 유통기한 임박상품 -->
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h5 class="panel-title">
									<strong>유통기한 임박상품</strong>
								</h5>
							</div>
							<div style="overflow-x:hidden; width:480px; height:195px;">
								<div id="collapse-One" class="accordion-body collapse in">
									<div class="panel-body">
										<div class="row">
											<c:forEach var="sp" items="${requestScope.list4}">
												<div class="col-md-4">
													<img src="/everycvs/resources/user/img/fillers/filler1.jpg"
														alt="filler image">
													<h5 align="center">
														<strong>${sp.product_name}</strong>
													</h5>
													<h6 align="center"><fmt:formatNumber value="${sp.price}" pattern="#,###"/>원</h6>
													<h6 align="center" style="color: red;">${sp.expiration_date}일 남았습니다.</h6>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</c:if>
				<c:if test="${ list eq null}">
				<div class="row">
				준비중입니다.<!-- 선주 이미지 넣을꺼 -->
				</div>
				</c:if>
			</div>
		</div>
	</div>
</div>
<!-- === END CONTENT === -->
<!-- === BEGIN FOOTER === -->
<c:import url="../include/user/common/footer.jsp"></c:import>
<!-- === END FOOTER === -->
<!-- JS -->
<c:import url="../include/user/common/end.jsp"></c:import>
<!-- === END FOOTER === -->