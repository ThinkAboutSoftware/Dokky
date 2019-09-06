<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="../includes/left.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Dokky - 회원가입</title> 
<link href="/dokky/resources/css/memberForm.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div class="memberFormWrap">	
		 <form id="" method='post' action="/dokky/members">	
		  	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		  	
			<div class="bigbig">
				<div class="information">아이디</div>
					<input type="text" name="userId" id="userId"  class="inputclass"/>
					
			    <div class="information">비밀번호</div>
			   		 <input type="password" name="userPw" id="userpw" class="inputclass"/>
			   		 
			    <div class="information">비밀번호 재입력</div>
			   		 <input type="password" name="userpwCheck" id="userpwCheck" class="inputclass"/>
			   		 
				<div class="information">닉네임</div>
					<input type="text" name="nickName" id="nickName" class="inputclass" />
					
				<div class="information">이메일</div>
					<input type="email" name="email" id="email" class="inputclass"/>
					
				<div class="information">연락처(선택)</div>
					<input type="text" name="phoneNum" class="inputclass"/> 
					
				<div class="information">은행명(선택)</div>
					<input type="text" name="bankName" class="inputclass"/> 
					
				<div class="information">계좌번호(선택)</div>
					<input type="text" name="account" class="inputclass"/>
			</div>
			
			<div class="nextWrap">
				<input type="button" class="pre" id="join"  value="가입"/>
			</div>
		 </form>
	</div>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
  	
 		 var csrfHeaderName ="${_csrf.headerName}"; 
		 var csrfTokenValue="${_csrf.token}";
		    
		 $(document).ajaxSend(function(e, xhr, options) { 
	       xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	   	 });
		 
		 function checkDuplicatedId(id, callback, error) {
			 	var checkReturn; 
			 
				$.ajax({
					type : 'get',
					url : '/dokky/idCheckedVal?inputId='+id,
					async: false, //동기로 처리  
					success : function(result, status, xhr) {
						if (callback) {
							if(callback(result,xhr)){
								checkReturn = true; 
							}
						}
					},
					error : function(xhr, status, er) {
						if (error) {
							error(xhr,er);  
						}
					}
				});
				
			return checkReturn;  
		 }
		 
		 function checkDuplicatedNickname(nickname, callback, error) {
			 	var checkReturn; 
			 
				$.ajax({
					type : 'get',
					url : '/dokky/nickCheckedVal?inputNickname='+nickname,
					async: false,  
					success : function(result, status, xhr) {
						if (callback) {
							if(callback(result,xhr)){
								checkReturn = true; 
							}
						}
					},
					error : function(xhr, status, er) {
						if (error) {
							error(xhr,er);  
						}
					}
				});
				
			 return checkReturn;  
		 }
		 
		 function checkDuplicatedEmail(email, callback, error) {
			 	var checkReturn; 
			 
				$.ajax({
					type : 'get',
					url : '/dokky/emailCheckedVal?inputEmail='+email,
					async: false, //동기로 처리  
					success : function(result, status, xhr) {
						if (callback) {
							if(callback(result,xhr)){
								checkReturn = true; 
							}
						}
					},
					error : function(xhr, status, er) {
						if (error) {
							error(xhr,er);  
						}
					}
				});
				
			return checkReturn;  
		 }
  
		 function memberCheck(){
			 var userId = $('#userId');
		     var userIdVal = userId.val();
		    	 userIdVal = $.trim(userIdVal);
		     
				if(userIdVal == ""){ 
					alert("아이디를 입력하세요.");
					userId.focus();  
					   return true;
				}
		    	
			var userpw = $('#userpw');
			var userpwVal = userpw.val();
				userpwVal = $.trim(userpwVal);
		     
				if(userpwVal == ""){ 
					alert("비밀번호를 입력하세요.");
					userpw.focus();  
					  return true;
				}
				
			var userpwCheck = $('#userpwCheck');
			var userpwCheckVal = userpwCheck.val();
				userpwCheckVal = $.trim(userpwCheckVal);
		     
				if(userpwCheckVal == ""){ 
					alert("비밀번호를 재입력하세요."); 
					userpwCheck.focus();  
					  return true;
				}
				if(userpwVal != userpwCheckVal ){ 
					alert('비밀번호가 일치하지 않습니다');
					userpwCheck.focus();
					return true;
				}
			
			var nickName = $('#nickName');
			var nickNameVal = nickName.val();
			nickNameVal = $.trim(nickNameVal);
	     
				if(nickNameVal == ""){ 
					nickName.focus();  
					alert("닉네임을 입력하세요."); 
					  return true;
				}
			
			var email = $('#email');
			var emailVal = email.val(); 
			emailVal = $.trim(emailVal);
	       
				if(emailVal == ""){ 
					email.focus(); 
					alert("이메일을 입력하세요.");  
					  return true;
				}
			
			    if(checkDuplicatedId(userIdVal, function(result){ //아이디 중복체크
						if(result == 'success'){ 
					 		alert("아이디가 중복됩니다."); 
					 		userId.focus(); 
					 		return true; 
						}
			   	    }))
			    {  
			   		 return true;
			   	}
	      
			    if(checkDuplicatedNickname(nickNameVal, function(result){ //닉네임 중복체크
						if(result == 'success'){ 
					 		alert("닉네임이 중복됩니다."); 
					 		nickName.focus(); 
					 		return true; 
						}
		   	    	}))
			    {  
		   			 return true;
				}
	    
			    if(checkDuplicatedEmail(emailVal, function(result){ //이메일 중복체크
						if(result == 'success'){ 
					 		alert("이메일이 중복됩니다."); 
					 		email.focus(); 
					 		return true; 
						}
					}))
			    {  
				 	return true;
				}
	    
		   return false;
	     }//END memberCheck
	 
		$("#join").on("click", function(e){
			   e.preventDefault();
			   
			   if(memberCheck()){
			   	return; 
			   } 
			   
			   $("form").submit();
		});
	  
</script>
</body>
</html>

