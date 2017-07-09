<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >
	<head>
		<meta charset="utf-8" />
		<title>儿童健康档案管理页面</title>
		<meta http-equiv="pragma" content="no-cache"/>   
		<meta http-equiv="Cache-Control" content="no-cache, must-revalidate"/>   
		<meta http-equiv="expires" content="0"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"> 
		<link href="${pageContext.request.contextPath}/static/bootstrap3.0.0/css/bootstrap.min.css" rel="stylesheet" media="screen">
		<link href="${pageContext.request.contextPath}/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
		
		
	</head>
	
	<body>
		<div class="container">

				 
				<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							<small>
								<i class="icon-list-alt"></i>
								儿童健康档案管理
							</small>
						</h1>
					</div> 

							<!--PAGE CONTENT BEGINS-->
							

								
								<table id="sample-table-1" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										
										<th width="20%">姓名</th>
										<th width="10%">身高</th>
										<th width="10%">体重</th>
										<th width="30%">录入日期</th>
										<th width="30%">操作</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${child_health_record_list}"  var="chr"  >
									<tr>
									<!--
										<td><a target='_blank' href='${pageContext.request.contextPath}/blog/articles/${blog.id}.html'>${chr.id}</a></td>
										-->
										<td>${chr.child_name}</td>
										<td>${chr.child_height}cm</td>
										<td>${chr.child_weight}kg</td>
										<td>${chr.update_date}</td>
										<td>
										<button class="btn btn-info btn-small" onclick="javascript:window.location.href='<%=request.getContextPath() %>/child_health_record/to_update_chr.do?pagenum=${pagenum}&chr_id=${chr.id}'">
											编辑
										</button>
										<button class="btn btn-danger btn-small" onclick="javascript:window.location.href='<%=request.getContextPath() %>/child_health_record/to_delete_chr.do?pagenum=${pagenum}&chr_id=${chr.id}'">
											删除
										</button>
										</td>
										
									</tr>
								</c:forEach>
								</tbody>
							</table>
		
								


		    
		        <div class="col-sm-12 ">
		          <button type="button" class="btn btn-lg btn-block btn-primary" onclick="location.href = '<%=request.getContextPath() %>/child_health_record/to_insert_chr.do';">添加新档案</button>
		        </div>
		      
							<!--PAGE CONTENT ENDS-->

	</div><!--/.main-container-->

	

	
	<script type="text/javascript">
		//var UEDITOR_HOME_URL = "/Blog/";//从项目的根目录开始
		
		
		
	</script>

	</div>
	</body>
</html>