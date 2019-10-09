<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html style="width:100%;height:100%;overflow:hidden">
<head>
<meta charset="utf-8">

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

</head>
<body class="easyui-layout">
	<div region="center" border="false" style="padding:5px;">
		 
			<form id="inputFrom" name="inputFrom" method="get" action="../geneLandReg/list">
				 <input type="hidden" name="id" id="id" value="">
				 <input type="hidden" name="archiveAcreage" id="archiveAcreage">
				 <input type="hidden" name="operatorName" id="operatorName" value="">
				 <input type="hidden" name="operatorDate" id="operatorDate" value="">
				 <!-- 承包方类型 -->
				 <input type="hidden" name="" id="contractorTypeTmp" value="">
				 <!-- 证件类型 -->
				 <input type="hidden" name="idType" id="idTypeTmp" value="">
				 <!-- 证件号码 -->
				 <input type="hidden" name="contractorID" id="contractorIDTmp" value="">
				 <!-- 承包人 -->
				 <input type="hidden" name="contractorName" value="contractorName">
				 <!-- 联系方式 -->
				 <input type="hidden" name="contractorTelTmp" id="contractorTelTmp" value="">
				 
				 <input type="hidden" id="applyBatchNo" name="applyBatchNo" value="PT20170521000003"/>
				 <input type="hidden" name="townCode" value="1">
				 <input type="hidden" name="countryCode" value="2">
				 <input type="hidden" name="groupName" value="3">
				 <input type="hidden" name="status" id="status" value="01">
			<fieldset id="queryBlock" class="fieldset_common_style">
			<table class="table_common_style">
				<tr>
					<td class="table_common_td_label_style">申请批次号：</td>
					<td class="table_common_td_txt_style">
						PT20170521000003
					</td>
				</tr>
				<tr>
					<td class="table_common_td_label_style">年度：</td>
					<td class="table_common_td_txt_style editableFalse">
						


		<select id="year" name="year" class="easyui-combobox" style="width:187px;height:25px" data-options="editable:false">

			<option value="2015">2015年</option>

			<option value="2014">2014年</option>

		</select>

		 <script type="text/javascript">

			 $(document).ready(function(){ 

				 $('#year').combobox({ 

					 onChange:function(newValue,oldValue){

						 return false;

					 } 

				 });


			 });

		</script>

						<span class="span_common_mustinput_style">*</span>
					</td>
					<td class="table_common_td_label_style">企业：</td>
					<td class="table_common_td_txt_style editableFalse">
						


	

		<select id="companyCode" name="companyCode" class="easyui-combobox" style="width:187px;height:25px" data-options="editable:true">
<option value="" selected>-=请选择=-</option>
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

			<option value="GS100">五常市金福粮油有限公司</option>

			<option value="GS101">五常市汤洪斌水稻种植农民专业合作社</option>

			<option value="GS102">五常市农之坊水稻种植农民专业合作社</option>

			<option value="GS103">五常市浩海水稻种植农民专业合作社</option>

			<option value="GS104">五常市首誉水稻种植农民专业合作社</option>

			<option value="GS105">五常市百谷香水稻种植农民专业合作社</option>

			<option value="GS106">五常市雪国粮仓水稻种植专业合作社</option>

			<option value="GS107">五常市明栎水稻种植专业合作社</option>

			<option value="GS108">五常市永顺丰水稻种植农民专业合作社</option>

			<option value="GS109">五常市秋然稻香水稻种植农民专业合作社</option>

			<option value="GS110">五常市千盈水稻种植专业合作社</option>

			<option value="GS111">五常裕禾田水稻种植农民专业合作社</option>

			<option value="GS112">五常市曾氏水稻种植专业合作社</option>

			<option value="GS113">五常市官仓稻场水稻种植农民专业合作社</option>

			<option value="GS114">五常市海兴水稻种植农民专业合作社</option>

			<option value="GS115">五常市积养源水稻种植农民专业合作社</option>

			<option value="GS116">五常市那军水稻种植农民专业合作社</option>

			<option value="GS117">五常市德双水稻种植专业合作社</option>

			<option value="GS118">五常市康基水稻种植专业合作社</option>

			<option value="GS119">双涛水稻种植合作社</option>

			<option value="GS120">五常市小稻夫水稻种植农民专业合作社</option>

			<option value="GS121">五常市郑文波水稻种植专业合作社</option>

			<option value="GS122">文龙水稻种植专业合作社</option>

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



						<span class="span_common_mustinput_style">*</span>
					</td>
				</tr>
			</table>
			</fieldset>	
			<fieldset id="toolBlock" class="fieldset_common_style">
			<table>
				
				<tr>
					<td>
						<a href="#" class="easyui-linkbutton" onclick="return addLandRegD();">
							<span class="l-btn-left">
							<span class="l-btn-text icon-add l-btn-icon-left">添加地块</span>
							</span>
						</a>
						<a href="#" class="easyui-linkbutton" onclick="return editLand();">
							<span class="l-btn-left">
							<span class="l-btn-text icon-edit l-btn-icon-left">修改地块
							</span></span>
						</a>
						<a href="#" class="easyui-linkbutton" onclick="return deleteLand();">
							<span class="l-btn-left">
							<span class="l-btn-text icon-remove l-btn-icon-left">删除地块</span></span>
						</a>
						<a href="#" class="easyui-linkbutton" onclick="javascript:copyData();">
							<span class="l-btn-left">
							<span class="l-btn-text icon-import l-btn-icon-left">复制上年备案
							</span>
							</span>
						</a>
						<a href="#"  class="easyui-linkbutton" onclick="javascript:importData();">
							<span class="l-btn-left">
							<span class="l-btn-text icon-import l-btn-icon-left">
							导入</span></span>
						</a>
						
						
							<a href="#" class="easyui-linkbutton"  data-options="iconCls:'icon-save'" onclick="return save();">保存</a>
							<a href="#" class="easyui-linkbutton" onclick="return submitAudit();">
								<span class="l-btn-left">
								<span class="l-btn-text icon-ok l-btn-icon-left">提交申请</span></span>
							</a>
						
						
					</td>
				</tr>				
			</table>
			</fieldset>
		<!-- Modify By WolfSoul Begin -->
		<table id="geneLandData" class="easyui-datagrid" striped="true" singleSelect="false" style="table-layout:fixed;border-collapse: collapse;">
			<thead> 
				<tr> 
					<th field="contractorValue" width="30" align="center" checkbox="true">选择</th>
					<th field="contractorType" align="center" hidden="true"></th>
					<th field="contractorText" width="120" align="center" nowrap="nowrap">承包方类型</th>
					<th field="idType" align="center" hidden="true"></th>
					<th field="idTypeText" width="120" align="center" nowrap="nowrap">证件类型</th>
					<th field="contractorID" width="150" align="center" nowrap="nowrap">证件号码</th>
					<th field="contractorName" width="120" align="center" nowrap="nowrap">承包方</th>
					<th field="contractorTel" align="center" hidden="true"></th>
					<th field="cityCode" align="center" hidden="true"></th>
					<th field="townCode" align="center" hidden="true"></th>
					<th field="townText" width="120" align="center" nowrap="nowrap">所在乡</th>
					<th field="countryCode" align="center" hidden="true"></th>
					<th field="countryText" width="120" align="center" nowrap="nowrap">所在村</th>
					<th field="groupName" width="200" align="center" nowrap="nowrap">住址</th>
					<th field="zmj" width="130" align="center" nowrap="nowrap">承包总面积（亩）</th>
					<th field="yba" width="130" align="center" nowrap="nowrap">已备案面积（亩）</th>
					<th field="kba" width="130" align="center" nowrap="nowrap">可备案面积（亩）</th>
					<th field="archiveAcreage" width="130" align="center" nowrap>本次备案面积（亩）</th>
					<th field="operatorName" width="130" align="center" nowrap="nowrap">经办人</th>
					<th field="operatorDate" width="120" align="center" nowrap="nowrap">经办日期</th> 
				</tr>
			</thead>
			<tbody id="dataBody">
						
			</tbody>
		</table>
		
		</form>
	</div>
	<div id="addDialog"></div>
	<div id="importDialog"></div>
	
<script type="text/javascript">
$(document).ready(function(){
	 var winHeight = $(window).height();
     var queryBlockHeight = $("#queryBlock").height();
     var toolBlock = $("#toolBlock").height();
	//Modify By WolfSoul Begin
	$("#geneLandData").datagrid({ 
        height:winHeight -queryBlockHeight -toolBlock - 50,
        rownumbers: true,
        fitColumns: false
	});
	//Modify By WolfSoul End
});

function getJsonObject( ){
	//Modify By WolfSoul Begin
	var jObj = [];
	var rows = $('#geneLandData').datagrid('getRows');
	for( var i = 0; i < rows.length; i++ ){
		var d = {};
		d.contractorType = rows[i].contractorType;
		d.idType = rows[i].idType;
		d.contractorID = rows[i].contractorID;
		d.contractorName = rows[i].contractorName;
		
		d.townCode = rows[i].townCode;
		d.countryCode = rows[i].countryCode;
		
		d.groupName = rows[i].groupName;
		d.archiveAcreage = rows[i].archiveAcreage;
		d.operatorName = rows[i].operatorName;
		d.operatorDate = rows[i].operatorDate;
		d.contractorTel = rows[i].contractorTel;
		d.contractTotalYield = rows[i].zmj;
		d.zmj = rows[i].zmj;
		d.registeredTotalYield = rows[i].yba;
		d.yba = rows[i].yba;
		
		jObj.push( d );
	}
	return jObj;
	//Modify By WolfSoul End
}

/**
* 页面保存按钮功能
*/
function save( ){
	if( $("#applyBatchNo").val() == "" ){
		$.messager.alert('警告','申请批次号不能为空！','warning');
		return false;
	}
	if( $("#companyCode").combobox('getValue') == "" ){
		$.messager.alert('警告','请选择企业！','warning');
		return false;
	}
	var checkBoxs = $("input[name='contractorValue']");
	if(checkBoxs.length==0){
		$.messager.alert('警告','没有可以保存的土地信息！','warning');
		return false;
	}
	var a = $('#inputFrom').toObject();
	//初始化子表数据
	a.list = getJsonObject();
	showLoading();
	Public.ajaxPost('${pageContext.request.contextPath}/geneLandReg/save', JSON.stringify(a), function(e) {
		hideLoading();
		if (200 == e.status) {
			$.messager.alert('提示','操作成功。','info', function(){
				var retFlag = "";
				if( retFlag == "1" ){//为1表示从一览页面过来的;
					retList();
				}else{
					document.location.href = "${pageContext.request.contextPath}/geneLandReg/editInput";
				}
			});
		} else {
			$.messager.alert('错误','操作失败！' + e.msg,'error');
		}
	});
}

function closeEdiDialog(){
	$('#provEvalEditDlg').dialog('close');
}
//增加地块
function addLandRegD(){
	var year = $("#year").combobox('getValue');
	$('#addDialog').dialog({
	    title: '添加地块信息',
	    width: 800,
	    height: 480,
	    closed: false,
	    cache: false,
	    href: 'geneLandRegDEdit.jsp',
	    modal: true
	});
}
//删除地块
function deleteLand(){
	//Modify By WolfSoul Begin
	var rows = $('#geneLandData').datagrid('getSelections');
	var length = rows.length;
	if(length == 0){
	  $.messager.alert('警告','至少选择一条记录。','warning');
		return false;
	}

    $.messager.confirm("确认", "您确认删除选定的记录吗？", function (deleteAction) {
	    if (deleteAction) {
	      var length = rows.length;
	      for(var i=0; i<rows.length; i++){
	          var index = $('#geneLandData').datagrid('getRowIndex',rows[i]);
	          $('#geneLandData').datagrid('deleteRow',index);
	      }
	    }
	});
	//Modify By WolfSoul End

}

function editLand(){
	var year = $("#year").combobox('getValue');
	//Modify By WolfSoul Begin
	var rows = $('#geneLandData').datagrid('getSelections');
	var length = rows.length;
	if(length == 0){
		$.messager.alert('警告','至少选择一条记录。','warning');
		return false;
	}
	if(length > 1){
		$.messager.alert('警告','只能选择一条记录。','warning');
		return false;
	}
	var rowIndex = $('#geneLandData').datagrid('getRowIndex',$('#geneLandData').datagrid('getSelected'));
	var row = $('#geneLandData').datagrid('getData').rows[rowIndex];
	var id = row.contractorValue;
	
	$('#addDialog').dialog({
	    title: '修改地块信息',
	    width: 800,
	    height: 480,
	    closed: false,
	    cache: false,
	    href: '${pageContext.request.contextPath}/geneLandRegD/editInput?flag=edit&rowIndex='+rowIndex+'&conInfo=' + encodeURIComponent(id) + "&t=" + (new Date).getTime() + "&year=" + year,
	    modal: true
	});
	//Modify By WolfSoul End
}

//提交申请
function submitAudit(){
	if( $("#companyCode").combobox('getValue') == "" ){
		$.messager.alert('警告','请选择企业！','warning');
		return false;
	}
	var checkBoxs = $("input[name='contractorValue']");
	if(checkBoxs.length==0){
		$.messager.alert('警告','请添加待备案的土地信息后再执行提交审核操作！','warning');
		return false;
	}
	//初始化二次确权数据
	var a = {};
	a.list = getJsonObject();
	var year = $("#year").combobox('getValue');
	showLoading();
	Public.ajaxPost('${pageContext.request.contextPath}/api/checkGeneRegExt?year=' + year, JSON.stringify(a), function(e) {
		hideLoading();
		if ("0" == e.status) {
			document.getElementById('status').value='02';
			save();
		} else {
			$.messager.alert('错误','操作失败！' + e.msg,'error');
		}
	});
}
function retList(){
	var url = "${pageContext.request.contextPath}/geneLandReg/list";
	url += "?year=";
	url += "&page=";
	url += "&pageSize=";
	url += "&companyCode=";
	url += "&beginDate=";
	url += "&endDate=";
	url += "&status=";
	
	document.location.href = url;
}
//复制上年度数据
function copyData(){
	var year = $("#year").combobox('getValue');
	var companyCode = $("#companyCode").combobox('getValue');
	if( companyCode == "" ){
		$.messager.alert('警告','请选择企业！','warning');
		return false;
	}
	if( year == "" ){
		$.messager.alert('警告','请选择年度！','warning');
		return false;
	}
	var info = "当前年度是"+year + "，您确认要复制" + (year-1) +"年度的数据吗？";
	$.messager.confirm("确认", info, function (deleteAction) {
	    if (deleteAction) {
	        showLoading();
	        var url = "${pageContext.request.contextPath}/geneLandReg/copyData";
	        url += "?year=" + year;
	        url += "&companyCode=" + companyCode + "&t="+(new Date()).getTime();
	        var ids = [];
	        var param = {};
			Public.ajaxGet(url, {ids : ids}, function(e) {
				hideLoading();
				if (200 == e.status) {
					appendRowData( e.data.landList, e.data.operatorDate );
				} else
					$.messager.alert('错误','操作失败！' + e.msg,'error');
			});
	    }
	});
}
function appendRowData( landInfo, operatorDate ){
	$('#geneLandData').datagrid('loadData', { total: 0, rows: [] });
	for( var data in landInfo ){
		var value = "";
		value += landInfo[data].contractorType;
		value += ",";
		value += landInfo[data].idType;
		value += ",";
		value += landInfo[data].contractorID;
		value += ",";
		value += landInfo[data].archiveAcreage;
		value += ",";
		value += landInfo[data].operatorName;
		value += ",";
		value += operatorDate;
		value += ",";
		value += landInfo[data].contractorName;
		value += ",";
		value += landInfo[data].contractorTel;
		value += ",";
		value += landInfo[data].townCode;
		value += ",";
		value += landInfo[data].countryCode;
		value += ",";
		value += landInfo[data].groupName;
		value += ",0";
		$('#geneLandData').datagrid('appendRow', {
			contractorValue: value,
			contractorType: landInfo[data].contractorType,
			contractorText: landInfo[data].contractorTypeName,
			idType: landInfo[data].idType,//证件类型列是隐藏的
			idTypeText: landInfo[data].idName,
			contractorID:  landInfo[data].contractorID,
			contractorName: landInfo[data].contractorName,
			contractorTel: landInfo[data].contractorTel,//联系人电话列是隐藏的
			cityCode: landInfo[data].cityCode,//市编码列是隐藏的
			townCode: landInfo[data].townCode,//镇编码列是隐藏的
			townText: landInfo[data].townName,
			countryCode: landInfo[data].countryCode,//村编码列是隐藏的
			countryText: landInfo[data].countryName,
			groupName: landInfo[data].groupName,
			zmj: landInfo[data].contractTotalYield,
			yba: landInfo[data].registeredTotalYield,
			kba: landInfo[data].kba,
			archiveAcreage: landInfo[data].archiveAcreage,
			operatorName: landInfo[data].operatorName,
			operatorDate: operatorDate
		});	
	}
}
/**
*  导入数据
*/
function appendImportData( landInfo ){
	$('#geneLandData').datagrid('loadData', { total: 0, rows: [] });
	for( var data in landInfo ){
		var value = "";
		value += landInfo[data].contractorType;
		value += ",";
		value += landInfo[data].idType;
		value += ",";
		value += landInfo[data].contractorID;
		value += ",";
		value += landInfo[data].archiveAcreage;
		value += ",";
		value += landInfo[data].operatorName;
		value += ",";
		value += landInfo[data].operatorDateStr;
		value += ",";
		value += landInfo[data].contractorName;
		value += ",";
		value += landInfo[data].contractorTel;
		value += ",";
		value += landInfo[data].townCode;
		value += ",";
		value += landInfo[data].countryCode;
		value += ",";
		value += landInfo[data].groupName;
		value += ",0";
		$('#geneLandData').datagrid('appendRow', {
			contractorValue: value,
			contractorType: landInfo[data].contractorType,
			contractorText: landInfo[data].contractorTypeName,
			idType: landInfo[data].idType,//证件类型列是隐藏的
			idTypeText: landInfo[data].idName,
			contractorID:  landInfo[data].contractorID,
			contractorName: landInfo[data].contractorName,
			contractorTel: landInfo[data].contractorTel,//联系人电话列是隐藏的
			cityCode: landInfo[data].cityCode,//市编码列是隐藏的
			townCode: landInfo[data].townCode,//镇编码列是隐藏的
			townText: landInfo[data].townName,
			countryCode: landInfo[data].countryCode,//村编码列是隐藏的
			countryText: landInfo[data].countryName,
			groupName: landInfo[data].groupName,
			zmj: landInfo[data].contractTotalYield,
			yba: landInfo[data].registeredTotalYield,
			kba: landInfo[data].kba,
			archiveAcreage: landInfo[data].archiveAcreage,
			operatorName: landInfo[data].operatorName,
			operatorDate: landInfo[data].operatorDateStr
		});	
	}
}

//导入
function importData(){
	var year = $("#year").combobox('getValue');
	if( year == "" ){
		$.messager.alert('警告','请选择年度！','warning');
		return false;
	}
	$('#importDialog').dialog({
	    title: '导入土地备案信息',
	    width: 460,
	    height: 280,
	    closed: false,
	    cache: false,
	    href: 'importEdit.jsp',
	    modal: true
	});
}

function importTempDown(){
	document.location.href = "${pageContext.request.contextPath}/temp/普通土地备案导入模板.xlsx";
}
</script>
</body>
</html>