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
		<div id="content">
			<div class="container background-white">
				<div class="row margin-vert-30">
					<div class="col-md-12">
						<div id="category">
							<input type="button" class="category" value="진행중 이벤트" onClick="setEdNo(1)"> 
							<input type="button" class="category" value="종료된 이벤트" onClick="setEdNo(2)">
							<input type="button" class="category" value="이벤트 당첨자" onClick="location.href='/everycvs/eventresultlist.do'">
						</div>
						<!-- Filter Buttons -->
						<div class="portfolio-filter-container margin-top-20">
							<ul class="portfolio-filter">
								<li class="portfolio-filter-label label label-primary">
									filter by:</li>
								<li><a href="#" class="portfolio-selected btn btn-default" onclick="setBrandNo(0);">All</a></li>
								<li><a href="#" class="btn btn-default" onclick="setBrandNo(1);">GS25</a></li>
								<li><a href="#" class="btn btn-default" onclick="setBrandNo(2);">CU</a></li>
								<li><a href="#" class="btn btn-default" onclick="setBrandNo(3);">7ELEVEN</a></li>
								
							</ul>
						</div>
						<!-- End Filter Buttons -->
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 portfolio-group no-padding" style="float: left;">
						<!-- Portfolio Item -->
						<div class="col-md-12 portfolio-item margin-bottom-40">
							
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
												href="javascript:setPageNo(${event.currentPage - 1})"
												aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
											</a></li>
										</c:if>

										<c:forEach var="i" begin="${event.startPage}"
											end="${event.endPage}" step="1">
											<c:if test="${event.currentPage eq i}">
												<li class="disabled"><a href="#">${i}</a></li>
											</c:if>

											<c:if test="${event.currentPage ne i}">
												<li><a href='javascript:setPageNo(${i})'>${i}</a></li>
											</c:if>

										</c:forEach>

										<c:if test="${event.currentPage >= event.maxPage}">
											<li class="disabled"><a href="#" aria-label="Next">
													<span aria-hidden="true">&raquo;</span>
											</a></li>
										</c:if>

										<c:if test="${event.currentPage < event.maxPage}">
											<li><a
												href='javascript:setPageNo(${event.currentPage + 1})'
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
<script type="text/javascript">
var ednobuffer=1;
var brandNobuffer=0;
var pagebuffer=1;

$(cvsEventList(ednobuffer,brandNobuffer,pagebuffer));

function setEdNo(edno){
	if(ednobuffer!=edno){
		ednobuffer=edno;
	}
	cvsEventList(ednobuffer,brandNobuffer,pagebuffer);
}   
function setBrandNo(brandNo){
	if(brandNobuffer!=brandNo){
		brandNobuffer=brandNo;
	}
	cvsEventList(ednobuffer,brandNobuffer,pagebuffer);
}
function setPageNo(page){
	if(pagebuffer!=page){
		pagebuffer=page;
	}
	cvsEventList(ednobuffer,brandNobuffer,pagebuffer);
}
   
function cvsEventList(edno,brandNo,page){	
		$.ajax({
			url:'/everycvs/ajax/cvsevent.do',
			type:'post',
		data:{
			"page":page,
			"edno":edno,
			"brandNo":brandNo},
			success:function(data){
				
				var index=0;
				var values='';
				var last = data.elist.length;
				var elist = data.elist;
				
				console.log("elist "+data.elist);
				console.log("currentPage "+data.currentPage);
				console.log("listCount "+data.listCount);
				console.log("maxPage "+data.maxPage);
				console.log("startPage "+data.startPage);
				console.log("endPage "+data.endPage);
				console.log("limit "+data.limit);
			
				for(var i in elist){
					if((index%3)==0){
						values+='<div class="row">';
					}
					values+='<div class="col-md-4">'
							+'<a href="/everycvs/eventDetail.do?no='+elist[i].event_no+'">'
							+'<figure>'								
							+'<img src="/everycvs/resources/upload/'+elist[i].stored_file_name+'" alt="이벤트 이미지가 없습니다." class="jun_img">'
							+'<figcaption>'
							+'<input type="hidden" class="margin-top-20" value="'+elist[i].event_no+'"/>'
							+'<h3 class="margin-top-20">'+elist[i].title+'</h3>'
							+'<span>시작일:'+elist[i].start_date+'</span>'
							+'<br>'
							+'<span>종료일:'+elist[i].end_date+'</span>'
							+'<br>'
							+'<span>조회수:'+elist[i].readcount+'</span>'
							+'</figcaption>'				
							+'</figure>'
							+'</a>'
							+'</div>';					
					if((index%3)==2||index==(last-1)){
						values+='</div>';
					}
					index++;
				}	
				$("#usereventlist").html(values);
				
				var valuesPaging="";
	            
	            if(data.currentPage <= 1){
	               valuesPaging+="<li class='disabled'>" + 
	                 "<a href='#' aria-label='Previous'>" +
	                   "<span aria-hidden='true'>&laquo;</span></a></li>";
	            } else {
	               valuesPaging += "<li><a href='javascript:setPageNo("+(data.currentPage - 1) + ")'  aria-label='Previous'>"
	                + "<span aria-hidden='true'>&laquo;</span></a></li>";
	            }
	            
	           for(var i = data.startPage; i<=data.endPage; i++)
	           {
	              if(data.currentPage == i)
	              {
	                valuesPaging+="<li class='disabled'>"+"<a href='#'>"+ i + "</a></li>";
	              } else {
	                  valuesPaging+="<li><a href='javascript:setPageNo("+ i + ")'>"+ i + "</a></li>";
	              }

	           }
	           
	            if(data.currentPage >= data.maxPage)
	            {
	               valuesPaging+= "<li class='disabled'>" + 
	                  "<a href='#' aria-label='Next'>"+
	                      "<span aria-hidden='true'>&raquo;</span></a></li>";
	            } else {
	               valuesPaging += "<li><a href='javascript:setPageNo("+(data.currentPage + 1)+ ")' aria-label='Next'>" +
	                "<span aria-hidden='true'>&raquo;</span></a></li>";
	            }
	            
	            $("#usereventpaging").html(valuesPaging);
			},
			error:function(error){
				swal({
					title: 'ERROR',
					text:error,
					timer: 1500,
					type: 'error'
				});
			}
		});
}
</script>
<c:import url="../include/user/common/end.jsp"></c:import>
<!-- === END === -->