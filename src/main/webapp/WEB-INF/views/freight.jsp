<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>李田田的运费计算器</title>
    <meta http-equiv="pragma" content="no-cache"/>   
    <meta http-equiv="Cache-Control" content="no-cache, must-revalidate"/>   
    <meta http-equiv="expires" content="0"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"> 
    <link href="${pageContext.request.contextPath}/static/bootstrap3.0.0/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>

<body>
<div class="container">
    <form action="${pageContext.request.contextPath}/child_health_record/detail.html" class="form-horizontal"  role="form">
        <fieldset>
        	<div class="page-header position-relative">
				<h1>
					<small>
						李田田的运费计算器
					</small>
				</h1>
				<h4>
					<small>
						结婚五周年纪念版
					</small>
				</h4>
           </div>
			<div class="form-group">
				 <label  class="col-sm-2 control-label">货物重量(克)g：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="cargo_weight" name="cargo_weight" value="0" placeholder="请输入货物重量(克)" check-type="required number" required-message="请输入货物重量(克)">
				 </div>
			</div>
			
			<div class="form-group">
				 <label  class="col-sm-2 control-label">货物重量(千克)kg：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="cargo_weight_kg" name="cargo_weight_kg" value="0" readonly>
				 </div>
			</div>
			
			<div class="form-group">
				 <label  class="col-sm-2 control-label">运费(根据货物重量自动生成)单位为日元：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="result_freight" name="result_freight"  placeholder="" readonly  > 
				 </div>
			</div>
			
			<div class="form-group">
				 <label  class="col-sm-2 control-label">汇率（${banknm}&nbsp;现钞（日元）卖价）：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="se_sell" name="se_sell"  value="${se_sell}" placeholder="${se_sell}" readonly  > 
				 </div>
			</div>
			
			<div class="form-group">
				 <label  class="col-sm-2 control-label">运费(根据货物重量自动生成)单位为人民币：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="result_freight_CNY" name="result_freight_CNY"  placeholder="" readonly  > 
				 </div>
			</div>

			<div class="form-group">
				 <label  class="col-sm-2 control-label">货物成本价，单位为日元：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="mycost" name="mycost"  value="0" placeholder="请输入成本价（日元）" check-type="required number" required-message="请输入成本价（日元）">
				 </div>
			</div>
			
			<div class="form-group">
				 <label  class="col-sm-2 control-label">包含运费的成本价,单位为人民币：</label>
				 <div class="col-sm-10 ">
					<input type="text" class="form-control" id="result_all_CNY" name="result_all_CNY"  placeholder="" readonly  > 
				 </div>
			</div>
			
			<div class="form-group">
				 <label  class="col-sm-12 ">说明：起步价为每500克600日元。每增加100克，增加110日元</label>

				 

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

   
   
   $("#cargo_weight").on('change',function(event){
   	   
		 if ($("form").valid_one(document.getElementById("cargo_weight"),"")==false){
		   return false;
		 } 
   	   document.getElementById("cargo_weight_kg").value = $("#cargo_weight").val()/1000
     	var se_sell =  $("#se_sell").val();
   	   var weight =  $("#cargo_weight").val();
   	
   	   var result = 0;
   	 if (weight <= 0) {
   		result = 0;
   	 } else if (weight <= 500) {
			result = 600;
   	   } else {
   		   //alert(Math.round((weight-500)/100))
   		    result = 600 + Math.round((weight-500)/100) * 110;
   	   }
       	document.getElementById("result_freight").value = result;
       	document.getElementById("result_freight_CNY").value = Math.round(result/100*se_sell);
       	var mycost = $("#mycost").val();
		 document.getElementById("result_all_CNY").value = Math.round(mycost/100*se_sell)*1 + $("#result_freight_CNY").val()*1;
   })
   
   $("#mycost").on('change',function(event){
	 if ($("form").valid_one(document.getElementById("mycost"),"")==false){
		   return false;
		 } 
	   var se_sell =  $("#se_sell").val();
	   var mycost = $("#mycost").val();
       	document.getElementById("result_all_CNY").value = Math.round(mycost/100*se_sell)*1 + $("#result_freight_CNY").val()*1;
   	   
	
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