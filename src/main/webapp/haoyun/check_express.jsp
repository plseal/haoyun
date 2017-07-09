<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >
	<head>
		<meta charset="utf-8" />
		<title>快递单号管理</title>
		<meta http-equiv="pragma" content="no-cache"/>   
		<meta http-equiv="Cache-Control" content="no-cache, must-revalidate"/>   
		<meta http-equiv="expires" content="0"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"> 
		<link href="${pageContext.request.contextPath}/static/bootstrap3.0.0/css/bootstrap.min.css" rel="stylesheet" media="screen">
		<link href="${pageContext.request.contextPath}/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
		<%@include file="./css_haoyun.jsp" %>
	</head>
	
	<body>
		<%@include file="./logo.jsp" %>
		
		<div class="container">
			<form  id="myform" action="" class="form-horizontal"  role="form">
			<div class="page-content">
				
				<div class="col-sm-12 ">
					<h1>
						<small>
							<i class="icon-list-alt"></i>
							快递单号管理 （演示用）
						</small>
					</h1>
				</div>
				<br/>
							<!--PAGE CONTENT BEGINS-->
							<div class="row">
								<div class="col-sm-12 ">
								  <button type="button" class="btn btn-lg btn-block btn-primary" onclick="location.href = '${pageContext.request.contextPath}/haoyun/get_express_by_wechat_id.do?wechat_id=testid';">客户查询快递单号</button>
								</div>
							</div><br/>
							<div class="row">
								<div class="col-sm-12 ">
								  <button type="button" class="btn btn-lg btn-block btn-primary" onclick="location.href = '<%=request.getContextPath() %>/haoyun/check_express_first.jsp';">客户开通自助查询运单编号</button>
								</div>
							</div><br/>
							<!--
							<div class="row">
								<div class="col-sm-12 ">
								  <button type="button" class="btn btn-lg btn-block btn-primary" onclick="location.href = '<%=request.getContextPath() %>/haoyun/check_express_insert.jsp';">添加快递单号</button>
								</div>
							</div><br/>
							-->
							<div class="row">
								<div class="col-sm-12 ">
								<a href="<%=request.getContextPath() %>/haoyun/check_express_insert_bat.jsp" class="button button-block button-caution  button-rounded button-large">批量添加快递单号</a>
								  
								</div>
							</div><br/>
							<div class="row">
								<div class="col-sm-12 ">
								<a href="<%=request.getContextPath() %>/haoyun/check_express_c_info.jsp" class="button button-block button-caution  button-rounded button-large">客户信息</a>
								  
								</div>
							</div><br/>
							<div class="row">
								<div class="col-sm-12 ">
									<div class="input-group">
										<input type="text" class="form-control" id="c_name" name="c_name" placeholder="请输入姓名" >
										<span class="input-group-btn">
											<button class="btn btn-default" type="button" onclick="get_express_by_name();">按客户姓名查询</button>
										</span>
									</div><!-- /input-group -->
									<br/>
									<div class="alert alert-warning hidden" id = "div_alert_c_name_blank" >警告：请输入客户姓名</div>
									
								</div>
							</div><br/>

							<div class="row">
								<div class="col-sm-12 ">
									<div class="input-group">
										<input type="text" class="form-control" id="c_number" name="c_number" placeholder="请输入运单编号">
										<span class="input-group-btn">
											<button class="btn btn-default" type="button" onclick="get_express_by_number();">按运单编号查询</button>
										</span>
									</div><!-- /input-group -->
									<br/>
									<div class="alert alert-warning hidden" id = "div_alert_c_number_blank" >警告：请输入运单编号</div>
								</div>
							</div><br/>
							<table id="sample-table-1" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										
										<th width="14%">日期</th>
										<th width="14%">姓名</th>
										<th width="14%">运单编号</th>
										<th width="14%">目的地</th>
										<th width="14%">包裹内容</th>
										<th width="14%">发货专区</th>
										<th width="14%">备注</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${expresses}"  var="express"  >
									<tr>
									<!--
										<td><a target='_blank' href='${pageContext.request.contextPath}/blog/articles/${express.id}.html'>${express.id}</a></td>
										-->
										<td>${express.date}</td>
										<td>${express.name}</td>
										<td>${express.number}</td>
										<td>${express.des}</td>
										<td>${express.content} </td>
										<td>${express.e_from}</td>
										<td>${express.remark} </td>
										
									</tr>
								</c:forEach>
								</tbody>
							</table>
							<!--PAGE CONTENT ENDS-->

	</div><!--/.main-container-->

	

	
<script type="text/javascript">
		
function get_express_by_name(){
	var c_name = document.all.c_name.value;
	
	//alert(getEx(file_name).toString().toLowerCase());
	if (c_name == ""){
		$("#div_alert_c_name_blank").attr("class","alert alert-danger");
	}else {
		document.all.myform.action="${pageContext.request.contextPath}/haoyun/get_express_by_name.do?c_name="+c_name;
		document.all.myform.submit(); 
	}

}
function get_express_by_number(){
	var c_number = document.all.c_number.value;
	
	if (c_number == ""){
		$("#div_alert_c_number_blank").attr("class","alert alert-danger");
	}else {
		document.all.myform.action="${pageContext.request.contextPath}/haoyun/get_express_by_number.do?c_number="+c_number;
		document.all.myform.submit(); 
	}

}

			
</script>
</form>
</div>
</body>
</html>