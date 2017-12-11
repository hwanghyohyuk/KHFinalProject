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
				<b>GS25</b>&nbsp;&nbsp;Event management
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
									<tr class="text-center">
										<td>02021</td>
										<td data-toggle="modal" data-target="#myModal"
											style="cursor: pointer;">GS25 빼빼로데이 이벤트</td>
										<td>2017.11.02 ~ 2017.11.12</td>
										<td>12442</td>
										<td><i class="fa fa-trash-o jun21" onclick="del_event();"></i></td>
									</tr>
								</table>
							</div>
							<!-- Search & Add block -->
							<div class="col-sm-12"
								style="padding-left: 5px; padding-right: 8px;">
								<!--start-->
								<div class="col-sm-2 jun16">
									<select class="form-control input jun15">
										<option>번호</option>
										<option>상품명</option>
										<option>제조사</option>
									</select>
								</div>
								<form>
									<div class="col-sm-4 jun12">
										<input class="form-control jun11" type="text"
											placeholder="검색 키워드를 입력하세요.">
									</div>
									<div class="col-sm-1 jun13">
										<button type="submit" onclick="search_event();"
											class="btn btn-default btn jun14">
											<i class="fa fa-search"></i>
										</button>
									</div>
								</form>
								<div class="col-sm-5 jun17">
									<button type="button" onclick="add_event();"
										class="btn btn-success btn jun4" id="width100">
										<i class="fa fa-gift" style="margin-right: 8px;"></i>ADD
									</button>
								</div>
								<!--end-->
							</div>
							<!-- End Search & Add block -->
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
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel" style="color: #999;">Event detail</h4>
			</div>
			<div class="modal-body">
				<div class="jun_imgdiv">
					<img src="assets/img/exam_img.jpg" alt="이벤트 이미지가 없습니다."
						class="jun_img">
				</div>
				<div class="jun_contentdiv">
					<div class="jun_textdiv">No.0001</div>
					<span style="padding-right: 22px;">이벤트명</span>GS25와 함께하는 빼빼로데이 이벤트<br>
					<span style="padding-right: 22px;">시작일자</span>2017.11.02<br> <span
						style="padding-right: 22px;">종료일자</span>2017.11.12<br> <span
						style="padding-right: 20px;">참여제한 </span><b>1</b>번<br> <span
						style="padding-right: 36px;">조회수</span>312344<br> <span
						style="padding-right: 36px;">참여수</span>12021<br> <span
						style="padding-right: 22px;">첨부파일</span>lotte-rice-002.png<br>
				</div>
				<div class="jun_contentdiv2">이벤트 내용</div>
			</div>
			<div class="modal-footer" style="clear: both; margin-top: 2px;">
				<button type="button" onclick="del_event();" class="btn btn-gray"
					style="float: left;">DELETE</button>
				<button type="button" onclick="modify_event();"
					class="btn btn-danger">MODIFY</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">CANCEL</button>
			</div>
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
	function del_event() {
		var answer = false;
		answer = confirm("해당 이벤트를 삭제하시겠습니까?");
		if (answer)
			alert("이벤트가 삭제되었습니다.");
	}

	function search_event() {
		// 검색창 null 이면 alert
		location.href = '/everycvs/cvseventlist.do';
	}

	function modify_event() {
		location.href = '/everycvs/cvseventmodifyview.do';
	}

	function add_event() {
		location.href = '/everycvs/cvseventwriteview.do';
	}
</script>
<!-- End JS Custom Function -->
<!-- === END === -->