<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>
<%
	int myoffset = 2;
	int mywidth = twelve - 2 * myoffset;
	int formleft = 3 ;
	int formright = twelve - formleft ; 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- AdminList Style CSS -->
<link rel="stylesheet" href="${contextPath}/css/adminList-style.css">
<!-- 댓글 모듈 -->
<script src="/js/reply.js"></script>
</head>
<body>

<div align="center" class="container col-sm-offset-2 col-sm-8">
	<h2 align="left">공지사항목록</h2>
		<div class="row">
			<%-- 상단 페이지 수 show ---------------------------------------------------%>
		    <div class="col-sm-6">
		        <div class="dataTables_length" id="DataTables_Table_0_length">
		            <label>
		                Show 
		                <select class="form-control input-sm" name="DataTables_Table_0_length" aria-controls="DataTables_Table_0">
			                <option value="10">10</option>
			                <option value="25">25</option>
			                <option value="50">50</option>
			                <option value="100">100</option>
		            	</select>
		            </label>
		        </div>
		    </div>
			<%-- 상단 검색 search ---------------------------------------------------%>
		    <div class="col-sm-6">
		        <div class="dataTables_filter" id="DataTables_Table_0_filter">
		            <label>
		                Search:
		                <input type="search" class="form-control input-sm" 
		                placeholder="" aria-controls="DataTables_Table_0">
		            </label>
		        </div>
		    </div>
		</div>
	
	  	<div class="row">
	      <table class="table table-bordered table-hover dt-responsive">
	        
	        <%-- 공지사항 목록의 header 부분 -------------------------------------------------------%>
	        <thead>
                <tr>
                    <th width="60%">제목</th>
                    <th width="10%">작성자</th>
                    <th width="10%">조회수</th>
                    <th width="10%">작성일</th>
                </tr>
	        </thead>
	        
	      	<%-- 공지사항 목록의 내용 부분 -------------------------------------------------------%>
            <tbody>
	            <c:forEach var="bean" items="${requestScope.lists}">
	                <tr>
	                    <td>
		                    <a href="<%=contextPath%>/nodetail.no?num=${bean.num}&${requestScope.parameters}">
		                    	<c:if test="${bean.fix==0 }">${bean.title }</c:if>
		                    	<c:if test="${bean.fix==1 }"><div style="color:red;">${bean.title }</div></c:if>
		                    </a>
	                    </td>
	                    <td>${bean.writer}</td>
	                    <td>${bean.readhit}</td>
	                    <td>${bean.regdate}</td>
	                </tr>
	            </c:forEach>    
            </tbody>
            
	        <%-- 공지사항 목록의 하단 부분 -------------------------------------------------------%>
			<tfoot>
			    <tr>
			        <td colspan="7" align="center">
                        ${requestScope.pagingHtml}	
			        </td>
			    </tr>
			</tfoot>
	      </table>
	  </div>
	   <c:if test="${whologin == 1}">
	  <div align="right">
	  	<a type="button" class="btn btn-primary" href="${contextPath }/noinsert.no">새 글 쓰기</a>
	  </div>
	  </c:if>
</div>
</body>
</html>