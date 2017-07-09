<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta http-equiv="pragma" content="no-cache"/>   
    <meta http-equiv="Cache-Control" content="no-cache, must-revalidate"/>   
    <meta http-equiv="expires" content="0"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"> 
	<link href="${pageContext.request.contextPath}/static/bootstrap3.0.0/css/bootstrap.min.css" rel="stylesheet" media="screen">

	<%@include file="./css_haoyun.jsp" %>
</head>

<body>
<%@include file="./logo.jsp" %>
<div class="container">
        <fieldset>

			<div class="col-sm-12 ">
				<h1>
					<small>
						<i class="icon-list-alt"></i>
						开通自助查询 结果页面
					</small>
				</h1>
			</div>
			<br/>

	        <br/>
			<div class="alert alert-warning " id = "" >信息：处理成功。</div>


		


		     <div class="form-group">
		        <div class="col-sm-12 ">
		          
		          <a href="${pageContext.request.contextPath}/haoyun/get_express_by_wechat_id.do?wechat_id=${wechat_id}"  class="button button-block button-rounded button-primary button-large">点击前往自助查询页面</a>
		        </div>
		      </div>

        </fieldset>

</div>


<script>
	
function getEx(file_name){
	var result =/\.[^\.]+/.exec(file_name);
	return result;
}

	</script>


</body>
</html>