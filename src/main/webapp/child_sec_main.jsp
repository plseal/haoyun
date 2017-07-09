<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>儿童健康档案二级界面 </title>
    <meta http-equiv="pragma" content="no-cache"/>   
    <meta http-equiv="Cache-Control" content="no-cache, must-revalidate"/>   
    <meta http-equiv="expires" content="0"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"> 
    <link href="${pageContext.request.contextPath}/static/bootstrap3.0.0/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>

<body>
<div class="container">
    <form class="form-horizontal"  >
        
        	<div class="page-header position-relative">
				<h1>
					<small>
						儿童健康档案二级界面 （演示用）
					</small>
				</h1>
           </div>
			
		        <div class="col-sm-12 ">
		          <button type="button" class="btn btn-lg btn-block btn-primary" onclick="location.href = '<%=request.getContextPath() %>/child_thi_health_manage.jsp';">体检记录</button>
		        </div>
				<br/>
		        <div class="col-sm-12 ">
		          <button type="button" class="btn btn-lg btn-block btn-primary" onclick="location.href = '<%=request.getContextPath() %>/child_thi_disease_manage.jsp';">疾病记录</button>
		        </div>
				<br/>
		        <div class="col-sm-12 ">
		          <button type="button" class="btn btn-lg btn-block btn-primary" onclick="location.href = '<%=request.getContextPath() %>/child_thi_birth_record.jsp';">出生史</button>
		        </div>
				<br/>
		        <div class="col-sm-12 ">
		          <button type="button" class="btn btn-lg btn-block btn-primary" onclick="location.href = '<%=request.getContextPath() %>/child_thi_mother.jsp';">母亲资料</button>
		        </div>
				<br/>
		        <div class="col-sm-12 ">
		          <button type="button" class="btn btn-lg btn-block btn-primary" onclick="location.href = '<%=request.getContextPath() %>/child_thi_father.jsp';">父亲资料</button>
		        </div>
				<br/>




        
    </form>
</div>



<script type="text/javascript">


</script>
<script type="text/javascript">
	
	
</script>

</body>
</html>