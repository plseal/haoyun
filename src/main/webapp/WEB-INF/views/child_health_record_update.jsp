<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>儿童电子档案</title>
    <meta http-equiv="pragma" content="no-cache"/>   
    <meta http-equiv="Cache-Control" content="no-cache, must-revalidate"/>   
    <meta http-equiv="expires" content="0"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"> 
    <link href="${pageContext.request.contextPath}/static/bootstrap3.0.0/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>

<body>
<div class="container">
    <form action="${pageContext.request.contextPath}/child_health_record/to_child_health_record_manage.do" class="form-horizontal"  role="form">
        
		<fieldset>
        	<div class="page-header position-relative">
				<h1>
					<small>
						儿童电子档案更新
					</small>
				</h1>
           </div>
			<div class="form-group">
				 <label class="col-sm-2 control-label">姓名：</label>
				<div class="col-sm-10">
					<input type="text"  class="form-control" id="child_name" name="child_name" value="${chr_out.child_name}"  placeholder="请输入姓名" check-type="required" required-message="请输入小朋友的名字">
				</div>
				<input type="text" id="hid_flg" name="hid_flg" style="display:none" value="update" >
				<input type="text" id="id" name="id" style="display:none" value="${chr_out.id}" >
			</div>
			<div class="form-group">
				 <label  class="col-sm-2 control-label">性别：</label>
				<div class="col-sm-10 ">
					<select  class="form-control" id="child_sex"  name="child_sex" check-type="required" required-message="请选择性别">
						<option value=""></option>
						<option value="男" >男</option>
						<option value="女" selected>女</option>
					</select>
					<input type="text" id="hid_child_sex" name="hid_child_sex" style="display:none" value="${chr_out.child_sex}" >
				</div>
			</div>
			
			<div class="form-group">
				 <label  class="col-sm-2 control-label">生日：</label>
				 <div class="col-sm-10 ">
	                <div class="input-group date form_date " data-date="${chr_out.child_birth}" data-date-format="yyyy/mm/dd" data-link-field="dtp_input2" data-link-format="yyyy/mm/dd">
	                    <input  id="child_birth" class="form-control" size="16" type="text" value="${chr_out.child_birth}" readonly >
	                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
						<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
	                </div>
					<input type="text" id="hid_child_birth" name="hid_child_birth" style="display:none" value="${chr_out.child_birth}" check-type="required" required-message="请输入小朋友的生日"><br/>
				 </div>
    		</div>

			<div class="form-group">
				 <label  class="col-sm-2 control-label">年龄(根据生日自动生成)：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="child_age" name="child_age" value="${chr_out.child_age}" placeholder="" readonly  > 
				 </div>
				 

			</div>
			
			<div class="form-group">
				 <label  class="col-sm-2 control-label">身高(厘米)：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="child_height" name="child_height" value="${chr_out.child_height}" placeholder="请输入身高" check-type="required number" required-message="请输入小朋友的身高">
				 </div>
			</div>

			<div class="form-group">
				 <label  class="col-sm-2 control-label">体重(公斤)：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="child_weight" name="child_weight" value="${chr_out.child_weight}" placeholder="请输入体重" check-type="required number" required-message="请输入小朋友的体重">
				 </div>
			</div>
			<div class="form-group">
				 <label  class="col-sm-2 control-label">体检日期（例：20170101）：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="update_date" name="update_date" value="${chr_out.update_date}" placeholder="请输入体检日期（例：20170101）" check-type="required number" required-message="请输入体检日期">
				 </div>
			</div>


		     <div class="form-group">
		        <div class="col-sm-12 ">
		          <button type="submit" class="btn btn-lg btn-block btn-primary">提交</button>
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
	
	$("#child_sex").val(document.getElementById("hid_child_sex").value);
   //bootstrap3-validation init：
   $("form").validation();
   $("button[type='submit']").on('click',function(event){
     // 2.最后要调用 valid()方法。
     if ($("form").valid_(this,"error!")==false){
       //$("#error-text").text("error!"); 1.0.4版本已将提示直接内置掉，简化前端。
       return false;
     }
   })
   
   $("#child_sex").on('change',function(event){
     if ($("form").valid_one(this,"")==false){
       return false;
     }
   })
   
   $("#child_birth").on('change',function(event){
   	   document.getElementById("hid_child_birth").value = $("#child_birth").val()
		 if ($("form").valid_one(document.getElementById("hid_child_birth"),"")==false){
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
	//alert(today);
	$('.form_date').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		endDate: today,
		forceParse: 0
    });

	$('.form_date').on('changeDate', function(ev){
		//alert(DateDiff(ev.date,new Date()));
		//btnCount_Click();
		
	    //if (ev.date.valueOf() < date-start-display.valueOf()){
	        //
	    //}
	    //根据出生日期系统自动推算，12个月内精确到天，1岁以上精确到月
	    //365
	    var nowdate = new Date();
	    var brithday = ev.date;
	    //if (document.getElementById("child_age").value == null) {
			//var age =nowdate.getFullYear() - brithday.getFullYear();
			//alert(age);
			if (brithday != null) {
				var age_of_days = DateDiff(brithday,nowdate);
				var age_of_months = getMonths(brithday,nowdate);
				//alert(age_of_days);
				//12个月内精确到天
				if (age_of_days < 365) {
					document.getElementById("child_age").value = age_of_days + "天"
				//1岁以上精确到月	
				} else {
					document.getElementById("child_age").value = age_of_months + "月"
				}
			//clear
			} else {
				document.getElementById("child_age").value = ""
			}
	    //}
	});
	
   //计算天数差的函数，通用  
   function  DateDiff(sDate1,  sDate2){    
       var  iDays  
       	         
       iDays  =  parseInt(Math.abs(sDate1  -  sDate2)  /  1000  /  60  /  60  /24)    //把相差的毫秒数转换为天数  
       return  iDays  
   }
   //计算月数差的函数，通用  
   function getMonths(date1 , date2){
	    //获取年,月数
	    var year1 = date1.getYear() , 
	        month1 = date1.getMonth() , 
	        year2 = date2.getYear() , 
	        month2 = date2.getMonth(), 
	        //通过年,月差计算月份差
	        months = (year2 - year1) * 12 + (month2-month1) + 1;
	    return months;    
	}

</script>

</body>
</html>