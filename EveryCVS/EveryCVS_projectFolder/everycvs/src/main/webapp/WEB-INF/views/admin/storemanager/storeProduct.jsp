<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.everycvs.common.model.vo.StoreProduct, java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
					<form action="spmlist.do" method="post">
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
				<br> <br>
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">
							<strong>지점상품관리</strong>
						</h3>
					</div>
					<br>
					<div class="box-body no-padding">
						<table class="table table-condensed">
							<tr>
								<th>지점상품번호</th>
								<th>종류</th>
								<th>상품명</th>
								<th>제조사</th>
								<th>가격</th>
								<th>할인정보</th>
								<th>제조일</th>
								<th>수량</th>
								<th>삭제여부</th>
								<th>삭제</th>
							</tr>
							<c:forEach var="spm" items="${requestScope.list}">
								<tr>
									<td>${spm.store_product_no}</td>
									<td>${spm.product_kind_name}</td>
									<td>
										<a href="#" data-toggle="modal" data-target="#spmmodal_${spm.store_product_no}"> 
											<strong>${spm.product_name}</strong>
										</a>
									</td>
									
									<td>${spm.manufacturer}</td>
									<td><fmt:formatNumber value="${spm.price}" pattern="#,###" />원</td>
									<td>${spm.discount_name}</td>
									<td>${spm.manufacture_date}</td>
									<td align="center">${spm.quantity}개</td>
									<td class="text-center">${spm.del_check}</td>
									<td>
										<button type="button" class="btn btn-primary btn-xs"
											onclick="location.href='spmdelete.do?spnum=${spm.store_product_no}&toggle=${spm.del_check}'">
											<c:if test="${spm.del_check eq 'N'}">삭제</c:if>
											<c:if test="${spm.del_check ne 'N'}">복구</c:if>
										</button>
									</td>
									<!-- Modal -->
									<td>
										<div id="spmmodal_${spm.store_product_no}" class="modal fade"
											role="dialog">
											<div class="modal-dialog">
												<!-- Modal content-->
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal">&times;</button>
														<h4 class="modal-title" style="color: black;">
															<strong>상품 수정</strong>
														</h4>
													</div>
													<div class="modal-body">
														<div class="row">
															<div class="col-sm-6">
																<img src="/everycvs/resources/upload/${spm.stored_file_name}"
																	alt="No_Image" align="left" style="margin-left: 5px;">
															</div>
															<div class="col-sm-6">
																<input type="hidden" id="spnum" value="${spm.store_product_no}">
																<input type="hidden" id="page" value="${currentPage}">
																<table class="table table-condensed">
																	<tr>
																		<td><strong>상품명</strong></td>
																		<td>${spm.product_name}</td>
																	</tr>
																	<tr>
																		<td><strong>가격</strong></td>
																		<td><fmt:formatNumber value="${spm.price}" pattern="#,###" />원</td>
																	</tr>
																	<tr>
																		<td><strong>유통기한</strong></td>
																		<td>${spm.expiration_date}일</td>
																	</tr>
																	<tr>
																		<td><strong>구매횟수</strong></td>
																		<td>${spm.purchase_count}번</td>
																	</tr>
																	<tr>
																		<td><strong>제조일</strong></td>
																		<td><input class="form-control" type="date" id="mdate_${spm.store_product_no}" value="${spm.manufacture_date}"></td>
																	</tr>
																	<tr>
																		<td><strong>수량</strong></td>
																		<td><input class="form-control" type="number" id="quantity_${spm.store_product_no}"
																			min="0" max="100" step="1" value="${spm.quantity}"></td>
																	</tr>
																</table>
																</div>
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-primary btn-sm"
															data-dismiss="modal" onclick="updateSubmit(${spm.store_product_no});">수정</button>
														&nbsp;
														<button type="button" class="btn btn-primary btn-sm"
															onclick="location.href='spmdelete.do?spnum=${spm.store_product_no}&toggle=${spm.del_check}'">
															<c:if test="${spm.del_check eq 'N'}">삭제</c:if>
															<c:if test="${spm.del_check ne 'N'}">복구</c:if>
														</button>
													</div>
												</div>
											</div>
											<!-- Get방식으로 넘김 -->
										</div>
									</td>
									<!-- Modal End -->
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
			<div class="text-center">
				<ul class="pagination">
					<c:choose>
						<c:when test="${currentPage <= 1}">
							<li class="hidden"><a href="#">&laquo;</a></li>
						</c:when>
						<c:otherwise>
							<c:url var="spmlist" value="spmlist.do" />
							<li><a href="${spmlist}?page=${currentPage - 1}">&laquo;</a></li>
						</c:otherwise>
					</c:choose>

					<c:forEach var="spm" begin="${startPage}" end="${endPage}" step="1">
						<c:choose>
							<c:when test="${spm == currentPage}">
								<li class="active"><a href="#">${spm}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${spmlist}?page=${spm}">${spm}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${currentPage >= maxPage}">
							<li class="hidden"><a href="#">&raquo;</a></li>
						</c:when>
						<c:otherwise>
							<c:url var="spmlist" value="spmlist.do" />
							<li><a href="${spmlist}?page=${currentPage + 1}">&raquo;</a></li>
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
function updateSubmit(spno){
	var mdate = $('#mdate_'+spno).val();
	var quantity = $('#quantity_'+spno).val();	
	$.ajax({
		url:'/everycvs/ajax/spmupdate.do',
		data:{"spno":spno,
			"mdate":mdate,
			"quantity":quantity},
		type:'post',
		success:function(data){
			if(data>0){
				swal({
					title: '상품 수정 성공',
					timer: 1500,
					type: 'success'
				});
				setTimeout(function(){
					$('#spmmodal_'+spno).modal('hide');
					location.href="/everycvs/spmlist.do";
				},1500);				
			}else{
				swal({
					title: '상품 수정 실패',
					text: 'Server Error',
					timer: 1500,
					type: 'error'
				});
			}
		},
		error : function(request, status, error) {
			swal({
				title: 'ERROR',
				text: error,
				timer: 1500,
				type: 'error'
			});
		}		
	});	 
}
</script>
<c:import url="../../include/user/common/end.jsp"></c:import>
<!-- === END FOOTER === -->