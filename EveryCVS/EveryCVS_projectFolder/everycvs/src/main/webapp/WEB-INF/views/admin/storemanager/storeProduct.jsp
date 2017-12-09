<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>storeProduct</title>
<!-- Meta -->
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<!-- Favicon -->
<link href="favicon.ico" rel="shortcut icon">
<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="/everycvs/resources/user/css/bootstrap.css" rel="stylesheet">
<!-- Template CSS -->
<link rel="stylesheet" href="/everycvs/resources/user/css/animate.css" rel="stylesheet">
<link rel="stylesheet" href="/everycvs/resources/user/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="/everycvs/resources/user/css/nexus.css" rel="stylesheet">
<link rel="stylesheet" href="/everycvs/resources/user/css/responsive.css" rel="stylesheet">
<link rel="stylesheet" href="/everycvs/resources/user/css/custom.css" rel="stylesheet">
<!-- Google Fonts-->
<link href="http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
<script type="text/javascript">
	$(document).ready(function() {
	    $("#name").click(function() {
	       $("#myModal").modal();
	    });
	 });
</script>
</head>
<body>
	<!-- === BEGIN CONTENT === -->
	<div id="content">
	<div class="container background-white">
	<div class="row margin-vert-30">
	<div class="col-md-12">
		<div class="row">
			<div class="col-sm-6">
				<h2><strong>GS25대치점</strong><br> 
				<small>서울특별시 강남구 영동대로86길 10 </small></h2>
			</div>
			<div class="col-sm-3" style="margin-left: 190px;"> <br>
				<input class="form-control" type="text" placeholder="상품명을 입력해주세요.">
			</div>
			<div> <br>
				<button type="button" class="btn btn-primary btn-sm">검색</button>
			</div>
		</div> <br><br>
		<div class="box">
            <div class="box-header">
              <h3 class="box-title"><strong>지점상품관리</strong></h3>
            </div> <br>
            <div class="box-body no-padding">
              <table class="table table-condensed">
                <tr>
                  <th>상품번호</th>
                  <th>종류</th>
                  <th>상품명</th>
                  <th>제조사</th>
                  <th>가격</th>
                  <th>할인여부</th>
                  <th>제조일</th>
                  <th>수량</th>
                  <th>삭제</th>
                </tr>
                <tr>
                  <td>1</td>
                  <td>음료</td>
                  <td><a id="name"><strong>다논)액티비아업플레인210ml</strong></a></td>
                  <td>주식회사 올가니카키친</td>
                  <td>1,800원</td>
                  <td>YES</td>
                  <td>2017/11/20</td>
                  <td>3</td>
                  <td><button type="button" class="btn btn-primary btn-xs">삭제</button></td>
                </tr>
              </table>
            </div>
          </div>
          <!-- Modal -->
		  <div id="myModal" class="modal fade" role="dialog">
		  <div class="modal-dialog">
		  	<!-- Modal content-->
		  	<div class="modal-content">
		  		<div class="modal-header">
		  			<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" style="color: black;"><strong>상품설정</strong></h4>
				</div>
				<div class="modal-body">
					<div class="row">
					<div class="col-sm-6">
						<img src="/everycvs/resources/user/img/theteam/image1.jpg" alt="image1" align="left" style="margin-left:5px;">
					</div>
					<div class="col-sm-6">
						<table class="table table-condensed">
                			<tr>
			                  <td><strong>상품명</strong></td>
			                  <td>다논)액티비아업플레인210ml</td>
			                </tr>
			                <tr>
			                  <td><strong>가격</strong></td>
			                  <td>1,200원</td>
			                </tr>
			                <tr>
			                  <td><strong>유통기한</strong></td>
			                  <td>3일</td>
			                </tr>
			                <tr>
			                  <td><strong>구매횟수</strong></td>
			                  <td>1번</td>
			                </tr>
			                <tr>
			                  <td><strong>제조일</strong></td>
			                  <td><input class="form-control" type="text" placeholder="날짜를 입력해주세요."></td>
			                </tr>
			                <tr>
			                  <td><strong>수량</strong></td>
			                  <td><input class="form-control" type="number" min="1" max="100" step="1" value="1"></td>
			                </tr>
              			</table>
					</div>
				</div>
					<div class="row" style="margin-left: 10px;">
						<h3><strong>진행중인 EVENT</strong></h3> <br>
						<button type="button" class="btn btn-default">없음</button> &nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-default">1+1</button> &nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-default">2+1</button> &nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-default">증정행사</button> &nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-default">할인행사</button>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">수정</button> &nbsp;
					<button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">삭제</button>
				</div>
			</div>
			</div>
			</div>
			<!-- Modal End -->
	</div>
	<div class="text-center">
		<ul class="pagination">
			<li><a href="#">&laquo;</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li class="active"><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">&raquo;</a></li>
		</ul>
	</div>
	</div>
	</div>
	</div>
</body>
</html>