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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
</head>
<body class="easyui-layout">
	<div region="center" border="false" style="padding: 5px;">
		<form id="addFrom" class="easyui-form" method="post" data-options="novalidate:true">
			<input name="id" value="" type="hidden">
			<fieldset id="queryBlock" class="fieldset_common_style">
				<table class="table_common_style">
					<tr>
		    			<td class="table_common_td_label_style">监测日期：</td>
		    			<td class="table_common_td_txt_style">
		    				<input class="easyui-datebox" id="monitorDate" name="monitorDate"  value="Sun May 21 00:00:00 CST 2017" 
	            data-options="showSeconds:false" style="width:170px" editable="false">
		    			</td>
	    			</tr>
	    			<tr>
						<td class="table_common_td_label_style">监测点位：</td>
		    			<td class="table_common_td_txt_style">
		    				<select name="monitorPointCode" class="easyui-combobox" style="width:170px;" data-options="editable:false">

	<option value="dq001" >大气121</option>

	<option value="dq2" >大气2</option>

	<option value="sf" >ss</option>

</select>
		    			</td>
	    			</tr>
	    			<tr>
		    			<td class="table_common_td_label_style">TSP(mg/m³)：</td>
		    			<td class="table_common_td_txt_style">
		    				<input class="easyui-numberbox" type="text" id="tsp" name="tsp" value=""  data-options="min:0,max:999999999.99,precision:2,groupSeparator:','"style="width:170px;"></input>
		    				<span class="span_common_mustinput_style">*</span>
		    			</td>
	    			</tr>
	    			<tr>
		    			<td class="table_common_td_label_style">SO2(mg/m³)：</td>
		    			<td class="table_common_td_txt_style">
		    				<input class="easyui-numberbox" type="text" id="so2" name="so2" value=""  data-options="min:0,max:999999999.99,precision:3,groupSeparator:','" style="width:170px;"></input>
		    				<span class="span_common_mustinput_style">*</span>
		    			</td>
	    			</tr>
	    			<tr>
		    			<td class="table_common_td_label_style">NO2(mg/m³)：</td>
		    			<td class="table_common_td_txt_style">
		    				<input class="easyui-numberbox" type="text" id="no2" name="no2" value=""  data-options="min:0,max:999999999.99,precision:3,groupSeparator:','" style="width:170px;"></input>
		    				<span class="span_common_mustinput_style">*</span>
		    			</td>
	    			</tr>
	    			<tr height="70">
		    			<td colspan="2" align="center">
			    			<a href="#" class="easyui-linkbutton" onclick="formCheck()" data-options="iconCls:'icon-save'">保存</a>
			    			<a href="#" class="easyui-linkbutton" style="margin-left:15px;" onclick="closeEdiDialog()" data-options="iconCls:'icon-cancel'">取消</a>
		    			</td>
	    			</tr>
				</table>
			</fieldset>
		</form>
	</div>
	<script type="text/javascript">

function formCheck(){
	if(!check()) return ;
	var a = $('#addFrom').toObject();
	Public.ajaxPost('save', JSON.stringify(a), function(e) {
		if (200 == e.status) {
			$.messager.alert('提示','保存成功。','info');
			closeEdiDialog();
			$('#inputForm').submit();
		} else {
			$.messager.alert('错误','处理失败。','error');
		}
	});
}

function closeEdiDialog(){
	$('#addDialog').dialog('close');
}

function check(){
	if($("#tsp").val()==""){
		$.messager.alert('警告','请填写TSP！','warning');
		return false;
	}else if (!isNumber($("input[name='tsp']").val())){
		$.messager.alert('警告','TSP请输入数字。','warning');
		return false;
	}
	if($("#so2").val()==""){
		$.messager.alert('警告','请填写SO2！','warning');
		return false;
	}else if (!isNumber($("input[name='so2']").val())){
		$.messager.alert('警告','SO2请输入数字！','warning');
		return false;
	}
	if($("#no2").val()==""){
		$.messager.alert('警告','请填写NO2！','warning');
		return false;
	}else if (!isNumber($("input[name='no2']").val())){
		$.messager.alert('警告','NO2请输入数字！！','warning');
		return false;
	}
	return true;
} 
</script>
</body>
</html>