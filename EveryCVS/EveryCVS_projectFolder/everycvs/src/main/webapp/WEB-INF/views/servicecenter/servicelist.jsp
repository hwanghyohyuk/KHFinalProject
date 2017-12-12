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
                            <form>
                                <div align="right">
                                    <input type="text" placeholder="제목을 입력해주세요" size="30">
                                    <input type="button" value="검색">
                                </div>
                                <br><br>
                                <div align="left" style="margin-left: 5%; margin-right: 5%">
                                    <div class="table-responsive">
                                    <table class="table table-striped table-bordered">
                                            <tr>
                                                    <th width="10%" style="background-color: rgb(51,116,122); text-align: center; color: white;">글번호</th>
                                                    <th width="60%" style="background-color: rgb(51,116,122); text-align: center; color: white;">제목</th>
                                                    <th width="10%" style="background-color: rgb(51,116,122); text-align: center; color: white;">작성자</th>
                                                    <th width="10%" style="background-color: rgb(51,116,122); text-align: center; color: white;">등록일</th>
                                                    <th width="10%" style="background-color: rgb(51,116,122); text-align: center; color: white;">조회수</th>
                                            </tr>
                                         <c:forEach var="sc" items="${requestScope.list }">
                                        <tr>
                                                <td style="text-align: center;">${sc.service_no}</td>
                                                <td style="text-align: center;">${sc.title}</td>
                                                <td style="text-align: center;">${sc.writer}</td>
                                                <td style="text-align: center;">${sc.write_date}</td>
                                                <td style="text-align: center;">${sc.readcount}</td>
                                            </tr>
                                            </c:forEach>
                                            
                                    </table>
                                <div align="right">
                                    <button type="submit" class="btn btn-primary">내가쓴글</button>&nbsp&nbsp&nbsp
                                    <a href="/everycvs/insertService.do">
                                    <input type="button" class="btn btn-primary" value="글쓰기">
                                    </a>
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
                            </form>
                            <hr>
                            <!-- End Contact Form -->
                            <!-- End Main Content -->
                        </div>
                        <!-- End Main Column -->
                        <!-- Side Column -->
                        <div class="col-md-3">
                            <!-- Recent Posts -->
                             <!-- <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Contact Info</h3>
                                </div>
                                <div class="panel-body">
                                    <p>Lorem ipsum dolor sit amet, no cetero voluptatum est, audire sensibus maiestatis vis et. Vitae audire prodesset an his. Nulla ubique omnesque in sit.</p>
                                    <ul class="list-unstyled">
                                        <li>
                                            <i class="fa-phone color-primary"></i>+353-44-55-66</li>
                                        <li>
                                            <i class="fa-envelope color-primary"></i>info@example.com</li>
                                        <li>
                                            <i class="fa-home color-primary"></i>http://www.example.com</li>
                                    </ul>
                                    <ul class="list-unstyled">
                                        <li>
                                            <strong class="color-primary">Monday-Friday:</strong>9am to 6pm</li>
                                        <li>
                                            <strong class="color-primary">Saturday:</strong>10am to 3pm</li>
                                        <li>
                                            <strong class="color-primary">Sunday:</strong>Closed</li>
                                    </ul>
                                </div>
                            </div>  -->
                            <!-- End recent Posts -->
                            <!-- About -->
                             <!-- <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">About</h3>
                                </div>
                                <div class="panel-body">
                                    Et harum quidem rerum facilis est et expedita distinctio lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut non libero consectetur adipiscing elit magna. Sed et quam lacus. Fusce condimentum eleifend enim a feugiat.
                                </div>
                            </div> -->
                            <!-- End About -->
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