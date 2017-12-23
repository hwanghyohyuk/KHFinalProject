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
	function writeService(){
		if(${sessionScope.user == null}){
			alert("로그인을 해주세요");
			return;
		}else{
		location.href = "/everycvs/writeService.do";
		}
	}
	
	function serviceMyWrite(writer) {
		location.href = '/everycvs/serviceMyWrite.do?writer='+writer;
	}
	console.log("${servicecenter}");
</script>
<!-- === BEGIN CONTENT === -->

            <div id="content">
                <div class="container background-white">
                    <div class="row margin-vert-30">
                        <!-- Main Column -->
                        <div class="col-md-12">
                            <!-- Main Content -->
                            <div class="headline">
                                 <h2>고객센터</h2>
                            </div>
                            <hr>
								<input type="hidden" name="writer" value="${servicecenter.writer }">
								<form action="serviceSearch.do" method="post">
									<div  align="right" class="col-sm-3" style="margin-left: 190px;">
										<br> <input class="form-control" type="search"
											placeholder="제목을 입력해 주세요" name="keyword" value="${keyword}">
									</div>
									<div>
										<br>
										<button type="submit" class="btn btn-primary btn-sm">검색</button>
									</div>
								</form>
								<br><br>
                                <div align="left" style="margin-left: 5%; margin-right: 5%">
                                    <div class="table-responsive">
                                    <table class="table table-striped table-bordered">
                                            <tr>
                                                    <th width="10%" style="background-color: rgb(51,116,122); text-align: center; color: white;">글번호</th>
                                                    <th width="55%" style="background-color: rgb(51,116,122); text-align: center; color: white;">제목</th>
                                                    <th width="15%" style="background-color: rgb(51,116,122); text-align: center; color: white;">작성자</th>
                                                    <th width="10%" style="background-color: rgb(51,116,122); text-align: center; color: white;">등록일</th>
                                                    <th width="10%" style="background-color: rgb(51,116,122); text-align: center; color: white;">조회수</th>
                                            </tr>
                                         <c:forEach var="sc" items="${requestScope.list }">
                                        <tr>
                                                <td style="text-align: center;">${sc.service_no}</td>                                                                                                                                                                        
                                                <td style="text-align: center;"><a href="detailService.do?sno=${sc.service_no }"> ${sc.title}</a></td>                                                                                                                                                                           
                                                <td style="text-align: center;">${sc.user_name}</td>
                                                <td style="text-align: center;">${sc.write_date}</td>
                                                <td style="text-align: center;">${sc.readcount}</td>
                                            </tr>
                                            </c:forEach> 
                                    </table>                               
                                <div align="right">
                                    <button class="btn btn-primary" onclick="serviceMyWrite(${servicecenter.writer});">내가쓴글</button>&nbsp&nbsp&nbsp                                 
                                    <button class="btn btn-primary" onclick="writeService();" >글쓰기</button>                                    
                                </div>         
                                                                                     
                                <!-- 페이지 -->
                                <div class="text-center">
                                   <ul class="pagination">
                                      <li><a href="#">&laquo;</a></li>
                                      <li><a href="#">1</a></li>
                                      <li><a href="#">2</a></li>
                                      <li class="active"><a href="#">3</a></li>
                                      <li><a href="#">4</a></li>
                                      <li><a href="#">5</a></li>
                                      <li><a href="#">&raquo;</a></li>
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
           
<!-- === END CONTENT === -->
<!-- === BEGIN FOOTER === -->
<c:import url="../include/user/common/footer.jsp"></c:import>
<!-- === END FOOTER === -->
<!-- JS -->
<c:import url="../include/user/common/end.jsp"></c:import>
<!-- === END === -->