<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- === BEGIN HEAD ===  -->
<c:import url="../../include/user/common/head.jsp"></c:import>
<!-- Bootstrap 3.3.2 -->
<link href="/everycvs/resources/admin/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<!-- FontAwesome 4.3.0 -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons 2.0.0 -->
<link
	href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="/everycvs/resources/admin/dist/css/AdminLTE.min.css"
	rel="stylesheet" type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
<link href="/everycvs/resources/admin/dist/css/skins/_all-skins.min.css"
	rel="stylesheet" type="text/css" />
<!-- iCheck -->
<link href="/everycvs/resources/admin/plugins/iCheck/flat/blue.css"
	rel="stylesheet" type="text/css" />
<!-- Morris chart -->
<link href="/everycvs/resources/admin/plugins/morris/morris.css"
	rel="stylesheet" type="text/css" />
<!-- jvectormap -->
<link
	href="/everycvs/resources/admin/plugins/jvectormap/jquery-jvectormap-1.2.2.css"
	rel="stylesheet" type="text/css" />
<!-- Date Picker -->
<link
	href="/everycvs/resources/admin/plugins/datepicker/datepicker3.css"
	rel="stylesheet" type="text/css" />
<!-- Daterange picker -->
<link
	href="/everycvs/resources/admin/plugins/daterangepicker/daterangepicker-bs3.css"
	rel="stylesheet" type="text/css" />
<!-- bootstrap wysihtml5 - text editor -->
<link
	href="/everycvs/resources/admin/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"
	rel="stylesheet" type="text/css" />

<!-- jQuery UI 1.11.2 -->
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.min.js"
	type="text/javascript"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
	$.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.2 JS -->
<script src="/everycvs/resources/admin/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script>
<!-- Morris.js charts -->
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="/everycvs/resources/admin/plugins/morris/morris.min.js"
	type="text/javascript"></script>
<!-- Sparkline -->
<script
	src="/everycvs/resources/admin/plugins/sparkline/jquery.sparkline.min.js"
	type="text/javascript"></script>
<!-- jvectormap -->
<script
	src="/everycvs/resources/admin/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"
	type="text/javascript"></script>
<script
	src="/everycvs/resources/admin/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"
	type="text/javascript"></script>
<!-- daterangepicker -->
<script
	src="/everycvs/resources/admin/plugins/daterangepicker/daterangepicker.js"
	type="text/javascript"></script>
<!-- datepicker -->
<script
	src="/everycvs/resources/admin/plugins/datepicker/bootstrap-datepicker.js"
	type="text/javascript"></script>
<!-- Bootstrap WYSIHTML5 -->
<script
	src="/everycvs/resources/admin/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"
	type="text/javascript"></script>
<!-- iCheck -->
<script src="/everycvs/resources/admin/plugins/iCheck/icheck.min.js"
	type="text/javascript"></script>
<!-- Slimscroll -->
<script
	src="/everycvs/resources/admin/plugins/slimScroll/jquery.slimscroll.min.js"
	type="text/javascript"></script>
<!-- FastClick -->
<script
	src='/everycvs/resources/admin/plugins/fastclick/fastclick.min.js'></script>
<!-- AdminLTE App -->
<script src="/everycvs/resources/admin/dist/js/app.min.js"
	type="text/javascript"></script>

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


<c:import url="../../include/user/common/headend.jsp"></c:import>
<!-- === END HEAD ===  -->
<!-- === BEGIN HEADER ===  -->
<c:import url="../../include/user/common/header.jsp"></c:import>
<!-- === END HEADER === -->
<!-- === BEGIN CONTENT === -->
<div id="content">
	<div class="container" style="background-color: #ecf0f5">
		<div class="row margin-vert-30">
			<div class="col-md-12">
				<div class="row">
					<div class="col-sm-6">
						<h2>
							<strong>${sessionScope.store.brand_name}&nbsp;${sessionScope.store.store_name}</strong><br>
							<small>${sessionScope.store.road_address}</small>
						</h2>
					</div>
				</div>
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
								<a href="#" class="small-box-footer">${sessionScope.store.store_name} 방문 고객
								<i	class="fa fa-arrow-circle-right"></i></a>
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
								<a href="/everycvs/spmlist.do" class="small-box-footer">오늘의 등록 상품 
								<i class="fa fa-arrow-circle-right"></i></a>
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
								<a href="#productkind" class="small-box-footer" onclick="productKindChart(3);">오늘의 판매량 
								<i class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div>
						<!-- ./col -->
						<div class="col-md-3 col-sm-6 col-xs-12">
							<!-- small box -->
							<div class="small-box bg-red">
								<div class="inner">
									<h4>
										<b><fmt:formatNumber value="${saleBenefit }"	pattern="#,###" /></b>
									</h4>
									<p>&nbsp;</p>
								</div>
								<div class="icon">
									<i class="ion ion-pie-graph"></i>
								</div>
								<a href="#salesgraph" class="small-box-footer">오늘의 수익 
								<i class="fa fa-arrow-circle-right"></i></a>
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
								<div id="carousel-popprd-1" class="carousel slide" data-ride="carousel">
										<!-- Indicators -->
										<ol class="carousel-indicators">
											<li data-target="#carousel-popprd-1" data-slide-to="0" class="active"></li>
											<li data-target="#carousel-popprd-1" data-slide-to="1"></li>
											<li data-target="#carousel-popprd-1" data-slide-to="2"></li>
											<li data-target="#carousel-popprd-1" data-slide-to="3"></li>
											<li data-target="#carousel-popprd-1" data-slide-to="4"></li>
										</ol>
										<!-- Wrapper for slides -->
										<div class="carousel-inner" role="listbox" style="height:210px;">
										 	<c:forEach var="sp" items="${spTop5}" varStatus="status">
												<c:if test="${status.first}">
													<div class="item text-center active">
												</c:if>
												<c:if test="${!status.first}">
													<div class="item text-center">
												</c:if>
														<span>
														<img alt="${sp.product_name }" style="height:210px;margin-left:-150px;" src="/everycvs/resources/upload/${sp.stored_file_name}">
														</span>
														<span>
														<img alt="${status.index}" style="height:50px;margin-left:-200px;margin-top:-160px;" src="/everycvs/resources/user/img/number/top_${sp.brand_no}_${status.count}.png">
														</span>
														<div class="carousel-caption"
															style="background-color: rgba(255, 255, 255, 0.5);">
															<b>${sp.product_name }</b> <br>
															<fmt:formatNumber value="${sp.price }" type="currency"
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
									<a class = "pull-right margin-horiz-10" onclick="productKindChart(1);" >Month</a>
									<a class = "pull-right margin-horiz-10" onclick="productKindChart(2);" >Week</a>
									<a class = "pull-right margin-horiz-10" onclick="productKindChart(3);" >Day</a>
									<a class = "pull-right margin-horiz-10" onclick="productKindChart(0);" >All</a>
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
						<div id="salesgraph"
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
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
			</div>
		</div>
	</div>
</div>
<!-- === END CONTENT === -->
<!-- === BEGIN FOOTER === -->
<c:import url="../../include/user/common/footer.jsp"></c:import>
<!-- === END FOOTER === -->
<!-- JS -->
<script type="text/javascript">
var dateNo = 0;
function productKindChart(dateNo){
	var dataprovider=[];
	$.ajax({
		url:'/everycvs/ajax/productkindchart.do',
		type:'get',
		data:{"dateNo":dateNo},
		async: false,
		success:function(data){
			console.log(data);	
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
		url:'/everycvs/ajax/saleschart.do',
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
<!-- JS -->
<c:import url="../../include/user/common/end.jsp"></c:import>
<!-- === END FOOTER === -->