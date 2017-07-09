<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >
	<head>
		<meta charset="utf-8" />
		<title></title>
		<meta http-equiv="pragma" content="no-cache"/>   
		<meta http-equiv="Cache-Control" content="no-cache, must-revalidate"/>   
		<meta http-equiv="expires" content="0"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"> 
		<link href="${pageContext.request.contextPath}/static/bootstrap3.0.0/css/bootstrap.min.css" rel="stylesheet" media="screen">
		<link href="${pageContext.request.contextPath}/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
		<%@include file="./css_js.jsp" %>
	</head>
	
	<body>
		
		
		<div class="container">
			<form  id="myform" action="" class="form-horizontal"  role="form">
			<div class="page-content">
				
				<div class="col-sm-12 ">
					<h1>
						<small>
							<i class="icon-list-alt"></i>
							Family管理 
						</small>
					</h1>
				</div>
				<br/>
							<!--PAGE CONTENT BEGINS-->
							<!--
							<div class="row">
								<div class="col-sm-12 ">
								  <button type="button" class="btn btn-lg btn-block btn-primary" onclick="location.href = '';">自动更新阴历生日</button>
								</div>
							</div><br/>
							-->
							<table id="sample-table-1" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										
										<th width="14%">姓名</th>
										<th width="14%">阳历生日</th>
										<th width="14%">阴历生日</th>
										<th width="14%">年龄</th>
										<th width="14%">属相</th>
										<th width="10%">提醒日期</th>
										<th width="18%">操作</th>

									</tr>
								</thead>
								<tbody>
								<c:forEach items="${families}"  var="family"  >
									<tr>
									<!--
										<td><a target='_blank' href='${pageContext.request.contextPath}/blog/articles/${family.id}.html'>${express.id}</a></td>
										-->
										
										<td>${family.name}</td>
										<td>${family.birth}</td>
										<td>${family.lunar_birth}</td>
										<td>${family.age} </td>
										<td>${family.animals_year} </td>
										<td>${family.remind_date}</td>
										<td>
										<a href="${pageContext.request.contextPath}/family/update.do?id=${family.id}"  class="button btn-block button-rounded button-primary button-small">更新</a>
										</td>
										
									</tr>
								</c:forEach>
								</tbody>
							</table>
							<!--PAGE CONTENT ENDS-->

	</div><!--/.main-container-->

	

	
<script type="text/javascript">
		


			
</script>
</form>
</div>
</body>
</html>