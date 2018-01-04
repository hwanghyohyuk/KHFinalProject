<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- === BEGIN HEAD ===  -->
<c:import url="../include/user/common/head.jsp"></c:import>
<c:import url="../include/user/common/headend.jsp"></c:import>
<!-- === END HEAD ===  -->
<!-- === BEGIN HEADER ===  -->
<c:import url="../include/user/common/header.jsp"></c:import>
<!-- === END HEADER === -->
<script type="text/javascript">
	$(function(){
		$("#keyword").focus();
	});
	function writeService(){
		if(${sessionScope.user == null}){
			alert("로그인을 해주세요");
			return;
		}else{
		location.href = "/everycvs/page/writeService.do";
		}
	}
	function serviceMyWrite(writer) {
		location.href = '/everycvs/page/serviceMyWrite.do?writer='+writer;
	}
	function detail(sno){
		location.href = '/everycvs/page/detailService.do?sno='+sno;
	}
	console.log("${servicecenter}");
</script>
<!-- === BEGIN CONTENT === -->
<div id="content">
	<div class="container background-white" style="min-height: 800px">
		<div class="row margin-vert-30">
			<!-- Main Column -->
			<div class="col-md-12">
				<!-- Main Content -->
				<div class="headline">
					<h2>고객센터</h2>
				</div>
				<hr>

				<form action="/everycvs/page/selectServiceList.do" method="post">
					<div align="right" class="col-lg-8">
						<c:if test="${keyword ne ''}">
							<span>&nbsp;&nbsp;&nbsp;&nbsp;검색어 <b>"${keyword}"</b></span>
						</c:if>
					</div>
					<div align="right" class="col-lg-3">
						<input class="form-control" type="search" id="keyword"
							placeholder="제목을 입력해 주세요" name="keyword">
					</div>
					<div>
						<button type="submit" class="btn btn-primary btn-sm">검색</button>
					</div>
				</form>
				<br> <br>
				<div align="left" style="margin-left: 5%; margin-right: 5%">
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover">
							<tr>
								<th width="10%"
									style="background-color: rgb(51, 116, 122); text-align: center; color: white;">글번호</th>
								<th width="55%"
									style="background-color: rgb(51, 116, 122); text-align: center; color: white;">제목</th>
								<th width="15%"
									style="background-color: rgb(51, 116, 122); text-align: center; color: white;">작성자</th>
								<th width="10%"
									style="background-color: rgb(51, 116, 122); text-align: center; color: white;">등록일</th>
								<th width="10%"
									style="background-color: rgb(51, 116, 122); text-align: center; color: white;">조회수</th>
							</tr>
							<c:if test="${result ne 0 }">
								<c:forEach var="sc" items="${list }">
									<tr onclick="detail(${sc.service_no });"
										style="cursor: pointer">
										<td style="text-align: center;">${sc.service_no}</td>
										<td style="text-align: center;">${sc.title}</td>
										<td style="text-align: center;">${sc.user_name}</td>
										<td style="text-align: center;">${sc.write_date}</td>
										<td style="text-align: center;">${sc.readcount}</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${result eq 0 }">
								<tr>
									<td colspan="5" style="text-align: center;">글이 존재하지 않습니다</td>
								</tr>
							</c:if>
						</table>
						<div align="right">
							<button type="button" class="btn btn-primary"
								onclick="serviceMyWrite(${sessionScope.user.user_no});">내가쓴글</button>
							&nbsp;&nbsp;&nbsp;
							<button class="btn btn-primary" onclick="writeService();">글쓰기</button>
						</div>

						<!-- 페이지 -->
						<div class="text-center">
							<ul class="pagination">
								<c:if test="${currentPage <= 1 }">
									<li class='disabled'><a href="#">&laquo;</a></li>
								</c:if>
								<c:if test="${currentPage > 1 }">
									<li><a
										href="/everycvs/page/selectServiceList.do?page=${currentPage-1 }">&laquo;</a></li>
								</c:if>
								<c:forEach begin="${startPage}" end="${endPage}" step="1"
									varStatus="status">
									<c:if test="${status.index eq currentPage }">
										<li class="active"><a href='#'>${status.index}</a></li>
									</c:if>
									<c:if test="${status.index ne currentPage }">
										<li><a
											href='/everycvs/page/selectServiceList.do?page=${status.index}'>${status.index}</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${currentPage < maxPage }">
									<li><a
										href="/everycvs/page/selectServiceList.do?page=${currentPage+1 }">&raquo;</a></li>
								</c:if>
								<c:if test="${currentPage >= maxPage }">
									<li class='disabled'><a href="#">&raquo;</a></li>
								</c:if>
							</ul>
						</div>
						<hr>
						<!-- End Contact Form -->
						<!-- End Main Content -->
					</div>
				</div>
				<!-- End Side Column -->
			</div>
		</div>
	</div>
	<!-- === END CONTENT === -->
</div>
<!-- === END CONTENT === -->
<!-- === BEGIN FOOTER === -->
<c:import url="../include/user/common/footer.jsp"></c:import>
<!-- === END FOOTER === -->
<!-- JS -->
<c:import url="../include/user/common/end.jsp"></c:import>
<!-- === END === -->