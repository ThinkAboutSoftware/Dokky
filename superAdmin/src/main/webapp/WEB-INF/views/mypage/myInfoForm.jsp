<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 
<%@include file="../includes/left.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Dokky - 개인정보 변경</title>   
	<link href="/resources/css/myInfoForm.css" rel="stylesheet" type="text/css">
</head>
<body>
<sec:authentication property="principal" var="userInfo"/>
<div class="myinfoWrap">	
		<div id="menuWrap">
			<div class="tab">  
				<button class="active" onclick="location.href='myInfoForm?userId=${userInfo.username}'">개인정보 변경</button>
		        <button onclick="location.href='rePasswordForm?userId=${userInfo.username}'">비밀번호 변경</button> 
		        <button onclick="location.href='myBoardList?userId=${userInfo.username}'">나의 게시글</button> 
		        <button onclick="location.href='myReplylist?userId=${userInfo.username}'">나의 댓글</button> 
		        <button onclick="location.href='myScraplist?userId=${userInfo.username}'">스크랩</button>
		        <button onclick="location.href='myCashInfo?userId=${userInfo.username}'">캐시</button>
		    </div> 
		</div>
		<!-- 프로필 이미지 관련 -->
		<div id="profileGray"></div>
		<div id="modprofile">
			<span class="modprofileText">이미지를 선택해주세요</span>
			<form action="/mypage/profileFile" id="profileForm" name="profileForm" method="post" enctype="multipart/form-data">
				<div class="mainImgWrap">  
					<img class="mainImgtag" id="mainImg" src="/resources/img/profile_img/<c:out value="${userInfo.username}" />.png" onerror="this.src='/resources/img/basicProfile.png'" />
				</div>   
		        <label for="profile" id="profileSearch">프로필 이미지 찾기</label>    
				<input type="file" name="profileFile" id="profile" /><br>
				<input type="hidden" name="userId" value="${userInfo.username}"/> 
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="button" class="profileButtons" id="profileConfirm" value="확인" />
				<input type="button" class="profileButtons" id="defaultImage" value="기본이미지"/>
				<input type="button" class="profileButtons" id="imageCancle"  value="취소" />
			</form>
		</div>
		<!-- 프로필 이미지 관련  끝-->
		
		<div id="infomation" class="tabcontent">
	       <form method='post' action="/superAdmin/mypage/myInfo" id="operForm">	
	     	  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	     	<table id="inforTable">   
	     		<tr>
	     			<td class="tableText">
	     				프로필 
	     			</td>
	     			<td class="tableValue">
	     				<div class="memberProfile">
							<img src="/resources/img/profile_img/<c:out value="${userInfo.username}" />.png" id="myImage" onerror="this.src='/resources/img/profile_img/basicProfile.png'" />
						</div> 
	     			</td>
	     		</tr>
	     		<tr>
	     			<td class="tableText">
	     				아이디
	     			</td>
	     			<td class="tableValue">
	     				<input type="text" name="userId" value="${myInfo.userId}" class="inputInfo" readonly="readonly">
	     			</td>
	     		</tr>
	     		<tr>
	     			<td class="tableText">
	     				닉네임
	     			</td>
	     			<td class="tableValue">
	     				<input type="text" name="nickName" value="${myInfo.nickName}" class="inputInfo" oninput="checkLength(this,20);"/> 
	     			</td>
	     		</tr>
	     		<tr>
	     			<td class="tableText">
	     			비밀번호
	     			</td>
	     			<td class="tableValue">
	     				<input type="password" name="userPw" value="" class="inputInfo" oninput="checkLength(this,20);"/> 
	     			</td>
	     		</tr>
	     		<tr>
	     			<td class="tableText">
	     				은행명
	     			</td>
	     			<td class="tableValue">
	     				<input type="text" name="bankName"  value="${myInfo.bankName}" class="inputInfo" oninput="checkLength(this,20);"/>
	     			</td>
	     		</tr>
	     		<tr>
	     			<td class="tableText">
	     				계좌번호
	     			</td>
	     			<td class="tableValue">
	     				<input type="text" name="account"  value="${myInfo.account}" class="inputInfo" oninput="checkLength(this,20);"/>
	     			</td>
	     		</tr>
	     		<tr>
	     			<td class="tableText">
	     				가입일
	     			</td> 
	     			<td class="tableValue"> 
	     				<fmt:formatDate value="${myInfo.regDate}" pattern="yyyy-MM-dd HH:mm" />
	     			</td>
	     		</tr>
	     		<tr>
	     			<td class="tableText">
	     				최근 로그인  
	     			</td>
	     			<td class="tableValue"> 
	     				<fmt:formatDate value="${myInfo.loginDate}" pattern="yyyy-MM-dd HH:mm" />
	     			</td>
	     		</tr>
	     	</table> 
	     		<input type="button" id="SumbitMyInfo" value="변경하기" class="submitInfo" /> 
	      </form>
     	</div>
</div> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
	function checkLength(obj, maxByte) { 
		 
		if(obj.tagName === "INPUT" || obj.tagName === "TEXTAREA"){ 
			var str = obj.value; 
		}else if(obj.tagName === "DIV" ){
			var str = obj.innerHTML; 
		} 
			
		var stringByteLength = 0;
		var reStr;
			
		stringByteLength = (function(s,b,i,c){
			
		    for(b=i=0; c=s.charCodeAt(i++);){
		    
			    b+=c>>11?3:c>>7?2:1;
			    //3은 한글인 경우 한글자당 3바이트를 의미,영어는 1바이트 의미 3을2로바꾸면 한글은 2바이트 영어는 1바이트 의미
			    //현재 나의 오라클 셋팅 같은경우 한글을 한자당 3바이트로 처리
			    if (b > maxByte) { 
			    	break;
			    }
			    
			    reStr = str.substring(0,i);
		    }
		    
		    return b //b는 바이트수 의미
		    
		})(str);
		
		if(obj.tagName === "INPUT" || obj.tagName === "TEXTAREA"){ 
			if (stringByteLength > maxByte) {// 전체길이를 초과하면          
				alert(maxByte + " Byte 이상 입력할 수 없습니다.");         
				obj.value = reStr;       
			}   
		}else if(obj.tagName === "DIV"){
			if (stringByteLength > maxByte) {// 전체길이를 초과하면          
				alert(maxByte + " Byte 이상 입력할 수 없습니다.");         
				obj.innerHTML = reStr;    
			}   
		} 
		
		obj.focus();  
	}
	
	var csrfHeaderName ="${_csrf.headerName}"; 
	var csrfTokenValue="${_csrf.token}";

	$(document).ajaxSend(function(e, xhr, options) { 
	    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); //모든 AJAX전송시 CSRF토큰을 같이 전송하도록 셋팅
	  });
	
		/* 프로필 이미지 관련 */
		var profileBack = $("#profileGray");
		var profileDiv = $("#modprofile");
	
		$("#myImage").on("click",function(event){
			profileBack.css("display","block"); 
			profileDiv.css("display","block");
		});
		
		$("#imageCancle").on("click",function(event){
			profileBack.css("display","none"); 
			profileDiv.css("display","none");
		});
		
	 	$("#profileConfirm").on("click",function(event){
			var profileForm = $("#profileForm");
			var fileName = profileForm.find("input[name='profileFile']").val();
			var fileSize = profileForm.find("input[name='profileFile']")[0].files[0].size; 
			
			 if(fileName == ""){    
				 alert("이미지를 선택해주세요");
				 return; 
			 }else if(!checkImage(fileName,fileSize)){ 
				 return; 
			 }else{
				 profileForm.submit(); 	    
			 } 
		});
		
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
				reader.onload = function (e) { 
				//파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
					$('#mainImg').attr('src', e.target.result);
					//이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
					//(아래 코드에서 읽어들인 dataURL형식)
				}			  		
				reader.readAsDataURL(input.files[0]);
				//File내용을 읽어 dataURL형식의 문자열로 저장
			}
		}
		
		function checkImage(fileName, fileSize) {
			var maxSize = 5242880; //5MB
			var type = fileName.substring(fileName.lastIndexOf('.')+1, fileName.length);
			
			if (fileSize >= maxSize) {
				alert("파일 사이즈가 5MB를 초과하였습니다.");
				return false;
			}
			if(type.toUpperCase() == 'JPG' || type.toUpperCase() == 'GIF' || type.toUpperCase() == 'PNG' || type.toUpperCase() == 'BMP'){
				return true; 
			}else{
				alert("해당 확장자 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}
		
		$("#profile").change(function(e){ 
			
			var fileSize = this.files[0].size; 
			var fileName= this.value;
				
			if(checkImage(fileName, fileSize)){
				readURL(this);
			}
		}); 
		
		$("#defaultImage").on("click",function(event){
			var profileForm = $("#profileForm");
			profileForm.attr("action","/mypage/deleteProfile");
	    	profileForm.submit(); 
		});
		
		/* 프로필 이미지 관련 끝 */
		
		function checkPassword(checkData, callback, error) {
			$.ajax({
				type : 'post',
				url : '/superAdmin/mypage/checkPassword',  
				data : JSON.stringify(checkData),
				contentType : "application/json; charset=utf-8",
				success : function(result, status, xhr) {
					if (callback) {
						callback(result,xhr);
					}
				},
				error : function(xhr, status, er) {
					if (error) {
						error(xhr,er);
					}
				}
			});
		}

	$("#SumbitMyInfo").on("click",function(event){
		var operForm = $("#operForm");
		
		var userPw = operForm.find("input[name='userPw']").val();
		var userId = operForm.find("input[name='userId']").val();
		
		if(userPw == ""){  
			alert("비밀번호를 입력해주세요.");
			return;
		} 
	    
		var checkData = {	userPw : userPw,
							userId : userId
						};
		
		checkPassword(checkData, function(result,xhr){
			 if(xhr.status == '200'){
				 operForm.submit(); 
	    	}
		    }
		,function(xhr,er){
			if(xhr.status == '404'){
			 alert("비밀번호가 맞지 않습니다.");
			}
		}
		);
		});
</script>
 		<c:choose>
		       <c:when test="${update eq 'complete'}">
		          		<script>
					      $(document).ready(function(){
					      	alert("변경되었습니다.");
					      });
				      	</script>
		       </c:when>
		       <c:when test="${update eq 'notComplete'}">
		       			<script>
					      $(document).ready(function(){
					      	alert("재시도해주세요.");
					      });
				    	</script>
		       </c:when>
		</c:choose>
</body>
</html>