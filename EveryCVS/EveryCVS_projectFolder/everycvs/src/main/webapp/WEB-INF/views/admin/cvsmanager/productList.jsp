<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- === BEGIN HEAD ===  -->
<c:import url="../../include/admin/common/head.jsp"></c:import>
<link rel="stylesheet"
	href="/everycvs/resources/admin/cvscss/custom.css" rel="stylesheet">
<link rel="stylesheet"
	href="/everycvs/resources/admin/cvscss/responsive.css" rel="stylesheet">
<c:import url="../../include/admin/common/headend.jsp"></c:import>
<!-- === END HEAD ===  -->
<!-- === BEGIN HEADER ===  -->
<!-- 선택적 -->
<c:import url="../../include/admin/common/header.jsp"></c:import>
<!-- === END HEADER === -->
<!-- === BEGIN CONTENT === -->

<!-- Right side column. Contains the navbar and content of the page -->
<div class="content-wrapper">
	<!-- Main content -->
	<div id="content">
		<div class="container background-white">
			<h2 class="margin-bottom-30">
				<b>GS25</b>&nbsp;&nbsp;Product management
			</h2>

			<!-- Accordion -->
			<div id="accordion" class="panel-group">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a class="accordion-toggle" href="#collapse-One"
								data-parent="#accordion" data-toggle="collapse"> 금주의 인기 상품
								TOP 5 </a>
						</h4>
					</div>
					<div id="collapse-One" class="accordion-body collapse in">
						<div class="panel-body"
							style="padding-top: 20px; padding-bottom: 56px;">
							<div class="row">
								<div class="jun1" id="modify1" data-toggle="modal"
									data-target="#myModal" style="cursor: pointer;">
									<div class="jun_imgdiv2">
										<img src="assets/img/background.jpg" class="jun_img2"
											alt="NO IMAGE">
									</div>
									<div class="jun19">롯데)전주한상도시락</div>
									<span class="label label-blue jun20">562 EA</span>
								</div>
								<div class="jun1" id="modify1" data-toggle="modal"
									data-target="#myModal" style="cursor: pointer;">
									<div class="jun_imgdiv2">
										<img src="assets/img/background.jpg" class="jun_img2"
											alt="NO IMAGE">
									</div>
									<div class="jun19">참치마요김밥</div>
									<span class="label label-blue jun20">544 EA</span>
								</div>
								<div class="jun1" id="modify1" data-toggle="modal"
									data-target="#myModal" style="cursor: pointer;">
									<div class="jun_imgdiv2">
										<img src="assets/img/background.jpg" class="jun_img2"
											alt="NO IMAGE">
									</div>
									<div class="jun19">치즈불닭볶음면</div>
									<span class="label label-blue jun20">538 EA</span>
								</div>
								<div class="jun1" id="modify1" data-toggle="modal"
									data-target="#myModal" style="cursor: pointer;">
									<div class="jun_imgdiv2">
										<img src="assets/img/background.jpg" class="jun_img2"
											alt="NO IMAGE">
									</div>
									<div class="jun19">데미소다애플</div>
									<span class="label label-blue jun20">289 EA</span>
								</div>
								<div class="jun1" id="modify1" data-toggle="modal"
									data-target="#myModal" style="cursor: pointer;">
									<div class="jun_imgdiv2">
										<img src="assets/img/background.jpg" class="jun_img2"
											alt="NO IMAGE">
									</div>
									<div class="jun19">불고기양념도시락</div>
									<span class="label label-blue jun20">228 EA</span>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a class="accordion-toggle" href="#collapse-Two"
								data-parent="#accordion" data-toggle="collapse"> 상품 종류별 판매량
							</a>
						</h4>
					</div>
					<div id="collapse-Two" class="accordion-body collapse">
						<div class="panel-body">
							<div class="row">
								<div class="col-md-6">
									<!-- progress bar -->
									<!-- first progress block -->
									<span class="jun2">과일(5%)</span>
									<div class="progress progress-sm height20">
										<div class="progress-bar progress-bar-red" role="progressbar"
											aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"
											style="width: 20%">500 EA</div>
									</div>
									<span class="jun2">도시락(22%)</span>
									<div class="progress progress-sm height20">
										<div class="progress-bar progress-bar-green"
											role="progressbar" aria-valuenow="90" aria-valuemin="0"
											aria-valuemax="100" style="width: 88%">2200 EA</div>
									</div>
									<span class="jun2">김밥(16%)</span>
									<div class="progress progress-sm height20">
										<div class="progress-bar progress-bar-yellow"
											role="progressbar" aria-valuenow="90" aria-valuemin="0"
											aria-valuemax="100" style="width: 64%">1600 EA</div>
									</div>
									<span class="jun2">햄버거(13%)</span>
									<div class="progress progress-sm height20">
										<div class="progress-bar progress-bar-ppple"
											role="progressbar" aria-valuenow="90" aria-valuemin="0"
											aria-valuemax="100" style="width: 52%">1300 EA</div>
									</div>
									<span class="jun2">햄(6%)</span>
									<div class="progress progress-sm height20">
										<div class="progress-bar progress-bar-pink" role="progressbar"
											aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"
											style="width: 24%">600 EA</div>
									</div>
								</div>
								<div class="col-md-6">
									<span class="jun2">라면(12%)</span>
									<div class="progress progress-sm height20">
										<div class="progress-bar progress-bar-salgu"
											role="progressbar" aria-valuenow="90" aria-valuemin="0"
											aria-valuemax="100" style="width: 48%">1200 EA</div>
									</div>
									<span class="jun2">아이스크림(6%)</span>
									<div class="progress progress-sm height20">
										<div class="progress-bar progress-bar-skyblue"
											role="progressbar" aria-valuenow="90" aria-valuemin="0"
											aria-valuemax="100" style="width: 24%">600 EA</div>
									</div>
									<span class="jun2">샐러드(1%)</span>
									<div class="progress progress-sm height20">
										<div class="progress-bar progress-bar-gray" role="progressbar"
											aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"
											style="width: 2%">100 EA</div>
									</div>
									<span class="jun2">과자(10%)</span>
									<div class="progress progress-sm height20">
										<div class="progress-bar progress-bar-blue" role="progressbar"
											aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"
											style="width: 20%">1000 EA</div>
									</div>
									<span class="jun2">음료(9%)</span>
									<div class="progress progress-sm height20">
										<div class="progress-bar progress-bar-aqua" role="progressbar"
											aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"
											style="width: 18%">900 EA</div>
									</div>

									<!-- End progress bar -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End Acordion -->

			<div class="panel" style="padding: 8px;">
				<!-- Tab v1 -->
				<div class="tabs">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#sample-1a" data-toggle="tab">전체</a></li>
						<li><a href="#sample-1a" data-toggle="tab">과일</a></li>
						<li><a href="#sample-1b" data-toggle="tab">도시락</a></li>
						<li><a href="#sample-1c" data-toggle="tab">김밥</a></li>
						<li><a href="#sample-1d" data-toggle="tab">햄버거</a></li>
						<li><a href="#sample-1d" data-toggle="tab">햄</a></li>
						<li><a href="#sample-1d" data-toggle="tab">라면</a></li>
						<li><a href="#sample-1d" data-toggle="tab">아이스크림</a></li>
						<li><a href="#sample-1d" data-toggle="tab">샐러드</a></li>
						<li><a href="#sample-1d" data-toggle="tab">과자</a></li>
						<li><a href="#sample-1d" data-toggle="tab">음료</a></li>
					</ul>

					<!-- tab-content -->
					<div class="tab-content">
						<div class="tab-pane fade in active" id="sample-1a">
							<div class="row">
								<div class="col-md-12">
									<table class="table">
										<tr class="active text-center">
											<th width="10%">번호</th>
											<th width="28%">상품명</th>
											<th width="17%">제조사</th>
											<th width="12%">분류</th>
											<th width="12%">가격</th>
											<th width="15%">유통기한</th>
											<th width="6%">Del</th>
										</tr>
										<tr class="text-center">
											<td>0421</td>
											<td data-toggle="modal" data-target="#myModal"
												style="cursor: pointer;">롯데)전주식한상도시락</td>
											<td>롯데푸드</td>
											<td>도시락</td>
											<td>3,000원</td>
											<td>3일</td>
											<td><i class="fa fa-trash-o jun21"
												onclick="del_product();"></i></td>
										</tr>
									</table>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
						<!-- End tab content -->
						<!-- Search & Add block -->
						<div class="row">
							<div class="col-sm-12" style="padding-left: 16px;">
								<!--start-->
								<div class="col-sm-2 jun16">
									<select class="form-control input jun15">
										<option>번호</option>
										<option>상품명</option>
										<option>제조사</option>
									</select>
								</div>
								<form>
									<div class="col-sm-4 jun12">
										<input class="form-control jun11" type="text"
											placeholder="검색 키워드를 입력하세요.">
									</div>
									<div class="col-sm-1 jun13">
										<button type="submit" class="btn btn-default btn jun14"
											onclick="search_product();">
											<i class="fa fa-search"></i>
										</button>
									</div>
								</form>
								<div class="col-sm-5 jun17">
									<button type="button" onclick="add_product();"
										class="btn btn-danger btn jun4" id="width100">
										<i class="fa fa-cube" style="margin-right: 6px;"></i>ADD
									</button>
								</div>
								<!--end-->
							</div>
						</div>
						<!-- End Search & Add block -->
					</div>
				</div>
				<!-- End Tab v1 -->

			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel" style="color: #999;">Product detail</h4>
			</div>
			<div class="modal-body">
				<div class="jun_imgdiv">
					<img src="" alt="상품 이미지가 없습니다." class="jun_img">
				</div>
				<div class="jun_contentdiv">
					<div class="jun_textdiv">No.0001</div>
					<span style="padding-right: 26px;">상품명</span>롯데)전주식한상도시락<br> <span
						style="padding-right: 12px;">상품분류</span>도시락<br> <span
						style="padding-right: 26px;">제조사</span>롯데푸드<br> <span
						style="padding-right: 42px;">가격</span>3,000원<br> <span
						style="padding-right: 14px;">유통기한</span>3일<br> <span
						style="padding-right: 14px;">첨부파일</span>lotte-rice-002.png<br>
					<div style="margin-top: 4px;">
						판매량<span
							style="padding-left: 26px; color: #E6367A; font-weight: bold;">123942</span>
					</div>
				</div>
			</div>
			<div class="modal-footer" style="clear: both; margin-top: 2px;">
				<button type="button" onclick="del_product();" class="btn btn-gray"
					style="float: left;">DELETE</button>
				<button type="button" onclick="modify_product();"
					class="btn btn-danger">MODIFY</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">CANCEL</button>
			</div>
		</div>
	</div>
	<!-- End Modal -->

	<!-- End Main content -->
</div>

<!-- === END CONTENT === -->
<!-- === BEGIN FOOTER === -->
<c:import url="../../include/admin/common/footer.jsp"></c:import>
<!-- === END FOOTER === -->
<!-- JS -->
<c:import url="../../include/admin/common/end.jsp"></c:import>
<!-- JS Custom Function -->
<script type="text/javascript">
	function del_product() {
		var answer = false;
		answer = confirm("해당 상품을 삭제하시겠습니까?");
		if (answer)
			alert("상품이 삭제되었습니다.");
	}

	function search_product() {
		// 검색창 null 이면 alert
		location.href = '/everycvs/cvsproductlist.do';
	}

	function modify_product() {
		location.href = '/everycvs/cvsproductmodifyview.do';
	}

	function add_product() {
		location.href = '/everycvs/cvsproductwriteview.do';
	}
</script>
<!-- End JS Custom Function -->
<!-- === END === -->