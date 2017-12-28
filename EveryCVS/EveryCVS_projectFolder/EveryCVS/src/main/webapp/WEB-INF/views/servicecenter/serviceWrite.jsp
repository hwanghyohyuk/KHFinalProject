<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- === BEGIN HEAD ===  -->
<c:import url="../include/user/common/head.jsp"></c:import>
<c:import url="../include/user/common/headend.jsp"></c:import>
<!-- === END HEAD ===  -->
<!-- === BEGIN HEADER ===  -->
<c:import url="../include/user/common/header.jsp"></c:import>
<!-- === END HEADER === -->
<script type="text/javascript">
	function check(){
		if(servicecenter.title.value == ""){
			alert("제목을 입력해주세요");
			return ;
		}
		if(servicecenter.contents.value=""){
			alert("내용을 입력해주세요")
			return;
		}
	}
</script>
<!-- === BEGIN CONTENT === -->
<div id="content">
	<div class="container background-white">
		<div class="row margin-vert-30">
			<!-- Main Column -->
			<div class="col-md-12">
				<!-- Main Content -->
				<div class="headline">
					<h2>고객센터 / 글쓰기</h2>
				</div>
				<hr>
				<form action="serviceInsert.do" name="servicecenter" method="post">
					<input type="hidden" name="writer"
						value="${sessionScope.user.user_no }"> <label>작성자
						<span class="color-red">*</span>
					</label>
					<c:if test="${sessionScope.user !=null }">
						<!-- 로그인 상태이면 -->
						<div class="row margin-bottom-20">
							<div class="col-md-6 col-md-offset-0">
								<input name="user_name" class="form-control" type="text"
									value=" ${sessionScope.user.user_name}" readonly>
					</c:if>
					<c:if test="${sessionScop.user ==null }">
					</c:if>
			</div>
		</div>

		<!-- <label>비밀번호
                                    <span class="color-red">*</span>
                                </label>
                                <div class="row margin-bottom-20">
                                    <div class="col-md-6 col-md-offset-0">
                                        <input class="form-control" type="password" placeholder="비밀번호를 입력해주세요">
                                    </div>
                                </div>  -->

		<label>제목 <span class="color-red">*</span>
		</label>
		<div class="row margin-bottom-20">
			<div class="col-md-6 col-md-offset-0">
				<input id="title" name="title" class="form-control" type="text"
					placeholder="제목을 입력해주세요">
			</div>
		</div>
		<div>
			<label>내용</label>
			<div class="row margin-bottom-20">
				<div class="col-md-8 col-md-offset-0">
					<textarea id="contents" name="contents" rows="8"
						class="form-control" placeholder="내용을 입력해주세요">
                                        </textarea>
				</div>
			</div>

			<div align="center">
				<button type="submit" class="btn btn-primary">등록</button>
				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <a href="javascript:history.go(-1);">
					<input type="button" class="btn btn-primary" value="취소">
				</a>
			</div>
		</div>
		</form>
		<hr>
		<!-- End Contact Form -->
		<!-- End Main Content -->
	</div>


	<!-- End Side Column -->
</div>
</div>
</div>

<!-- === END CONTENT === -->
<!-- === BEGIN FOOTER === -->
<c:import url="../include/user/common/footer.jsp"></c:import>
<!-- === END FOOTER === -->
<!-- JS -->
<c:import url="../include/user/common/end.jsp"></c:import>
<!-- === END === -->
