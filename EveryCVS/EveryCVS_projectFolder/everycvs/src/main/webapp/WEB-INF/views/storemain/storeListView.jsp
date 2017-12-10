<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.kh.everycvs.common.model.vo.StoreProduct, java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- === BEGIN HEAD ===  -->
<c:import url="../include/user/common/head.jsp"></c:import>
<script type="text/javascript">
	$(document).ready(function() {
		$("#spname").click(function() {
			$("#myModal").modal();
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
							<strong>GS25대치점</strong><br> <small>서울특별시 강남구
								영동대로86길 10 </small>
						</h2>
					</div>
					<form action="spsearch.do" method="post">
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
				<br> <br>
				<div class="row margin-bottom-30">
					<!-- Person Details -->
					<c:forEach var="sp" items="${requestScope.list}">
						<div
							class="col-md-3 col-sm-3 col-xs-6 person-details margin-bottom-30">
							<figure>
								<figcaption>
									<c:url var="spdetail" value="spdetail.do" />
									<a id="spname" href="${spdetail}?spnum=${sp.store_product_no}&page=${requestScope.currentPage}">
										<img src="/everycvs/resources/user/img/theteam/image1.jpg" alt="image1">
									</a><br>
									<h5 align="center">
										<strong>${sp.product_name}</strong>
									</h5>
									<h6 align="center">${sp.price}</h6>
								</figcaption>
							</figure>
						</div>
					</c:forEach>
				</div>
			</div>
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
<c:import url="../include/user/common/end.jsp"></c:import>
<!-- === END FOOTER === -->