<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
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

							<div class="panel-body" align="right" id="result">
								
								<b style="font-size: 20pt;">
								 <fmt:formatNumber value="${user.cash }" pattern="#,###"/>원	
								</b>

								<button class="btn btn-primary" id="myBtn">충전하기</button>

								<!-- Modal -->
								<div class="modal fade" id="myModal" role="dialog">
									<div class="modal-dialog">

										<!-- Modal content-->
										<div class="modal-content" align="left">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">&times;</button>
												<h4 class="modal-title" 
													style="color:#245256; font-weight: bold;">충전하기</h4>
											</div>
											
											<form name="frm" id="frm" method="post"> 
											<div class="modal-body">
												<p>- 1000원 이하의 금액은 충전 할 수 없습니다.</p>
												<p>- 충전된 금액은 환불이 불가합니다.</p>
												
												    <input type="hidden" name="user_no">
												    <input type="hidden" name="cash">
													<input type="text" name="increMoney" placeholder="충전할 금액을 입력해주세요.">
														
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-primary"
													    id="increBtn">충전하기</button>
											</div>
											</form>
											
										</div>

									</div>
								</div>

								<br><br>
								<button class="btn btn-primary" id="myBtn2">거래내역</button>

								<!-- Modal -->
								<div class="modal fade" id="myModal2" role="dialog" data-backdrop="static">
									<div class="modal-dialog modal-lg">

										<!-- Modal content-->
										<div class="modal-content" align="left">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">&times;</button>
												<h4 class="modal-title"
													style="color:#245256; font-weight: bold;">거래내역</h4>
											</div>
											<div class="modal-body box-body no-padding" 
												 style="overflow-x:hidden; width:890px; height:300px;" id="purchaseTable">
												 
												<table id="purchaseList" class="table table-condensed" style="text-align: center;	" id="table">
														<tr style="font-size: 8pt; text-align: center;">
															<th>구매번호</th><th>지점상품번호</th>
															<th style="text-align: center;">지점번호</th><th style="text-align: center;">지점명</th>
															<th style="text-align: center;">상품명</th><th>상품수량</th><th>합 계</th>
															<th>사용포인트</th><th>적립포인트</th><th style="text-align: center;">구매날짜</th>
														</tr>
															
													<c:choose>
														<c:when test="${fn:length(list) > 0}">
															<c:forEach items="${list }" var="list">
															 <c:if test="${list.user_no eq sessionScope.user.user_no }"> 
															<tr>
															<td>${list.purchase_no }</td>
														    <td>${list.store_product_no }</td>
														    <td>${list.store_no }</td>
														    <td>${list.store_name }</td>
														    <td>${list.product_name }</td>
														    <td>${list.purchase_quantity }</td>
														    <td>${list.calculated_price }</td>
														    <td>${list.using_point }</td>
														    <td>${list.accumulate_point }p</td>
														    <td>${list.purchase_date }</td>
														    </tr> 
														     </c:if> 
															</c:forEach>
														</c:when>
													</c:choose>
												</table>
											</div>
											
											<!-- 거래내역 버튼 검색 -->
											<div class="modal-footer" align="left">
											
												<button class="btn btn-primary" style="float: left;" 
														data-toggle="modal"
														data-target="#purchaseTable"
														data-month="0"
														type="button">
														전체</button>
														
												<button class="btn btn-primary" style="float: left;" 
														data-toggle="modal"
														data-target="#purchaseTable"
														data-month="1"
														type="button"
														>3개월</button>
														
												<button class="btn btn-primary" style="float: left;"
														data-toggle="modal"
														data-target="#purchaseTable"
														data-month="2"
														type="button"
														
														>1개월</button>
														
												<button class="btn btn-primary" style="float: left;"
														data-toggle="modal" 
														data-target="#purchaseTable" 
														data-month="3"
														type="button"
														
														>1주일</button>
												
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
								<div class="panel-body box-body no-padding" align="right" 
									 style="font-size: 15pt;" >
									<table class="table table-condensed" style="text-align: center; font-size:10pt">
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
			//충전하기  ajax
			$("#myBtn").click(function() {
				var cash;
				$("#myModal").modal();
				
				//모달창의 충전 버튼을 클릭하면 ajax 통신이 시작
				$("#increBtn").on("click", function(){
					var incre = frm.increMoney.value;
					var result;
					
					//1000원 이하 충전 불가
					if( incre < 1000){
						$("#myModal").modal('hide');
						alert("1000원 이하는 충전이 불가능합니다.");
						return false;
					}
					
					//충전 확인, 취소에 따라 충전여부 결정
					var con = confirm("정말로 충전하시겠습니까?");
					if(con == true){
				$.ajax({
					url : "increMoney.do",
					data : {increMoney:incre, user_no:"${sessionScope.user.user_no}", cash:"${sessionScope.user.cash}"},
					type: "post", 
					dataType: "json",
				 	async: false,
				 	cache: false,
					success: function(data){
						cash = data.cash;	
						
					},	
					error: function(request, status, errorData){
						alert("error code: " + request.status + "/n" 
								+ "message : " + request.reponseText + "/n"
								+ "error : " + request.errorData);
					}
					
				}); 
				
				return cash;
					}
				
				if(con == false){
					$("#myModal").modal('hide');
					return false;
					}
					
				});
				
				
			});
			
			});
	
		//거래내역 모달창
		$(document).ready(function() {
			$("#myBtn2").click(function() {
				$("#myModal2").modal();
				
		//거래내역 3개월 단위로 검색하는 버튼
 	 		$("#purchaseTable").on('show.bs.modal', function (event) {
 	 		  var button = $(event.relatedTarget);
			  var params =  button.data('month');
			  console.log(params);
  				//1이면 3개월 조회
				   $.ajax({
						url:"purchaseList.do",
						data: {month:params},
						dataType: "json",
						type:"post",							
						success:function(data){
							console.log(data);
							var jsonStr = JSON.stringify(data);
							var json = JSON.parse(jsonStr);
							var values = '<tr style="font-size: 8pt; text-align: center;">'
							+'<th>구매번호</th><th>지점상품번호</th>'
							+'<th style="text-align: center;">지점번호</th><th style="text-align: center;">지점명</th>'
							+'<th style="text-align: center;">상품명</th><th>상품수량</th><th>합 계</th>'
							+'<th>사용포인트</th><th>적립포인트</th><th style="text-align: center;">구매날짜</th>'
							+'</tr>';//이부분이 테이블 헤더 (고정부분)			
							for(var i in json.plist){ //이부분은 테이블 바디(가변부분)
								var p = json.plist[i];
								values += '<tr>'
									+'<td>'+p.purchase_no+'</td>'
									+'<td>'+p.store_product_no+'</td>'
									+'<td>'+p.store_no+'</td>'
									+'<td>'+p.store_name+'</td>'
									+'<td>'+p.product_name+'</td>'
									+'<td>'+p.purchase_quantity+'</td>'
									+'<td>'+p.calculated_price+'</td>'
									+'<td>'+p.using_point+'</td>'
									+'<td>'+p.accumulate_point+'</td>'
									+'<td>'+p.purchase_date+'</td></tr>';	
							}
							$("#purchaseList").html(values);
							
						},
						error:function(request, status, errorData){
							alert("error code: " + request.status + "/n" 
									+ "message : " + request.reponseText + "/n"
									+ "error : " + request.errorData);
						} 
					
					});  
			 return false;
		});  
	});
});
	</script>
	

<!-- JS -->
	<c:import url="../../include/user/common/end.jsp"></c:import>
	<!-- === END === -->