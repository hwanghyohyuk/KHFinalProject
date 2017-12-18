<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- === BEGIN HEAD ===  -->
<c:import url="../../include/user/common/head.jsp"></c:import>
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
							<li class="list-group-item list-toggle">
							<a href="/everycvs/gifticonPage.do">기프티콘 보관함</a>
							</li>
							
							<!-- 관심목록 -->
							<li class="list-group-item list-toggle">
							<a href="/everycvs/favoritePage.do">관심목록</a>
							</li>
								
							<!-- 회원탈퇴 -->
							<li class="list-group-item list-toggle"><a
								data-toggle="collapse" data-parent="#sidebar-nav"
								href="#collapse-icons">회원탈퇴</a>
								</li>
						</ul>
					</div>
					<!-- End Sidebar Menu -->
					
					<div class="col-md-9">
						<div class="row">
					
						<!-- 컬럼 시작 -->
                        <div class="col-md-12 no-padding">
                            <!-- Portfolio Item -->
                            <div class="col-md-4 portfolio-item margin-bottom-40 video">
                                <div class="sy1">
                                    <a href="#">
                                        <figure>
                                            <img src="./resources/user/img/gifticon/10.jpg" 
                                            alt="이미지가 존재하지 않습니다." id="image">
                                            <figcaption>
                                                <h3 class="margin-top-20">Velit esse molestie</h3>
                                                <span>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</span>
                                            </figcaption>
                                        </figure>
                                    </a>
                                </div>
                            </div>


						<!-- Modal -->
						<div class="modal fade" id="gifticon" role="dialog">
							<div class="modal-dialog modal-80size">

								<!-- Modal content-->
								<div class="modal-content modal-80size">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									<div class="modal-body">
										<img alt="" src="./resources/user/img/gifticon/gifticon_1.jpeg" style="height:500px;">
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
									</div>
								</div>

							</div>
						</div>




						<!-- Portfolio Item -->
                            <div class="col-md-4 portfolio-item margin-bottom-40 video">
                                <div class="sy1">
                                    <a href="#">
                                        <figure>
                                            <img src="./resources/user/img/gifticon/11.jpg" alt="image1">
                                            <figcaption>
                                                <h3 class="margin-top-20">Velit esse molestie</h3>
                                                <span>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</span>
                                            </figcaption>
                                        </figure>
                                    </a>
                                </div>
                            </div>
                            
                            
                           
                            <!-- Portfolio Item -->
                            <div class="col-md-4 portfolio-item margin-bottom-40 video">
                                <div class="sy1">
                                    <a href="#">
                                        <figure>
                                            <img src="./resources/user/img/gifticon/12.jpg" alt="image1">
                                            <figcaption>
                                                <span>참치마요</span>
                                            </figcaption>
                                        </figure>
                                    </a>
                                </div>
                            </div>
                            
                            
                            <!-- Portfolio Item -->
                            <div class="col-md-4 portfolio-item margin-bottom-40 video">
                                <div class="sy1">
                                    <a href="#">
                                        <figure>
                                            <img src="./resources/user/img/gifticon/12.jpg" alt="image1">
                                            <figcaption>
                                                <span>참치마요</span>
                                            </figcaption>
                                        </figure>
                                    </a>
                                </div>
                            </div>
                            
                            
                            <!-- Portfolio Item -->
                            <div class="col-md-4 portfolio-item margin-bottom-40 video">
                                <div class="sy1">
                                    <a href="#">
                                        <figure>
                                            <img src="./resources/user/img/gifticon/12.jpg" alt="image1">
                                            <figcaption>
                                                <span>참치마요</span>
                                            </figcaption>
                                        </figure>
                                    </a>
                                </div>
                            </div>
                            
                            </div>
                            </div>
		
						<!-- 컬럼 끝 -->
								</div>
							</div>
						</div>
					
				 </div>
			
	
	
	
	<!-- === BEGIN FOOTER === -->
	<c:import url="../../include/user/common/footer.jsp"></c:import>
	<!-- === END FOOTER === -->

	<script>
		$(document).ready(function() {
			$("#image").click(function() {
				$("#gifticon").modal();
			});
		});
	</script>


	<!-- JS -->
	<c:import url="../../include/user/common/end.jsp"></c:import>
	<!-- === END === -->