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
    <form action="${pageContext.request.contextPath}/child_thi_disease_manage.jsp" class="form-horizontal"  role="form">
        <fieldset>
        	<div class="page-header position-relative">
				<h1>
					<small>
						儿童健康档案四级界面 更新疾病记录（演示用）
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
					<input type="text" class="form-control" id="disease_date" name="disease_date" value="2017/05/26" placeholder=""    > 
				 </div>
			</div>
			<div class="form-group">
				 <label  class="col-sm-2 control-label">发病起因：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="disease_cause" name="disease_cause" value="流感传染" placeholder=""    > 
				 </div>
			</div>
			<div class="form-group">
				 <label  class="col-sm-2 control-label">症状体征：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="disease_symptom" name="disease_symptom" value="打喷嚏，流鼻涕" placeholder=""    > 
				 </div>
			</div>
			<div class="form-group">
				 <label  class="col-sm-2 control-label">用药：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="disease_pharmacy" name="disease_pharmacy" value="" placeholder=""    > 
				 </div>
			</div>
			<div class="form-group">
				 <label  class="col-sm-2 control-label">查体以及实验室检查结果：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="disease_inspection" name="disease_inspection" value="" placeholder=""    > 
				 </div>
			</div>
			<div class="form-group">
				 <label  class="col-sm-2 control-label">疾病诊断以及转归：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="disease_diagnosis" name="disease_diagnosis" value="" placeholder=""    > 
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