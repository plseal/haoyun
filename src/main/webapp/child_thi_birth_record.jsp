<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>儿童健康档案 三级界面</title>
    <meta http-equiv="pragma" content="no-cache"/>   
    <meta http-equiv="Cache-Control" content="no-cache, must-revalidate"/>   
    <meta http-equiv="expires" content="0"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"> 
    <link href="${pageContext.request.contextPath}/static/bootstrap3.0.0/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>

<body>
<div class="container">
    <form action="${pageContext.request.contextPath}/child_sec_main.jsp" class="form-horizontal"  role="form">
        <fieldset>
        	<div class="page-header position-relative">
				<h1>
					<small>
						儿童健康档案三级界面 出生史（演示用）
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
				 <label  class="col-sm-2 control-label">孕周：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="ge_weeks" name="ge_weeks" value="40" placeholder="" check-type="required number"   > 
				 </div>
			</div>
			<div class="form-group">
				 <label  class="col-sm-2 control-label">分娩方式：</label>
				<div class="col-sm-10 ">
					<select  class="form-control" id="delivery_type"  name="delivery_type" check-type="required" required-message="请选择分娩方式">
						<option value=""></option>
						<option value="顺产" selected>顺产</option>
						<option value="剖腹">剖腹</option>
						<option value="产钳助产">产钳助产</option>
					</select>
					
				</div>
			</div>
			<div class="form-group">
				 <label class="col-sm-2 control-label">上述以外的其他分娩方式：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="delivery_type_other" name="delivery_type_other" value="" placeholder=""   > 
				 </div>
			</div>
			<div class="form-group">
				 <label  class="col-sm-2 control-label">胎数：</label>
				<div class="col-sm-10 ">
					<select  class="form-control" id="born_num"  name="born_num" check-type="required" required-message="请选择胎数">
						<option value=""></option>
						<option value="单胎" selected>单胎</option>
						<option value="双胎">双胎</option>
						<option value="三胎">三胎</option>
					</select>
					
				</div>
			</div>
			<div class="form-group">
				 <label class="col-sm-2 control-label">上述以外的其他胎数：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="born_num_other" name="born_num_other" value="" placeholder=""   > 
				 </div>
			</div>
			<div class="form-group">
				 <label class="col-sm-2 control-label">第X胎第X产：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="born_record" name="born_record" value="第1胎第1产" placeholder=""   > 
				 </div>
			</div>
			<div class="form-group">
				 <label  class="col-sm-2 control-label">出生体重(公斤)：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="born_weight" name="born_weight" value="5" placeholder="请输入体重" check-type="required number" required-message="请输入小朋友的体重">
				 </div>
			</div>
			<div class="form-group">
				 <label  class="col-sm-2 control-label">出生身长(厘米)：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="born_height" name="born_height" value="40" placeholder="请输入身长" check-type="required number" required-message="请输入小朋友的身高">
				 </div>
			</div>
			<div class="form-group">
				 <label  class="col-sm-2 control-label">母亲孕期疾病：</label>
				<div class="col-sm-10 ">
					<select  class="form-control" id="m_disease"  name="m_disease" check-type="required" required-message="请选择母亲孕期疾病">
						<option value=""></option>
						<option value="糖尿病" selected>糖尿病</option>
						<option value="高血压">高血压</option>
						
					</select>
					
				</div>
			</div>
			<div class="form-group">
				 <label class="col-sm-2 control-label">上述以外的其他母亲孕期疾病：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="m_disease_other" name="m_disease_other" value="" placeholder=""   > 
				 </div>
			</div>
			<div class="form-group">
				 <label  class="col-sm-2 control-label">窒息：</label>
				<div class="col-sm-10 ">
					<select  class="form-control" id="asphyxia"  name="asphyxia" check-type="required" required-message="请选择有无窒息">
						<option value=""></option>
						<option value="无" selected>无</option>
						<option value="有">有</option>
						
					</select>
					
				</div>
			</div>
			<div class="form-group">
				 <label class="col-sm-2 control-label">Apgar评分（1分钟X分，5分钟X分）：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="apgar" name="apgar" value="1分钟7分，5分钟8分" placeholder=""   > 
				 </div>
			</div>
			
			<div class="form-group">
				 <label  class="col-sm-2 control-label">出生缺陷：</label>
				<div class="col-sm-10 ">
					<select  class="form-control" id="birth_defect"  name="birth_defect" check-type="required" required-message="请选择有无出生缺陷">
						<option value=""></option>
						<option value="无" selected>无</option>
						<option value="有">有</option>
						
					</select>
					
				</div>
			</div>
			<div class="form-group">
				 <label class="col-sm-2 control-label">有出生缺陷的情况，请补充诊断结果：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="birth_defect_other" name="birth_defect_other" value="" placeholder=""   > 
				 </div>
			</div>
			
			<div class="form-group">
				 <label  class="col-sm-2 control-label">听力筛查：</label>
				<div class="col-sm-10 ">
					<select  class="form-control" id="aabr"  name="aabr" check-type="required" required-message="请选择听力筛查结果">
						<option value=""></option>
						<option value="通过" selected>通过</option>
						<option value="左耳未通过">左耳未通过</option>
						<option value="右耳未通过">右耳未通过</option>
						<option value="双耳未通过">双耳未通过</option>
					</select>
					
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