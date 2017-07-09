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
    <form action="" class="form-horizontal"  role="form">
        <fieldset>
        	<div class="page-header position-relative">
				<h1>
					<small>
						提交成功
					</small>
				</h1>
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