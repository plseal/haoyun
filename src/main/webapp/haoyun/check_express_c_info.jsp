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
							客户信息管理 （演示用）
						</small>
					</h1>
				</div>
				<br/>
							<!--PAGE CONTENT BEGINS-->
							
							<div class="row">
								<div class="col-sm-12 ">
									<div class="input-group">
										<input type="text" class="form-control" id="c_name" name="c_name" placeholder="请输入姓名" >
										<span class="input-group-btn">
											<button class="btn btn-default" type="button" onclick="get_wechat_id_by_name();">按客户姓名查询</button>
										</span>
									</div><!-- /input-group -->
									<br/>
									<div class="alert alert-warning hidden" id = "div_alert_c_name_blank" >警告：请输入客户姓名</div>
									
								</div>
							</div><br/>

							
							<table id="sample-table-1" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										
										<th width="33%">姓名</th>
										<th width="33%">微信ID</th>
										<th width="33%">关联日期</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${expresses}"  var="express"  >
									<tr>
									<!--
										<td><a target='_blank' href='${pageContext.request.contextPath}/blog/articles/${express.id}.html'>${express.id}</a></td>
										-->
										
										<td>${express.name}</td>
										<td>${express.wechat_id}</td>
										<td>${express.wechat_date} </td>
										
									</tr>
								</c:forEach>
								</tbody>
							</table><br/>
							<div class="row">
								<div class="col-sm-12 ">
								  <a href="../haoyun/check_express.jsp"  class="button button-block button-rounded button-primary button-large">点击返回</a>
								</div>
							</div>
							<!--PAGE CONTENT ENDS-->

	</div><!--/.main-container-->

	

	
<script type="text/javascript">
		
function get_wechat_id_by_name(){
	var c_name = document.all.c_name.value;
	
	//alert(getEx(file_name).toString().toLowerCase());
	if (c_name == ""){
		$("#div_alert_c_name_blank").attr("class","alert alert-danger");
	}else {
		document.all.myform.action="${pageContext.request.contextPath}/haoyun/get_wechat_id_by_name.do?c_name="+c_name;
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