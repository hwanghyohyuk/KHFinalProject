<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.everycvs.common.model.vo.StoreProduct, java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- === BEGIN HEAD ===  -->
<c:import url="../../include/user/common/head.jsp"></c:import>
<c:import url="../../include/user/common/headend.jsp"></c:import>
<!-- === END HEAD ===  -->
<!-- === BEGIN HEADER ===  -->
<c:import url="../../include/user/common/header.jsp"></c:import>
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
					<form action="apmlist.do" method="post">
						<div class="col-sm-3" style="margin-left: 190px;">
							<br> <input class="form-control" type="search"
								placeholder="상품명을 입력해주세요." name="keyword" value="${keyword}">
						</div>
						<div>
							<br>
							<button type="submit" class="btn btn-primary btn-sm">검색</button>
						</div>
					</form>
				</div>
				<br>
				<div>
					<h6>본사에서 등록한 상품목록에서 판매할 상품을 선택하여 등록합니다.</h6>
					<h6>추가할 상품의 제조일을 입력하고, 수량을 조정한 후 추가 버튼을 클릭하여 상품을 추가합니다.</h6>
				</div>
				<br>
				<div class="box">
					<div class="box-body no-padding">
						<table class="table table-condensed">
							<tr>
								<th>상품번호</th>
								<th>종류</th>
								<th>상품명</th>
								<th>제조사</th>
								<th>가격</th>
								<th>유통기한</th>
								<th>제조일</th>
								<th>수량</th>
								<th>추가</th>
							</tr>
							<c:forEach var="apm" items="${requestScope.list}">
								<tr>
									<td>${apm.product_no}</td>
									<td>${apm.product_kind_name}</td>
									<td><a href="#" data-toggle="modal"
										data-target="#apmmodal${apm.product_no}"><strong>${apm.product_name}</strong>
									</a></td>
									<td>${apm.manufacturer}</td>
									<td><fmt:formatNumber value="${apm.price}" pattern="#,###" />원</td>
									<td align="center">${apm.expiration_date}일</td>
									<td><input class="form-control" type="date" name="mdate"></td>
									<td><input class="form-control" type="number" min="1"
										max="100" step="1" name="quantity" value="0"></td>
									<td><button type="button" class="btn btn-primary btn-sm"
									data-dismiss="modal" onclick="insertSubmit();">추가</button></td>
									<!-- Modal -->
									<td>
										<div id="apmmodal${apm.product_no}" class="modal fade"
											role="dialog">
											<div class="modal-dialog">
												<!-- Modal content-->
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal">&times;</button>
														<h4 class="modal-title" style="color: black;">
															<strong>상품추가</strong>
														</h4>
													</div>
													<div class="modal-body">
														<div class="row">
															<div class="col-sm-6">
																<img src="/everycvs/resources/upload/${apm.stored_file_name}"
																	alt="No_Image" align="left" style="margin-left: 5px;">
															</div>
															<div class="col-sm-6">
															<form id="insertform" action="/everycvs/apminsert.do" method="post" enctype="multipart/form-data">
															<input type="hidden" name="sno" value="${sessionScope.store.store_no}">
															<input type="hidden" name="pnum" value="${apm.product_no}">
															<input type="hidden" name="page" value="${currentPage}">
																<table class="table table-condensed">
																	<tr>
																		<td><strong>상품명</strong></td>
																		<td>${apm.product_name}</td>
																	</tr>
																	<tr>
																		<td><strong>가격</strong></td>
																		<td><fmt:formatNumber value="${apm.price}"
																				pattern="#,###" />원</td>
																	</tr>
																	<tr>
																		<td><strong>제조사</strong></td>
																		<td>${apm.manufacturer}</td>
																	</tr>
																	<tr>
																		<td><strong>유통기한</strong></td>
																		<td>${apm.expiration_date}일</td>
																	</tr>
																	<tr>
																		<td><strong>제조일</strong></td>
																		<td><input class="form-control" type="date" name="mdate"></td>
																	</tr>
																	<tr>
																		<td><strong>수량</strong></td>
																		<td><input class="form-control" type="number"
																			min="1" max="100" step="1" name="quantity" value="0"></td>
																	</tr>
																</table>
															</form>
															</div>
														</div>
													</div>
													<div class="modal-footer">
														<button type="submit" class="btn btn-primary btn-sm"
														data-dismiss="modal" onclick="insertSubmit();">추가</button>
													</div>
												</div>
											</div>
										</div>
									</td>
									<!-- Modal End -->
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
			<br>
			<div class="text-center">
				<ul class="pagination">
					<c:choose>
						<c:when test="${currentPage <= 1}">
							<li class="hidden"><a href="#">&laquo;</a></li>
						</c:when>
						<c:otherwise>
							<c:url var="apmlist" value="apmlist.do" />
							<li><a href="${apmlist}?page=${currentPage - 1}">&laquo;</a></li>
						</c:otherwise>
					</c:choose>

					<c:forEach var="apm" begin="${startPage}" end="${endPage}" step="1">
						<c:choose>
							<c:when test="${apm == currentPage}">
								<li class="active"><a href="#">${apm}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${apmlist}?page=${apm}">${apm}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${currentPage >= maxPage}">
							<li class="hidden"><a href="#">&raquo;</a></li>
						</c:when>
						<c:otherwise>
							<c:url var="apmlist" value="apmlist.do" />
							<li><a href="${apmlist}?page=${currentPage + 1}">&raquo;</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- === END CONTENT === -->
<!-- === BEGIN FOOTER === -->
<c:import url="../../include/user/common/footer.jsp"></c:import>
<!-- === END FOOTER === -->
<!-- JS -->
<script type="text/javascript">
	function insertSubmit() {
		$("#insertform").submit();
	}
</script>
<c:import url="../../include/user/common/end.jsp"></c:import>
<!-- === END FOOTER === -->