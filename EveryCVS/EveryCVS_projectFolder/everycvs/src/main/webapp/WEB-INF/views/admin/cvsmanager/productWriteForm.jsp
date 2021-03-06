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
				<b>${sessionScope.user.brand_name}</b>&nbsp;&nbsp;Product management
			</h2>
			<!-- aqua panel -->
			<div class="panel panel-blue">
				<div class="panel-heading">
					<h3 class="panel-title">Add product</h3>
				</div>
				<div class="panel-body">
					<form name="productFrm" action="/everycvs/cvsproductwrite.do"
					method="post" class="form-inline" enctype="multipart/form-data">
						<div class="form-group" id="jun_input1">
							<label for="product0" style="padding-right: 54px;">Category</label>
							<select name="kind" class="form-control input" id="product0"
								style="padding-left: 5px;">
								<option value="0" selected>분류 선택</option>
								<option value="1">과일</option>
								<option value="2">도시락</option>
								<option value="3">김밥</option>
								<option value="4">햄버거</option>
								<option value="5">햄</option>
								<option value="6">라면</option>
								<option value="7">아이스크림</option>
								<option value="8">샐러드</option>
								<option value="9">과자</option>
								<option value="10">음료</option>
							</select>
						</div>
						<br>

						<div class="form-group" id="jun_input1">
							<label for="product1" style="padding-right: 22px;">Product
								Name</label> <input type="text" name="productname" class="form-control" id="product1"
								style="width: 300px;" placeholder="상품명을 입력하세요.">
						</div>
						<br>
						<div class="form-group" id="jun_input1">
							<label for="product2" style="padding-right: 27px;">Manufacturer</label>
							<input type="text" name="manufacturer" class="form-control" id="product2"
								style="width: 248px;" placeholder="제조사를 입력하세요.">
						</div>
						<br>
						<div class="form-group" id="jun_input1">
							<label for="product3"
								style="padding-right: 82px; float: left; padding-top: 7px;">Price</label>
							<div class="input-group">
								<div class="input-group-addon">￦</div>
								<input type="number" name="price" class="form-control" id="product3" step="100"
									style="width: 80px; padding: 5px; text-align: center;"
									placeholder="가격">
							</div>
						</div>
						<br>
						<div class="form-group" id="jun_input1">
							<label for="product4"
								style="padding-right: 19px; float: left; padding-top: 6px;">Expiration
								Date</label>
							<div class="input-group col-md-1">
								<input type="number" name="deadline" class="form-control" id="product4"
									style="width: 48px; padding: 5px; text-align: center;">
								<div class="input-group-addon" id="modify2">day</div>
								<div class="jun6" id="displayblock">day</div>
							</div>
						</div>
						<br>
						<div class="form-group" id="jun_input1">
							<label for="product5"
								style="float: left; padding: 0px 24px 10px 0px; padding-top: 2px;">Product
								image</label> <input type="file" name="imgfile" id="product5"
								style="padding: 0px; float: left;">
						</div>
						<div class="col-sm-13 jun18">
							<button onclick="input_check();" type="submit" class="btn btn-danger btn-lg jun4 jun7"
								id="width100">SUBMIT</button>
						</div>
					</form>
				</div>
			</div>
			<!-- End aqua panel -->

		</div>
	</div>
</div>

<!-- === END CONTENT === -->
<!-- === BEGIN FOOTER === -->
<c:import url="../../include/admin/common/footer.jsp"></c:import>
<!-- === END FOOTER === -->
<!-- JS -->
<c:import url="../../include/admin/common/end.jsp"></c:import>
<!-- JS Custom Function -->
<script type="text/javascript">
	function input_check() {
		if(productFrm.kind.value == 0){
			alert("상품 분류를 선택하세요.");
			return false;
		}
		if(productFrm.productname.value == ""){
			alert("상품명을 입력하세요.");
			return false;
		}
		if(productFrm.manufacturer.value == ""){
			alert("제조사를 입력하세요.");
			return false;
		}
		if(productFrm.price.value == ""){
			alert("가격을 입력하세요.");
			return false;
		}
		if(productFrm.price.value < 0){
			alert("0 이상의 가격을 입력하세요.");
			return false;
		}
		if(productFrm.deadline.value == ""){
			alert("유통기한을 입력하세요.");
			return false;
		}
		if(productFrm.deadline.value < 0){
			alert("0 이상의 유통기한을 입력하세요.");
			return false;
		}
		productFrm.submit();
	}
</script>
<!-- End JS Custom Function -->
<!-- === END === -->