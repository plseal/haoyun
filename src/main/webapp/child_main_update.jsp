<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>儿童健康档案主界面 更新</title>
    <meta http-equiv="pragma" content="no-cache"/>   
    <meta http-equiv="Cache-Control" content="no-cache, must-revalidate"/>   
    <meta http-equiv="expires" content="0"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"> 
    <link href="${pageContext.request.contextPath}/static/bootstrap3.0.0/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>

<body>
<div class="container">
    <form action="${pageContext.request.contextPath}/child_main.jsp" class="form-horizontal"  role="form">
        <fieldset>
        	<div class="page-header position-relative">
				<h1>
					<small>
						儿童健康档案主界面 更新（演示用）
					</small>
				</h1>
           </div>
			<div class="form-group">
				 <label class="col-sm-2 control-label">姓名：</label>
				<div class="col-sm-10">
					<input type="text"  class="form-control" id="child_name" name="child_name" value="宋嘉诚"  placeholder="请输入姓名" check-type="required" required-message="请输入小朋友的名字">
					<input type="text" id="hid_flg" name="hid_flg" style="display:none" value="insert" >
					
				</div>
			</div>
			<div class="form-group">
				 <label  class="col-sm-2 control-label">性别：</label>
				<div class="col-sm-10 ">
					<select  class="form-control" id="child_sex"  name="child_sex" check-type="required" required-message="请选择性别">
						<option value=""></option>
						<option value="男" selected>男</option>
						<option value="女">女</option>
					</select>
					
				</div>
			</div>
			
			<div class="form-group">
				 <label  class="col-sm-2 control-label">生日：</label>
				 <div class="col-sm-10 ">
	                <div class="input-group date form_date " data-date="2013/06/29" data-date-format="yyyy/mm/dd" data-link-field="dtp_input2" data-link-format="yyyy/mm/dd">
	                    <input  id="child_birth" class="form-control" size="16" type="text" value="" readonly >
	                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
						<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
	                </div>
					<input type="text" id="hid_child_birth" name="hid_child_birth" style="display:none" value="" check-type="required" required-message="请输入小朋友的生日"><br/>
				 </div>
    		</div>

			<div class="form-group">
				 <label  class="col-sm-2 control-label">年龄(根据生日自动生成)：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="child_age" name="child_age"  placeholder="" readonly  > 
				 </div>
				 

			</div>
			
			<div class="form-group">
				 <label  class="col-sm-2 control-label">血型：</label>
				 <div class="col-sm-10 ">
					<select  class="form-control" id="child_blood"  name="child_blood" check-type="required" required-message="请选择血型">
						<option value=""></option>
						<option value="A" selected>A</option>
						<option value="B">B</option>
						<option value="O">O</option>
						<option value="AB">AB</option>
					</select>
				 </div>
			</div>


		     <div class="form-group">
		        <div class="col-sm-12 ">
		          <button type="submit" class="btn btn-lg btn-block btn-primary">提交暂不可用点击返回</button>
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