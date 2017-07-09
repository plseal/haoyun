<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap3/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap3/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/blog.css">
<script src="${pageContext.request.contextPath}/static/bootstrap3/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap3/js/bootstrap.min.js"></script>
<title>翎筑主页</title>
<style type="text/css">
	body{
		padding-top:10px;
		padding-bottom:40px;
		background-color: #F8F8FF;
		font-family: microsoft yahei;
	}
</style>
</head>

<body>
	<div class="container">

		

		
		<div class="row">	
	  	  
		  	<div class="data_list">
		  		<div class="data_list_title">
					<img src="${pageContext.request.contextPath}/static/images/list_icon.png"/>&nbsp;最新文章
				</div>	
				<div class="datas">
					<ul>
														
						<li style="margin-bottom: 30px">
						  	<span class="title">
						  		<img alt="文章类型" src="${pageContext.request.contextPath}/static/userImages/yuan.jpg">
						  		<a href="#">这是一篇测试文章</a>
						  	</span>
						  	
						  	<span class="img">
						  		
							  		<a href="#"><img src="${pageContext.request.contextPath}/static/userImages/dog.jpg" title="dog" alt="dog.jpg" width="823" height="489" style="width: 823px; height: 489px;"></a>
							  		<a href="#"><img src="${pageContext.request.contextPath}/static/userImages/dog.jpg" title="dog" alt="dog.jpg" width="823" height="489" style="width: 823px; height: 489px;"></a>
							  		<a href="#"><img src="${pageContext.request.contextPath}/static/userImages/dog.jpg" title="dog" alt="dog.jpg" width="823" height="489" style="width: 823px; height: 489px;"></a>
							  		&nbsp;&nbsp;
						  		
						  	</span>
						  	<span class="info">
						  		<font color="#999">2016-07-03 10:39</font> &nbsp;&nbsp;
						  		<font color="#33a5ba"><a href="#">阅读</a><font color="#999">(404)</font>&nbsp;&nbsp;</font>
						  		<font color="#33a5ba"><a href="#">评论</a><font color="#999">(8)</font>&nbsp;&nbsp;</font>  	
						  	</span>
						</li>
						<hr style="height:5px;border:none;border-top:1px dashed gray;padding-bottom:10px;" />													
						
						<li style="margin-bottom: 30px">
						  	<span class="title">
						  		<img alt="文章类型" src="${pageContext.request.contextPath}/static/userImages/yuan.jpg">
						  		<a href="#">这是一篇测试文章</a>
						  	</span>
						  	
						  	<span class="img">
						  		
							  		<a href="#"><img src="${pageContext.request.contextPath}/static/userImages/dog.jpg" title="dog.jpg" alt="dog.jpg" width="823" height="489" style="width: 823px; height: 489px;"></a>
							  		<a href="#"><img src="${pageContext.request.contextPath}/static/userImages/dog.jpg" title="dog.jpg" alt="dog.jpg" width="823" height="489" style="width: 823px; height: 489px;"></a>
							  		<a href="#"><img src="${pageContext.request.contextPath}/static/userImages/dog.jpg" title="dog.jpg" alt="dog.jpg" width="823" height="489" style="width: 823px; height: 489px;"></a>
							  		&nbsp;&nbsp;
						  		
						  	</span>
						  	<span class="info">
						  		<font color="#999">2016-07-03 10:39</font> &nbsp;&nbsp;
						  		<font color="#33a5ba"><a href="#">阅读</a><font color="#999">(404)</font>&nbsp;&nbsp;</font>
						  		<font color="#33a5ba"><a href="#">评论</a><font color="#999">(8)</font>&nbsp;&nbsp;</font>	  	
						  	</span>
						</li>
						<hr style="height:5px;border:none;border-top:1px dashed gray;padding-bottom:10px;" />													
						
						<li style="margin-bottom: 30px">
						  	<span class="title">
						  		<img alt="文章类型" src="${pageContext.request.contextPath}/static/userImages/yuan.jpg">
						  		<a href="#">这是一篇测试文章</a>
						  	</span>
						  	
						  	<span class="img">
						  		
							  		<a href="#"><img src="${pageContext.request.contextPath}/static/userImages/dog.jpg" title="dog.jpg" alt="dog.jpg" width="823" height="489" style="width: 823px; height: 489px;"></a>
							  		<a href="#"><img src="${pageContext.request.contextPath}/static/userImages/dog.jpg" title="dog.jpg" alt="dog.jpg" width="823" height="489" style="width: 823px; height: 489px;"></a>
							  		<a href="#"><img src="${pageContext.request.contextPath}/static/userImages/dog.jpg" title="dog.jpg" alt="dog.jpg" width="823" height="489" style="width: 823px; height: 489px;"></a>
							  		&nbsp;&nbsp;
						  		
						  	</span>
						  	<span class="info">
						  		<font color="#999">2016-07-03 10:39</font> &nbsp;&nbsp;
						  		<font color="#33a5ba"><a href="#">阅读</a><font color="#999">(404)</font>&nbsp;&nbsp;</font>
						  		<font color="#33a5ba"><a href="#">评论</a><font color="#999">(8)</font>&nbsp;&nbsp;</font>  	
						  	</span>
						</li>
						<hr style="height:5px;border:none;border-top:1px dashed gray;padding-bottom:10px;" />													
					</ul>
				</div>  		
		  	</div>

		  
		</div>
		
		<div class="row">
			<div class="col-md-12" >
				<div class="footer" align="center" style="padding-top: 120px" >
					<font>Copyright © 2017-2018 翎筑文章管理系统 版权所有</font>
					  
				</div>
			</div>			
		</div>
	</div>
</body>
</html>
