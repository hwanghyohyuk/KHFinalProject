<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
					<div align="center">
					<img alt="이미지를 준비중입니다." 
						 src="/everycvs/resources/upload/${user.stored_file_name }" 
						 style="height:200px; text-align: center; border-radius: 150px; margin-bottom: 15px;"
						 
						 >
					</div>
					
					<div align="center">
						<span style="font-size: 14pt;">${user.user_name}님</span><br>
						<a href="/everycvs/user/infointro.do">내 정보 수정</a> 
						<hr style="margin-top: 5px; margin-bottom: 2px;">
						<ul class="list-group sidebar-nav" id="sidebar-nav">
						
							<!-- 마이페이지 -->
							<li class="list-group-item list-toggle">
							<a href="/everycvs/page/mypage.do">마이페이지</a>
							</li>
						
							<!-- 기프티콘 보관함 -->
							<li class="list-group-item list-toggle">
							<a href="/everycvs/gifticonPage.do">기프티콘</a>
								</li>
							
							<!-- 관심목록 -->
							<li class="list-group-item list-toggle">
							<a href="/everycvs/user/favoriteList.do">관심상품</a>
							</li>
								
							<!-- 회원탈퇴 -->
							<li class="list-group-item list-toggle">
							<a href="#" onclick="deleteUser('${sessionScope.user.email}');">회원탈퇴</a>
							</li>
						</ul>
						</div>
					
<%-- <ul class="list-group sidebar-nav" id="sidebar-nav">
	<!-- 마이페이지 -->
	<li class="list-group-item list-toggle"><a href="/everycvs/page/mypage.do">My Page</a></li>

	<!-- 기프티콘 보관함 -->
	<li class="list-group-item list-toggle"><a href="/everycvs/gifticonPage.do">기프티콘 보관함</a></li>

	<!-- 관심목록 -->
	<li class="list-group-item list-toggle"><a href="/everycvs/user/favoriteList.do">관심목록</a></li>

	<!-- 회원탈퇴 -->
	<li class="list-group-item list-toggle"><a href="#" onclick="deleteUser('${sessionScope.user.email}');">회원탈퇴</a></li>
</ul> --%>
<script type="text/javascript">
function deleteUser(userEmail){
	swal({
		title: '정말로 회원탈퇴를 하시겠습니까?',
		html: "회원탈퇴가 완료되면 계정이 삭제됩니다",
		type: 'warning',
		showCancelButton: true,
		confirmButtonClass: 'btn btn-success btn-lg',
		cancelButtonClass: 'btn btn-danger btn-lg',
		confirmButtonText: '예, 탈퇴합니다',
		cancelButtonText: '아니요'
		}).then((result) => {
			if (result.value) {
				swal({
					html: '회원탈퇴를 위해 이메일을 입력해주세요',
					input: 'email',
					showCancelButton: true,
					confirmButtonText: 'Submit',
					showLoaderOnConfirm: true,
					preConfirm: (email) => {
					    return new Promise((resolve) => {
					        setTimeout(() => {
					          if (email != userEmail) {
					            swal.showValidationError(
					              '현재 계정의 이메일과 입력하신 이메일이 같지 않습니다'
					            )
					          }
					          resolve()
					        }, 1000)
					      })
					    },
					    allowOutsideClick: () => !swal.isLoading()
					}).then((result) => {
					if (result.value) {
						ajaxDeleteUser(userEmail);
					}
				})
			}
		})
}
function ajaxDeleteUser(userEmail){
	$.ajax({
		url:'/everycvs/ajax/deleteuser.do',
		data:{'userEmail':userEmail},
		type:'get',
		beforeSend:function(){
			swal({
				  title: '회원 탈퇴 처리 중...',
				  allowOutsideClick: false,
				  onOpen: () => {swal.showLoading()}
				})
		},
		success:function(data){
			if(data===1){
				swal({
					title: '정상적으로 회원탈퇴 되었습니다',
					html:'이용해 주셔서 감사합니다',
					timer: 2000,
					type: 'success'
				});
				setTimeout("next()",2000);
			}else if(data===0){
				swal({
					title: 'ERROR',
					html:'Internal Server Error',
					timer: 1500,
					type: 'error'
				});
			}
		},
		error:function(error){
			console.log(error);
		}
	});
}
function next(){
	location.href="/everycvs/user/signout.do";
}
</script>