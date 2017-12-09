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
                                 <h2>고객센터 / 글쓰기</h2>
                            </div>
                            <hr>
                            <form>

                                 <label>작성자
                                    <span class="color-red">*</span>
                                 </label>
                                <div class="row margin-bottom-20">
                                    <div class="col-md-6 col-md-offset-0">
                                        <input class="form-control" type="text" placeholder="작성자를 입력해주세요" >
                                    </div>
                                </div>
                                
                                <label>비밀번호
                                    <span class="color-red">*</span>
                                </label>
                                <div class="row margin-bottom-20">
                                    <div class="col-md-6 col-md-offset-0">
                                        <input class="form-control" type="password" placeholder="비밀번호를 입력해주세요">
                                    </div>
                                </div>

                                <label>제목
                                    <span class="color-red">*</span>
                                 </label>
                                <div class="row margin-bottom-20">
                                    <div class="col-md-6 col-md-offset-0">
                                        <input class="form-control" type="text" placeholder="제목을 입력해주세요">
                                    </div>
                                </div>
                                <div>
                                <label>내용</label>
                                <div class="row margin-bottom-20">
                                    <div class="col-md-8 col-md-offset-0">
                                        <textarea rows="8" class="form-control" placeholder="내용을 입력해주세요"></textarea>
                                    </div>
                                </div>
                                <div align="center">
                                    <input type="button" class="btn btn-primary" value="등록">
                                    &nbsp&nbsp&nbsp&nbsp&nbsp
                                    <input type=button class="btn btn-primary" value="취소">
                                </div>
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
                            </div> -->
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
<!-- === BEGIN FOOTER === -->
<c:import url="../include/user/common/footer.jsp"></c:import>
<!-- === END FOOTER === -->
<!-- JS -->
<c:import url="../include/user/common/end.jsp"></c:import>
<!-- === END === -->
