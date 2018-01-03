<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- === BEGIN HEAD ===  -->
<c:import url="../../include/admin/common/head.jsp"></c:import>
<link rel="stylesheet"
	href="/everycvs/resources/admin/cvscss/custom.css" rel="stylesheet">
<link rel="stylesheet"
	href="/everycvs/resources/admin/cvscss/responsive.css" rel="stylesheet">
<c:import url="../../include/admin/common/headend.jsp"></c:import>
<!-- === END HEAD ===  -->
<!-- === BEGIN HEADER ===  -->
<!-- 선택적 -->
<c:import url="../../include/admin/common/header.jsp"></c:import>
<!-- === END HEADER === -->
<!-- === BEGIN CONTENT === -->

<!-- Right side column. Contains the navbar and content of the page -->
<div class="content-wrapper">
	<!-- Main content -->
	<div id="content">
		<div class="container background-white">
			<h2 class="margin-bottom-30">
				<b>${sessionScope.user.brand_name}</b>&nbsp;&nbsp;Event management
			</h2>

			<!-- Branch select table -->
			<div class="panel panel-default" style="padding-bottom: 8px;">
				<!-- Tab v1 -->
				<div class="tabs">
					<!-- tab-content -->
					<div class="row">
						<div class="col-md-12">
							<div class="col-sm-12"
								style="padding-left: 8px; padding-right: 8px;">
								<div class="panel-heading" style="padding: 15px 5px;">
									<h4 class="panel-title" style="font-size: 17px; color: #777;">진행
										중인 이벤트</h4>
								</div>
								<table class="table">
									<tr class="active text-center">
										<th width="12%">번호</th>
										<th width="43%">이벤트명</th>
										<th width="25%">진행기간</th>
										<th width="12%">조회수</th>
										<th width="8%">Del</th>
									</tr>
									<tbody id="eventlist">
									</tbody>
								</table>
							</div>
							<!-- Search & Add block -->
							<div class="col-sm-12"
								style="padding-left: 5px; padding-right: 8px;">
								<!--start-->
								<div class="col-sm-2 jun16">
									<select class="form-control input jun15" >
										<option value="both">제목</option>
									</select>
								</div>
								
									<div class="col-sm-4 jun12">
										<input class="form-control jun11" type="text" name="keyword" id="keyword"
											placeholder="검색 키워드를 입력하세요.">
									</div>
									<div class="col-sm-1 jun13">
										<button type="button" onclick="setKeyword();"
											class="btn btn-default btn jun14">
											<i class="fa fa-search"></i>
										</button>
									</div>
							
								<div class="col-sm-5 jun17">
									<button type="button" onclick="add_event();"
										class="btn btn-success btn jun4" id="width100">
										<i class="fa fa-gift" style="margin-right: 8px;"></i>ADD
									</button>
								</div>
								<!--end-->
							</div>
							<!-- End Search & Add block -->
							<!-- 페이지 시작 -->
							<div id="paging">
								<nav>
									<ul class="pagination" id="eventpaging">
									</ul>
								</nav>
							</div>
							<!-- page끝 -->
						</div>
					</div>
					<!-- End tab content -->
				</div>
				<!-- End Tab v1 -->
			</div>
			<!-- End Branch select table -->
		</div>
	</div>
</div>
<!-- Modal -->
<script type="text/javascript">
	function ajaxDetail(eno){
		$.ajax({
			url : '/everycvs/cvsEventDetail.do',
			data : {"eno": eno },
			type : "post",
			success:function(data){
				var values="";
				values+=
					'<div class="modal-header">'+
				'<button type="button" class="close" data-dismiss="modal"	aria-label="Close">'+
					'<span aria-hidden="true">&times;</span>'+
				'</button>'+
				'<h4 class="modal-title" id="myModalLabel" style="color: #999;">Event detail</h4>'+
			'</div>'+
			'<div class="modal-body">'+
				'<div class="jun_imgdiv">'+
					'<img src="/everycvs/resources/upload/' +data.stored_file_name+'" alt="이벤트 이미지가 없습니다." class="jun_img">'+
				'</div>'+
				'<div class="jun_contentdiv">'+
					'<div class="jun_textdiv">'+data.event_no+'</div>'+
					'<span style="padding-right: 22px;">이벤트명</span>'+data.title+'<br>'+
					'<span style="padding-right: 22px;">시작일자</span>'+data.start_date+'<br> '+
					'<span style="padding-right: 22px;">종료일자</span>'+data.end_date+'<br> '+
					'<span style="padding-right: 20px;">참여제한 </span><b>'+data.join_limit+'</b>번<br>'+
					'<span style="padding-right: 36px;">조회수</span>'+data.readcount+'<br> '+
					'<span style="padding-right: 22px;">첨부파일</span>'+data.original_file_name+'<br>'+
				'</div>'+
				'<div class="jun_contentdiv2">'+data.contents+'</div>'+
			'</div>'+
			'<div class="modal-footer" style="clear: both; margin-top: 2px;">'+
				'<button type="button" onclick="del_event('+data.event_no+');" class="btn btn-gray" style="float: left;">DELETE</button>'+
				'<button type="button" onclick="modify_event('+data.event_no+');" class="btn btn-danger">MODIFY</button>'+
				'<button type="button" class="btn btn-default" data-dismiss="modal">CANCEL</button>'+
			'</div>';
			$("#ajaxDetail").html(values);
			$("#myModal").modal('toggle');
			},
			error:function(errorData){
				alert("error : "+errorData);
			}
		});
	}
</script>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div id="ajaxDetail" class="modal-content">
		</div>
	</div>
</div>
<!-- End Modal -->
<!-- === END CONTENT === -->
<!-- === BEGIN FOOTER === -->
<c:import url="../../include/admin/common/footer.jsp"></c:import>
<!-- === END FOOTER === -->
<!-- JS -->
<c:import url="../../include/admin/common/end.jsp"></c:import>
<!-- JS Custom Function -->
<script type="text/javascript">
	
	function del_event(no) {
		var answer = false;
		
		answer = confirm("해당 이벤트를 삭제하시겠습니까?");
		if (answer){
			location.href ='/everycvs/eventDelete.do?no='+no;
			alert("이벤트가 삭제되었습니다.");}
	}

	function modify_event(no) {
		location.href = '/everycvs/cvseventmodifyview.do?no='+no;
	}

	function add_event() {
		location.href = '/everycvs/cvseventwriteview.do';
	}
</script>

<!-- 페이지 처리 -->
 <script type="text/javascript">
 var ednobuffer=${code};
 var pagebuffer=1;
 var keywordbuffer="";
 
 $(admeventList(ednobuffer,pagebuffer,keywordbuffer));
 
 function setEdNo(edno){
 	alert(edno);
 	if(ednobuffer!=edno){
 		edno=ednobuffer;
 	}
 	admeventList(ednobuffer,pagebuffer,keywordbuffer);
 } 
 function setPageNo(page){
 	if(pagebuffer!=page){
 		pagebuffer=page;
 	}
 	admeventList(ednobuffer,pagebuffer,keywordbuffer);
 }
 function setKeyword(){
	var keyword = $("#keyword").val();
 	if(keywordbuffer!=keyword){
 		keywordbuffer=keyword;
 	}
 	admeventList(ednobuffer,pagebuffer,keywordbuffer);
 	keywordbuffer="";
 }
 
 
 function admeventList(edno,page,keyword)
 {
    $.ajax({
       url:"cvseventlist.do",
       type: "post",
       data: {
     	"edno":edno,
     	"page":page,
 		"keyword":keyword
     	 },
       success: function(data)
       {
     	  
     	    var index=0;
 			var values='';
 			var last = data.list.length;
 			var list = data.list;
 			
 			console.log("list "+data.list);
 			console.log("currentPage "+data.currentPage);
 			console.log("listCount "+data.listCount);
 			console.log("maxPage "+data.maxPage);
 			console.log("startPage "+data.startPage);
 			console.log("endPage "+data.endPage);
 			console.log("limit "+data.limit);
                  
             for(var i in list)
             {
                values += "<tr><td>" + list[i].event_no + "</td>"+ "<td><a href='javascript:ajaxDetail("+list[i].event_no+")'>" +
                      list[i].title + "</a></td><td>" + list[i].start_date + '~' +list[i].end_date + "</td><td>" + 
                      list[i].readcount + "</td><td>"+'<i class="fa fa-trash-o jun21" onclick="del_event('+list[i].event_no+');"></i>'+"</td></tr>";     
             }
             
             $("#eventlist").html(values);
             
          
             var valuesPaging="";
             
             if(data.currentPage <= 1){
                valuesPaging+="<li class='disabled'>" + 
                  "<a href='#' aria-label='Previous'>" +
                    "<span aria-hidden='true'>&laquo;</span></a></li>";
             } else {
                valuesPaging += "<li><a href='javascript:setPageNo(" + (data.currentPage - 1) + ")'  aria-label='Previous'>"
                 + "<span aria-hidden='true'>&laquo;</span></a></li>";
             }
             
            for(var i = data.startPage; i<=data.endPage; i++)
            {
               if(data.currentPage == i)
               {
                 valuesPaging+="<li class='disabled'>"+"<a href='#'>"+ i + "</a></li>";
               } else {
                   valuesPaging+="<li><a href='javascript:setPageNo(" + i + ")'>"+ i + "</a></li>";
               }
 
            }
            
             if(data.currentPage >= data.maxPage)
             {
                valuesPaging+= "<li class='disabled'>" + 
                   "<a href='#' aria-label='Next'>"+
                       "<span aria-hidden='true'>&raquo;</span></a></li>";
             } else {
                valuesPaging += "<li><a href='javascript:setPageNo(" + (data.currentPage + 1)+ ")' aria-label='Next'>" +
                 "<span aria-hidden='true'>&raquo;</span></a></li>";
             }
 
             $("#eventpaging").html(valuesPaging);
       }
    });
}
 </script>
<!-- End JS Custom Function -->
<!-- === END === -->