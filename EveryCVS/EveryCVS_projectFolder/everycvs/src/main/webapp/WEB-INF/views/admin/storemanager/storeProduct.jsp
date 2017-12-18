<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.kh.everycvs.common.model.vo.StoreProduct, java.util.ArrayList"%>
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
					<form action="spmlist.do" method="post">
						<div class="col-sm-3" style="margin-left: 190px;">
							<br> 
							<input class="form-control" type="search"
								placeholder="상품명을 입력해주세요." name="keyword" value="${keyword}">
						</div>
						<div>
							<br>
							<button type="submit" class="btn btn-primary btn-sm">검색</button>
						</div>
					</form>
				</div>
				<br> <br>
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">
							<strong>지점상품관리</strong>
						</h3>
					</div> <br>
					<div class="box-body no-padding">
						<table class="table table-condensed">
							<tr>
								<th>지점상품번호</th>
								<th>종류</th>
								<th>상품명</th>
								<th>제조사</th>
								<th>가격</th>
								<th>할인정보</th>
								<th>제조일</th>
								<th>수량</th>
								<th>삭제여부</th>
								<th>삭제</th>
							</tr>
							<c:forEach var="spm" items="${requestScope.list}">
								<tr>
									<td>${spm.store_product_no}</td>
									<td>${spm.product_kind_name}</td>
									<td><a href="#" data-toggle="modal"
										data-target="#spmmodal${spm.store_product_no}"> <strong>${spm.product_name}</strong>
									</a></td>
									<td>${spm.manufacturer}</td>
									<td><fmt:formatNumber value="${spm.price}" pattern="#,###"/>원</td>
									<td>${spm.discount_name}</td>
									<td>${spm.manufacture_date}</td>
									<td>${spm.quantity}개</td>
									<td class="text-center">${spm.del_check}</td>
									<td>
										<button type="button" class="btn btn-primary btn-xs" 
										onclick="location.href='spmdelete.do?spnum=${spm.store_product_no}&toggle=${spm.del_check}'">
										<c:if test="${spm.del_check eq 'N'}">삭제</c:if>
										<c:if test="${spm.del_check ne 'N'}">복구</c:if>										
										</button>
									</td>
									<!-- Modal -->
									<td>
										<div id="spmmodal${spm.store_product_no}" class="modal fade" role="dialog">
											<div class="modal-dialog">
												<!-- Modal content-->
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal">&times;</button>
														<h4 class="modal-title" style="color: black;">
															<strong>상품설정</strong>
														</h4>
													</div>
													<div class="modal-body">
														<div class="row">
															<div class="col-sm-6">
																<img
																	src="/everycvs/resources/user/img/theteam/image1.jpg"
																	alt="image1" align="left" style="margin-left: 5px;">
															</div>
															<div class="col-sm-6">
															<form id="updateform" action="/everycvs/spmupdate.do" method="post" enctype="multipart/form-data">
															<input type="hidden" name="spnum" value="${spm.store_product_no}">
															<input type="hidden" name="page" value="${currentPage}">
																<table class="table table-condensed">
																	<tr>
																		<td><strong>상품명</strong></td>
																		<td>${spm.product_name}</td>
																	</tr>
																	<tr>
																		<td><strong>가격</strong></td>
																		<td><fmt:formatNumber value="${spm.price}" pattern="#,###"/>원</td>
																	</tr>
																	<tr>
																		<td><strong>유통기한</strong></td>
																		<td>${spm.expiration_date}일</td>
																	</tr>
																	<tr>
																		<td><strong>구매횟수</strong></td>
																		<td>${spm.purchase_count}번</td>
																	</tr>
																	<tr>
																		<td><strong>제조일</strong></td>
																		<td><input class="form-control" type="date" name="mdate"
																			value="${spm.manufacture_date}"></td>
																	</tr>
																	<tr>
																		<td><strong>수량</strong></td>
																		<td><input class="form-control" type="number" min="1"
																			max="100" step="1" name="quantity" value="${spm.quantity}"></td>
																	</tr>
																</table>
																</form>
															</div>
														</div>
														<div class="row" style="margin-left: 10px;">
															<h3>
																<strong>진행중인 EVENT</strong>
															</h3>
															<br>
															<button type="button" class="btn btn-default">없음</button>
															&nbsp;&nbsp;&nbsp;&nbsp;
															<button type="button" class="btn btn-default">1+1</button>
															&nbsp;&nbsp;&nbsp;&nbsp;
															<button type="button" class="btn btn-default">2+1</button>
															&nbsp;&nbsp;&nbsp;&nbsp;
															<button type="button" class="btn btn-default">증정행사</button>
															&nbsp;&nbsp;&nbsp;&nbsp;
															<button type="button" class="btn btn-default">할인행사</button>
														</div>
													</div>
													<div class="modal-footer">
														<button type="submit" class="btn btn-primary btn-sm" data-dismiss="modal"
														onclick="updateSubmit();">수정</button> &nbsp;
														<button type="button" class="btn btn-primary btn-sm" 
														onclick="location.href='spmdelete.do?spnum=${spm.store_product_no}&toggle=${spm.del_check}'">
															<c:if test="${spm.del_check eq 'N'}">삭제</c:if>
															<c:if test="${spm.del_check ne 'N'}">복구</c:if>										
														</button>
													</div>
												</div>
											</div><!-- Get방식으로 넘김 -->
										</div> 
									</td>
									<!-- Modal End -->
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
			<div class="text-center">
				<ul class="pagination">
					<c:choose>
						<c:when test="${currentPage <= 1}">
							<li class="hidden"><a href="#">&laquo;</a></li>
						</c:when>
						<c:otherwise>
							<c:url var="spmlist" value="spmlist.do" />
							<li><a href="${spmlist}?page=${currentPage - 1}">&laquo;</a></li>
						</c:otherwise>
					</c:choose>

					<c:forEach var="spm" begin="${startPage}" end="${endPage}" step="1">
						<c:choose>
							<c:when test="${spm == currentPage}">
								<li class="active"><a href="#">${spm}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${spmlist}?page=${spm}">${spm}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${currentPage >= maxPage}">
							<li class="hidden"><a href="#">&raquo;</a></li>
						</c:when>
						<c:otherwise>
							<c:url var="spmlist" value="spmlist.do" />
							<li><a href="${spmlist}?page=${currentPage + 1}">&raquo;</a></li>
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
	function updateSubmit(){
		$("#updateform").submit();
	}
</script>
<c:import url="../../include/user/common/end.jsp"></c:import>
<!-- === END FOOTER === -->