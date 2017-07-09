<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>儿童健康档案 四级界面</title>
    <meta http-equiv="pragma" content="no-cache"/>   
    <meta http-equiv="Cache-Control" content="no-cache, must-revalidate"/>   
    <meta http-equiv="expires" content="0"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"> 
    <link href="${pageContext.request.contextPath}/static/bootstrap3.0.0/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>

<body>
<div class="container">
    <form action="${pageContext.request.contextPath}/child_thi_health_manage.jsp" class="form-horizontal"  role="form">
        <fieldset>
        	<div class="page-header position-relative">
				<h1>
					<small>
						儿童健康档案四级界面 新录入体检记录（演示用）
					</small>
				</h1>
           </div>
			<div class="form-group">
				 <label class="col-sm-2 control-label">姓名：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="child_name" name="child_name" value="司马光" placeholder="" readonly  > 
				 </div>
			</div>

			<div class="form-group">
				 <label  class="col-sm-2 control-label">时间：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="me_date" name="me_date" value="2017/05/26" placeholder=""    > 
				 </div>
			</div>
			
			<div class="form-group">
				 <label  class="col-sm-2 control-label">身高(厘米)：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="me_height" name="me_height" value="100" placeholder="请输入身高" check-type="required number" required-message="请输入小朋友的身高">
				 </div>
			</div>

			<div class="form-group">
				 <label  class="col-sm-2 control-label">体重(公斤)：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="me_weight" name="me_weight" value="15" placeholder="请输入体重" check-type="required number" required-message="请输入小朋友的体重">
				 </div>
			</div>
			<div class="form-group">
				 <label  class="col-sm-2 control-label">头围(厘米)：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="me_head" name="me_head" value="15" placeholder="请输入头围" check-type="required number" required-message="请输入小朋友的头围">
				 </div>
			</div>
			<div class="form-group">
				 <label  class="col-sm-2 control-label">囟门大小(厘米)：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="me_fontanel" name="me_fontanel" value="15" placeholder="请输入囟门大小" check-type="required number" required-message="请输入小朋友的囟门大小">
				 </div>
			</div>
			
			<div class="form-group">
				 <label  class="col-sm-2 control-label">查体以及实验室检查结果：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="me_inspection" name="me_inspection" value="" placeholder=""    > 
				 </div>
			</div>
			<div class="form-group">
				 <label  class="col-sm-2 control-label">总体评价：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="me_devaluation" name="me_devaluation" value="" placeholder=""    > 
				 </div>
			</div>
	






		     <div class="form-group">
		        <div class="col-sm-12 ">
		          <button type="submit" class="btn btn-lg btn-block btn-primary">更新暂不可用点击返回</button>
		        </div>
		      </div>

        </fieldset>
    </form>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.8.3.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap3.0.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap3-validation.js" charset="UTF-8"></script>

<script type="text/javascript">


$(function(){
   //bootstrap3-validation init：
   $("form").validation();
   $("button[type='submit']").on('click',function(event){
     // 2.最后要调用 valid()方法。
     if ($("form").valid_(this,"error!")==false){
       //$("#error-text").text("error!"); 1.0.4版本已将提示直接内置掉，简化前端。
       return false;
     }
   })
   

   

   



})
</script>
<script type="text/javascript">
	
	//endDate limit to thisday
	var year = new Date().getFullYear();
	var month = new Date().getMonth() + 1;
	var day = new Date().getDate();
	var today = year + "/" + month + "/" +day;
	
	Date.prototype.yyyymmdd = function() {
	  var mm = this.getMonth() + 1; // getMonth() is zero-based
	  var dd = this.getDate();

	  return [this.getFullYear(),
			  (mm>9 ? '' : '0') + mm,
			  (dd>9 ? '' : '0') + dd
			 ].join('');
	};

	var date = new Date();
	//alert(date.yyyymmdd());
	//document.getElementById("update_date").value = date.yyyymmdd();
</script>

</body>
</html>