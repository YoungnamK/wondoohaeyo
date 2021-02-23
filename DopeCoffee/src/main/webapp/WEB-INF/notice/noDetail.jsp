<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp"%>
<%
int myoffset = 2;
int mywidth = twelve - 2 * myoffset;
int formleft = 3;
int formright = twelve - formleft;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath }/css/adminList-style.css">
<script type="text/javascript" src="${contextPath}/js/noticedetail.js"></script>
<style type="text/css">
.reply-write-title{
	padding-top : 40px;
}
.con {
    margin:0 auto;
}

/* 커스텀 */
.con {
    width:1200px;
}

.reply-list > table {
    width:100%;
    border-collapse:collapse;
}

.reply-list > table th, .reply-list > table td {
    border:1px solid black;
    text-align:center;
    padding:5px 0;
}

.reply-list .reply-body-td {
    text-align:left;
    padding-left:5px;
    padding-right:5px;
}

.reply-list > table > tbody > tr[data-modify-mode="N"] .modify-mode-visible {
    display:none;
}

.reply-list > table > tbody > tr[data-modify-mode="Y"] .modify-mode-invisible {
    display:none;
}

.reply-list > table > tbody > tr > .reply-body-td > .modify-mode-visible > form {
    width:100%;
    display:block;
}

.reply-list > table > tbody > tr > .reply-body-td > .modify-mode-visible > form > textarea {
    width:100%;
    height:100px;
    box-sizing:border-box;
    display:block;
}

.reply-write > form {
    display:block;
    width:100%;
}

.reply-write > form > table {
    width:100%;
    border-collapse:collapse;
}

.reply-write > form > table th, .reply-write > form > table td {
    border:1px solid black;
    padding:10px;
}

.reply-write > form > table textarea {
    width:100%;
    display:block;
    box-sizing:border-box;
    height:100px;
}

.template-box {
    display:none;
}
</style>
</head>
<body>

	<div align="center" class="container col-sm-offset-2 col-sm-8">
		<input type="hidden" value="${bean.num }" name="num" id="num">
		<h2 align="left">공지사항</h2>
		<div class="row">
			<table class="table table-bordered table-hover dt-responsive">
				 <c:if test="${whologin != 1}">
				<tr>
					<th colspan="4" align="left">${bean.title }</th>
				</tr>
				</c:if> 
				<c:if test="${whologin == 1}">
				<tr>
					<th colspan="3" align="left">${bean.title }</th>
					<th colspan="1" align="right"><a id="updatebtn" href="${contextPath }/noupdate.no?num=${bean.num}&${requestScope.parameters}">수정</a>&nbsp;&nbsp;<a id="delbtn" data-toggle="modal" data-target=".modal">삭제</a></th>
				</tr>
 				</c:if>
				<tr>
					<td colspan="1" align="center">작성자</td>
					<td colspan="3" align="left">${bean.writer }</td>
				</tr>
				<tr>
					<td width="10%" align="center">조회수</td>
					<td width="40%" align="left">${bean.readhit }</td>
					<td width="10%" align="center">작성일</td>
					<td width="40%" align="left">${bean.regdate }</td>
				</tr>
				<c:if test="${not empty bean.image}">
				<tr>
				<td colspan="4">
					<table>
					<tr>
						<td colspan="1" align="center">
						<a href="./upload/${bean.image}" data-fancybox data-caption="캡션" class="fancybox-img" >
						<img src="./upload/${bean.image}" class="img-responsive" width="200" height="200" alt="${bean.image}">
						</a>
						</td>
						<td colspan="8" align="center">${bean.content}</td>
						</tr>
				</table>
				</td>
				</tr>
				</c:if>
				<c:if test="${empty bean.image}">
				<tr height="350px">
					<td colspan="4" align="center">${bean.content}</td>
				</tr>
				</c:if>
			</table>
			<a type="button" class="btn btn-primary" href="<%=contextPath%>/nolist.no">목록으로</a>
			
		</div>
		
	</div>
	
	<!-- ------------------------------------- [모달 section]--------------------------------------- -->
	<div class="container">
	
	  <!-- Modal -->
	  <div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog modal-sm">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 id="modal-title" class="modal-title" style="font-size: 35px"><i class="fas fa-exclamation-circle"></i></h4>
	        </div>
	        <div class="modal-body">
	          <p id="modal-body" style="font-size: 13px">정말 삭제하시겠습니까?</p>
	        </div>
	        <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal" style="font-size: 13px" id="modal-btn-del" onclick="del_check();">삭제</button>
	          <button type="button" class="btn btn-default" data-dismiss="modal" style="font-size: 13px" id="modal-btn-no">닫기</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	
</body>

</html>