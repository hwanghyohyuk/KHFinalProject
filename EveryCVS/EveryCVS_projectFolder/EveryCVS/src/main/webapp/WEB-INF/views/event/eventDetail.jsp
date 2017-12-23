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
<<script type="text/javascript">
<!-- 자바 스크립트-->
//이벤트 참여처리


/* function eventCount(event_no){
   var user_no = $("#user_no").val();
   $.ajax({
      url:"eventCount.do",
      dataType:"json",
      type:"post",
      data:{"event_no":event_no,"user_no":user_no},
      success:function(data){
         var eventJoinCount = data.eventJoinCount;   
         var checkEventJoinTable = data.checkEventJoinTable;
         
         if(user_no){ //로그인 한경우 
            if(eventJoinCount==1 && checkEventJoinTable == 1){   //나 혼자 좋아요 눌럿을 때
               $("#eventJoinCount").html("회원님이 이 이벤트에참여하였습니다.");   
            }else if(eventJoinCount==0 && checkEventJoinTable == 0){   //아무도 좋아요 안눌렀을 때
               $("#eventJoinCount").html(eventJoinCount + " 명이 이 이벤트에 참여하였습니다")
            }else if(eventJoinCount!=0 && checkEventJoinTable ==1){ //이미 좋아요를 클릭한 상황
               $("#eventJoinCount").html("회원 님 외 " + (eventJoinCount-1) + "명이 이 이벤트 참여하였습니다.");
            }else if(eventJoinCount !=0 && checkEventJoinTable ==0){
               $("#eventJoinCount").html(eventJoinCount + " 명이 이 이벤트 참여하였습니다.")
            }
         }else{
            $("#eventJoinCount").html(eventJoinCount + " 명이 이벤트 참여하였습니다.");
         }
      },
      error: function(request, status, errorData){
         alert("error code : " + request.status + "\n"
               + "message : " + request.responseText + "\n"
               + "error : " + errorData);
      }
   }); 
}*/
</script>
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
                                    	<c:if test="${isJoin eq 1 }">
                                    	<input id="joinBtn" type="button" class="btn btn-red btn-lg" onclick="eventJoin('${et.event_no}', '${user.user_no}', '${user.user_name}')" style=float:left; value="참여완료">
                                    	</c:if>
                                    	<c:if test="${isJoin eq 0 }">
                                    	<input id="joinBtn" type="button" class="btn btn-primary btn-lg" onclick="eventJoin('${et.event_no}', '${user.user_no}', '${user.user_name}')" style=float:left; value="참여하기">
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
				function eventJoin(event_no,user_no,user_name){   
					
					   var checkEventJoinTable = 0;
				   
					   $.ajax({
					      url:"eventJoin.do",
					      dataType:"json",
					      type:"post",
					      data:{"event_no":event_no,"user_no":user_no,"user_name":user_name},
					      success:function(data){
					         checkEventJoinTable = data.checkEventJoinTable;
					         console.log("checkEventJoinTable"+checkEventJoinTable);
					       	 if(checkEventJoinTable==0 ){
					       		$("#joinBtn").val("참여완료");
					        	 $("#joinBtn").addClass("btn-green");
					        	 $("#joinBtn").removeClass("btn-red");
					            swal("이벤트에 참여하였습니다","다시한번 참여하면 취소됩니다.","success");
					         }else if(checkEventJoinTable==1){
					        	 $("#joinBtn").val("참여하기");
					        	 $("#joinBtn").addClass("btn-red");
					        	 $("#joinBtn").removeClass("btn-green");
					        	swal("이벤트를 취소하였습니다","다시한번 누르면 참여됩니다.","success");
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