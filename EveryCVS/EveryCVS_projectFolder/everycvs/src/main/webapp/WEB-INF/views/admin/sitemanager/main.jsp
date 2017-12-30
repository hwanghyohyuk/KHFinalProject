<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- === BEGIN HEAD ===  -->
<c:import url="../../include/admin/common/head.jsp"></c:import>
<!-- Styles -->
<style>
#chartdiv {
  width: 100%;
  height: 500px;
}												
</style>
<!-- Resources -->
<script src="/everycvs/resources/admin/plugins/amcharts/amcharts.js"></script>
<script src="/everycvs/resources/admin/plugins/amcharts/pie.js"></script>
<script src="/everycvs/resources/admin/plugins/amcharts/none.js"></script>
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
			모두의 편의점 <small>Dash Board</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">Dashboard</li>
		</ol>
	</section>

		<div class="content">
		<!-- Small boxes (Stat box) -->
		<div class="row">
			<div class="col-md-4 col-sm-4 col-xs-12">
				<!-- small box -->
				<div class="small-box bg-yellow">
					<div class="inner">
						<h4>
							<b>${joinCustomers }</b>
						</h4>
						<p>&nbsp;</p>
					</div>
					<div class="icon">
						<i class="ion ion-person-add"></i>
					</div>
					<a href="#" class="small-box-footer">편의점 방문 고객</a>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-md-4 col-sm-4 col-xs-12">
				<!-- small box -->
				<div class="small-box bg-green">
					<div class="inner">
						<h4>
							<b>${registUserCount }</b>
						</h4>
						<p>&nbsp;</p>
					</div>
					<div class="icon">
						<i class="ion ion-person-add"></i>
					</div>
					<a href="/everycvs/admin/manageUser.do" class="small-box-footer">오늘의 신규 회원 등록 수
					<i class="fa fa-arrow-circle-right"></i>
					</a>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-md-4 col-sm-4 col-xs-12">
				<!-- small box -->
				<div class="small-box bg-blue">
					<div class="inner">
						<h4>
							<b>${purchaseCount }</b>
						</h4>
						<p>&nbsp;</p>
					</div>
					<div class="icon">
						<i class="ion ion-ios-cart-outline"></i>
					</div>
					<a href="#" class="small-box-footer">이번달 구매기능 이용 횟수 </a>
				</div>
			</div>
			<!-- ./col -->
		</div>
		<!-- /.row -->
	<!-- row -->
	<div class="row">
		<div id="productkind" class="col-xs-12">
			<!-- jQuery Knob -->
			<div class="box box-solid">
				<div class="box-header">
					<i class="fa fa-bar-chart-o"></i>
					<h3 class="box-title">편의점 방문자</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div id="chartdiv"></div>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
</div>
<!-- /.content -->


<!-- === END CONTENT === -->
<!-- === BEGIN FOOTER === -->
<c:import url="../../include/admin/common/footer.jsp"></c:import>
<!-- === END FOOTER === -->
<!-- JS -->
<script type="text/javascript">
function visitcvsChart(){
	var dataprovider=[];
	$.ajax({
		url:'/everycvs/ajax/visitcvschart.do',
		type:'get',
		async: false,
		success:function(data){
			if(data.length>0){
				for(var i in data){
					dataprovider.push({"cvs":data[i].brand_name,"value": data[i].join_count});
				}
			}else{
				swal({
					title:"기록이 없습니다",
					timer:1500,
					type:"error"					
					});	
			}
		},
		error:function(error){
			console.log(error);	
		}	
	});	
	AmCharts.makeChart( "chartdiv", {
		  "type": "pie",
		  "theme": "none",
		  "dataProvider": dataprovider,
		  "valueField": "value",
		  "titleField": "cvs",
		  "outlineAlpha": 0.4,
		  "depth3D": 30,
		  "balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
		  "angle": 30
		});
}

$(function(){
	visitcvsChart();
})
</script>
<c:import url="../../include/admin/common/end.jsp"></c:import>
<!-- === END === -->