<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html style="width:100%;height:100%;overflow:hidden">
<head>
<title>添加土地图片-五常优质水稻溯源监管平台</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/table.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/themes/color.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/form2js.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/json2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ajaxfileupload.js"></script>
</head>
<body class="easyui-layout">
	<div region="center" border="false" style="padding:10px 10px;">	
		<form id="addUserFrom" class="easyui-form" method="post" data-options="novalidate:true">
			<table class="n_input" style="width:100%">
				<tr>
					<td width="50%" valign="top">
						<fieldset style="border: 1px solid #99BBE8; height:300px;">
						<input type="hidden" id="year" value="2015" />
						<input type="hidden" id="companyCode" value="" />
						<table>
							<tr height="50">
							<td width="20%" align="right">请选择市：</td>
				    			<td width="30%">
				    				<select id="cityCode" name="cityCode" class="easyui-combobox" editable="false" style="width:180px;height:25px" data-options='required:true'>
					    				
					    					<option value="230184">五常市</option>
					    				
					    			</select>
								</td>
			    			</tr>
			    			<tr height="50">
				    			<td width="60" align="right">请选择乡镇：</td>
				    			<td width="200">
				    				<select id="townCode" name="townCode" class="easyui-combobox" editable="false" style="width:180px;height:25px" data-options='required:true'>
					    				<option value="">-=请选择=-</option>
					    				
					    					<option value="100">五常镇</option>
					    				
					    					<option value="101">拉林满族镇</option>
					    				
					    					<option value="102">山河镇</option>
					    				
					    					<option value="103">小山子镇</option>
					    				
					    					<option value="104">安家镇</option>
					    				
					    					<option value="105">牛家满族镇</option>
					    				
					    					<option value="106">杜家镇</option>
					    				
					    					<option value="107">背荫河镇</option>
					    				
					    					<option value="111">龙凤山镇</option>
					    				
					    					<option value="110">向阳镇</option>
					    				
					    					<option value="200">兴盛乡</option>
					    				
					    					<option value="201">志广乡</option>
					    				
					    					<option value="203">常堡乡</option>
					    				
					    					<option value="206">民意乡</option>
					    				
					    					<option value="211">民乐朝鲜族乡</option>
					    				
					    					<option value="209">红旗满族乡</option>
					    				
					    					<option value="210">八家子乡</option>
					    				
					    					<option value="212">营城子满族乡</option>
					    				
					    					<option value="214">长山乡</option>
					    				
					    					<option value="215">兴隆乡</option>
					    				
					    					<option value="216">二河乡</option>
					    				
					    					<option value="108">冲河镇</option>
					    				
					    					<option value="109">沙河子镇</option>
					    				
					    			</select>
								</td>
			    			</tr>
			    			<tr height="50">
				    			<td width="60" align="right">图片描述：</td>
				    			<td width="200">
				    				<input class="easyui-textbox" id="fileInfo" style="width:180px; height:25px;">
								</td>
			    			</tr>
			    			<tr height="50">
				    			<td width="60" align="right">选择文件:</td>
				    			<td width="200">
				    				<input type="file" id="file" name="file" size="10"/>
								</td>
			    			</tr>
			    			<tr height="70">
				    			<td colspan="2" align="center">
				    			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="save()" data-options="iconCls:'icon-save'">保存</a>
				    			<a href="javascript:void(0)" style="margin-left:30px;" class="easyui-linkbutton" style="margin-left:15px;" onclick="closeDialog()" data-options="iconCls:'icon-cancel'">关闭</a>
				    			</td>
			    			</tr>
						</table>
						</fieldset>
					</td>
	    			<td width="50%">
	    				<fieldset style="border: 1px solid #99BBE8;height:300px;">
	    				<table border="0">
						<tr>
							<td><img src="${pageContext.request.contextPath}/images/nothing.png" style="width:360px;height:300px;" border="0"/></td>
						</tr>
						</table>
						</fieldset>
	    			</td>
			</table>
		</form>
	</div>
<script type="text/javascript">
$(document).ready(function(){
	$("#cityCode").combobox({
		valueField:"id",
		textField:"text",
		onChange : getTowns
	});
	$('#townCode').combobox({
        valueField:'id',
        textField:'text',
        onChange : checkUploaded
    });
});

function getTowns(){
	var cityCode = $('#cityCode').combobox('getValue');
	showLoading();
	Public.ajaxGet('${pageContext.request.contextPath}/landPic/getTowns', {cityCode:cityCode}, function(e) {
		hideLoading();
		if (200 == e.status) {
			$("#townCode").combobox("loadData", JSON.parse(e.data));
			$("#townCode").append("<option value='-=请选择=-'>-=请选择=-</option>");
		} else {
			$.messager.alert('错误',e.msg,'error');
		}
	});
}

function checkUploaded(){
	var companyCode = $("#companyCode").val();
	var cityCode = $('#cityCode').combobox('getValue');
	var townCode = $('#townCode').combobox('getValue');
	showLoading();
	Public.ajaxGet('${pageContext.request.contextPath}/landPic/checkUploaded', {companyCode:companyCode,cityCode:cityCode,townCode:townCode}, function(e) {
		hideLoading();
		if (200 == e.status) {
			if(e.data){
				$.messager.alert('警告','该乡镇已上传过图片。','warning');
			}
		} else {
			$.messager.alert('错误',e.msg,'error');
		}
	});
}

function closeDialog(){
	$('#addDialog').dialog('close');
}

function save(){
	var cityCode = $('#cityCode').combobox('getValue');
	var townCode = $('#townCode').combobox('getValue');
	var fileInfo = $("#fileInfo").val();
	var file = $("#file").val();
	var year = $("#year").val();
	var companyCode = $("#companyCode").val();
	if(cityCode == ''){
		$.messager.alert('警告','请选择城市。','warning');
		return false;
	}
	if(townCode == ''){
		$.messager.alert('警告','请选择乡镇。','warning');
		return false;
	}
	if(fileInfo == '') {
		$.messager.alert('警告','请填写图片说明。','warning');
		return false;
	}
	if(file == ''){
		$.messager.alert('警告','请选择文件。','warning');
		return false;
	}
	fileInfo = encodeURIComponent(fileInfo);
	showLoading();
	$.ajaxFileUpload({
		url:"${pageContext.request.contextPath}/landPic/upload?&cityCode="+cityCode+"&townCode="+townCode+"&fileInfo="+fileInfo+"&year="+year+"&companyCode="+companyCode,
		secureuri:false,
		fileElementId:'file',
		dataType: 'text',
		success: function (data, status){
			hideLoading();
			$.messager.alert('提示','操作成功。','info');
			$('#addDialog').dialog('close');
			$('#landpicform').submit();
		},
		error: function (data, status, e){
			hideLoading();
        	$.messager.alert('错误','上传失败。','error');
		}
	});
}
</script>
</body>
</html>