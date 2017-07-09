<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta http-equiv="pragma" content="no-cache"/>   
    <meta http-equiv="Cache-Control" content="no-cache, must-revalidate"/>   
    <meta http-equiv="expires" content="0"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"> 
	<link href="${pageContext.request.contextPath}/static/bootstrap3.0.0/css/bootstrap.min.css" rel="stylesheet" media="screen">

	<%@include file="./css_haoyun.jsp" %>
</head>

<body>
<%@include file="./logo.jsp" %>
<div class="container">
        <fieldset>

			<div class="col-sm-12 ">
				<h1>
					<small>
						<i class="icon-list-alt"></i>
						快递单号 批量添加 （演示用）
					</small>
				</h1>
			</div>
			<br/>
	        <div class="container kv-main">
				
	            <form id="myform"  method="post" enctype="multipart/form-data">
	                <input id="fileObj" class="file" name = "fileObj" type="file"  multiple data-min-file-count="1">
	            </form>
	        </div>
	        <br/>
			<div class="alert alert-warning hidden" id = "div_alert_xlsx_File_NoBeSetted" >警告：还未选择本地xlsx文件</div>
			<div class="alert alert-warning hidden" id = "div_alert_NOT_xlsx_File"        >警告：请选择xlsx格式文件</div>


		


		     <div class="form-group">
		        <div class="col-sm-12 ">
		          
		          <a href="javascript:uploadFile();"  class="button button-block button-rounded button-primary button-large">提交</a>
		        </div>
		      </div>

        </fieldset>

</div>


<script>
	//初始化按钮
    $('#fileObj').fileinput({
        language: 'zh',
        //上传地址
        uploadUrl: '#',
        'showPreview' : false,
        showUpload: false,
        allowedFileExtensions : ['xlsx'],
    });
    $('#file-es').fileinput({
        language: 'zh',
        uploadUrl: '#',
        allowedFileExtensions : ['jpg', 'png','gif'],
    });
    $("#file-0").fileinput({
    	language: 'zh',
        'allowedFileExtensions' : ['jpg', 'png','gif'],
    });
    $("#file-1").fileinput({
    	language: 'zh',
        uploadUrl: '#', // you must set a valid URL here else you will get an error
        allowedFileExtensions : ['jpg', 'png','gif'],
        overwriteInitial: false,
        maxFileSize: 1000,
        maxFilesNum: 10,
        //allowedFileTypes: ['image', 'video', 'flash'],
        slugCallback: function(filename) {
            return filename.replace('(', '_').replace(']', '_');
        }
	});
    /*
    $(".file").on('fileselect', function(event, n, l) {
        alert('File Selected. Name: ' + l + ', Num: ' + n);
    });
    */
	$("#file-3").fileinput({
		language: 'zh',
		showUpload: false,
		showCaption: false,
		browseClass: "btn btn-primary btn-lg",
		fileType: "any",
        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>"
	});
	$("#file-4").fileinput({
		language: 'zh',
		uploadExtraData: {kvId: '10'}
	});
    $(".btn-warning").on('click', function() {
        if ($('#file-4').attr('disabled')) {
            $('#file-4').fileinput('enable');
        } else {
            $('#file-4').fileinput('disable');
        }
    });    
    $(".btn-info").on('click', function() {
        $('#file-4').fileinput('refresh', {previewClass:'bg-info'});
    });
    /*
    $('#file-4').on('fileselectnone', function() {
        alert('Huh! You selected no files.');
    });
    $('#file-4').on('filebrowse', function() {
        alert('File browse clicked for #file-4');
    });
    */
    $(document).ready(function() {
        $("#test-upload").fileinput({
        	language: 'zh',
            'showPreview' : false,
            'allowedFileExtensions' : ['jpg', 'png','gif'],
            'elErrorContainer': '#errorBlock'
        });
        /*
        $("#test-upload").on('fileloaded', function(event, file, previewId, index) {
            alert('i = ' + index + ', id = ' + previewId + ', file = ' + file.name);
        });
        */
    });


function uploadFile(){
	var file_name = document.all.fileObj.value;
	
	//alert(getEx(file_name).toString().toLowerCase());
	if (file_name == ""){
		$("#div_alert_xlsx_File_NoBeSetted").attr("class","alert alert-danger");
		
	} else if (getEx(file_name).toString().toLowerCase() != ".xlsx") {
		$("#div_alert_NOT_xlsx_File").attr("class","alert alert-danger");
	}else {
		
		document.all.myform.action="${pageContext.request.contextPath}/uploadFile/upload_express_file.do";
		document.all.myform.submit(); 
	}
	
	
}
function getEx(file_name){
	var result =/\.[^\.]+/.exec(file_name);
	return result;
}

	</script>


</body>
</html>