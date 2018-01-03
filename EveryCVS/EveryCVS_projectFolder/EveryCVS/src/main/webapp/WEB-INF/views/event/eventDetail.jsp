<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- === BEGIN HEAD ===  -->
<c:import url="../include/user/common/head.jsp"></c:import>
<link href="/everycvs/resources/user/css/event.css" rel="stylesheet"
	type="text/css">
<c:import url="../include/user/common/headend.jsp"></c:import>
<!-- === END HEAD ===  -->
<!-- === BEGIN HEADER ===  -->
<c:import url="../include/user/common/header.jsp"></c:import>
<!-- === END HEADER === -->
<!-- === BEGIN CONTENT === -->
<div id="content">
	<div class="container background-white">
		<div class="row margin-vert-30">
			<div class="col-md-12">
				<h2>${et.event_no}번 상세보기</h2>
				<div class="row">
					<div class="col-md-6 animate fadeIn">
						<img src="/everycvs/resources/upload/${et.stored_file_name}" alt="이벤트 이미지가 없습니다." class="jun_img">
					</div>
					<div class="col-md-6 margin-bottom-10 animate fadeInRight">
						<form name="event" method="post" action="eventDetail.do">
							<div class="clearfix"></div>
							<label>이벤트 이름</label><br>
							<div class="row margin-bottom-20">
								<div class="col-md-10 col-md-offset-0">
									<input class="form-control" type="text"
										 value="${et.title}" readonly><br>

									<label>이벤트 기간</label><br> 
									<input class="modify" type="text" value="${et.start_date}" readonly> 
									<input class="modify" type="text" value="${et.end_date}" readonly>
									<br><br> 
									<input type="hidden" class="margin-top-20" value="${et.join_limit}"/>
									<label>상세내용</label><br>
									<textarea rows="5" class="form-control"
										style="margin-bottom: 4px; width: 100%;" readonly>${et.contents}
                                    </textarea>
                                    <jsp:useBean id="now" class="java.util.Date" />
                                    <fmt:formatDate value="${now}" pattern="yyyy-MM-dd a hh:mm" var="sysdate" /> 
                                    <c:if test="${et.end_date > sysdate }">
                                    	<c:if test="${isJoin eq 1 }">
                                    	<input id="joinBtn" type="button" class="btn btn-red btn-lg" onclick="selectFunction(${et.event_no},${user.user_no},0)" style=float:left; value="참여완료">
                                    	</c:if>
                                    	<c:if test="${isJoin eq 0 }">
                                    	<input id="joinBtn" type="button" class="btn btn-primary btn-lg" onclick="selectFunction(${et.event_no},${user.user_no},1)" style=float:left; value="참여하기">
                                    	</c:if>
                                    </c:if>
                                    <c:if test="${et.end_date <= sysdate }">
									   	<input id="joinBtn" type="button" class="btn btn-red btn-lg" style=float:left; value="이벤트종료" readonly>
                                    </c:if>
										<button type="button" class="btn btn-primary btn-lg" onclick='location.href="/everycvs/page/eventmain.do"' style=float:right;>CANCEL</button>
									</p>
								</div>
							</div>
						</form>
					</div>
				</div>
				<hr>
				<script>
				function selectFunction(event_no,user_no,no){
					if(no==1){
						eventJoin(event_no,user_no)
					}else{
						eventJoinCancel(event_no,user_no)
					}
				}
				function eventJoin(event_no,user_no){   
					   $.ajax({
					      url:"/everycvs/eventJoin.do",
					      type:"post",
					      data:{"event_no":event_no,"user_no":user_no},
					      success:function(data){
					       	 if(data==1){
					       		$("#joinBtn").val("참여완료");
					        	 $("#joinBtn").addClass("btn-green");
					        	 $("#joinBtn").removeClass("btn-red");
					            swal({
					        		title:"이벤트에 참여하였습니다",
					        		text:'다시한번 참여하면 취소됩니다',
					        		timer:1500,
					        		type:'success'
					        	});
					            setTimeout(function(){
					        		location.href="/everycvs/eventDetail.do?no="+event_no;
					        	},1400);
					         }else if(data==0){
					        	swal({
					        		title:"ERROR",
					        		text:'Internal Server Error',
					        		timer:1500,
					        		type:'error'
					        	});
					         }else{
					        	 swal({
						        		title:"이벤트 참여 정원 초과",
						        		timer:1500,
						        		type:'warning'
						        	});
					         }
					      },
					      error: function(xhr,status,error){
					         alert(xhr+status+error);
					      }
					      
					   });
					}
				function eventJoinCancel(event_no,user_no){   
					
					   var checkEventJoinTable = 0;
					   $.ajax({
					      url:"/everycvs/eventJoinCancel.do",
					      type:"post",
					      data:{"event_no":event_no,"user_no":user_no},
					      success:function(data){
					       	 if(data==0){
					       		swal({
					        		title:"ERROR",
					        		text:'Internal Server Error',
					        		timer:1500,
					        		type:'error'
					        	});
					         }else if(data==1){
					        	 $("#joinBtn").val("참여하기");
					        	 $("#joinBtn").addClass("btn-green");
					        	 $("#joinBtn").removeClass("btn-red");
					        	swal({
					        		title:"이벤트를 취소하였습니다",
					        		text:"다시한번 누르면 참여됩니다",
					        		timer:1500,
					        		type:'success'
					        	});
					        	setTimeout(function(){
					        		location.href="/everycvs/eventDetail.do?no="+event_no;
					        	},1400);
					         }else{
					        	 swal({
						        		title:"이벤트 미참여 고객",
						        		timer:1500,
						        		type:'warning'
						        	});
					         }
					      },
					      error: function(xhr,status,error){
					         alert(xhr+status+error);
					      }
					      
					   });
					}
				</script>
				<!-- === END CONTENT === -->
				<!-- === BEGIN FOOTER === -->
				<c:import url="../include/user/common/footer.jsp"></c:import>
				<!-- === END FOOTER === -->
				<!-- JS -->
				<c:import url="../include/user/common/end.jsp"></c:import>
				<!-- === END === -->