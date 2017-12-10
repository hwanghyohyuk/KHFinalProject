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
							<li class="list-group-item list-toggle">
							<a href="gifticonPage.do">기프티콘 보관함</a>
								</li>
							
							<!-- 관심목록 -->
							<li class="list-group-item list-toggle">
							<a href="favoritePage.do">관심목록</a>
								</li>
								
							<!-- 회원탈퇴 -->
							<li class="list-group-item list-toggle"><a
								data-toggle="collapse" data-parent="#sidebar-nav"
								href="#collapse-icons">회원탈퇴</a>
								</li>
						</ul>
					</div>
					<!-- End Sidebar Menu -->
					<div class="col-md-9">

						<div class="row">
					<div class="col-md-6">

						<!-- 나의 잔고 영역 -->
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">나의 잔고</h3>
							</div>

							<div class="panel-body" align="right">
								<b style="font-size: 20pt;" id="result"> <fmt:formatNumber
										value="${user.cash}" pattern="#,###" />원
										
								</b>
								<b id="result"></b>
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
												<p>- 1000원 이하의 금액은 충전 할 수 없습니다.</p>
												<p>- 충전된 금액은 환불이 불가합니다.</p>
												<br>
												
												<form name="frm" id="frm" method="get"> 
												    <input type="hidden" name="user_no">
												    <input type="hidden" name="cash">
													<input type="text" name="increMoney">
														
													<button class="btn btn-primary" type="submit" id="btn">충 전</button>
												</form>

											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">완료</button>
											</div>
										</div>

									</div>
								</div>

								<br><br>
								<button class="btn btn-primary" id="myBtn2">거래내역</button>

								<!-- Modal -->
								<div class="modal fade" id="myModal2" role="dialog">
									<div class="modal-dialog modal-lg">

										<!-- Modal content-->
										<div class="modal-content" align="left">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">&times;</button>
												<h4 class="modal-title">거래내역</h4>
											</div>
											<div class="modal-body">
												<table border="1" style="text-align: center;">
															<tr style="font-size: 10pt;">
															<th>구매번호</th><th>사용자번호</th><th>지점상품번호</th>
															<th>지점번호</th><th>지점명</th><th>상품번호</th>
															<th>상품명</th><th>상품수량</th><th>합 계</th>
															<th>사용포인트</th><th>적립포인트</th><th>구매날짜</th>
															</tr>
														
														<c:forEach items="${list }" var="list">
														    <tr><td>${list.purchase_no }</td>
														    <td>${list.user_no }</td>
														    <td>${list.store_product_no }</td>
														    <td>${list.store_no }</td>
														    <td>${list.store_name }</td>
														    <td>${list.product_no }</td>
														    <td>${list.product_name }</td>
														    <td>${list.purchase_quantity }</td>
														    <td>${list.calculated_price }</td>
														    <td>${list.using_point }</td>
														    <td>${list.accumulate_point }p</td>
														    <td>${list.purchase_date }</td>
														    </tr>
															
														</c:forEach>
														</table>
												
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">Close</button>
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
											QnA()</a> <a href="#"
											style="margin-right: 50px; font-size: 15pt;"> 신고()</a> <a
											href="#" style="margin-right: 50px; font-size: 15pt;">
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
											${sessionScope.user.point} point
									</div>
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
								</div>
							</div>
						</div>
					
					
					<!-- 관심목록 -->
						<div class="col-md-6">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">관심 목록</h3>
								</div>
								<div class="panel-body" align="right" style="font-size: 15pt;">
									<table border="1" style="text-align: center; font-size:10pt">
											<tr style="font-size: 10pt;">
											<th>상호명</th>
											<th>지점명</th>
											<th>상품명</th>
											<th>첨부파일변경명</th>
											<th>최소유통기한</th>
											</tr>
										
									<c:forEach items="${flist }" var="flist">
									    <tr>
										<td>${flist.brand_name }</td>
										<td>${flist.store_name }</td>
										<td>${flist.product_name }</td>
										<td>${flist.stored_file_name }</td>
										<td>${flist.min_expiration_hour }</td>
										</tr> 
									
									</c:forEach>
									</table>
								</div>
							</div>
						</div>
					
				 </div>
				</div>
			</div> 
	</div>
	</div>
	
	
	<!-- === BEGIN FOOTER === -->
	<c:import url="../../include/user/common/footer.jsp"></c:import>
	<!-- === END FOOTER === -->

	<script>
		$(document).ready(function() {
			$("#myBtn").click(function() {
				$("#myModal").modal();
				 
				//모달창의 충전 버튼을 클릭하면 ajax 통신이 시작
				$("#btn").on("click", function(){
				$.ajax({
					url : "increMoney.do",
					async:false,
					data : {increMoney:500, user_no:"${sessionScope.user.user_no}", cash:"${sessionScope.user.cash}"},
					type: "get", 
					success: function(data){
							alert(data);
							$("#result").html(data);
					},
					error: function(request, status, errorData){
						alert("error code: " + request.status + "/n" 
								+ "message : " + request.reponseText + "/n"
								+ "error : " + request.errorData);
					}
				});
				});
			});
			});
	
		$(document).ready(function() {
			$("#myBtn2").click(function() {
				$("#myModal2").modal();
			});
		});
	</script>

	<!-- JS -->
	<c:import url="../../include/user/common/end.jsp"></c:import>
	<!-- === END === -->