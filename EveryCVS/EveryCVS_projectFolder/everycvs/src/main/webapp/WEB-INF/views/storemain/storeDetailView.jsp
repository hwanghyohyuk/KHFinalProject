<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
								<td>${requestScope.storeproduct.product_name}</td>
							</tr>
							<tr>
								<td><strong>가격</strong></td>
								<td>${requestScope.storeproduct.price}</td>
							</tr>
							<tr>
								<td><strong>제조사</strong></td>
								<td>${requestScope.storeproduct.manufacturer}</td>
							</tr>
							<tr>
								<td><strong>제조일</strong></td>
								<td>${requestScope.storeproduct.manufacture_date}</td>
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