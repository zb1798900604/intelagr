<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/tags/simple" %>

<!DOCTYPE html>
<html style="width:100%;height:100%;overflow:hidden">
<head>
<title>用户管理-五常优质水稻溯源监管平台</title>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/ajaxfileupload.js"></script>
	<script>
		var root = "${pageContext.request.contextPath}";
	</script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/upload.js"></script>
</head>
<body class="easyui-layout">
	<div region="center" border="false" style="padding:5px;">
		<form id="addFrom" class="easyui-form" method="post" data-options="novalidate:true">
		<input type="hidden" name="id" id="id" value=""/>
		<input type="hidden" name="settleStatus" id="settleStatus" value="01"/>
			<fieldset class="fieldset_common_style">
				<table class="table_common_style">
					<tr>
						<td>
						    <a href="#" class="easyui-linkbutton" onclick="return save();">
								<span class="l-btn-left">
								<span class="l-btn-text icon-save l-btn-icon-left">保存</span>
								</span>
							</a>
						</td>
					</tr>
				</table>
			</fieldset>
			<fieldset class="fieldset_common_style">
				<table class="table_common_style">
					<tr>
						<td class="table_common_td_label_style">企业名称：</td>
						<td colspan="3" class="table_common_td_txt_style">
							

		<select id="companyCode" name="companyCode" class="easyui-combobox" style="width:200px;height:25px" data-options="editable:true">
			<option value="" selected>-=请选择=-</option>
<%--			<s:select id="companyCode1" name="companyCode" codeKey="02" hasPleaseSelectOption="true" entityName="Company" width="170" value="${companyCode}"/>--%>
			<option value="GS001">五常市长盛种业有限公司</option>

			<option value="GS002">五常市利元种业有限公司</option>

			<option value="GS003">五常市龙洋种子有限公司</option>

			<option value="GS004">黑龙江阳光种业有限公司</option>

			<option value="GS005">五常市神农天源种子有限公司</option>

			<option value="GS006">五常市葵花阳光农业科技服务有限公司</option>

			<option value="GS007">东方粮仓种业科技发展有限公司</option>

			<option value="GS008">五常沃科收种业有限责任公司</option>

			<option value="GS009">五常市宏运种业有限公司</option>

			<option value="GS010">五常市绿珠种业科技有限公司</option>

			<option value="GS011">黑龙江方圆农业有限责任公司</option>

			<option value="GS012">五常市丰源农业科技创新有限责任公司</option>

			<option value="GS013">哈尔滨盛世百年农业有限公司</option>

		</select>

		 <input type="hidden" id="companyCode_companyName" name="companyName" value="">

		 <script type="text/javascript">

			 $(document).ready(function(){ 

				 $('#companyCode_companyName').val($('#companyCode option:selected').text());

				 $('#companyCode').combobox({ 

					 onChange:function(newValue,oldValue){

						 var ops = document.getElementById('companyCode').options;

						 for(var i=0;i<ops.length;i++){ 

							 if(ops[i].value == newValue){ 

								 $('#companyCode_companyName').val(ops[i].text); 

								 break; 

							 } 

						 } 

						 return false;; 

					 } 

				 });


				 $('#companyCode').combobox('textbox').bind('focus',function(){
					 var value = $('#companyCode').combobox('getValue');
					 var opts = $('#companyCode').combobox('getData');
						 if(value != ''){
							 var findFlag = false;
							 for(var i=0; i<opts.length; i++){
								 if(opts[i].value == value){
									 findFlag = true;
									 break;
								 }
							 }
							 if(!findFlag){
								 value = '';
								 $('#companyCode').combobox('setValue', '');
							 }
						 }
					 if(value == ''){
						 $('#companyCode').combobox('setText','');
					 }
				 }); 
				 $('#companyCode').combobox('textbox').bind('blur',function(){  
					 var value = $('#companyCode').combobox('getValue');
					 if(value == ''){
						 $('#companyCode').combobox('setText','-=请选择=-');
					 }
				 });
			 });

		</script>

						</td>
					</tr>
					<tr>
						<td class="table_common_td_label_style">投诉日期：</td>
						<td class="table_common_td_txt_style editableFalse" >
							<input class="easyui-datebox" name="complaintDate"  value="Sun May 21 00:00:00 CST 2017"
	                                     data-options="required:true,showSeconds:false,editable:false" style="width:170px">
						</td>
						<td class="table_common_td_label_style">购买日期：</td>
						<td class="table_common_td_txt_style editableFalse" >
							<input class="easyui-datebox" name="buySeedsDate" id="buySeedsDate" value=""
	                                    data-options="required:true,showSeconds:false,editable:false" style="width:170px">
						</td>
					</tr>
					<tr>
						<td class="table_common_td_label_style">投诉人：</td>
						<td class="table_common_td_txt_style">
							<input class="easyui-textbox"  type="text" id='complainant' name="complainant" value="" style="width:170px;"></input>
						</td>
						<td class="table_common_td_label_style">性别：</td>
						<td class="table_common_td_txt_style editableFalse">
							

		<select id="complainantSex" name="complainantSex" class="easyui-combobox" style="width:170px;height:25px" data-options="editable:false">
<option value="" selected>-=请选择=-</option>
			<option value="01">男</option>

			<option value="02">女</option>

		</select>

		 <script type="text/javascript">

			 $(document).ready(function(){ 

				 $('#complainantSex').combobox({ 

					 onChange:function(newValue,oldValue){

						 return false;

					 } 

				 });


			 });

		</script>
<BR>
						</td>
					</tr>
					<tr>
						<td class="table_common_td_label_style">联系电话：</td>
						<td class="table_common_td_txt_style">
							<input class="easyui-textbox" id='complainantTel' type="text" name="complainantTel" value="" style="width:170px;"></input>
						</td>
						<td class="table_common_td_label_style">联系邮箱：</td>
						<td class="table_common_td_txt_style">
							<input class="easyui-textbox" type="text" id="complainantMail" name="complainantMail" value="" style="width:170px;"></input>
						</td>
					</tr>
					<tr>
						<td class="table_common_td_label_comment_style">诉投内容：</td>
						<td colspan="3" class="table_common_td_txt_style">
							<textarea class="easyui-textbox" rows="5" cols="66" id='complaintContent' name="complaintContent" style="font-size:12px;height:80px;width:560px;" data-options="multiline:true" ></textarea>
						</td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>
	<div id="addDialog"></div>
	<div id="uploadDialog"></div>
	
<script type="text/javascript">
	function save(){
		
		if(!check()) return false;
		var a = $('#addFrom').toObject();
		showLoading();
		Public.ajaxPost('/seedCPLT/save', JSON.stringify(a), function(e) {
			hideLoading();
			if (200 == e.status) {
				$.messager.alert('提示','保存成功。','info');
				if( e.data.id != "" ){
					$("#id").val( e.data.id );
				}
				document.location.href = "${pageContext.request.contextPath}/seedCPLT/editInput";
			} else {
				$.messager.alert('错误','保存失败！'+ e.msg,'error');
			}
		});
	}
	function retList(){
		window.document.location.href = "${pageContext.request.contextPath}/inputReg/list";
	}
	function closeEdiDialog(){
		$('#addDialog').dialog('close');
	}
	
	function check(){
		var companyCode = $('#companyCode').combobox('getValue');
		if(companyCode == ''){
			$.messager.alert('警告','请选择企业。','warning');
			return false;
		}
		if($('#buySeedsDate').datebox('getValue')==""){
			$.messager.alert('警告','请输入购买日期。','warning');
			return false;
		}
		if($('#complainant').val()==""){
			$.messager.alert('警告','请输入投诉人姓名。','warning');
			return false;
		}
		if($('#complainantSex').combobox('getValue')==""){
			$.messager.alert('警告','请选择性别。','warning');
			return false;
		}
		if($('#complainantTel').val()==""){
			$.messager.alert('警告','请输入投诉人联系电话。','warning');
			return false;
		}
		if(!isTel($("#complainantTel").val())){
			$.messager.alert('警告','请填写正确的电话号码或者手机号。','warning');		
			return false;
		}
		var mailbox = $.trim($("#complainantMail").val());
		if(mailbox!=""&&mailbox!=null&&!isEmail(mailbox)){
			$.messager.alert('警告','请填写正确邮箱地址。','warning');		
			return false;
		}
		if($('#complaintContent').val()==""){
			$.messager.alert('警告','请输入投诉内容。','warning');
			return false;
		}
		return true;
	}
</script>
</body>
</html>