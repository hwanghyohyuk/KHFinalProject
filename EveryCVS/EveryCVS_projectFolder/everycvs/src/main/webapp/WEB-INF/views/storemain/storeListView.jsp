<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<div class="col-sm-3" style="margin-left: 190px;">
						<br> <input class="form-control" type="text"
							placeholder="상품명을 입력해주세요.">
					</div>
					<div>
						<br>
						<button type="button" class="btn btn-primary btn-sm">검색</button>
					</div>
				</div>
				<br> <br>
				<div class="row margin-bottom-30">
					<!-- Person Details -->
					<div
						class="col-md-3 col-sm-3 col-xs-6 person-details margin-bottom-30">
						<figure>
							<figcaption>
								<a id="spname"><img
									src="/everycvs/resources/user/img/theteam/image1.jpg"
									alt="image1"></a><br>
								<h5 align="center">
									<strong>보성녹돈불고기</strong>
								</h5>
								<h6 align="center">4200원</h6>
							</figcaption>
						</figure>
						<!-- Modal -->
						<div id="myModal" class="modal fade" role="dialog">
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
														<td>다논)액티비아업플레인210ml</td>
													</tr>
													<tr>
														<td><strong>가격</strong></td>
														<td>1,800원</td>
													</tr>
													<tr>
														<td><strong>제조사</strong></td>
														<td>주식회사 올가니카키친</td>
													</tr>
													<tr>
														<td><strong>제조일</strong></td>
														<td>2017/11/20</td>
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
											data-dismiss="modal">구매하기</button>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>
		<div class="text-center">
			<ul class="pagination">
				<li><a href="#">&laquo;</a></li>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li class="active"><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">&raquo;</a></li>
			</ul>
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