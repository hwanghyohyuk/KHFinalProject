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
			${sessionScope.user.brand_name} <small>Control panel</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">Dashboard</li>
		</ol>
	</section>

	<div class="content">
		<!-- Small boxes (Stat box) -->
		<div class="row">
			<div class="col-md-3 col-sm-6 col-xs-12">
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
					<a href="#" class="small-box-footer">${sessionScope.user.brand_name} 방문 고객 
					<i class="fa fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-md-3 col-sm-6 col-xs-12">
				<!-- small box -->
				<div class="small-box bg-green">
					<div class="inner">
						<h4>
							<b>${registProducts }</b>
						</h4>
						<p>&nbsp;</p>
					</div>
					<div class="icon">
						<i class="ion ion-cube"></i>
					</div>
					<a href="/everycvs/spmlist.do" class="small-box-footer">오늘의 등록
						상품 <i class="fa fa-arrow-circle-right"></i>
					</a>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-md-3 col-sm-6 col-xs-12">
				<!-- small box -->
				<div class="small-box bg-blue">
					<div class="inner">
						<h4>
							<b>${saleQuantity }</b>
						</h4>
						<p>&nbsp;</p>
					</div>
					<div class="icon">
						<i class="ion ion-ios-cart-outline"></i>
					</div>
					<a href="#productkind" class="small-box-footer"
						onclick="productKindChart(3);">오늘의 판매량 <i
						class="fa fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-md-3 col-sm-6 col-xs-12">
				<!-- small box -->
				<div class="small-box bg-red">
					<div class="inner">
						<h4>
							<b><fmt:formatNumber value="${saleBenefit }" pattern="#,###" /></b>
						</h4>
						<p>&nbsp;</p>
					</div>
					<div class="icon">
						<i class="ion ion-pie-graph"></i>
					</div>
					<a href="#salesgraph" class="small-box-footer">오늘의 수익 <i
						class="fa fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->
		</div>
		<!-- /.row -->
		<!-- row -->
		<div class="row">
			<div id="productlist" class="col-xs-12">
				<!-- jQuery Knob -->
				<div class="box box-solid">
					<div class="box-header">
						<i class="fa fa-cube"></i>
						<h3 class="box-title">금주의 인기상품 TOP5</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div id="carousel-popprd-1" class="carousel slide"
							data-ride="carousel">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#carousel-popprd-1" data-slide-to="0"
									class="active"></li>
								<li data-target="#carousel-popprd-1" data-slide-to="1"></li>
								<li data-target="#carousel-popprd-1" data-slide-to="2"></li>
								<li data-target="#carousel-popprd-1" data-slide-to="3"></li>
								<li data-target="#carousel-popprd-1" data-slide-to="4"></li>
							</ol>
							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox" style="height: 210px;">
								<c:forEach var="p" items="${pTop5}" varStatus="status">
									<c:if test="${status.first}">
										<div class="item text-center active">
									</c:if>
									<c:if test="${!status.first}">
										<div class="item text-center">
									</c:if>
									<span> <img alt="${p.product_name }"
										style="height: 210px; margin-left: -150px;"
										src="/everycvs/resources/upload/${p.stored_file_name}">
									</span>
									<span> <img alt="${status.index}"
										style="height: 50px; margin-left: -200px; margin-top: -160px;"
										src="/everycvs/resources/user/img/number/top_${p.brand_no}_${status.count}.png">
									</span>
									<div class="carousel-caption"
										style="background-color: rgba(255, 255, 255, 0.5);">
										<b>${p.product_name }</b> <br>
										<fmt:formatNumber value="${p.price }" type="currency"
											groupingUsed="true" />
									</div>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
	<!-- row -->
	<div class="row">
		<div id="productkind" class="col-xs-12">
			<!-- jQuery Knob -->
			<div class="box box-solid">
				<div class="box-header">
					<i class="fa fa-bar-chart-o"></i>
					<h3 class="box-title">상품 종류별 판매량</h3>
					<a class="pull-right margin-horiz-10" onclick="productKindChart(1);">Month</a> 
					<a class="pull-right margin-horiz-10" onclick="productKindChart(2);">Week</a>
					<a class="pull-right margin-horiz-10" onclick="productKindChart(3);">Day</a> 
					<a class="pull-right margin-horiz-10" onclick="productKindChart(0);">All</a>
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
	<!-- row -->
	<div class="row">
		<div id="salesgraph" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<!-- solid sales graph -->
			<div class="box box-solid bg-teal-gradient">
				<div class="box-header">
					<i class="fa fa-inbox"></i>
					<h3 class="box-title">Sales Graph</h3>
				</div>
				<div class="box-body border-radius-none">
					<div class="chart" id="linechart" style="height: 400px;"></div>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
	</div>
	<!-- /.row  -->
</div>
<!-- /.content -->
<!-- === END CONTENT === -->
<!-- === BEGIN FOOTER === -->
<c:import url="../../include/admin/common/footer.jsp"></c:import>
<!-- === END FOOTER === -->
<!-- JS -->
<script type="text/javascript">
var dateNo = 0;
function productKindChart(dateNo){
	var dataprovider=[];
	$.ajax({
		url:'/everycvs/ajax/cvsproductkindchart.do',
		type:'get',
		data:{"dateNo":dateNo},
		async: false,
		success:function(data){
			if(data.length>0){
				for(var i in data){
					dataprovider.push({"product":data[i].product_kind_name,"value": data[i].sale_quantity});
				}
			}else{
				if(dateNo==0){
					swal({
						title:"전체 판매내역이 없습니다",
						timer:1500,
						type:"error"					
						});	
				}
				else if(dateNo==1){
					swal({
						title:"이번달 판매내역이 없습니다",
						timer:1500,
						type:"error"					
						});	
									
				}else if(dateNo==2){
					swal({
						title:"이번주 판매내역이 없습니다",
						timer:1500,
						type:"error"					
						});	
				}else if(dateNo==3){
					swal({
						title:"금일 판매내역이 없습니다",
						timer:1500,
						type:"error"					
						});	
				}
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
		  "titleField": "product",
		  "outlineAlpha": 0.4,
		  "depth3D": 30,
		  "balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
		  "angle": 30
		} );
}

function salesChart(){
	var dataArray=[];	
	$.ajax({
		url:'/everycvs/ajax/cvssaleschart.do',
		type:'get',
		async: false,
		success:function(data){
			for(var i in data){
				dataArray.push({saledate:data[i].sale_date,value: data[i].calculated_price});
			}
		},
		error:function(error){
			console.log(error);	
		}	
	});	
	Morris.Line({
	    element: 'linechart',
	    resize: true,
	    data: dataArray,
	    xkey: 'saledate',
	    ykeys: ['value'],
	    labels: '₩',
	    lineColors: ['#efefef'],
	    lineWidth: 2,
	    hideHover: 'auto',
	    gridTextColor: "#fff",
	    gridStrokeWidth: 0.4,
	    pointSize: 4,
	    pointStrokeColors: ["#efefef"],
	    gridLineColor: "#efefef",
	    gridTextFamily: "Open Sans",
	    gridTextSize: 10
	  });
}

$(function(){
	productKindChart(dateNo);
	salesChart();
})
</script>
<c:import url="../../include/admin/common/end.jsp"></c:import>
<!-- === END === -->