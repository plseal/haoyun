<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>文章管理页面</title>
		<meta name="description" content="" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<%@include file="/WEB-INF/views/common/css.jsp" %>
		
	</head>
	
	<body>
		<div class="container">
		<%@ include file="/WEB-INF/views/common/navbar.jsp" %>
		<div class="main-container container-fluid">
			<a class="menu-toggler" id="menu-toggler" href="#">
				<span class="menu-text"></span>
			</a>
			<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
			<div class="main-content">
				 
				<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							<small>
								<i class="icon-list-alt"></i>
								文章管理
							</small>
						</h1>
					</div> 

							<!--PAGE CONTENT BEGINS-->
							

								
								<table id="sample-table-1" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th width="20%">编号</th>
										<th width="20%">标题</th>
										<th width="20%">发布日期</th>
										<th width="20%">文章类型</th>
										<th width="20%">操作</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${blogList}"  var="blog"  >
									<tr>
										<td>${blog.id}</td>
										<td><a target='_blank' href='${pageContext.request.contextPath}/blog/articles/${blog.id}.html'>${blog.title}</a></td>
										<td>${blog.releaseDateStr}</td>
										<td>${blog.blogType.typeName}</td>
										<td>
										<button class="btn btn-info btn-small" onclick="javascript:window.location.href='<%=request.getContextPath() %>/blog/to_modifyBlog.do?pagenum=${pagenum}&blog_id=${blog.id}'">
											编辑
										</button>
										<button class="btn btn-danger btn-small" onclick="javascript:window.location.href='<%=request.getContextPath() %>/blog/to_blogManage.do?pagenum=${pagenum}&blog_id=${blog.id}'">
											删除
										</button>
										</td>
										
									</tr>
								</c:forEach>
								</tbody>
							</table>
		
								
						
					 		<div class="dataTables_paginate paging_bootstrap pagination">
							  <button class="btn btn-success btn-mini" onclick="javascript:window.location.href='<%=request.getContextPath() %>/blog/to_blogManage.do?pagenum=${pagenum-1}'" <c:if test="${pagenum <= 1}">disabled="disabled"</c:if>    >&laquo;</button>
							  <button class="btn btn-success btn-mini" disabled="disabled">第 ${pagenum} 页</button>
							  <button class="btn btn-success btn-mini" onclick="javascript:window.location.href='<%=request.getContextPath() %>/blog/to_blogManage.do?pagenum=${pagenum+1}'" <c:if test="${length < 8}">disabled="disabled"</c:if> >&raquo;</button>
					 		</div>	
							<!--PAGE CONTENT ENDS-->
					</div><!--/.span-->

		</div><!--/.main-content-->
	</div><!--/.main-container-->

	

	
	<script type="text/javascript">
		//var UEDITOR_HOME_URL = "/Blog/";//从项目的根目录开始
		
		
		
	</script>

	</div>
	</body>
</html>