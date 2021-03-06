<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- === BEGIN HEAD ===  -->
<c:import url="../../include/user/common/head.jsp"></c:import>
<link href="/everycvs/resources/user/css/event.css" rel="stylesheet"
	type="text/css">
<c:import url="../../include/user/common/headend.jsp"></c:import>
<!-- === END HEAD ===  -->
<!-- === BEGIN HEADER ===  -->
<c:import url="../../include/user/common/header.jsp"></c:import>
<!-- === END HEADER === -->
<!-- === BEGIN CONTENT === -->
<div id="content">
	<div class="container background-white">
		<div class="row margin-vert-30">
			<!-- Main Column -->
			<div class="col-md-14">
				<div class="blog-post">

					<div align="left" style="margin-left: 5%; margin-right: 5%;">
						<div class="blog-item-header">
							<h2>이벤트 당첨자 발표</h2>

						</div>
						<br>
						<!--  <div align="left">
            <form class="form-group" role="form" action="#" method="get" >
                <select class="btn btn-primary" name="searchValue" id="findType" style="display: inline-block;">
                    <option value="findByTitle">제목</option>
                </select> 
                <input class="form-nomaltext" name ="searchKeyWord" type="search"
                    id="searchKeyWord" placeholder="제목으로 검색" class="btn btn-primary" style="display: inline-block;">
                <button type="submit" id="searchSubmit" value="검색" class="btn btn-primary" style="display: inline-block;">검색</button>
            &nbsp;&nbsp;&nbsp;&nbsp;    
            </form>
        </div> -->
					</div>
					<div align="left" style="margin-left: 5%; margin-right: 5%">
						<div class="table-responsive">
							<table class="table table-striped table-bordered">
								<caption>당첨되신걸 축하 드립니다.</caption>
								<tr>
									<th width="10%"
										style="background-color: rgb(51, 116, 122); text-align: center; color: white;">글번호</th>
									<th width="55%"
										style="background-color: rgb(51, 116, 122); text-align: center; color: white;">제목</th>
									<th width="25%"
										style="background-color: rgb(51, 116, 122); text-align: center; color: white;">작성일</th>
									<th width="10%"
										style="background-color: rgb(51, 116, 122); text-align: center; color: white;">조회수</th>
								</tr>


								<c:forEach items="${ewlevent.list}" var="ewl">
									<tr>
										<td style="text-align: center;">${ewl.event_result_no}</td>
										<td style="text-align: center;"><a
											href="eventwin.do?rno=${ewl.event_result_no}">${ewl.title}</a></td>
										<td style="text-align: center;">${ewl.write_date}</td>
										<td style="text-align: center;">${ewl.readcount}</td>
									</tr>
								</c:forEach>
							</table>
							<!-- 글작성버튼 -->
						</div>
					</div>
				</div>
			</div>


	<!-- 페이지인 척 하는 새끼 -->
	<div class="text-center">
				<ul class="pagination">
					<c:choose>
						<c:when test="${currentPage <= 1}">
							<li class="hidden"><a href="#">&laquo;</a></li>
						</c:when>
						<c:otherwise>
							<c:url var="list" value="eventresultlist.do" />
							<li><a href="eventresultlist.do?page=1">&laquo;</a></li>
						</c:otherwise>
					</c:choose>

					<c:forEach var="re" begin="${startPage}" end="${endPage}" step="1">
						<c:choose>
							<c:when test="${re == currentPage}">
								<li class="active"><a href="#">${re}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="eventresultlist.do?page=${re+1}">${re+1}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${currentPage >= maxPage}">
							<li class="hidden"><a href="#">&raquo;</a></li>
						</c:when>
						<c:otherwise>
							<c:url var="list" value="eventresultlist.do" />
							<li><a href="eventresultlist.do?page=${currentPage + 1}">&raquo;</a>&raquo;</li>
						</c:otherwise>
					</c:choose>
						<li><a href="eventresultlist.do?page=2">2</a></li>
						<li><a href="eventresultlist.do?page=2">&raquo;</a></li>
					</ul>
			</div>
	</div>
	</div>
	<!-- 페이지 끝 -->
</div>
<!-- === BEGIN FOOTER === -->
<c:import url="../../include/user/common/footer.jsp"></c:import>
<!-- === END FOOTER === -->
<!-- JS -->
<c:import url="../../include/user/common/end.jsp"></c:import>
<!-- === END === -->