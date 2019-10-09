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
		<form id="addFrom" class="easyui-form" method="post" data-options="novalidate:true">
			<input type="hidden" name="id" id="id" value="">
			<fieldset class="fieldset_common_style">
				<table class="table_common_style">
					<tr>
		    			<td class="table_common_td_label_style">年度：</td>
	    			
	    			
	    				<td class="table_common_td_txt_style editableFalse">
	    					

		<select id="year2" name="year" class="easyui-combobox" style="width:187px;height:25px" data-options="editable:false">

			<option value="2015">2015年</option>

			<option value="2014">2014年</option>

		</select>

		 <script type="text/javascript">

			 $(document).ready(function(){ 

				 $('#year2').combobox({ 

					 onChange:function(newValue,oldValue){

						 return false;

					 } 

				 });


			 });

		</script>

	    					<span class="span_common_mustinput_style">*</span>
	    				</td>
	    			
	    			</tr> 
	    			<tr>
		    			<td class="table_common_td_label_style">品种：</td>
		    			<td class="table_common_td_txt_style">
		    				


		<select id="seedCode" name="seedCode" class="easyui-combobox" style="width:187px;height:25px" data-options="editable:false">

			<option value="1">稻花香2号</option>

		</select>

		 <script type="text/javascript">

			 $(document).ready(function(){ 

				 $('#seedCode').combobox({ 

					 onChange:function(newValue,oldValue){

						 return false;

					 } 

				 });


			 });

		</script>

		    			</td>
	    			</tr>
	    			<tr>
		    			<td class="table_common_td_label_style">最小亩产量(斤)：</td>
		    			<td class="table_common_td_txt_style">
		    				<input class="easyui-numberbox" precision="1"  type="text" name="minYield" value="" data-options="min:0,max:999999999.99,precision:2,groupSeparator:','" style="width:187px;"></input>
		    				<span class="span_common_mustinput_style">*</span>
		    			</td>
	    			</tr>
	    			<tr>
		    			<td class="table_common_td_label_style">最大亩产量(斤)：</td>
		    			<td class="table_common_td_txt_style">
		    				<input class="easyui-numberbox" precision="1" type="text" name="maxYield" value="" data-options="min:0,max:999999999.99,precision:2,groupSeparator:','"  style="width:187px;"></input>
		    				<span class="span_common_mustinput_style">*</span>
		    			</td>
	    			</tr>
	    			<tr height="80">
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
	var year = $("#year2").combobox('getValue');
	var seedCode = $("#seedCode").combobox('getValue');
	var seedName = $("#seedCode").combobox('getText');
	var id = $("#id").val();
	if( id == "" ){
		Public.ajaxPost('validateYearAndSeed?year=' + year +"&seedCode=" + seedCode, [], function(e) {
			if (200 == e.status) {
				if( e.data.flag == "1" ){	
					$.messager.alert('警告',year + "年度[" + seedName + "]种子的种源评估参数已经维护！",'warning');
					return;
				}else{
					save();
				}
			} else {
				$.messager.alert('错误','异常，请联系系统管理员！','error');
				return false;
			}
		});
	}else{
		save();
	}
}

function save(){
	var a = $('#addFrom').toObject();
	showLoading();
	Public.ajaxPost('save', JSON.stringify(a), function(e) {
		hideLoading();	
		if (200 == e.status) {
			$.messager.alert('提示','保存成功。','info');
			$('#addDialog').window('close');
			$('#inputForm').submit();
		} else {
			$.messager.alert('错误','保存失败！'+ e.msg,'error');
		}
	});
	
}

function closeEdiDialog(){
	$('#addDialog').dialog('close');
}

function check(){
	if($("input[name='minYield']").val()==""){
		$.messager.alert('警告','请填写最小产量。','warning');
		return false;
	}else if (!isNumber($("input[name='minYield']").val())){
		$.messager.alert('警告','最小产量请输入数字。','warning');
		return false;
	}
	if($("input[name='maxYield']").val()==""){
		$.messager.alert('警告','请填写最大产量。','warning');
		return false;
	}else if (!isNumber($("input[name='maxYield']").val())){
		$.messager.alert('警告','最大产量请输入数字。','warning');
		return false;
	}	

	if(parseFloat($("input[name='minYield']").val())>parseFloat($("input[name='maxYield']").val())){
		$.messager.alert('警告','最小产量不能大于最大产量。','warning');
		return false;
	}
	return true;
}
</script>
</body>
</html>