<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- === BEGIN HEAD ===  -->
<c:import url="../../include/user/common/head.jsp"></c:import>
<link rel="stylesheet" href="/everycvs/resources/user/css/custom.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="/everycvs/resources/user/css/responsive.css" rel="stylesheet">
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
						href="/everycvs/gifticonPage.do">기프티콘 보관함</a></li>

					<!-- 관심목록 -->
					<li class="list-group-item list-toggle"><a
						href="/everycvs/favoriteList.do">관심목록</a></li>

					<!-- 회원탈퇴 -->
					<li class="list-group-item list-toggle"><a
						data-toggle="collapse" data-parent="#sidebar-nav"
						href="#collapse-icons">회원탈퇴</a></li>
				</ul>
			</div>
			<!-- End Sidebar Menu -->

			<div class="col-md-9">
				<!-- Branch select table -->
				<!-- Tab v1 -->
				<div class="tabs">
					<!-- tab-content -->
					<div class="row">
						<div class="col-md-12">
							<table class="table">
								<tr class="active text-center">
									<th width="12%">브랜드명</th>
									<th width="20%">지점명</th>
									<th width="38%">상품명</th>
									<th width="12%">가격</th>
									<th width="6%">Del</th>
								</tr>
								<c:forEach var="favorite" items="${flist}">
									<tr class="text-center">
										<td>${favorite.brand_name}</td>
										<td>${favorite.store_name}</td>
										<td><a id="productName">${favorite.product_name}</a></td>
										<td>${favorite.price}원</td>
										<td><i class="fa fa-trash-o jun21"
											onclick="delete_fav('${favorite.product_no}' + '/' + '${favorite.store_no}');"></i></td>
									</tr>
								</c:forEach>
							</table>
						</div>
						
						<!-- Modal -->
						<div class="modal fade" id="favorite" role="dialog">
							<div class="modal-dialog">
								<!-- Modal content-->
								<div class="modal-content">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<div class="modal-body">
										<img alt="" src="./resources/user/img/gifticon/11.jpg"
											style="height: 500px;">
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<!-- End tab content -->
					<!-- Search & Add block -->
					<div class="col-sm-12" style="padding-left: 5px;">
						<div class="col-sm-2" style="padding-right: 0px;" id="paddingrmv3">
							<select class="form-control input" style="padding-left: 5px;">
								<option>지점번호</option>
								<option>지점명</option>
								<option>시도명</option>
								<option>구군명</option>
								<option>법정동명</option>
							</select>
						</div>
						<div class="col-sm-4" style="padding-right: 4px" id="paddingrmv3">
							<input class="form-control" type="text" style="height: 34px;"
								placeholder="검색 키워드를 입력하세요.">
						</div>
						<div class="col-sm-1" style="padding-left: 4px;" id="paddingrmv3">
							<button type="button" class="btn btn-default btn" id="width100">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</div>
					<!-- End Search & Add block -->
				</div>
				<!-- End Tab v1 -->
			</div>
			<!-- End Branch select table -->
		</div>
	</div>
</div>
<!-- 본문 끝 -->
<!-- === BEGIN FOOTER === -->
<c:import url="../../include/user/common/footer.jsp"></c:import>
<!-- === END FOOTER === -->

<script type="text/javascript">
		// 전역변수
		var narr;
	
		$(document).ready(function() {
			$("#productName").click(function() {
				$("#favorite").modal();
			});
		});
		
		/*	delete_fav() : 관심상품의 번호들을 받아서 삭제처리하는 함수
			- 매개변수 numbers는 "product_no/store_no" */
		function delete_fav(numbers){
			narr = numbers.split('/');
			var answer = false;
			answer = confirm("해당 상품을 삭제하시겠습니까?");
			if(answer)
				location.href="/everycvs/favoriteDelete.do?product_no=" + narr[0] + "&store_no=" + narr[1];
		}
	</script>


<!-- JS -->
<c:import url="../../include/user/common/end.jsp"></c:import>
<!-- === END === -->