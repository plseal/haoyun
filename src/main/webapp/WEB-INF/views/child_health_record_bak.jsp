<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>儿童电子档案</title>
		<meta name="description" content="" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />



<link href="<%=request.getContextPath()%>/assets/css/bootstrap-responsive.min.css" rel="stylesheet">


<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
  
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
 
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--[if !IE]>-->
<script type="text/javascript">
	window.jQuery || document.write("<script src='<%=request.getContextPath()%>/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
</script>
<!--<![endif]-->
<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='<%=request.getContextPath()%>/assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
<script type="text/javascript">
	if("ontouchend" in document) document.write("<script src='<%=request.getContextPath()%>/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
</script>

<!--page specific plugin scripts-->
<link href="<%=request.getContextPath()%>/assets/css/bootstrap-datetimepicker.min.css" rel="stylesheet"/>
<script src="<%=request.getContextPath()%>/assets/js/bootstrap-datetimepicker.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>		
	</head>
	
	<body>
				

	<div class="container">
	
<label class="control-label col-xs-3">日期4：</label>
  <div class='input-group date' id='datetimepicker2'>
    <input type='text' class="form-control" />
    <span class="input-group-addon">
      <span class="glyphicon glyphicon-calendar"></span>
    </span>
  </div> 
  <script type="text/javascript">
  $(function () {
	    $('#datetimepicker2').datetimepicker({
	        format: 'YYYY-MM-DD',//日期格式化，只显示日期
	        locale: 'zh-cn'   //中文化
	      });
  });
  </script>
	
	<div class="page-header position-relative">
		<h1>
			<small>
				成长点滴
			</small>
		</h1>
	</div> 
	
		<div class="row clearfix">
			<div class="col-md-12 column">
				<form class="form-horizontal" role="form" method="post">
					<div class="form-group">
						 <label class="col-sm-2 control-label">姓名：</label>
						<div class="col-sm-10">
							<input type="text"  class="form-control" id="child_name" name="child_name"  placeholder="请输入姓名" >
						</div>
					</div>
					<div class="form-group">
						 <label  class="col-sm-2 control-label">性别：</label>
						<div class="col-sm-10 ">
							<select id="sexTypeId" class="form-control"  name="sexType.id" >
								<option value="">请选择...</option>
								<c:forEach items="${sexTypeList}" var="sexType">
									<option value="${sexType.id}">${sexType.typeName}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						 <label  class="col-sm-2 control-label">生日：</label>
						 <div class="col-sm-10 ">
				            <div class='input-group date' id='datetimepicker1'>  
				                <input type='text' class="form-control" />  
				                <span class="input-group-addon">  
				                    <span class="glyphicon glyphicon-calendar"></span>  
				                </span>  
				            </div> 
						 </div>
						 
		
					</div>
	
					<div class="form-group">
						 <label  class="col-sm-2 control-label">年龄(根据生日自动生成)：</label>
						 <div class="col-sm-10 ">
							<input type="text" class="form-control" id="child_age" name="child_age"  placeholder="" readonly  > 
						 </div>
						 
		
					</div>
	
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							 <button type="submit" class="btn btn-default">Sign in</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	

	
	
		
		
		


							<!--PAGE CONTENT BEGINS-->
							
							
							

							<div class="form-group">
							  <label ></label>
							  

								
							</div>
							<br/>
							<div class="form-group">
							  

            					
							</div>	
							<br/>	
						    <div class="form-group">
							  <label >身高：</label>
							 
							  <input type="text"  id="child_height" name="child_height"  placeholder="请输入身高" >
							  
							</div>
							
							<br/>	
						    <div class="form-group">
							  <label >体重：</label>
							 
							  <input type="text"  id="child_weight" name="child_weight"  placeholder="请输入体重" >
							  
							</div>
							<br/>
							<div class="form-group">
							  <button type="button" class="btn btn-success" onclick="javascript:submitData()" >发布文章</button>
							</div>	
											
								
							
					 		
							<!--PAGE CONTENT ENDS-->
		
		
	

	
	<script type="text/javascript">
	//alert(new Date().Format("yyyy/mm/dd"));
	var year = new Date().getFullYear();
	var month = new Date().getMonth() + 1;
	var day = new Date().getDate();
	//alert(day)
	var today = year + "/" + month + "/" +day;
	//alert(today)
	$(function () { 
		$('#datetimepicker1').datetimepicker({
			format: 'YYYY-MM-DD',
	        locale: moment.locale('zh-hk') 
			
	    });
	});
	$('#datetimepicker1').on('changeDate', function(ev){
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
	
		function submitData() {
			var pagenum = document.getElementById("pagenum").value;
			var title = $("#title").val();
			var blogTypeId = document.getElementById("blogTypeId").value;
			var content = UE.getEditor('editor').getContent();
			var summary = UE.getEditor('editor').getContentTxt().substr(0, 155);
			var keyWord = $("#keyWord").val();
			var contentNoTag = UE.getEditor('editor').getContentTxt();

			if (title == null || title == '') {
				alert( "请输入标题！");
			} else if (blogTypeId == null || blogTypeId == '') {
				alert("请选择文章类型！");
			} else if (content == null || content == '') {
				alert("请编辑文章内容！");
			} else {
				$.post("${pageContext.request.contextPath}/blog/save.do",
						{
							'id': '${blog_id}',
							'title' : title,
							'blogType.id' : blogTypeId,
							'content' : content,
							'summary' : summary,
							'keyWord' : keyWord,
							'contentNoTag' : contentNoTag
						}, function(result) {
							if (result.success) {
								//$.messager.alert("系统提示", "文章发布成功！");
								window.location.href='${pageContext.request.contextPath}/blog/to_blogManage.do?pagenum='+pagenum;
								//clearValues();
							} else {
								alert("error");
								//$.messager.alert("系统提示", "文章发布失败！");
							}
						}, "json");
			}
		}

	</script>

	</div>
	</body>
</html>