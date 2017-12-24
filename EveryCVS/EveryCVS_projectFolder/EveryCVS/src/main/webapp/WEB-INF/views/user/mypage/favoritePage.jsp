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
										<td><a id="productName" data-toggle="modal" data-target="#myModal" style="cursor: pointer;"
										onclick="show_modal('${favorite.brand_name}', '${favorite.store_name}', '${favorite.product_name}', '${favorite.price}', '${favorite.stored_file_name}', '${favorite.store_no}');">
										${favorite.product_name}</a></td>
										<td>${favorite.price}원</td>
										<td><i class="fa fa-trash-o jun21"
											onclick="delete_fav('${favorite.product_no}', '${favorite.store_no}');"></i></td>
									</tr>
								</c:forEach>
							</table>
						</div>

						<!-- Modal -->
						<div class="modal fade" id="myModal" role="dialog">
							<div class="modal-dialog modal-sm modal-custom-height">
								<div class="modal-content">
									<div class="modal-body">
										<div class="jun_imgdiv3" id="detail5"></div>
										<div class="jun_contentdiv" style="display: block;">
											<span onclick="goStore();" style="cursor: pointer;">
											<span id="detail1"></span><span id="detail2"></span></span><br>
											<span id="detail3" style="font-weight: bold;"></span><br>
											<span id="detail4" class="col-xs-offset-9 jun40"></span>원<br>
										</div>
									</div>
									<div class="modal-footer" style="clear: both; margin-top: 2px;">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">CANCEL</button>
									</div>
								</div>
							</div>
						</div>
						<!-- End Modal -->

						<div class="clearfix"></div>
					</div>
					<!-- End tab content -->
					<!-- Search & Add block -->
					<form name="searchFavoriteFrm" action="/everycvs/favoriteSearch.do"
						method="post">
						<div class="col-sm-12" style="padding-left: 0px;">
							<div class="col-sm-2" style="padding: 0px;"
								id="paddingrmv3">
								<select name="category" class="form-control input"
									style="padding-left: 5px;">
									<option>상호명</option>
									<option>지점명</option>
									<option selected>상품명</option>
								</select>
							</div>
							<div class="col-sm-4" style="padding: 0px" id="paddingrmv3">
								<input name="keyword" class="form-control jun42" type="text"
									placeholder="검색 키워드를 입력하세요.">
							</div>
							<div class="col-sm-1" id="paddingrmv3" style="padding: 0px;">
								<button type="submit" onclick="search_favorite();"
									class="btn btn-default btn" id="searchbtn">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</div>
					</form>
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
	var sno;

	/*	delete_fav() : 관심상품의 번호들을 받아서 삭제처리하는 함수 */
	function delete_fav(product_no, store_no) {
		var answer = false;
		answer = confirm("해당 상품을 삭제하시겠습니까?");
		if (answer)
			location.href = "/everycvs/favoriteDelete.do?product_no=" + product_no
					+ "&store_no=" + store_no;
	}

	function search_favorite() {
		var category = searchFavoriteFrm.category.value;
		var keyword = searchFavoriteFrm.keyword.value;
		if (keyword == "") {
			alert("검색 키워드를 입력하세요.");
			return false;
		}
		searchFavoriteFrm.submit();
	}

	/* 해당 상품의 정보를 받아서 모달 안의 내용을 상품 정보로 바꾸는 함수 */
	function show_modal(brand_name, store_name, product_name, price, stored_file_name, store_no) {
		sno = store_no;
		$("#detail1").html(brand_name);
		$("#detail2").html(store_name);
		$("#detail3").html(product_name);
		$("#detail4").html(price);
		if (stored_file_name == "")
			$("#detail5").html('<img src="" alt="상품 이미지가 없습니다." class="jun_img">');
		else
			$("#detail5").html('<img src="/everycvs/resources/upload/' + stored_file_name + '" alt="상품 이미지가 없습니다." class="jun_img">');
	}
	
	function goStore(){
		location.href="/everycvs/page/storemain.do?sno=" + sno;
	}
</script>


<!-- JS -->
<c:import url="../../include/user/common/end.jsp"></c:import>
<!-- === END === -->