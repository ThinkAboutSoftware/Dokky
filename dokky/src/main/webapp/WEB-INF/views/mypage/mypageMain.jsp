<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 
<%@include file="../includes/left.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>마이페이지</title>
<style>
	body{
		background-color: #323639;  
		}
	.bodyWrap {
	    width: 80%; 
	    display: inline-block;
	    margin-left: 2%;
	    margin-top: 1%;
	    min-height: 500px; 
	    border-color: #e6e6e6;
		border-style: solid;
		background-color: #323639; 
		color: #e6e6e6;
	}
	.ContentWrap{box-sizing: border-box;
	    padding-top: 48px;
	    padding-left: 20px;
	    padding-right: 20px;
	    width: 95%;
		min-height: 750px;
	    margin: 0 auto; 
 	}
	#menuWrap .tab button {
		background-color: inherit;
		border: none;
		outline:none;
		cursor: pointer;
		padding: 14px 16px;
		transition: 0.3s;
		font-size: 20px;  
		color: #e6e6e6;
	}
	#menuWrap .tab button:hover {
	background-color: #7b7676;
	}
	/* #menuWrap .tabcontent {  
		display: none; 
		padding: 6px 12px;
		border: 1px;
	}  */
	.tableText{
		width: 10%;
		font-size: 20px;  
		color: #e6e6e6;
    }
	.tableValue{    
		height: 50px;
	    /* font-size: 18px;
	    color: #555; */
	 }
	 .inputInfo{
	 	margin-top: 3px;
	    font-size: 20px;
	    color: #555;
	    padding: 8px;
	    width: 30%;
	    border-radius: 8px;
	    border: 1px solid #b5b5b5;
	    height: 30px;
	 }
	 .submitInfo{  
	 	font-size: 20px;
	    background-color: #555;
	    border: 1px solid #555;
	    color: #e6e6e6;
	    padding: 8px;
	    border-radius: 8px;
	    width: 7%;
    }
	
</style>  
</head>
<body>
<div class="bodyWrap">	
	<div class="ContentWrap">
		<div id="menuWrap">
			<div class="tab">
				<button >개인정보 변경</button>
		        <button >비밀번호 변경</button>
		        <button >나의 게시글</button>
		        <button >나의 댓글</button> 
		        <button >스크랩</button>
		        <button >캐시</button> 
		    </div> 
		</div>
		<div id="infomation" class="tabcontent">
	       <form method='post' action="/dokky/members">	
	     	  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	     	<table width="100%" style="margin-bottom: 30px;">
	     		<tr>
	     			<td class="tableText">
	     				아이디
	     			</td>
	     			<td class="tableValue">
	     				<input type="text" name="userId" value='' class="inputInfo" readonly="readonly">
	     			</td>
	     		</tr>
	     		<tr>
	     			<td class="tableText">
	     				닉네임
	     			</td>
	     			<td class="tableValue">
	     				<input type="text" name="nickName" value='' class="inputInfo">
	     			</td>
	     		</tr>
	     		<tr>
	     			<td class="tableText">
	     			비밀번호
	     			</td>
	     			<td class="tableValue">
	     				<input type="password" name="userPw" class="inputInfo">
	     			</td>
	     		</tr>
	     		<tr> 
	     			<td class="tableText">
	     				이메일 
	     			</td>
	     			<td class="tableValue">
	     				<input type="text" name="email" value='' class="inputInfo" >
	     			</td>
	     		</tr>
	     		<tr>
	     			<td class="tableText">
	     				연락처
	     			</td>
	     			<td class="tableValue">
	     				<input type="text" name="phoneNum"  value='' class="inputInfo" >	
	     			</td>
	     		</tr>
	     		<tr>
	     			<td class="tableText">
	     				은행명
	     			</td>
	     			<td class="tableValue">
	     				<input type="text" name="bankName"  value='' class="inputInfo" >	
	     			</td>
	     		</tr>
	     		<tr>
	     			<td class="tableText">
	     				계좌번호
	     			</td>
	     			<td class="tableValue">
	     				<input type="text" name="account"  value='' class="inputInfo" >	
	     			</td>
	     		</tr>
	     		<tr>
	     			<td class="tableText">
	     				가입일
	     			</td>
	     			<td class="tableValue"> 
	     				<%-- <fmt:formatDate value="" pattern="yyyy년 MM월 dd일 hh:mm" /> --%>
	     			</td>
	     		</tr>
	     	</table>
	     		<input type="submit" value="변경하기" class="submitInfo" />
	      </form>
     	</div>
	</div> 
</div>
</body>
</html>