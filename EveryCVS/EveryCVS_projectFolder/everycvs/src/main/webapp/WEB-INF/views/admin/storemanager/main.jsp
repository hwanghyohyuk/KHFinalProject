<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- === BEGIN HEAD ===  -->
<c:import url="../../include/user/common/head.jsp"></c:import>
<!-- Bootstrap 3.3.2 -->
<link href="/everycvs/resources/admin/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<!-- FontAwesome 4.3.0 -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons 2.0.0 -->
<link
	href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="/everycvs/resources/admin/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
<link href="/everycvs/resources/admin/dist/css/skins/_all-skins.min.css" rel="stylesheet"
	type="text/css" />
<!-- iCheck -->
<link href="/everycvs/resources/admin/plugins/iCheck/flat/blue.css" rel="stylesheet"
	type="text/css" />
<!-- Morris chart -->
<link href="/everycvs/resources/admin/plugins/morris/morris.css" rel="stylesheet" type="text/css" />
<!-- jvectormap -->
<link href="/everycvs/resources/admin/plugins/jvectormap/jquery-jvectormap-1.2.2.css"
	rel="stylesheet" type="text/css" />
<!-- Date Picker -->
<link href="/everycvs/resources/admin/plugins/datepicker/datepicker3.css" rel="stylesheet"
	type="text/css" />
<!-- Daterange picker -->
<link href="/everycvs/resources/admin/plugins/daterangepicker/daterangepicker-bs3.css"
	rel="stylesheet" type="text/css" />
<!-- bootstrap wysihtml5 - text editor -->
<link href="/everycvs/resources/admin/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"
	rel="stylesheet" type="text/css" />

<!-- jQuery UI 1.11.2 -->
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.min.js"
	type="text/javascript"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
	$.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.2 JS -->
<script src="/everycvs/resources/admin/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<!-- Morris.js charts -->
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="/everycvs/resources/admin/plugins/morris/morris.min.js" type="text/javascript"></script>
<!-- Sparkline -->
<script src="/everycvs/resources/admin/plugins/sparkline/jquery.sparkline.min.js"
	type="text/javascript"></script>
<!-- jvectormap -->
<script src="/everycvs/resources/admin/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"
	type="text/javascript"></script>
<script src="/everycvs/resources/admin/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"
	type="text/javascript"></script>
<!-- jQuery Knob Chart -->
<script src="/everycvs/resources/admin/plugins/knob/jquery.knob.js" type="text/javascript"></script>
<!-- daterangepicker -->
<script src="/everycvs/resources/admin/plugins/daterangepicker/daterangepicker.js"
	type="text/javascript"></script>
<!-- datepicker -->
<script src="/everycvs/resources/admin/plugins/datepicker/bootstrap-datepicker.js"
	type="text/javascript"></script>
<!-- Bootstrap WYSIHTML5 -->
<script
	src="/everycvs/resources/admin/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"
	type="text/javascript"></script>
<!-- iCheck -->
<script src="/everycvs/resources/admin/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
<!-- Slimscroll -->
<script src="/everycvs/resources/admin/plugins/slimScroll/jquery.slimscroll.min.js"
	type="text/javascript"></script>
<!-- FastClick -->
<script src='/everycvs/resources/admin/plugins/fastclick/fastclick.min.js'></script>
<!-- AdminLTE App -->
<script src="/everycvs/resources/admin/dist/js/app.min.js" type="text/javascript"></script>

<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="/everycvs/resources/admin/dist/js/pages/dashboard.js" type="text/javascript"></script>

<!-- AdminLTE for demo purposes -->
<script src="/everycvs/resources/admin/dist/js/demo.js" type="text/javascript"></script>
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
							<div class="small-box bg-aqua">
								<div class="inner">
									<h3>150</h3>
									<p>오늘의 판매량</p>
								</div>
								<div class="icon">
									<i class="ion ion-bag"></i>
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
									<h3>
										53<sup style="font-size: 20px">%</sup>
									</h3>
									<p>오늘의 상품</p>
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
							<div class="small-box bg-yellow">
								<div class="inner">
									<h3>44</h3>
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
							<div class="small-box bg-red">
								<div class="inner">
									<h3>65</h3>
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
					<!-- Main row -->
					<div class="row">
						<!-- Left col -->
						<section class="col-lg-7 connectedSortable">
							<!-- Custom tabs (Charts with tabs)-->
							<div class="nav-tabs-custom">
								<!-- Tabs within a box -->
								<ul class="nav nav-tabs pull-right">
									<li class="active"><a href="#revenue-chart"
										data-toggle="tab">Area</a></li>
									<li><a href="#sales-chart" data-toggle="tab">Donut</a></li>
									<li class="pull-left header"><i class="fa fa-inbox"></i>
										Sales</li>
								</ul>
								<div class="tab-content no-padding">
									<!-- Morris chart - Sales -->
									<div class="chart tab-pane active" id="revenue-chart"
										style="position: relative; height: 300px;"></div>
									<div class="chart tab-pane" id="sales-chart"
										style="position: relative; height: 300px;"></div>
								</div>
							</div>
							<!-- /.nav-tabs-custom -->
							<!-- solid sales graph -->
							<div class="box box-solid bg-teal-gradient">
								<div class="box-header">
									<i class="fa fa-th"></i>
									<h3 class="box-title">Sales Graph</h3>
									<div class="box-tools pull-right">
										<button class="btn bg-teal btn-sm" data-widget="collapse">
											<i class="fa fa-minus"></i>
										</button>
										<button class="btn bg-teal btn-sm" data-widget="remove">
											<i class="fa fa-times"></i>
										</button>
									</div>
								</div>
								<div class="box-body border-radius-none">
									<div class="chart" id="line-chart" style="height: 250px;"></div>
								</div>
								<!-- /.box-body -->
								<div class="box-footer no-border">
									<div class="row">
										<div class="col-xs-4 text-center"
											style="border-right: 1px solid #f4f4f4">
											<input type="text" class="knob" data-readonly="true"
												value="20" data-width="60" data-height="60"
												data-fgColor="#39CCCC" />
											<div class="knob-label">Mail-Orders</div>
										</div>
										<!-- ./col -->
										<div class="col-xs-4 text-center"
											style="border-right: 1px solid #f4f4f4">
											<input type="text" class="knob" data-readonly="true"
												value="50" data-width="60" data-height="60"
												data-fgColor="#39CCCC" />
											<div class="knob-label">Online</div>
										</div>
										<!-- ./col -->
										<div class="col-xs-4 text-center">
											<input type="text" class="knob" data-readonly="true"
												value="30" data-width="60" data-height="60"
												data-fgColor="#39CCCC" />
											<div class="knob-label">In-Store</div>
										</div>
										<!-- ./col -->
									</div>
									<!-- /.row -->
								</div>
								<!-- /.box-footer -->
							</div>
							<!-- /.box -->

							<!-- Calendar -->
							<div class="box box-solid bg-green-gradient">
								<div class="box-header">
									<i class="fa fa-calendar"></i>
									<h3 class="box-title">Calendar</h3>
									<!-- tools box -->
									<div class="pull-right box-tools">
										<!-- button with a dropdown -->
										<div class="btn-group">
											<button class="btn btn-success btn-sm dropdown-toggle"
												data-toggle="dropdown">
												<i class="fa fa-bars"></i>
											</button>
											<ul class="dropdown-menu pull-right" role="menu">
												<li><a href="#">Add new event</a></li>
												<li><a href="#">Clear events</a></li>
												<li class="divider"></li>
												<li><a href="#">View calendar</a></li>
											</ul>
										</div>
										<button class="btn btn-success btn-sm" data-widget="collapse">
											<i class="fa fa-minus"></i>
										</button>
										<button class="btn btn-success btn-sm" data-widget="remove">
											<i class="fa fa-times"></i>
										</button>
									</div>
									<!-- /. tools -->
								</div>
								<!-- /.box-header -->
								<div class="box-body no-padding">
									<!--The calendar -->
									<div id="calendar" style="width: 100%"></div>
								</div>
								<!-- /.box-body -->
								<div class="box-footer text-black">
									<div class="row">
										<div class="col-sm-6">
											<!-- Progress bars -->
											<div class="clearfix">
												<span class="pull-left">Task #1</span> <small
													class="pull-right">90%</small>
											</div>
											<div class="progress xs">
												<div class="progress-bar progress-bar-green"
													style="width: 90%;"></div>
											</div>

											<div class="clearfix">
												<span class="pull-left">Task #2</span> <small
													class="pull-right">70%</small>
											</div>
											<div class="progress xs">
												<div class="progress-bar progress-bar-green"
													style="width: 70%;"></div>
											</div>
										</div>
										<!-- /.col -->
										<div class="col-sm-6">
											<div class="clearfix">
												<span class="pull-left">Task #3</span> <small
													class="pull-right">60%</small>
											</div>
											<div class="progress xs">
												<div class="progress-bar progress-bar-green"
													style="width: 60%;"></div>
											</div>

											<div class="clearfix">
												<span class="pull-left">Task #4</span> <small
													class="pull-right">40%</small>
											</div>
											<div class="progress xs">
												<div class="progress-bar progress-bar-green"
													style="width: 40%;"></div>
											</div>
										</div>
										<!-- /.col -->
									</div>
									<!-- /.row -->
								</div>
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