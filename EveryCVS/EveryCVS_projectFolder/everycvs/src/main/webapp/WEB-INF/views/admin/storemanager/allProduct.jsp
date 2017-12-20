<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.everycvs.common.model.vo.StoreProduct, java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
<!-- === BEGIN HEAD ===  -->
<c:import url="../../include/user/common/head.jsp"></c:import>
<c:import url="../../include/user/common/headend.jsp"></c:import>
<!-- === END HEAD ===  -->
<!-- === BEGIN HEADER ===  -->
<c:import url="../../include/user/common/header.jsp"></c:import>
<!-- === END HEADER === -->
<!-- === BEGIN CONTENT === -->
<div id="content">
	<div class="container background-white">
		<div class="row margin-vert-30">
			<div class="col-md-12">
				<div class="row">
					<div class="col-sm-6">
						<h2>
							<strong>${sessionScope.store.brand_name}&nbsp;${sessionScope.store.store_name}</strong><br>
							<small>${sessionScope.store.road_address}</small>
						</h2>
					</div>
					<form action="apmlist.do" method="post">
						<div class="col-sm-3" style="margin-left: 190px;">
							<br> <input class="form-control" type="search"
								placeholder="상품명을 입력해주세요." name="keyword" value="${keyword}">
						</div>
						<div>
							<br>
							<button type="submit" class="btn btn-primary btn-sm">검색</button>
						</div>
					</form>
				</div>
				<br>
				<div>
					<h6>본사에서 등록한 상품목록에서 판매할 상품을 선택하여 등록합니다.</h6>
					<h6>추가할 상품의 제조일을 입력하고, 수량을 조정한 후 추가 버튼을 클릭하여 상품을 추가합니다.</h6>
				</div>
				<br>
				<div class="box">
					<div class="box-body no-padding">
						<form id="productinsert" action="apminsert.do" method="post">
							<table class="table table-condensed">
								<tr>
									<th>상품번호</th>
									<th>종류</th>
									<th>상품명</th>
									<th>제조사</th>
									<th>가격</th>
									<th>유통기한</th>
									<th>제조일</th>
									<th>수량</th>
								</tr>
								<c:forEach var="apm" items="${requestScope.list}"
									varStatus="status">
									<tr>
										<td><input type="hidden" id="list_${status.index}" value="${apm.product_no}">${apm.product_no}</td>
										<td>${apm.product_kind_name}</td>
										<td><a href="#"><strong>${apm.product_name}</strong></a></td>
										<td>${apm.manufacturer}</td>
										<td><fmt:formatNumber value="${apm.price}" pattern="#,###" />원</td>
										<td align="center">${apm.expiration_date}일</td>
										<td><input class="form-control" id="listmdate_${status.index}"
											type="date" name="mdate" value="${today}"></td>
										<td><input class="form-control" id="listquantity_${status.index}"
											type="number" min="0" max="100" step="1" name="quantity" value="0"></td>
									</tr>
								</c:forEach>
							</table>
							<button type="button" class="btn btn-primary btn-sm pull-right" style="margin-right: 10px;"
								onclick="insertSubmit(${sessionScope.store.store_no},${currentPage},${listCount});">추가</button>
						</form>
					</div>
				</div>
			</div>
			<br>
			<div class="text-center">
				<ul class="pagination">
					<c:choose>
						<c:when test="${currentPage <= 1}">
							<li class="hidden"><a href="#">&laquo;</a></li>
						</c:when>
						<c:otherwise>
							<c:url var="apmlist" value="apmlist.do" />
							<li><a href="${apmlist}?page=${currentPage - 1}">&laquo;</a></li>
						</c:otherwise>
					</c:choose>

					<c:forEach var="apm" begin="${startPage}" end="${endPage}" step="1">
						<c:choose>
							<c:when test="${apm == currentPage}">
								<li class="active"><a href="#">${apm}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${apmlist}?page=${apm}">${apm}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${currentPage >= maxPage}">
							<li class="hidden"><a href="#">&raquo;</a></li>
						</c:when>
						<c:otherwise>
							<c:url var="apmlist" value="apmlist.do" />
							<li><a href="${apmlist}?page=${currentPage + 1}">&raquo;</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- === END CONTENT === -->
<!-- === BEGIN FOOTER === -->
<c:import url="../../include/user/common/footer.jsp"></c:import>
<!-- === END FOOTER === -->
<!-- JS -->
<script type="text/javascript">
	function insertSubmit(sno,page,listCount) {
		var lists =[];
		for(var i=0;i<listCount;i++){
			var pnum = $("#list_"+i).val();//개별로 받아올 값들
			var mdate = $("#listmdate_"+i).val();//개별로 받아올 값들
			var quantity = $("#listquantity_"+i).val();//개별로 받아올 값들
			if(quantity>0)
			lists.push({product_no:pnum,manufacture_date:mdate,quantity:quantity});
			 $("#listquantity_"+i).val("0");
		}
		console.log(lists);
		if(lists.length>0){
		var jlists = JSON.stringify(lists);

		$.ajax({
			url:"apminsert.do",
			data:{
				sno:sno,
				page:page,
				jlists:jlists},
			type : 'post',
			success : function(data) {
				swal("성공",data+"개의 상품 등록!","success");
			},
			error : function(request, status, error) {
				swal("오류",error,"error");
			}			
			});
		}
	}
</script>
<c:import url="../../include/user/common/end.jsp"></c:import>
<!-- === END FOOTER === -->