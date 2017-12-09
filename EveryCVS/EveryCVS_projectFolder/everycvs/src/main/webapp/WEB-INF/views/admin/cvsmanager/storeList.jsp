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
				<b>GS25</b>&nbsp;&nbsp;Store management
			</h2>

			<!-- Accordion -->
			<div id="accordion" class="panel-group">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a class="accordion-toggle" href="#collapse-One"
								data-parent="#accordion" data-toggle="collapse"> 판매량 TOP5 지점
							</a>
						</h4>
					</div>
					<div id="collapse-One" class="accordion-body collapse in">
						<div class="panel-body" style="padding-top: 0px;">
							<div class="row jun22">
								<div class="col-sm-12">
									<span class="label label-success">1위</span> <a
										data-toggle="modal" data-target="#myModal"
										style="cursor: pointer; color: #666"> <span class="jun8">역삼쌍마점</span>
										<span class="jun8"><b>782253</b> EA 판매</span>
									</a>
								</div>
								<div class="col-sm-12">
									<span class="label label-success">2위</span> <a
										data-toggle="modal" data-target="#myModal"
										style="cursor: pointer; color: #666"> <span class="jun8">역삼상록점</span>
										<span class="jun8"><b>624823</b> EA 판매</span>
									</a>
								</div>
								<div class="col-sm-12">
									<span class="label label-success">3위</span> <a
										data-toggle="modal" data-target="#myModal"
										style="cursor: pointer; color: #666"> <span class="jun8">강남본점</span>
										<span class="jun8"><b>602422</b> EA 판매</span>
									</a>
								</div>
								<div class="col-sm-12">
									<span class="label label-success">4위</span> <a
										data-toggle="modal" data-target="#myModal"
										style="cursor: pointer; color: #666"> <span class="jun8">이천관고점</span>
										<span class="jun8"><b>521438</b> EA 판매</span>
									</a>
								</div>
								<div class="col-sm-12">
									<span class="label label-success">5위</span> <a
										data-toggle="modal" data-target="#myModal"
										style="cursor: pointer; color: #666"> <span class="jun8">이천중리본점</span>
										<span class="jun8"><b>461211</b> EA 판매</span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a class="accordion-toggle" href="#collapse-Two"
								data-parent="#accordion" data-toggle="collapse"> 방문자 수 TOP5
								지점 </a>
						</h4>
					</div>
					<div id="collapse-Two" class="accordion-body collapse">
						<div class="panel-body" style="padding-top: 0px;">
							<div class="row jun22">
								<div class="col-sm-12">
									<span class="label label-danger">1위</span> <a
										data-toggle="modal" data-target="#myModal"
										style="cursor: pointer; color: #666"> <span class="jun8">역삼쌍마점</span>
										<span class="jun8"><b>782253</b> 번 방문</span>
									</a>
								</div>
								<div class="col-sm-12">
									<span class="label label-danger">2위</span> <a
										data-toggle="modal" data-target="#myModal"
										style="cursor: pointer; color: #666"> <span class="jun8">역삼상록점</span>
										<span class="jun8"><b>624823</b> 번 방문</span>
									</a>
								</div>
								<div class="col-sm-12">
									<span class="label label-danger">3위</span> <a
										data-toggle="modal" data-target="#myModal"
										style="cursor: pointer; color: #666"> <span class="jun8">강남본점</span>
										<span class="jun8"><b>602422</b> 번 방문</span>
									</a>
								</div>
								<div class="col-sm-12">
									<span class="label label-danger">4위</span> <a
										data-toggle="modal" data-target="#myModal"
										style="cursor: pointer; color: #666"> <span class="jun8">이천관고점</span>
										<span class="jun8"><b>521438</b> 번 방문</span>
									</a>
								</div>
								<div class="col-sm-12">
									<span class="label label-danger">5위</span> <a
										data-toggle="modal" data-target="#myModal"
										style="cursor: pointer; color: #666;"> <span class="jun8">이천중리본점</span>
										<span class="jun8"><b>461211</b> 번 방문</span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End Acordion -->

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
									<h4 class="panel-title" style="font-size: 17px; color: #777;">지점 리스트</h4>
								</div>
								<table class="table">
                                                    <tr class="active text-center">
                                                        <th width="12%">지점번호</th>
                                                        <th width="20%">지점명</th>
                                                        <th width="38%">지번주소</th>
                                                        <th width="12%">방문횟수</th>
                                                        <th width="12%">판매량</th>
                                                        <th width="6%">Del</th>
                                                    </tr>
                                                    <tr class="text-center">
                                                        <td>25305326</td>
                                                        <td>역삼달샘점</td>
                                                        <td>서울특별시 강남구 테헤란로19길 29</td>
                                                        <td>52436</td>
                                                        <td>12442</td>
                                                        <td><i class="fa fa-trash-o jun21" onclick="del_store();" style="padding: 5px 10px; cursor: pointer;"></i></td>
                                                    </tr>
                                                </table>
							</div>
							<!-- Search & Add block -->
							<div class="col-sm-12"
								style="padding-left: 5px; padding-right: 8px;">
								<!--start-->
								<div class="col-sm-2 jun16">
                                                <select class="form-control input jun15">
                                                    <option>지점번호</option>
                                                    <option>지점명</option>
                                                    <option>시도명</option>
                                                    <option>구군명</option>
                                                    <option>법정동명</option>
                                                </select>
                                            </div>
                                            <div class="col-sm-4 jun12">
                                              <input class="form-control jun11" type="text" placeholder="검색 키워드를 입력하세요.">
                                            </div>
                                            <form>
                                            <div class="col-sm-1 jun13">
                                                <button type="submit" onclick="search_store();" class="btn btn-default btn jun14">
                                                    <i class="fa fa-search"></i>
                                                </button>
                                            </div>
                                            </form>
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

<!-- === END CONTENT === -->
<!-- === BEGIN FOOTER === -->
<c:import url="../../include/admin/common/footer.jsp"></c:import>
<!-- === END FOOTER === -->
<!-- JS -->
<c:import url="../../include/admin/common/end.jsp"></c:import>
<!-- JS Custom Function -->
<script type="text/javascript">
	function del_store() {
		var answer = false;
		answer = confirm("해당 지점을 삭제하시겠습니까?");
		if (answer)
			alert("지점이 삭제되었습니다.");
	}

	function search_store() {
		// 검색창 null 이면 alert
		location.href = '/everycvs/cvsstorelist.do';
	}
</script>
<!-- End JS Custom Function -->
<!-- === END === -->