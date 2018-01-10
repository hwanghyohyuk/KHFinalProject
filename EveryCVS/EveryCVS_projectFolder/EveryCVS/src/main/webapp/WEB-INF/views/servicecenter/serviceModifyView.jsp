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
	function serviceUpdate(){
		location.href ='/everycvs/serviceUpdate.do';
	}
	console.log("${servicecenter}");
	</script>
            <!-- === BEGIN CONTENT === -->
            <div id="content">
                <div class="container background-white">
                    <div class="row margin-vert-30">
                        <!-- Main Column -->
                        <div class="col-md-9">
                            <!-- Main Content -->
                            <div class="headline">
                                 <h2>고객센터 / 상세보기</h2>
                            </div>
                            <hr>
                            <%-- <c:forEach items=" ${servicecenter }" var="sc">  --%>
                            <form name="servicecenter" method="post" action="serviceUpdate.do">
                            <input type="hidden" name="writer" value="${sessionScope.user.user_no }">
                            <input type="hidden" name="service_no" value="${servicecenter.service_no }">
                                 <label>작성자
                                    <span class="color-red">*</span>
                                 </label>
                                <div class="row margin-bottom-20">
                                    <div class="col-md-6 col-md-offset-0">
                                        <input name="user_name"class="form-control" type="text" value="${servicecenter.user_name}" readonly>
                                    </div>
                                </div>
                                <label>제목
                                    <span class="color-red">*</span>
                                 </label>
                                <div class="row margin-bottom-20">
                                    <div class="col-md-6 col-md-offset-0">
                                        <input id="title" name="title"class="form-control" type="text"  value="${servicecenter.title }" >
                                    </div>
                                </div>
                                <div>
                                <label>내용</label>
                                <div class="row margin-bottom-20">
                                    <div class="col-md-8 col-md-offset-0">
                                        <textarea id="contents"name="contents" rows="8" class="form-control" placeholder="내용을 입력해주세요"   >${servicecenter.contents }</textarea>
                                    </div>
                                </div>                              
                                <div align="center">
                                    <button type="submit" class="btn btn-primary" >수정완료</button>
                                    &nbsp&nbsp&nbsp&nbsp&nbsp                                                                                                   
                                    <a href="javascript:history.go(-1);">
                                    <button type="button" class="btn btn-primary">취소</button>
                                    </a>
                                </div>
                                </form>
                                </div>
                             <%-- </c:forEach>  --%>
                             <hr>
                            <!-- End Contact Form -->
                            <!-- End Main Content -->
                        </div>
                        <!-- End Main Column -->
                        
                        </div>
                        <!-- End Side Column -->
                    </div>
                </div>
            
            <!-- === END CONTENT === -->
          <!-- === BEGIN FOOTER === -->
<c:import url="../include/user/common/footer.jsp"></c:import>
<!-- === END FOOTER === -->
<!-- JS -->
<c:import url="../include/user/common/end.jsp"></c:import>
<!-- === END === -->