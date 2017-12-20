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
                            <!-- gifticon Item -->
                            <c:forEach items="${glist }" var="glist">
                            <div class="col-md-4 portfolio-item margin-bottom-40 video">
                                <div class="sy1">
                                    <a>
                                        <figure>
                                            <img src="/everycvs/resources/upload/${glist.stored_file_name}" 
                                            alt="이미지가 존재하지 않습니다." id="image"
                                            data-toggle="modal"
                                            data-target="#gifticon${glist.product_no }">
                                            
                                            <figcaption>
                                                <h3 class="margin-top-20"></h3>
                                                <span> 상품명 : ${glist.product_name }<br>
                                                	      지점명 : ${glist.store_name }<br>
                                                	      유효기간 : ${glist.extinction_date}
                                                </span>
                                            </figcaption>
                                           
                                        </figure>
                                    </a>
                                </div>	
                            </div>
							

						<!-- Modal -->
						<div class="modal fade" id="gifticon${glist.product_no }" role="dialog" align="center">
							<div class="modal-dialog modal-80size">
								
								
								<!-- Modal content-->
								<div class="modal-content modal-80size">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									<div class="modal-body" align="center">
									
								<!-- 기프티콘 이미지 영역 -->
					
											<img alt="이미지를 준비중입니다." 
												 src="/everycvs/resources/upload/${glist.stored_file_name}" 
												 style="height:250px;">
												<br><br>
												
											<b>${glist.product_name }</b>
										
										<div id="bcTarget" align="center"></div>	
										
										<br>		
										<div align="right">						
											<b>유효기간 : ${glist.extinction_date }</b><br>
											<b>교환처 : ${glist.store_name }</b> <br>
											
										</div>
									
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
									</div>
								</div>

							</div>
						</div>
						</c:forEach>

						<!-- 컬럼 끝 -->
								</div>
							</div>
						</div>
					
				 </div>
				 
				</div>
				</div>
			
	
	<!-- === BEGIN FOOTER === -->
	<c:import url="../../include/user/common/footer.jsp"></c:import>
	<!-- === END FOOTER === -->

	<script>

 		$(document).ready(function() {
 			$("#bcTarget").barcode("1234 5678 1290", "code128");
 			
		});

 		
	</script>

	<!-- JS -->
	<c:import url="../../include/user/common/end.jsp"></c:import>
	<!-- === END === -->