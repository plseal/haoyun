<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<title>${blogTypeName }</title>
	
    <meta http-equiv="pragma" content="no-cache"/>   
    <meta http-equiv="Cache-Control" content="no-cache, must-revalidate"/>   
    <meta http-equiv="expires" content="0"/>
    
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1,maximum-scale=1, user-scalable=no"> 
    <link href="${pageContext.request.contextPath}/static/bootstrap3.0.0/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

</head>

<style type="text/css"> 
  body { background-color:#E5E7E9; } 
</style>
<body >
	<div class="container">
		<br/>
		

		
		<c:forEach items="${blogList}" var="blog">



			<div class="list-group">

				<a href="${pageContext.request.contextPath}/blog/articles/${blog.id}.html" class="list-group-item">
				
					<p class="list-group-item-text">
						
					</p>
					<p class="list-group-item-text">
	                    <c:forEach items="${blog.imageList }" var="image">
				  			${image }
				  		</c:forEach>
					</p>
					<p class="list-group-item-text">
						<font color="#33a5ba"><a href="${pageContext.request.contextPath}/blog/articles/${blog.id}.html">阅读</a><font color="#999">(${blog.clickHit })</font>&nbsp;&nbsp;</font>
					</p>
				</a>
				
	
			</div>
		</c:forEach>
				
	   

		
		<div class="row">
			<jsp:include page="./foreground/common/footer.jsp"/>
		</div>
		
	</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.8.3.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap3.0.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap3-validation.js" charset="UTF-8"></script>

<script>
window.onload=function(){

	var imgs=document.getElementsByTagName('img');

	for(var i=0;i<imgs.length;i++){

	imgs[i].setAttribute('class','img-responsive img-thumbnail');

	}

	}
</script>
</body>
</html>
