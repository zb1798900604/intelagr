<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html style="width:100%;height:100%;overflow:hidden">
<head>
<title>用户管理-五常优质水稻溯源监管平台</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/themes/color.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/form2js.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/json2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
</head>
<body class="easyui-layout">
	<div region="center" border="false" style="padding:5px;">	
		<form id="editUserFrom" class="easyui-form" method="post" data-options="novalidate:true">
			<fieldset class="fieldset_common_style">
			<table class="table_common_style">
				<tr>
	    			<td class="table_common_td_label_style">用户名:</td>
	    			<td class="table_common_td_txt_style">
	    			<input class="easyui-textbox" type="text" name="userID" value="${user.userID }" style="width:200px;" value="cszy" readonly></input>
	    			<input type="hidden" name="id" style="width:200px;" value="14"></input>
	    			</td>
    			</tr>
    			<tr>
	    			<td class="table_common_td_label_style">密码:</td>
	    			<td class="table_common_td_txt_style">
	    				<input class="easyui-textbox" type="password" name="password" style="width:200px;"></input>
	    				<span class="span_common_mustinput_style">*</span>
	    			</td>
    			</tr>
    			<tr height="50">
	    			<td colspan="2" align="center">
	    			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="formCheck()" data-options="iconCls:'icon-save'">保存</a>
	    			<a href="javascript:void(0)" class="easyui-linkbutton" style="margin-left:30px;" onclick="closeDialog()" data-options="iconCls:'icon-cancel'">取消</a>
	    			</td>
    			</tr>
			</table>
			</fieldset>
		</form>
	</div>
<script type="text/javascript">
function formCheck(){
	var a = $('#editUserFrom').toObject();
	if(a.password == ''){
		$.messager.alert('警告','密码不能为空。','warning');
		return false;
	}else if(a.password.length < 6){
		$.messager.alert('警告','密码至少6位。','warning');
		return false;
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/user/resetPwd",
		type:"post",
		data:a,
		success:function(e){
			if (200 == e.status) {
				$.messager.alert('提示','操作成功。','info');
				$('#addDialog').window('close');
				$('#userform').submit();
			} else
				$.messager.alert('错误',e.msg,'error');
		},
		dataType:"json"
	});

}

function closeDialog(){
	$('#addDialog').dialog('close');
}

function form_check(){
	$('#userform').submit();
}
</script>
</body>
</html>