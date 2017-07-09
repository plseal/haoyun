<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/ueditor1_4_3_3/third-party/SyntaxHighlighter/shCore.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/ueditor1_4_3_3/third-party/SyntaxHighlighter/shCoreDefault.css">
<script type="text/javascript">
	SyntaxHighlighter.all(); //ueditor代码高亮


	
	window.onload=function(){

		var imgs=document.getElementsByTagName('img');

		for(var i=0;i<imgs.length;i++){

		imgs[i].setAttribute('class','img-responsive img-thumbnail');

		}

	}	
	
	
</script>
</head>

<style type="text/css"> 
  body { background-color:#E5E7E9; } 
</style>

<body >
	<div class="container">
		<br/>
		<div class="panel panel-info">
		    <div class="panel-heading">
		        <h3 class="panel-title">${blog.title }</h3>
		    </div>
		    <div class="panel-body">
		        ${blog.content }
		    </div>
		</div>

		
	</div>
</body>