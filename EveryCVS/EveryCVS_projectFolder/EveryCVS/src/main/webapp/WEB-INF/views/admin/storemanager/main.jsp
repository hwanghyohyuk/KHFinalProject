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
<!-- jQuery Knob Chart -->
<script src="/everycvs/resources/admin/plugins/knob/jquery.knob.js"
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

<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script type="text/javascript">  
$(function () {
$(".knob").knob();
});
</script>

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
				<section class="content">
					<!-- Small boxes (Stat box) -->
					<div class="row">
						<div class="col-md-3 col-sm-6 col-xs-12">
							<!-- small box -->
							<div class="small-box bg-yellow">
								<div class="inner">
									<h4>
										<b>${joinCustomers }</b>
									</h4>
									<p>오늘의 방문 고객</p>
								</div>
								<div class="icon">
									<i class="ion ion-person-add"></i>
								</div>
								<a href="#" class="small-box-footer">More info <i
									class="fa fa-arrow-circle-right"></i></a>
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
									<p>오늘의 등록 상품</p>
								</div>
								<div class="icon">
									<i class="ion ion-cube"></i>
								</div>
								<a href="#" class="small-box-footer">More info <i
									class="fa fa-arrow-circle-right"></i></a>
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
									<p>오늘의 판매량</p>
								</div>
								<div class="icon">
									<i class="ion ion-ios-cart-outline"></i>
								</div>
								<a href="#" class="small-box-footer">More info <i
									class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div>
						<!-- ./col -->
						<div class="col-md-3 col-sm-6 col-xs-12">
							<!-- small box -->
							<div class="small-box bg-red">
								<div class="inner">
									<h4>
										<b><fmt:formatNumber value="${saleBenefit }"
												pattern="#,###" /></b>
									</h4>
									<p>오늘의 수익</p>
								</div>
								<div class="icon">
									<i class="ion ion-pie-graph"></i>
								</div>
								<a href="#" class="small-box-footer">More info <i
									class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div>
						<!-- ./col -->
					</div>
					<!-- /.row -->

					<!-- row -->
					<div class="row">
						<div class="col-xs-12">
							<!-- jQuery Knob -->
							<div class="box box-solid">
								<div class="box-header">
									<i class="fa fa-bar-chart-o"></i>
									<h3 class="box-title">상품 종류별 판매량</h3>
								</div>
								<!-- /.box-header -->
								<div class="box-body">
									<div class="row">
										<div class="col-md-3 col-sm-6 col-xs-6 text-center">
											<input type="text" class="knob" value="30" data-width="90" data-readonly="true" readonly="readonly"
												data-height="90" data-fgColor="#3c8dbc" />
											<div class="knob-label">New Visitors</div>
										</div>
										<!-- ./col -->
										<div class="col-md-3 col-sm-6 col-xs-6 text-center">
											<input type="text" class="knob" value="70" data-width="90" data-readonly="true" readonly="readonly"
												data-height="90" data-fgColor="#f56954" />
											<div class="knob-label">Bounce Rate</div>
										</div>
										<!-- ./col -->
										<div class="col-md-3 col-sm-6 col-xs-6 text-center">
											<input type="text" class="knob" value="0" data-readonly="true" readonly="readonly"
												data-min="0" data-max="100" data-width="90" data-height="90"
												data-fgColor="#00a65a" />
											<div class="knob-label">Server Load</div>
										</div>
										<!-- ./col -->
										<div class="col-md-3 col-sm-6 col-xs-6 text-center">
											<input type="text" class="knob" value="40" data-width="90" data-readonly="true" readonly="readonly"
												data-height="90" data-fgColor="#00c0ef" />
											<div class="knob-label">Disk Space</div>
										</div>
										<!-- ./col -->
									</div>
									<!-- /.row -->
									<div class="row">
										<div class="col-xs-6 text-center">
											<input type="text" class="knob" value="90" data-width="90" data-readonly="true" readonly="readonly"
												data-height="90" data-fgColor="#932ab6" />
											<div class="knob-label">Bandwidth</div>
										</div>
										<!-- ./col -->
										<div class="col-xs-6 text-center">
											<input type="text" class="knob" value="50" data-width="90" data-readonly="true" readonly="readonly"
												data-height="90" data-fgColor="#39CCCC" />
											<div class="knob-label">CPU</div>
										</div>
										<!-- ./col -->
									</div>
									<!-- /.row -->
								</div>
								<!-- /.box-body -->
							</div>
							<!-- /.box -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->

					<!-- Main row -->
					<div class="row">
						<!-- Left col -->
						<section
							class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<!-- solid sales graph -->
							<div class="box box-solid bg-teal-gradient">
								<div class="box-header">
									<i class="fa fa-inbox"></i>
									<h3 class="box-title">Sales Graph</h3>
								</div>
								<div class="box-body border-radius-none">
									<div class="chart" id="linechart" style="height: 250px;"></div>
									<script type="text/javascript">
									Morris.Line({
									    element: 'linechart',
									    resize: true,
									    data: [
									      {y: '2011 Q1', item1: 2666},
									      {y: '2011 Q2', item1: 2778},
									      {y: '2011 Q3', item1: 4912},
									      {y: '2011 Q4', item1: 3767},
									      {y: '2012 Q1', item1: 6810},
									      {y: '2012 Q2', item1: 5670},
									      {y: '2012 Q3', item1: 4820},
									      {y: '2012 Q4', item1: 15073},
									      {y: '2013 Q1', item1: 10687},
									      {y: '2013 Q2', item1: 8432}
									    ],
									    xkey: 'y',
									    ykeys: ['item1'],
									    labels: ['Item 1'],
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
									</script>
								</div>
								<!-- /.box-body -->
							</div>
							<!-- /.box -->
						</section>
						<!-- right col -->
					</div>
					<!-- /.row (main row) -->
				</section>
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
<c:import url="../../include/user/common/end.jsp"></c:import>
<!-- === END FOOTER === -->