<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >
	<head>
		<meta charset="utf-8" />
		<title>儿童健康档案主界面</title>
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
								儿童健康档案主界面 （演示用）
							</small>
						</h1>
					</div> 

							<!--PAGE CONTENT BEGINS-->
							

								
								<table id="sample-table-1" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										
										<th width="15%">姓名</th>
										<th width="15%">年龄</th>
										<th width="15%">性别</th>
										<th width="15%">血型</th>
										<th width="30%">操作</th>
									</tr>
								</thead>
								<tbody>
								
									<tr>
									<!--
										<td><a target='_blank' href='${pageContext.request.contextPath}/blog/articles/${blog.id}.html'>${chr.id}</a></td>
										-->
										<td>司马光</td>
										<td>30月</td>
										<td>男</td>
										<td>AB</td>
										<td>
										<button class="btn btn-info btn-small" onclick="javascript:window.location.href='<%=request.getContextPath() %>/child_main_update.jsp'">
											编辑
										</button>
										<button class="btn btn-danger btn-small" onclick="javascript:window.location.href='<%=request.getContextPath() %>/child_sec_main.jsp'">
											详细
										</button>
										</td>
										
									</tr>
								
								</tbody>
							</table>
		
								


		    
		        <div class="col-sm-12 ">
		          <button type="button" class="btn btn-lg btn-block btn-primary" onclick="location.href = '<%=request.getContextPath() %>/child_main_insert.jsp';">添加新小朋友</button>
		        </div>
		      
							<!--PAGE CONTENT ENDS-->

	</div><!--/.main-container-->

	

	
	<script type="text/javascript">
		
		
		
		
	</script>

	</div>
	</body>
</html>