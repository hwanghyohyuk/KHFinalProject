<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- === BEGIN HEAD ===  -->
<c:import url="../include/user/common/head.jsp"></c:import>
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
	
	function add_favorite(pno, sno){
		alert(pno + ", " + sno);
		location.href="/everycvs/favoriteInsert.do?product_no=" + pno + "&store_no=" + sno;
	}
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
						<br> 
						<a href="splist.do">
							<button type="button" class="btn btn-primary btn-sm">지점상품 전체보기</button>
						</a>
					</div>
				</div>
				<br> <br>
				<c:if test="${count>0}">
					<div class="row">
						<!-- 인기상품 -->
						<div class="col-md-6">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<strong>인기상품</strong>
									</h4>
								</div>
								<div id="collapse-One" class="accordion-body collapse in"
									id="toplist">
									<div class="panel-body">
										<div class="row">
											<c:forEach var="sp" items="${requestScope.list}">
												<div class="col-md-4 col-sm-4 col-xs-6">
													<a href="#" data-toggle="modal" data-target="#amodal${sp.store_product_no}">
														<img src="/everycvs/resources/upload/${sp.stored_file_name}" alt="No_Image">
													</a>
													<h5 align="center">
														<strong>${sp.product_name}</strong>
													</h5>
													<h6 align="center">
														<fmt:formatNumber value="${sp.price}" pattern="#,###" />원
													</h6>
													<!-- Modal -->
													<div id="amodal${sp.store_product_no}" class="modal fade" role="dialog">
														<div class="modal-dialog">
															<!-- Modal content-->
															<div class="modal-content">
																<div class="modal-header">
																	<button type="button" class="close"
																		data-dismiss="modal">&times;</button>
																	<h4 class="modal-title" style="color: black;">
																		<strong>제품 상세보기</strong>
																	</h4>
																</div>
																<div class="modal-body">
																	<div class="row">
																		<div class="col-sm-6">
																			<img src="/everycvs/resources/upload/${sp.stored_file_name}"
																				alt="No_Image" align="left"
																				style="margin-left: 5px;">
																		</div>
																		<div class="col-sm-6">
																			<table class="table table-condensed">
																				<tr>
																					<td><strong>상품명</strong></td>
																					<td>${sp.product_name}</td>
																				</tr>
																				<tr>
																					<td><strong>가격</strong></td>
																					<td><fmt:formatNumber value="${sp.price}" pattern="#,###" />원</td>
																				</tr>
																				<tr>
																					<td><strong>제조사</strong></td>
																					<td>${sp.manufacturer}</td>
																				</tr>
																				<tr>
																					<td><strong>제조일</strong></td>
																					<td>${sp.manufacture_date}</td>
																				</tr>
																			</table>
																		</div>
																	</div>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-primary btn-sm" data-dismiss="modal"
																		onclick="add_favorite('${sp.store_product_no}', '${sp.store_no}');">관심상품</button>
																	&nbsp;
																	<button type="button" class="btn btn-primary btn-sm"
																		data-dismiss="modal">구매하기</button>
																</div>
															</div>
														</div>
													</div>
													<!-- Modal End -->
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
									<h4 class="panel-title">
										<strong>신상품</strong>
									</h4>
								</div>
								<div id="collapse-One" class="accordion-body collapse in" id="newlist">
									<div class="panel-body">
										<div class="row">
											<c:forEach var="sp" items="${requestScope.list2}">
												<div class="col-md-4 col-sm-4 col-xs-6">
													<a href="#" data-toggle="modal" data-target="#bmodal${sp.store_product_no}">
														<img src="/everycvs/resources/upload/${sp.stored_file_name}" alt="No_Image">
													</a>
													<h5 align="center">
														<strong>${sp.product_name}</strong>
													</h5>
													<h6 align="center">
														<fmt:formatNumber value="${sp.price}" pattern="#,###"/>원
													</h6>
													<!-- Modal -->
													<div id="bmodal${sp.store_product_no}" class="modal fade"
														role="dialog">
														<div class="modal-dialog">
															<!-- Modal content-->
															<div class="modal-content">
																<div class="modal-header">
																	<button type="button" class="close" data-dismiss="modal">&times;</button>
																	<h4 class="modal-title" style="color: black;">
																		<strong>제품 상세보기</strong>
																	</h4>
																</div>
																<div class="modal-body">
																	<div class="row">
																		<div class="col-sm-6">
																			<img src="/everycvs/resources/upload/${sp.stored_file_name}"
																				alt="No_Image" align="left"
																				style="margin-left: 5px;">
																		</div>
																		<div class="col-sm-6">
																			<table class="table table-condensed">
																				<tr>
																					<td><strong>상품명</strong></td>
																					<td>${sp.product_name}</td>
																				</tr>
																				<tr>
																					<td><strong>가격</strong></td>
																					<td><fmt:formatNumber value="${sp.price}" pattern="#,###" />원</td>
																				</tr>
																				<tr>
																					<td><strong>제조사</strong></td>
																					<td>${sp.manufacturer}</td>
																				</tr>
																				<tr>
																					<td><strong>제조일</strong></td>
																					<td>${sp.manufacture_date}</td>
																				</tr>
																			</table>
																		</div>
																	</div>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-primary btn-sm" data-dismiss="modal"
																	onclick="add_favorite('${sp.store_product_no}', '${sp.store_no}');">관심상품</button>
																	&nbsp;
																	<button type="button" class="btn btn-primary btn-sm"
																		data-dismiss="modal">구매하기</button>
																</div>
															</div>
														</div>
													</div>
													<!-- Modal End -->
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
									<h4 class="panel-title">
										<strong>할인상품</strong>
									</h4>
								</div>
								<div style="overflow-x: hidden; width: 480px; height: 185px;">
									<div id="collapse-One" class="accordion-body collapse in">
										<div class="panel-body">
											<div class="row">
												<c:forEach var="sp" items="${requestScope.list3}">
													<div class="col-md-4 col-sm-4 col-xs-6">
														<a href="#" data-toggle="modal" data-target="#cmodal${sp.store_product_no}">
															<img src="/everycvs/resources/upload/${sp.stored_file_name}" alt="No_Image">
														</a>
														<h5 align="center">
															<strong>${sp.product_name}</strong>
														</h5>
														<h6 align="center" style="color: red;">${sp.discount_name}</h6>
														<!-- Modal -->
														<div id="cmodal${sp.store_product_no}" class="modal fade"
															role="dialog">
															<div class="modal-dialog">
																<!-- Modal content-->
																<div class="modal-content">
																	<div class="modal-header">
																		<button type="button" class="close"
																			data-dismiss="modal">&times;</button>
																		<h4 class="modal-title" style="color: black;">
																			<strong>제품 상세보기</strong>
																		</h4>
																	</div>
																	<div class="modal-body">
																		<div class="row">
																			<div class="col-sm-6">
																				<img src="/everycvs/resources/upload/${sp.stored_file_name}"
																					alt="No_Image" align="left"
																					style="margin-left: 5px;">
																			</div>
																			<div class="col-sm-6">
																				<table class="table table-condensed">
																					<tr>
																						<td><strong>상품명</strong></td>
																						<td>${sp.product_name}</td>
																					</tr>
																					<tr>
																						<td><strong>가격</strong></td>
																						<td><fmt:formatNumber value="${sp.price}" pattern="#,###" />원</td>
																					</tr>
																					<tr>
																						<td><strong>제조사</strong></td>
																						<td>${sp.manufacturer}</td>
																					</tr>
																					<tr>
																						<td><strong>제조일</strong></td>
																						<td>${sp.manufacture_date}</td>
																					</tr>
																					<tr>
																						<td><strong>할인기간</strong></td>
																						<td>${sp.start_date}~${sp.end_date}</td>
																					</tr>
																					<tr>
																						<c:choose>
																							<c:when test="${sp.discount_no==3}">
																								<td><strong>증정상품</strong></td>
																								<td>${sp.discount_info}</td>
																							</c:when>
																							<c:when test="${sp.discount_no==4}">
																								<td><strong>할인가격</strong></td>
																								<td><fmt:formatNumber value="${sp.discount_info}" pattern="#,###" />원</td>
																							</c:when>
																						</c:choose>
																					</tr>
																				</table>
																			</div>
																		</div>
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-primary btn-sm" data-dismiss="modal"
																		onclick="add_favorite('${sp.store_product_no}', '${sp.store_no}');">관심상품</button>
																		&nbsp;
																		<button type="button" class="btn btn-primary btn-sm"
																			data-dismiss="modal">구매하기</button>
																	</div>
																</div>
															</div>
														</div>
														<!-- Modal End -->
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
									<h4 class="panel-title">
										<strong>유통기한 임박상품</strong>
									</h4>
								</div>
								<div style="overflow-x: hidden; width: 480px; height: 185px;">
									<div id="collapse-One" class="accordion-body collapse in">
										<div class="panel-body">
											<div class="row">
												<c:forEach var="sp" items="${requestScope.list4}">
													<div class="col-md-4 col-sm-4 col-xs-6">
														<a href="#" data-toggle="modal" data-target="#dmodal${sp.store_product_no}">
															<img src="/everycvs/resources/upload/${sp.stored_file_name}" alt="No_Image">
														</a>
														<h5 align="center">
															<strong>${sp.product_name}</strong>
														</h5>
														<c:set var="day">
															<fmt:formatNumber value="${sp.expiration_hour/24-1}" type="number" maxFractionDigits="0" />
														</c:set>
														<c:set var="hour" value="${sp.expiration_hour%24}" />
														<c:choose>
															<c:when test="${day<1}">
																<h6 align="center" style="color: red; font-size: 10pt;">${hour}시간 남았습니다.</h6>
															</c:when>
															<c:otherwise>
																<h6 align="center" style="color: red; font-size: 10pt;">${day}일 ${hour}시간<br>남았습니다.
																</h6>
															</c:otherwise>
														</c:choose>
														<!-- Modal -->
														<div id="dmodal${sp.store_product_no}" class="modal fade"
															role="dialog">
															<div class="modal-dialog">
																<!-- Modal content-->
																<div class="modal-content">
																	<div class="modal-header">
																		<button type="button" class="close" data-dismiss="modal">&times;</button>
																		<h4 class="modal-title" style="color: black;">
																			<strong>제품 상세보기</strong>
																		</h4>
																	</div>
																	<div class="modal-body">
																		<div class="row">
																			<div class="col-sm-6">
																				<img src="/everycvs/resources/upload/${sp.stored_file_name}"
																					alt="No_Image" align="left"
																					style="margin-left: 5px;">
																			</div>
																			<div class="col-sm-6">
																				<table class="table table-condensed">
																					<tr>
																						<td><strong>상품명</strong></td>
																						<td>${sp.product_name}</td>
																					</tr>
																					<tr>
																						<td><strong>가격</strong></td>
																						<td><fmt:formatNumber value="${sp.price}" pattern="#,###" />원</td>
																					</tr>
																					<tr>
																						<td><strong>할인가격</strong></td>
																						<td><fmt:formatNumber value="${sp.expiration_price}" pattern="#,###" />원
																							&nbsp;(${sp.discount_rate}할인)</td>
																					</tr>
																					<tr>
																						<td><strong>제조사</strong></td>
																						<td>${sp.manufacturer}</td>
																					</tr>
																					<tr>
																						<td><strong>제조일</strong></td>
																						<td>${sp.manufacture_date}</td>
																					</tr>
																				</table>
																			</div>
																		</div>
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-primary btn-sm" data-dismiss="modal"
																		onclick="add_favorite('${sp.store_product_no}', '${sp.store_no}');">관심상품</button>
																		&nbsp;
																		<button type="button" class="btn btn-primary btn-sm"
																			data-dismiss="modal">구매하기</button>
																	</div>
																</div>
															</div>
														</div>
														<!-- Modal End -->
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
				<c:if test="${count==0}">
					<div class="row" align="center">
						<img src="/everycvs/resources/upload/ready_img.jpg" alt="No_Image">
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