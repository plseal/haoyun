<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>编辑文章</title>
		<meta name="description" content="" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<%@include file="/WEB-INF/views/common/css.jsp" %>
		
	</head>
	
	<body>
		<div class="container">
		<%@ include file="/WEB-INF/views/common/navbar.jsp" %>
		<div class="main-container container-fluid">
			<a class="menu-toggler" id="menu-toggler" href="#">
				<span class="menu-text"></span>
			</a>
			<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>
			<div class="main-content">
				 
				<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							<small>
								编辑文章
							</small>
						</h1>
					</div> 

							<!--PAGE CONTENT BEGINS-->
							<input type="hidden" id="id" name="id" class="form-control" value = "${blog_id}" placeholder="BLOGID" aria-describedby="basic-addon1">
							<input type="hidden" id="pagenum" name="pagenum" class="form-control" value = "${pagenum}" aria-describedby="basic-addon1">
							<form class="form-inline" method="post" >
							<div class="input-group">
							  <span class="input-group-addon" id="basic-addon1">文章标题：</span>
							  <input type="text" id="title" name="title" class="form-control" placeholder="文章标题" aria-describedby="basic-addon1">
							</div>
							<br/>
							<div class="input-group">
							  <span class="input-group-addon" id="basic-addon1">所属类别：</span>
								<select id="blogTypeId" class="easyui-combobox"
									name="blogType.id" style="width:154px" editable="false"
									panelHeight="auto">
										<option value="">请选择文章类别...</option>
										<c:forEach items="${blogTypeList }" var="blogType">
											<option value="${blogType.id }">${blogType.typeName }</option>
										</c:forEach>
								</select>
							</div>
							<br/>
							<div class="input-group">
								<script id="editor" name="content" type="text/plain" style="width:80%; height:400px;"></script>
							</div>		
							<br/>
							<div class="input-group">
							  <span class="input-group-addon" id="basic-addon1">关键字：</span>
							  <input type="text" id="keyWord" name="keyWord" class="form-control" placeholder="多个关键字的话请用空格隔开" aria-describedby="basic-addon1">
							</div>	
							<br/>	
							<div class="input-group">
							  <button type="button" class="btn btn-success" onclick="javascript:submitData()" >发布文章</button>
							</div>	
											
								
							</form>
					 		
							<!--PAGE CONTENT ENDS-->
					</div><!--/.span-->

		</div><!--/.main-content-->
	</div><!--/.main-container-->
	<%@include file="/WEB-INF/views/common/js.jsp" %>
	<script type="text/javascript" charset="utf-8"
		src="${pageContext.request.contextPath}/static/ueditor1_4_3_3/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="${pageContext.request.contextPath}/static/ueditor1_4_3_3/ueditor.all.min.js">
		
	</script>
	<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
	<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
	<script type="text/javascript" charset="utf-8"
		src="${pageContext.request.contextPath}/static/ueditor1_4_3_3/lang/zh-cn/zh-cn.js"></script>
	<!-- 实例化编辑器 -->

	
	<script type="text/javascript">
		//var UEDITOR_HOME_URL = "/Blog/";//从项目的根目录开始
		var ue = UE.getEditor('editor');
		ue.addListener("ready", function(){
			//通过UE自己封装的ajax请求数据
			UE.ajax.request("${pageContext.request.contextPath}/blog/findById.do",
					{
						method: "post",
						async: false,
						data: {"blog_id":"${blog_id}"},
						onsuccess: function(result) { //根据id查询Blog，返回一个json格式的blog对象
							result = eval("(" + result.responseText + ")");
						
							$("#title").val(result.title);
							$("#keyWord").val(result.keyWord);							
							
							document.getElementById("blogTypeId").value = result.blogType.id;
							UE.getEditor('editor').setContent(result.content);
						}
					});
		});
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