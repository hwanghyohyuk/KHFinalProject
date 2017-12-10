<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
							<strong>GS25대치점</strong><br> <small>서울특별시 강남구
								영동대로86길 10</small>
						</h2>
					</div>
					<div class="col-sm-1" style="margin-left: 350px;">
						<br> <a href="splist.do"><button type="button"
								class="btn btn-primary btn-sm">지점상품 전체보기</button></a>
					</div>
				</div>
				<br> <br>
				<div class="row">
					<!-- 인기상품 -->
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h5 class="panel-title">
									<strong>인기상품</strong>
								</h5>
							</div>
							<div id="collapse-One" class="accordion-body collapse in">
								<div class="panel-body">
									<div class="row">
										<div class="col-md-4">
											<img src="/everycvs/resources/user/img/fillers/filler1.jpg"
												alt="filler image">
											<h5 align="center">
												<strong>보성녹돈불고기</strong>
											</h5>
											<h6 align="center">4200원</h6>
										</div>
										<div class="col-md-4">
											<img src="/everycvs/resources/user/img/fillers/filler1.jpg"
												alt="filler image">
											<h5 align="center">
												<strong>보성녹돈불고기</strong>
											</h5>
											<h6 align="center">4200원</h6>
										</div>
										<div class="col-md-4">
											<img src="/everycvs/resources/user/img/fillers/filler1.jpg"
												alt="filler image">
											<h5 align="center">
												<strong>보성녹돈불고기</strong>
											</h5>
											<h6 align="center">4200원</h6>
										</div>
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
							<div id="collapse-One" class="accordion-body collapse in">
								<div class="panel-body">
									<div class="row">
										<div class="col-md-4">
											<img src="/everycvs/resources/user/img/fillers/filler1.jpg"
												alt="filler image">
											<h5 align="center">
												<strong>보성녹돈불고기</strong>
											</h5>
											<h6 align="center">4200원</h6>
										</div>
										<div class="col-md-4">
											<img src="/everycvs/resources/user/img/fillers/filler1.jpg"
												alt="filler image">
											<h5 align="center">
												<strong>보성녹돈불고기</strong>
											</h5>
											<h6 align="center">4200원</h6>
										</div>
										<div class="col-md-4">
											<img src="/everycvs/resources/user/img/fillers/filler1.jpg"
												alt="filler image">
											<h5 align="center">
												<strong>보성녹돈불고기</strong>
											</h5>
											<h6 align="center">4200원</h6>
										</div>
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
							<div id="collapse-One" class="accordion-body collapse in">
								<div class="panel-body">
									<div class="row">
										<div class="col-md-4">
											<img src="/everycvs/resources/user/img/fillers/filler1.jpg"
												alt="filler image">
											<h5 align="center">
												<strong>보성녹돈불고기</strong>
											</h5>
											<h6 align="center">4200원</h6>
											<h6 align="center" style="color: red;">할인행사</h6>
										</div>
										<div class="col-md-4">
											<img src="/everycvs/resources/user/img/fillers/filler1.jpg"
												alt="filler image">
											<h5 align="center">
												<strong>보성녹돈불고기</strong>
											</h5>
											<h6 align="center">4200원</h6>
											<h6 align="center" style="color: red;">1+1행사</h6>
										</div>
										<div class="col-md-4">
											<img src="/everycvs/resources/user/img/fillers/filler1.jpg"
												alt="filler image">
											<h5 align="center">
												<strong>보성녹돈불고기</strong>
											</h5>
											<h6 align="center">4200원</h6>
											<h6 align="center" style="color: red;">2+1행사</h6>
										</div>
									</div>
								</div>
							</div>
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
					<!-- 유통기한 임박상품 -->
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h5 class="panel-title">
									<strong>유통기한 임박상품</strong>
								</h5>
							</div>
							<div id="collapse-One" class="accordion-body collapse in">
								<div class="panel-body">
									<div class="row">
										<div class="col-md-4">
											<img src="/everycvs/resources/user/img/fillers/filler1.jpg"
												alt="filler image">
											<h5 align="center">
												<strong>보성녹돈불고기</strong>
											</h5>
											<h6 align="center">4200원</h6>
											<h6 align="center" style="color: red;">3일 남았습니다.</h6>
										</div>
										<div class="col-md-4">
											<img src="/everycvs/resources/user/img/fillers/filler1.jpg"
												alt="filler image">
											<h5 align="center">
												<strong>보성녹돈불고기</strong>
											</h5>
											<h6 align="center">4200원</h6>
											<h6 align="center" style="color: red;">2일 남았습니다.</h6>
										</div>
										<div class="col-md-4">
											<img src="/everycvs/resources/user/img/fillers/filler1.jpg"
												alt="filler image">
											<h5 align="center">
												<strong>보성녹돈불고기</strong>
											</h5>
											<h6 align="center">4200원</h6>
											<h6 align="center" style="color: red;">1일 남았습니다.</h6>
										</div>
									</div>
								</div>
							</div>
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
				</div>
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