<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- === BEGIN HEAD ===  -->
<c:import url="../../include/admin/common/head.jsp"></c:import>
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
        <section class="content-header">
          <h1>
          모두의 편의점
            <small>회원관리</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="/everycvs/main/main.do"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Dashboard</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->


<!-- === END CONTENT === -->
<!-- === BEGIN FOOTER === -->
<c:import url="../../include/admin/common/footer.jsp"></c:import>
<!-- === END FOOTER === -->
<!-- JS -->
<script>
function log(o){console.log(o);}
(function($){
	var body = new RGInfiniteScroll($(document), {
		url : '/everycvs/ajax/userlist.do?page={page}',
		method : 'ajax',
		ajaxOptions : {
			dataType : 'json',
			complete : function(data) {
				console.log("z");
				console.log(data);
				for(var i in data){
					console.log(data[i]);
				}				
				return true;
			}
		}
	});

	$('#more').on('click', function(){
		body.ajax();
	});
})(jQuery);
</script>
<c:import url="../../include/admin/common/end.jsp"></c:import>
<!-- === END === -->