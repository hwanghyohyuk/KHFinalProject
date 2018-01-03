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
		location.href="/everycvs/favoriteInsert.do?product_no=" + pno + "&store_no=" + sno;
	}
</script>
<style type="text/css">
	h5 {
		overflow: hidden; 
	    text-overflow: ellipsis;
	    white-space: nowrap; 
	    width: 120px;
	}
</style>
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
														<img src="/everycvs/resources/upload/${sp.stored_file_name}" alt="No_Image"
														width="200px" height="130px">
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
																		data-dismiss="modal"
																		data-toggle="modal" 
																		data-target="#s${sp.store_product_no}">구매하기</button>
																</div>
															</div>
														</div>
													</div>
													<!-- Modal End -->

													<!-- 구매하는 새 모달 띄우기 -->
													<!-- Modal -->
													<div class="modal fade" id="s${sp.store_product_no}"
														role="dialog" tabindex="-1">
														<div class="modal-dialog">
															<!-- Modal content-->
															<div class="modal-content">
																<div class="modal-header">
																	<button type="button" class="close"
																		data-dismiss="modal">&times;</button>
																	<h4 class="modal-title">구매하기</h4>
																</div>
																<div class="modal-body">
																	<p>나의 잔고 : ${user.cash }</p>
																	<p>결제할 금액 : ${sp.price }</p>
																	-결제금액보다 잔고가 적으면 결제가 되지않습니다.<br> -결제 후에는 환불이
																	불가능합니다. <br>
																	<br>
																	<!-- 결제 선택 버튼(잔고) -->
																	<form action="userDecreMoney.do" id="frm">
																		<input type="hidden" name="cash" value="${user.cash }">
																		<input type="hidden" name="user_no"
																			value="${user.user_no }"> <input
																			type="hidden" name="point" value="${user.point }">
																		<input type="hidden" name="store_product_no"
																			value="${sp.store_product_no}"> <input
																			type="number" name="purchase_quantity"
																			value="${purchase.purchase_quantity }"
																			style="width: 40px;"> <input type="hidden"
																			name="calculated_price" value="${sp.price }">
																		<input type="hidden" name="using_point" value=0>
																		<input type="hidden" name="store_no"
																			value="${sp.store_no }">

																		<button type="submit" class="btn btn-primary"
																			name="price" value="${sp.price}"
																			onclick="return purchaseMoney();">잔고 결제</button>

																	</form>
																	&nbsp;
																	<!-- 포인트 결제 버튼 -->
																	<form action="userDecrePoint.do" id="form">
																		<input type="hidden" name="user_no"
																			value="${user.user_no }"> <input
																			type="hidden" name="point" value="${user.point }">
																		<input type="hidden" name="store_product_no"
																			value="${sp.store_product_no}"> <input
																			type="number" name="purchase_quantity"
																			value="${purchase.purchase_quantity }"
																			style="width: 40px;"> <input type="hidden"
																			name="calculated_price" value="${sp.price }">
																		<input type="hidden" name="store_no"
																			value="${sp.store_no }">

																		<button type="submit" class="btn btn-primary"
																			name="price" value="${sp.price }"
																			onclick="return purchasePoint();">포인트 결제</button>
																	</form>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-default"
																		data-toggle="modal" 
																		data-target="#s${sp.store_product_no}">close</button>
																</div>
															</div>
														</div>
													</div>
													<!-- 구매 모달창 끝 -->

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
														<img src="/everycvs/resources/upload/${sp.stored_file_name}" alt="No_Image"
														width="200px" height="130px">
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
																		data-dismiss="modal"
																		data-toggle="modal" 
																		data-target="#s${sp.store_product_no}"
																		>구매하기</button>
																</div>
															</div>
														</div>
													</div>
													<!-- Modal End -->

													<!-- 구매하는 새 모달 띄우기 -->
													<!-- Modal -->
													<div class="modal fade" id="s${sp.store_product_no}"
														role="dialog" tabindex="-1">
														<div class="modal-dialog">
															<!-- Modal content-->
															<div class="modal-content">
																<div class="modal-header">
																	<button type="button" class="close"
																		data-dismiss="modal">&times;</button>
																	<h4 class="modal-title">구매하기</h4>
																</div>
																<div class="modal-body">
																	<p>나의 잔고 : ${user.cash }</p>
																	<p>결제할 금액 : ${sp.price }</p>
																	-결제금액보다 잔고가 적으면 결제가 되지않습니다.<br> -결제 후에는 환불이
																	불가능합니다. <br>
																	<br>
																	<!-- 결제 선택 버튼(잔고) -->
																	<form action="userDecreMoney.do" id="frm">
																		<input type="hidden" name="cash" value="${user.cash }">
																		<input type="hidden" name="user_no"
																			value="${user.user_no }"> <input
																			type="hidden" name="point" value="${user.point }">
																		<input type="hidden" name="store_product_no"
																			value="${sp.store_product_no}"> <input
																			type="number" name="purchase_quantity"
																			value="${purchase.purchase_quantity }"
																			style="width: 40px;"> <input type="hidden"
																			name="calculated_price" value="${sp.price }">
																		<input type="hidden" name="using_point" value=0>
																		<input type="hidden" name="store_no"
																			value="${sp.store_no }">

																		<button type="submit" class="btn btn-primary"
																			name="price" value="${sp.price}"
																			onclick="return purchaseMoney();">잔고 결제</button>

																	</form>
																	&nbsp;
																	<!-- 포인트 결제 버튼 -->
																	<form action="userDecrePoint.do" id="form">
																		<input type="hidden" name="user_no"
																			value="${user.user_no }"> <input
																			type="hidden" name="point" value="${user.point }">
																		<input type="hidden" name="store_product_no"
																			value="${sp.store_product_no}"> <input
																			type="number" name="purchase_quantity"
																			value="${purchase.purchase_quantity }"
																			style="width: 40px;"> <input type="hidden"
																			name="calculated_price" value="${sp.price }">
																		<input type="hidden" name="store_no"
																			value="${sp.store_no }">

																		<button type="submit" class="btn btn-primary"
																			name="price" value="${sp.price }"
																			onclick="return purchasePoint();">포인트 결제</button>
																	</form>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-default"
																		data-dismiss="modal">close</button>
																</div>
															</div>
														</div>
													</div>
													<!-- 구매 모달창 끝 -->
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
								<div style="overflow-x: hidden; width: 480px; height: 235px;">
									<div id="collapse-One" class="accordion-body collapse in">
										<div class="panel-body">
											<div class="row">
												<c:forEach var="sp" items="${requestScope.list3}">
													<div class="col-md-4 col-sm-4 col-xs-6">
														<a href="#" data-toggle="modal" data-target="#cmodal${sp.store_product_no}">
															<img src="/everycvs/resources/upload/${sp.stored_file_name}" alt="No_Image"
															width="200px" height="130px">
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
																			data-dismiss="modal"
																			data-toggle="modal" 
																			data-target="#s${sp.store_product_no}">구매하기</button>
																	</div>
																</div>
															</div>
														</div>
														<!-- Modal End -->

														<!-- 구매하는 새 모달 띄우기 -->
														<!-- Modal -->
														<div class="modal fade" id="s${sp.store_product_no}" role="dialog" tabindex="-1">
															<div class="modal-dialog">
																<!-- Modal content-->
																<div class="modal-content">
																	<div class="modal-header">
																		<button type="button" class="close"
																			data-dismiss="modal">&times;</button>
																		<h4 class="modal-title">구매하기</h4>
																	</div>
																	<div class="modal-body">
																		<p>나의 잔고 : ${user.cash }</p>
																		<p>결제할 금액 : ${sp.price }</p>
																		-결제금액보다 잔고가 적으면 결제가 되지않습니다.<br> -결제 후에는 환불이
																		불가능합니다. <br>
																		<br>
																		<!-- 결제 선택 버튼(잔고) -->
																		<form action="userDecreMoney.do" id="frm">
																			<input type="hidden" name="cash"
																				value="${user.cash }"> <input type="hidden"
																				name="user_no" value="${user.user_no }"> <input
																				type="hidden" name="point" value="${user.point }">
																			<input type="hidden" name="store_product_no"
																				value="${sp.store_product_no}"> <input
																				type="number" name="purchase_quantity"
																				value="${purchase.purchase_quantity }"
																				style="width: 40px;"> <input type="hidden"
																				name="calculated_price" value="${sp.price }">
																			<input type="hidden" name="using_point" value=0>
																			<input type="hidden" name="store_no"
																				value="${sp.store_no }">

																			<button type="submit" class="btn btn-primary"
																				name="price" value="${sp.price}"
																				onclick="return purchaseMoney();">잔고 결제</button>

																		</form>
																		&nbsp;
																		<!-- 포인트 결제 버튼 -->
																		<form action="userDecrePoint.do" id="form">
																			<input type="hidden" name="user_no"
																				value="${user.user_no }"> <input
																				type="hidden" name="point" value="${user.point }">
																			<input type="hidden" name="store_product_no"
																				value="${sp.store_product_no}"> <input
																				type="number" name="purchase_quantity"
																				value="${purchase.purchase_quantity }"
																				style="width: 40px;"> <input type="hidden"
																				name="calculated_price" value="${sp.price }">
																			<input type="hidden" name="store_no"
																				value="${sp.store_no }">

																			<button type="submit" class="btn btn-primary"
																				name="price" value="${sp.price }"
																				onclick="return purchasePoint();">포인트 결제</button>
																		</form>
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-default"
																			data-dismiss="modal">close</button>
																	</div>
																</div>
															</div>
														</div>
														<!-- 구매 모달 끝 -->
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
								<div style="overflow-x: hidden; width: 480px; height: 235px;">
									<div id="collapse-One" class="accordion-body collapse in">
										<div class="panel-body">
											<div class="row">
												<c:forEach var="sp" items="${requestScope.list4}">
													<div class="col-md-4 col-sm-4 col-xs-6">
														<a href="#" data-toggle="modal" data-target="#dmodal${sp.store_product_no}">
															<img src="/everycvs/resources/upload/${sp.stored_file_name}" alt="No_Image"
															width="200px" height="130px">
														</a>
														<h5 align="center">
															<strong>${sp.product_name}</strong>
														</h5>
														<c:set var="day">
															<fmt:formatNumber value="${sp.expiration_minute/(24*60)-1}" type="number" maxFractionDigits="0" />
														</c:set>
														<c:set var="hour">
															<fmt:formatNumber value="${(sp.expiration_minute/60)%24-1}" type="number" maxFractionDigits="0" />
														</c:set>
														<c:set var="minute" value ="${sp.expiration_minute%60}"></c:set>
														<c:choose>
															<c:when test="${day==0 && hour==0 && minute==0}">
																<h6 align="center" style="color: red; font-size: 10pt;">유통기한 만료</h6>
															</c:when>
															<c:when test="${day==0 && hour==0 && minute!=0}">
																<h6 align="center" style="color: red; font-size: 10pt;">${minute}분 <br>남았습니다.</h6>
															</c:when>
															<c:when test="${day==0 && hour!=0 && minute==0}">
																<h6 align="center" style="color: red; font-size: 10pt;">${hour}시간 <br>남았습니다.</h6>
															</c:when>
															<c:when test="${day==0 && hour!=0 && minute!=0}">
																<h6 align="center" style="color: red; font-size: 10pt;">${hour}시간 ${minute}분 <br>남았습니다.</h6>
															</c:when>
															<c:when test="${day!=0 && hour==0 && minute==0}">
																<h6 align="center" style="color: red; font-size: 10pt;">${day}일 <br>남았습니다.</h6>
															</c:when>
															<c:when test="${day!=0 && hour==0 && minute!=0}">
																<h6 align="center" style="color: red; font-size: 10pt;">${day}일 ${minute}분 <br>남았습니다.</h6>
															</c:when>
															<c:when test="${day!=0 && hour!=0 && minute==0}">
																<h6 align="center" style="color: red; font-size: 10pt;">${day}일 ${hour}시간 <br>남았습니다.</h6>
															</c:when>
															<c:when test="${day!=0 && hour!=0 && minute!=0}">
																<h6 align="center" style="color: red; font-size: 10pt;">${day}일 ${hour}시간 ${minute}분 <br>남았습니다.</h6>
															</c:when>
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
																			data-dismiss="modal"
																			data-toggle="modal" 
																			data-target="#s${sp.store_product_no}">구매하기</button>
																	</div>
																</div>
															</div>
														</div>
														<!-- Modal End -->

														<!-- 구매하는 새 모달 띄우기 -->
														<!-- Modal -->
														<div class="modal fade" id="s${sp.store_product_no}"
															role="dialog" tabindex="-1">
															<div class="modal-dialog">
																<!-- Modal content-->
																<div class="modal-content">
																	<div class="modal-header">
																		<button type="button" class="close"
																			data-dismiss="modal">&times;</button>
																		<h4 class="modal-title">구매하기</h4>
																	</div>
																	<div class="modal-body">
																		<p>나의 잔고 : ${user.cash }</p>
																		<p>결제할 금액 : ${sp.price }</p>
																		-결제금액보다 잔고가 적으면 결제가 되지않습니다.<br> -결제 후에는 환불이
																		불가능합니다. <br>
																		<br>
																		<!-- 결제 선택 버튼(잔고) -->
																		<form action="userDecreMoney.do" id="frm">
																			<input type="hidden" name="cash"
																				value="${user.cash }"> <input type="hidden"
																				name="user_no" value="${user.user_no }"> <input
																				type="hidden" name="point" value="${user.point }">
																			<input type="hidden" name="store_product_no"
																				value="${sp.store_product_no}"> <input
																				type="number" name="purchase_quantity"
																				value="${purchase.purchase_quantity }"
																				style="width: 40px;"> <input type="hidden"
																				name="calculated_price" value="${sp.price }">
																			<input type="hidden" name="using_point" value=0>
																			<input type="hidden" name="store_no"
																				value="${sp.store_no }">

																			<button type="submit" class="btn btn-primary"
																				name="price" value="${sp.price}"
																				onclick="return purchaseMoney();">잔고 결제</button>

																		</form>
																		&nbsp;
																		<!-- 포인트 결제 버튼 -->
																		<form action="userDecrePoint.do" id="form">
																			<input type="hidden" name="user_no"
																				value="${user.user_no }"> <input
																				type="hidden" name="point" value="${user.point }">
																			<input type="hidden" name="store_product_no"
																				value="${sp.store_product_no}"> <input
																				type="number" name="purchase_quantity"
																				value="${purchase.purchase_quantity }"
																				style="width: 40px;"> <input type="hidden"
																				name="calculated_price" value="${sp.price }">
																			<input type="hidden" name="store_no"
																				value="${sp.store_no }">

																			<button type="submit" class="btn btn-primary"
																				name="price" value="${sp.price }"
																				onclick="return purchasePoint();">포인트 결제</button>
																		</form>
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-default"
																			data-dismiss="modal">close</button>
																	</div>
																</div>
															</div>
														</div>

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
<script>
function purchaseMoney(){
	var result;
	<c:forEach var="sp" items="${requestScope.list}">
	var price = ${sp.price};
	var cash = ${user.cash};
	result = cash - price;
	</c:forEach>
	
	if(result < 0){
		alert("잔고 부족");
		return false;
	}
	if(result > 0){
		alert("결제 완료");
	}
}

function purchasePoint(){
	var result;
	<c:forEach var="sp" items="${requestScope.list}">
	var price = ${sp.price};
	var point = ${user.point};
	result = point - price;
	</c:forEach>

	if(result < 0){
		alert("잔고 부족");
		return false;
	}
	if(result > 0){
		alert("결제 완료");
		
	}
}
</script>
<c:import url="../include/user/common/end.jsp"></c:import>
<!-- === END FOOTER === -->