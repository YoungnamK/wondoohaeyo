<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!-- spring:message 및 properties 파일 사용을 위함  -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
<title>사업자용 원데이 클래스 목록</title>
<!-- AdminList Style CSS -->
<link rel="stylesheet" href="${contextPath}/css/adminList-style.css">

<script type="text/javascript">
/* 수정필요) 상단 search, 페이지 수 조회 부분 */
/* 	$('table').DataTable(); */
</script>
 
</head>
<body>
<%-- 사업자용 원데이 클래스 등록 목록 보기 -------------------------------------------------------%>
<div align="center" class="container col-sm-offset-2 col-sm-8">
	<h2>전체 회원 목록</h2>
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
	        
	        <%-- 회원 목록의 header 부분 -------------------------------------------------------%>
	        <thead>
                <tr>
                    <th><spring:message code="oneday.code"/></th>
                    <th><spring:message code="oneday.sell_email"/></th>
                    <th><spring:message code="oneday.type"/></th>
                    <th><spring:message code="oneday.classname"/></th>
                    <th><spring:message code="oneday.instructor"/></th>
                    <th><spring:message code="oneday.person"/></th>
                    <th><spring:message code="oneday.oneprice"/></th>
                    <th><spring:message code="oneday.date"/></th>
                    <th><spring:message code="oneday.time"/></th>
                    <th><spring:message code="oneday.add_time1"/></th>
                    <th><spring:message code="oneday.add_time2"/></th>
                    <th><spring:message code="oneday.address1"/></th>
                    <th><spring:message code="oneday.content"/></th>
                    <th><spring:message code="oneday.remark"/></th>
                </tr>
	        </thead>
	        
	      	<%-- 회원 목록의 내용 부분 -------------------------------------------------------%>
            <tbody>
	            <c:forEach var="bean" items="${requestScope.lists}">
	                <tr>
	                    <td>${bean.code}</td>
	                    <td>
		                    ${bean.sell_email}
	                    </td>
	                    <td>${bean.type}</td>
	                    <td>${bean.classname}</td>
	                    <td>${bean.instructor}</td>
	                    <td>${bean.person}</td>
	                    <td>${bean.oneprice}</td>
	                    <td>${bean.startdate} ~ ${bean.enddate}</td>
	                    <td>${bean.opentime} ~ ${bean.closetime}</td>
	                    <td>
	                    	<c:if test="${not empty bean.add_opentime1}">
	                    		${bean.add_opentime1} ~ ${bean.add_closetime1}
	                    	</c:if>
	                    	<c:if test="${empty bean.add_opentime1}">
	                    	</c:if>
	                    </td>
	                    <td>
	                    	<c:if test="${not empty bean.add_closetime2}">
	                    		${bean.add_opentime2} ~ ${bean.add_closetime2}
	                    	</c:if>
	                    	<c:if test="${empty bean.add_closetime2}">
	                    	</c:if>
	                    </td>
	                    <td>${bean.oneprice}</td>
	                    <td>${bean.oneprice}</td>
	                    
	                    
	                </tr>
	            </c:forEach>    
            </tbody>
            
	        <%-- 회원 목록의 하단 부분 -------------------------------------------------------%>
			<tfoot>
			    <tr>
			        <td colspan="7">
                        ${requestScope.pageInfo.pagingHtml}	
			        </td>
			    </tr>
			</tfoot>
	      </table>
	  </div>
</div>
</body>
</html>