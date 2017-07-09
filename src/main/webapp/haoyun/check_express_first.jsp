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
							开通自助查询
						</small>
					</h1>
				</div>
				<br/>
							<!--PAGE CONTENT BEGINS-->
							
							<div class="row">
								<div class="col-sm-12 ">
									请输入运单编号（不清楚可以向客服查询）
									<input type="hidden" id="okflg" name="okflg" class="form-control" value = "${okflg}" >
									<input type="hidden" id="wechat_id" name="wechat_id" class="form-control" value = "${wechat_id}" >
								</div>
							</div><br/>

							<div class="row">
								<div class="col-sm-12 ">
									<div class="input-group">
										<input type="text" class="form-control" id="c_number" name="c_number" placeholder="请输入运单编号">
										<span class="input-group-btn">
											<button class="btn btn-default" type="button" onclick="get_express_by_number();">查询</button>
										</span>
									</div><!-- /input-group -->
									<br/>
									<div class="alert alert-warning hidden" id = "div_alert_c_number_blank" >警告：请输入运单编号</div>
								</div>
							</div><br/>
							<table id="sample-table-1" class="table table-striped table-bordered table-hover">
								<thead>
									<tr><!--
										<th width="0%">ID</th>
										-->
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
										<td>${express.id}</td>
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
							</table><br/>
							<c:if test="${okflg eq 'ok'}">
								<div class="row">
									<div class="col-sm-12 ">
									  <a href="${pageContext.request.contextPath}/haoyun/c_first_confirm.do?id=${express_id}&wechat_id=${wechat_id}"  class="button button-block button-rounded button-primary button-large">确认开通</a>
									</div>
								</div>
							</c:if>
							<!--PAGE CONTENT ENDS-->

	</div><!--/.main-container-->

	

	
<script type="text/javascript">
		

function get_express_by_number(){
	var c_number = document.all.c_number.value;
	var wechat_id = document.all.wechat_id.value;
	if (c_number == ""){
		$("#div_alert_c_number_blank").attr("class","alert alert-danger");
	}else {
		document.all.myform.action="${pageContext.request.contextPath}/haoyun/get_express_by_number_first.do?c_number="+c_number+"&wechat_id="+wechat_id;
		document.all.myform.submit(); 
	}

}

			
</script>
</form>
</div>
</body>
</html>