<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- === BEGIN HEAD ===  -->
<c:import url="../../include/user/common/head.jsp"></c:import>
<c:import url="../../include/user/common/headend.jsp"></c:import>
<!-- === END HEAD ===  -->
<!-- === BEGIN HEADER ===  -->
<c:import url="../../include/user/common/header.jsp"></c:import>
<!-- === END HEADER === -->
<!-- === 본문내용 === -->
<div id="content">
	<div class="container background-white">
		<div class="row margin-vert-40">
			<!-- Begin Sidebar Menu -->
			<div class="col-md-3">
				<ul class="list-group sidebar-nav" id="sidebar-nav">
					<!-- 기프티콘 보관함 -->
					<li class="list-group-item list-toggle"><a
						data-toggle="collapse" data-parent="#sidebar-nav"
						href="#collapse-typography">기프티콘 보관함</a></li>

					<!-- 관심목록 -->
					<li class="list-group-item list-toggle"><a
						class="accordion-toggle" href="#collapse-components"
						data-toggle="collapse">관심목록</a></li>

					<!-- 회원탈퇴 -->
					<li class="list-group-item list-toggle"><a
						data-toggle="collapse" data-parent="#sidebar-nav"
						href="#collapse-icons">회원탈퇴</a></li>
				</ul>
			</div>
			<!-- End Sidebar Menu -->
			<div class="col-md-9">

				<div class="row margin-top-20">
					<div class="col-md-6">

						<!-- 나의 잔고 영역 -->
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">나의 잔고</h3>
							</div>

							<div class="panel-body" align="right">
								<b style="font-size: 20pt;">125,000</b>
								<button class="btn btn-primary" id="myBtn">충전하기</button>

								<!-- Modal -->
								<div class="modal fade" id="myModal" role="dialog">
									<div class="modal-dialog">

										<!-- Modal content-->
										<div class="modal-content" align="left">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">&times;</button>
												<h4 class="modal-title">충전하기</h4>
											</div>

											<div class="modal-body">
												<p style="font-size: 15pt; font-weight: bold;">충전할 금액 :
													[값]</p>
												<p>- 1000원이하의 금액은 충전 할 수 없습니다.</p>
												<p>- 이미 충전한 금액에 대해서는 환불이 불가능합니다.</p>
												<br> <input type="text">
												<button class="btn btn-primary">충 전</button>
											</div>

											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">완료</button>
											</div>
										</div>

									</div>
								</div>

								<br> <br>
								<button class="btn btn-primary" id="purchaseDetailsBtn">거래내역</button>

								<!-- Modal -->
								<div class="modal fade" id="myModal2" role="dialog">
									<div class="modal-dialog">

										<!-- Modal content-->
										<div class="modal-content" align="left">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">&times;</button>
												<h4 class="modal-title">거래내역</h4>

												<c:forEach items="${list }" var="list">
															${list}
														</c:forEach>
											</div>

											<div class="modal-body">거래내역</div>

											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">완료</button>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>


					<div class="col-md-6">
						<!-- 내가 쓴글 보기 영역 -->
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">내가 쓴글 보기</h3>
							</div>
							<div class="panel-body">
								<a href="#" style="margin-right: 50px; font-size: 15pt;">
									QnA()</a> <a href="#" style="margin-right: 50px; font-size: 15pt;">
									신고()</a> <a href="#" style="margin-right: 50px; font-size: 15pt;">
									자유()</a>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<!-- 포인트 현황 -->
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">포인트 현황</h3>
							</div>
							<div class="panel-body" align="right" style="font-size: 20pt;">
								3256point</div>
						</div>
					</div>
				</div>

				<hr>

				<div class="row">
					<!-- 자주구매 목록 -->
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">자주 구매한 목록</h3>
							</div>
							<div class="panel-body" align="right" style="font-size: 15pt;">
								상품 리스트 영역</div>
						</div>
					</div>


					<!-- 관심목록 -->
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">관심 목록</h3>
							</div>
							<div class="panel-body" align="right" style="font-size: 15pt;">
								관심상품 리스트 영역</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- === END CONTENT === -->
	<!-- === BEGIN FOOTER === -->
	<c:import url="../../include/user/common/footer.jsp"></c:import>
	<!-- === END FOOTER === -->
	<script>
		//충전하기 모달
		$(document).ready(function() {
			$("#myBtn").click(function() {
				$("#myModal").modal();
			});
		});

		//거래내역 모달
		$(document).ready(function() {
			$("#purchaseDetailsBtn").click(function() {
				$("#myModal2").modal();
			});
		});
	</script>

	<!-- JS -->
	<c:import url="../../include/user/common/end.jsp"></c:import>
	<!-- === END === -->