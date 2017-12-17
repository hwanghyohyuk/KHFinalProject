<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.everycvs.common.model.vo.StoreProduct, java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- === BEGIN HEAD ===  -->
<c:import url="../include/user/common/head.jsp"></c:import>
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
					<form action="splist.do" method="post">
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
				<div class="row" style="margin-left: 1px;">
					<br> <a href="sprank.do">
					<button type="button" class="btn btn-primary btn-sm">지점메인으로 이동하기</button> </a>
				</div>
				<br>
				<div class="row margin-bottom-30">
					<!-- Person Details -->
					<c:forEach var="sp" items="${requestScope.list}">
						<div class="col-md-3 col-sm-3 col-xs-6 person-details margin-bottom-30">
							<figure>
								<figcaption>
									<a href="#" data-toggle="modal" data-target="#spmodal${sp.store_product_no}"> 
										<img src="/everycvs/resources/user/img/theteam/image1.jpg" alt="image1">
									</a> <br>
									<h5 align="center">
										<strong>${sp.product_name}</strong>
									</h5>
									<h6 align="center"><fmt:formatNumber value="${sp.price}" pattern="#,###"/>원</h6>
								</figcaption>
							</figure>
						</div>
						<c:if test="${ sessionScope.user ne null }">
						<!-- Modal -->
						<div id="spmodal${sp.store_product_no}" class="modal fade" role="dialog">
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
												<img src="/everycvs/resources/user/img/theteam/image1.jpg"
													alt="image1" align="left" style="margin-left: 5px;">
											</div>
											<div class="col-sm-6">
												<table class="table table-condensed">
													<tr>
														<td><strong>상품명</strong></td>
														<td>${sp.product_name}</td>
													</tr>
													<tr>
														<td><strong>가격</strong></td>
														<td><fmt:formatNumber value="${sp.price}" pattern="#,###"/>원</td>
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
										<button type="button" class="btn btn-primary btn-sm"
											data-dismiss="modal">관심상품</button>
										&nbsp;
										<button type="button" class="btn btn-primary btn-sm"
											data-toggle="modal" 
											data-target="#purchaseModal">구매하기</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Modal End -->

						<!-- 구매하는 새 모달 띄우기 -->
							<!-- Modal -->
							<div class="modal fade" id="purchaseModal" role="dialog" tabindex="-1">
								<div class="modal-dialog">

									<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">구매하기</h4>
										</div>
										
									
										<div class="modal-body">
											<p>나의 잔고 :  ${user.cash }</p>
											<p>결제할 금액 : ${sp.price }</p>
											-결제금액보다 잔고가 적으면 결제가 되지않습니다.<br>
											-결제 후에는 환불이 불가능합니다.
											<br><br>

										<!-- 결제 선택 버튼(잔고) -->
										<form action="userDecreMoney.do" id="frm">
											<input type="hidden" name="cash" value="${user.cash }">
											<input type="hidden" name="user_no" value="${user.user_no }">
											<input type="hidden" name="point" value="${user.point }">
											<button type="submit" class="btn"
												    name="price" value="${sp.price}">잔고 결제</button>
											
										</form>
										
										<!-- 포인트 결제 버튼 -->
										<form action="userDecrePoint.do" id="frm">
											<input type="hidden" name="user_no" value="${user.user_no }">
											<input type="hidden" name="point" value="${user.point }">
											<button type="submit" class="btn"
												    name="price" value="${sp.price }">포인트 결제</button>
										</form>
										
										</div>

										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">close</button>
										</div>
									</div>

								</div>
							</div>
							<!-- 구매하기 모달 끝 -->

						</c:if>
					</c:forEach>
				</div>
			</div>
			
			<!-- 페이징 처리 -->
			<div class="text-center">
				<ul class="pagination">
					<c:choose>
						<c:when test="${currentPage <= 1}">
							<li class="hidden"><a href="#">&laquo;</a></li>
						</c:when>
						<c:otherwise>
							<c:url var="splist" value="splist.do" />
							<li><a href="${splist}?page=${currentPage - 1}">&laquo;</a></li>
						</c:otherwise>
					</c:choose>

					<c:forEach var="sp" begin="${startPage}" end="${endPage}" step="1">
						<c:choose>
							<c:when test="${sp == currentPage}">
								<li class="active"><a href="#">${sp}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${splist}?page=${sp}">${sp}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${currentPage >= maxPage}">
							<li class="hidden"><a href="#">&raquo;</a></li>
						</c:when>
						<c:otherwise>
							<c:url var="splist" value="splist.do" />
							<li><a href="${splist}?page=${currentPage + 1}">&raquo;</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
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
//결제하기에 대한 js
  $(document).ready(function() {
	$("#frm").click(function() {
		alert("정말로 결제하시겠습니까?");
	});
});  




</script>

<c:import url="../include/user/common/end.jsp"></c:import>
<!-- === END FOOTER === -->