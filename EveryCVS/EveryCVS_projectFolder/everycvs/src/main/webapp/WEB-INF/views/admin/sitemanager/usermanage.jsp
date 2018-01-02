<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- === BEGIN HEAD ===  -->
<c:import url="../../include/admin/common/head.jsp"></c:import>
<link rel="stylesheet" href="/everycvs/resources/user/css/userinfo.css" type="text/css">
<script src="/everycvs/resources/admin/plugins/rg-InfiniteScroll/RGInfiniteScroll.min.js"></script>
<c:import url="../../include/admin/common/headend.jsp"></c:import>
<!-- === END HEAD ===  -->
<!-- === BEGIN HEADER ===  -->
<!-- 선택적 -->
<c:import url="../../include/admin/common/header.jsp"></c:import>
<!-- === END HEADER === -->
<!-- === BEGIN CONTENT === -->


 <!-- Right side column. Contains the navbar and content of the page -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
          <h1>
          모두의 편의점
            <small>회원관리</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="/everycvs/main/main.do"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Dashboard</li>
          </ol>
        </div>

        <!-- Main content -->
        <section class="content">
        	<div class="row">
        	<div class="col-lg-6 col-lg-offset-6 col-md-4 col-md-offset-8 col-sm-2 col-sm-offset-10 col-xs-12 ">
	        	<div class="input-group input-group-lg">
			      <input type="text" class="form-control" id="keyword" placeholder="Search for...">
			      <span class="input-group-btn">
			        <button class="btn btn-primary" type="button" onclick="setKeyword();">Go!</button>
			      </span>
			    </div>
			    <div class="btn-group pull-right">
				<button class="btn btn-info btn-lg dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
				정렬<span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu">
				<li><a href="#" onclick="setOrderby(0);">기본</a></li>
				<li class="divider"></li>
				<li><a href="#" onclick="setOrderby(0);">사용자번호<span class="glyphicon glyphicon-sort-by-order"></span></a></li>
			    <li><a href="#" onclick="setOrderby(1);">사용자번호<span class="glyphicon glyphicon-sort-by-order-alt"></span></a></li>
			    <li><a href="#" onclick="setOrderby(2);">사용자이름<span class="glyphicon glyphicon-sort-by-order"></span></a></li>
			    <li><a href="#" onclick="setOrderby(3);">사용자이름<span class="glyphicon glyphicon-sort-by-order-alt"></span></a></li>
			    <li><a href="#" onclick="setOrderby(4);">이메일<span class="glyphicon glyphicon-sort-by-order"></span></a></li>
			    <li><a href="#" onclick="setOrderby(5);">이메일<span class="glyphicon glyphicon-sort-by-order-alt"></span></a></li>
			    <li><a href="#" onclick="setOrderby(6);">생년월일<span class="glyphicon glyphicon-sort-by-order"></span></a></li>
			    <li><a href="#" onclick="setOrderby(7);">생년월일<span class="glyphicon glyphicon-sort-by-order-alt"></span></a></li>
			    <li><a href="#" onclick="setOrderby(8);">가입일<span class="glyphicon glyphicon-sort-by-order"></span></a></li>
			    <li><a href="#" onclick="setOrderby(9);">가입일<span class="glyphicon glyphicon-sort-by-order-alt"></span></a></li>
				</ul>
				</div>
				<div class="btn-group pull-right">
				<button class="btn btn-success btn-lg dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
				사용자<span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu">
				<li><a href="#" onclick="setJobno(1);">기본</a></li>
				<li class="divider"></li>
				<li><a href="#" onclick="setJobno(1);">Customer</a></li>
			    <li><a href="#" onclick="setJobno(2);">Store Manager</a></li>
			    <li><a href="#" onclick="setJobno(3);">CVS Manager</a></li>
				</ul>
				</div>
        	</div>
        	</div>
        	<div class="row">
        	<div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-12 ">
			<br>
        	<table class="table table-striped text-center" style="background-color:white;font-size:14pt;valign:middle">
			<thead>
				<tr style="font-size:16pt">
					<th style="width:20%">사용자 번호</th>
					<th style="width:20%">이미지</th>
					<th style="width:40%">정보</th>
					<th style="width:20%">추가정보</th>
				</tr>				
			</thead>
			<tbody id = "userlist">
			</tbody>
			</table>
			<div id="paging">
				<nav>
					<ul class="pagination" id="userlistpaging">
					</ul>
				</nav>
			</div>
			</div>
			</div>			
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->


<!-- === END CONTENT === -->
<!-- === BEGIN FOOTER === -->
<c:import url="../../include/admin/common/footer.jsp"></c:import>
<!-- === END FOOTER === -->
<!-- JS -->
<script>
var pageBuffer=1;
var jobnoBuffer=1;
var orderbyBuffer=0;
var keywordBuffer='';

$(userList(pageBuffer,jobnoBuffer,orderbyBuffer,keywordBuffer));

function setPage(page){
	if(pagebuffer!=page){
		pagebuffer=page;
	}
	userList(pageBuffer,jobnoBuffer,orderbyBuffer,keywordBuffer);
}
function setJobno(jobno){
	if(jobnoBuffer!=jobno){
		jobnoBuffer=jobno;
	}
	userList(pageBuffer,jobnoBuffer,orderbyBuffer,keywordBuffer);
}   
function setOrderby(orderby){
	if(orderbyBuffer!=orderby){
		orderbyBuffer=orderby;
	}
	userList(pageBuffer,jobnoBuffer,orderbyBuffer,keywordBuffer);
}
function setKeyword(){
	var keyword = $("#keyword").val();
	if(keywordBuffer!=keyword){
		keywordBuffer=keyword;
	}
	userList(pageBuffer,jobnoBuffer,orderbyBuffer,keywordBuffer);
	keywordBuffer='';
}

function userList(page,jobno,orderby,keyword){
	var data={"page":page,"jobno":jobno,"orderby":orderby,"keyword":keyword};
	$.ajax({
		url : '/everycvs/ajax/userlist.do',
		data : data,
		type : 'get',
		success : function(data){
			var values='';
			var userlist = data.userlist;
		
			for(var i in userlist){
					values+='<tr>'
						+'<td style="vertical-align:middle"><b >'+userlist[i].user_no+'</b></td>'
						+'<td style="vertical-align:middle"><div class="thumbnail-wrapper">'
						+'<div class="thumbnail">'
						+'<div class="centered">';
						if(userlist[i].stored_file_name == '' || userlist[i].stored_file_name == null){
							values+='<img id="userimg" src="/everycvs/resources/user/img/user.png">';
						}else{
							values+='<img id="userimg" src="/everycvs/resources/upload/'+userlist[i].stored_file_name+'">';
						}						
						values+='</div></div></div></td>'
						+'<td style="vertical-align:middle"><p>이메일 : '+userlist[i].email+'</p>'
						+'<p>이름 : '+userlist[i].user_name+'</p>'
						+'<p>생년월일 : '+userlist[i].birthday+'</p>'
						+'<p>전화번호 : '+userlist[i].phone+'</p>'
						+'<p>가입일 : '+userlist[i].enroll_date+'</p>'
						+'</td>'
						+'<td style="vertical-align:middle">추가정보</td>'
						+'</tr>';
			}	
			$("#userlist").html(values);
			
			var valuesPaging="";
            
            if(data.currentPage <= 1){
               valuesPaging+="<li class='disabled'>" + 
                 "<a href='#' aria-label='Previous'>" +
                   "<span aria-hidden='true'>&laquo;</span></a></li>";
            } else {
               valuesPaging += "<li><a href='javascript:setPage("+(data.currentPage - 1) + ")'  aria-label='Previous'>"
                + "<span aria-hidden='true'>&laquo;</span></a></li>";
            }
            
           for(var i = data.startPage; i<=data.endPage; i++)
           {
              if(data.currentPage == i)
              {
                valuesPaging+="<li class='disabled'>"+"<a href='#'>"+ i + "</a></li>";
              } else {
                  valuesPaging+="<li><a href='javascript:setPage("+ i + ")'>"+ i + "</a></li>";
              }

           }
           
            if(data.currentPage >= data.maxPage)
            {
               valuesPaging+= "<li class='disabled'>" + 
                  "<a href='#' aria-label='Next'>"+
                      "<span aria-hidden='true'>&raquo;</span></a></li>";
            } else {
               valuesPaging += "<li><a href='javascript:setPage("+(data.currentPage + 1)+ ")' aria-label='Next'>" +
                "<span aria-hidden='true'>&raquo;</span></a></li>";
            }
            
            $("#userlistpaging").html(valuesPaging);
		},
		error:function(error){
			console.log(error);
		}
	});
}
</script>
<c:import url="../../include/admin/common/end.jsp"></c:import>
<!-- === END === -->