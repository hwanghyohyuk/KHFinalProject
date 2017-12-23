<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- === BEGIN HEAD ===  -->
<c:import url="../include/user/common/head.jsp"></c:import>
<link href="/everycvs/resources/user/css/event.css" rel="stylesheet" type="text/css">
<c:import url="../include/user/common/headend.jsp"></c:import>
<!-- === END HEAD ===  -->
<!-- === BEGIN HEADER ===  -->
<c:import url="../include/user/common/header.jsp"></c:import>
<!-- === END HEADER === -->
<!-- === BEGIN CONTENT === -->
<script type="text/javascript">

function userpageload(page)
{
   $.ajax({
      url:"/everycvs/userpageload.do",
      type: "post",
      dataType: "json",
      data: {"page":page},
      success: function(data)
      {
         console.log(data.currentPage);
         console.log(data.maxPage);
         console.log(data.list);
         
         var list = data.list;
         var values = "";
         for(var i in list)
            {				//여기부분 수정 손을...못대고있습니다 ...	2ㅍㅔ이지 .후 ...		
      			if((i%3)==0)
      				 values +='<div class="row">';
      				 
               values += '<div class="col-md-4"><a href="/everycvs/eventDetail.do?no='+list[i].event_no+'"><figure>'+
					'<img src="/everycvs/resources/upload/'+list[i].stored_file_name+'" alt="이벤트 이미지가 없습니다." class="jun_img">'+
					'<figcaption>'+
					'<input type="hidden" class="margin-top-20" value="'+list[i].event_no+'"/>'+
					'<h3 class="margin-top-20">'+list[i].title+'</h3>'+
					'<span>시작일:'+list[i].start_date+'</span> '+
					'<br> '+
					'<span>종료일:'+list[i].end_date+'</span>'+
					'<br>'+
					'<span>조회수:'+list[i].readcount+'</span>'+
					'</figcaption>'+
					'</figure></a></div>';        
					
               if((i%3)==2 || i==(list.length-1))
    				 values +='</div>';
            }
       		console.log(values);
            $("#usereventlist").html(values);
         
            var valuesPaging="";
            
            if(data.currentPage <= 1){
               valuesPaging+="<li class='disabled'>" + 
                 "<a href='#' aria-label='Previous'>" +
                   "<span aria-hidden='true'>&laquo;</span></a></li>";
            } else {
               valuesPaging += "<li><a href='javascript:userpageload(" + (data.currentPage - 1) + ")'  aria-label='Previous'>"
                + "<span aria-hidden='true'>&laquo;</span></a></li>";
            }
            
           for(var i = data.startPage; i<=data.endPage; i++)
           {
              if(data.currentPage == i)
              {
                valuesPaging+="<li class='disabled'>"+"<a href='#'>"+ i + "</a></li>";
              } else {
                  valuesPaging+="<li><a href='javascript:userpageload(" + i + ")'>"+ i + "</a></li>";
              }

           }
           
            if(data.currentPage >= data.maxPage)
            {
               valuesPaging+= "<li class='disabled'>" + 
                  "<a href='#' aria-label='Next'>"+
                      "<span aria-hidden='true'>&raquo;</span></a></li>";
            } else {
               valuesPaging += "<li><a href='javascript:userpageload(" + (data.currentPage + 1)+ ")' aria-label='Next'>" +
                "<span aria-hidden='true'>&raquo;</span></a></li>";
            }
            
            $("#usereventpaging").html(valuesPaging);
      },
  	error : function(request, status, error) {
		swal("오류",error,"error");
	}	
   });
}
</script>
		<div id="content">
			<div class="container background-white">
				<div class="row margin-vert-30">
					<div class="col-md-12">
						<div id="category">
							<input type="button" class="category" value="진행중 이벤트"
								onClick="location.href='#"> <input type="button"
								class="category" value="종료된 이벤트" onClick="location.href='#">
							<input type="button" class="category" value="이벤트 당첨자"
								onClick="location.href='/everycvs/eventresultlist.do'">
						</div>
						<!-- Filter Buttons -->
						<div class="portfolio-filter-container margin-top-20">
							<ul class="portfolio-filter">
								<li class="portfolio-filter-label label label-primary">
									filter by:</li>
								<li><a href="#" class="portfolio-selected btn btn-default"
									data-filter="*">All</a></li>
								<li><a href="#" class="btn btn-default" data-filter=".GS25">GS25</a>
								</li>
								<li><a href="#" class="btn btn-default" data-filter=".CU">CU</a>
								</li>
								<li><a href="#" class="btn btn-default"
									data-filter=".7ELEVEN">7ELEVEN</a></li>
							</ul>
						</div>
						<!-- End Filter Buttons -->
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 portfolio-group no-padding" style="float: left;">
						<!-- Portfolio Item -->
						<div class="col-md-12 portfolio-item margin-bottom-40 GS25">
							<!-- 로그인시 상세보기 -->
							<div id="usereventlist">
								<c:forEach items="${event.list}" var="e" varStatus="status">
								<c:if test="${ (status.index % 3)eq 0}">
								<div class="row">
								</c:if>
								<div class="col-md-4">
								<a href="/everycvs/eventDetail.do?no=${e.event_no}">
									<figure>										
										<img src="/everycvs/resources/upload/${e.stored_file_name}" alt="이벤트 이미지가 없습니다." class="jun_img">
										<figcaption>
											<input type="hidden" class="margin-top-20" value="${e.event_no}"/>
											<h3 class="margin-top-20">${e.title}</h3>
											<span>시작일:${e.start_date}</span> 
											<br> 
											<span>종료일:${e.end_date}</span>
											<br>
											<span>조회수:${e.readcount}</span>
										</figcaption>						
									</figure>
									</a>	
								</div>
								<c:if test="${ ((status.index % 3)eq 2) || status.last}">
								</div>
								</c:if>
								</c:forEach>		
								</div>		
							</div>
						</div>
						<!-- End Portfolio Item -->	
				<!-- 페이지 시작 -->
							<div id="paging">
								<nav>
									<ul class="pagination" id="usereventpaging">

										<c:if test="${event.currentPage <= 1}">
											<li class="disabled"><a href="#" aria-label="Previous">
													<span aria-hidden="true">&laquo;</span>
											</a></li>
										</c:if>

										<c:if test="${event.currentPage > 1}">
											<li><a
												href="javascript:userpageload(${event.currentPage - 1})"
												aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
											</a></li>
										</c:if>

										<c:forEach var="i" begin="${event.startPage}"
											end="${event.endPage}" step="1">
											<c:if test="${event.currentPage eq i}">
												<li class="disabled"><a href="#">${i}</a></li>
											</c:if>

											<c:if test="${event.currentPage ne i}">
												<li><a href='javascript:userpageload(${i})'>${i}</a></li>
											</c:if>

										</c:forEach>

										<c:if test="${event.currentPage >= event.maxPage}">
											<li class="disabled"><a href="#" aria-label="Next">
													<span aria-hidden="true">&raquo;</span>
											</a></li>
										</c:if>

										<c:if test="${event.currentPage < event.maxPage}">
											<li><a
												href='javascript:userpageload(${event.currentPage + 1})'
												aria-label="Next"> <span aria-hidden="true">&raquo;</span>
											</a></li>
										</c:if>
									</ul>
								</nav>
							</div>
				<!-- page끝 --> 
				</div>
		</div>
<!-- === END CONTENT === -->
<!-- === BEGIN FOOTER === -->
<c:import url="../include/user/common/footer.jsp"></c:import>
<!-- === END FOOTER === -->
<!-- JS -->
<c:import url="../include/user/common/end.jsp"></c:import>
<!-- === END === -->