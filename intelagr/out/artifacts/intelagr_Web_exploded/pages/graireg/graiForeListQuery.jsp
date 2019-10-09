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
	<div region="center" border="false" style="padding:5px;">
		<fieldset id="queryBlock" class="fieldset_common_style">
			<form id="inputForm" name="inputForm" method="get" action="../graiFore/listquery">
				<input type='hidden' id="pageTotal" name="pageTotal" value="0" />
				<input type="hidden" id="page" name="page" value="1">
				<input type="hidden" id="pageSize" name="pageSize" value="15">
				
				<table class="table_common_style">
					<tr>
						<td class="table_common_td_label_query_style">年度：</td>
						<td class="table_common_td_txt_query_style editableFalse">
							


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

						</td>
						<td class="table_common_td_label_query_style">企业：</td>
						<td class="table_common_td_txt_query_style">
							

	

		<select id="companyCode" name="companyCode" class="easyui-combobox" style="width:187px;height:20px" data-options="editable:true">
<option value="" selected>-=请选择=-</option>
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


						</td>
					</tr>
					<tr>
						<td class="table_common_td_label_query_style">预报日期：</td>
						<td colspan="2" class="table_common_td_txt_query_style editableFalse">
							<input class="easyui-datebox" name="beginDate" id="beginDate" value=""
	            				data-options="required:false,showSeconds:false" style="width:100px" editable="false"/>
							~
							<input class="easyui-datebox" id="endDate" name="endDate" value=""
	            				data-options="required:false,showSeconds:false" style="width:100px" editable="false"/>
						</td>
						<td align="right" valign="bottom">
	                       	<a href="#" class="easyui-linkbutton" onclick="return form_check();">
	                       		<span class="l-btn-left"><span class="l-btn-text icon-search l-btn-icon-left">查询</span></span>
	                       	</a>
	             		</td>
					</tr>
				</table>
			
			</form>
		</fieldset>
		<fieldset id="toolBlock" class="fieldset_common_style">
			<table>
				<tr>
					<td>
						<a href="#" class="easyui-linkbutton" onclick="return view();">
							<span class="l-btn-left">
								<span class="l-btn-text icon-view l-btn-icon-left">查看</span>
							</span>
						</a>
						<a href="#" class="easyui-linkbutton" onclick="return deleteRecord();">
							<span class="l-btn-left">
								<span class="l-btn-text icon-remove l-btn-icon-left">删除</span>
							</span>
						</a>
						<a href="#" class="easyui-linkbutton" onclick="return viewReport();">
							<span class="l-btn-left">
								<span class="l-btn-text icon-export l-btn-icon-left">预报报表导出</span>
							</span>
						</a>
					</td>
				</tr>
			</table>
		</fieldset>	
		<table id="data" class="easyui-datagrid" striped="true" singleSelect="false" pageSize="15" pageNumber="1">
			<thead>
				<tr>
					<th field="id" width="140" align="center" checkbox="true"></th>
					<th field="year" width="60" align="center">年度</th>
					<th field="companyName" width="140" align="center">企业</th>
					<th field="name" width="100" align="center">农户姓名</th>
					<th field="idNumber" width="130" align="center">身份证号</th>
					<th field="inputName" width="120" align="center">实（亩）合计</th>
					<th field="inpuDealer" width="120" align="center">测量（亩）合计</th>
					<th field="purchaseQuantity" width="120" align="center">预估总产量（斤）</th>
					<th field="purchasingAgent" width="120" align="center">预报日期</th>
					<th field="zy" width="120" align="center">争议地块</th>
				</tr>
			</thead>
			<tbody>
				
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>合计：</td>
					<td>0.00</td>
					<td>0.00</td>
					<td>0.00</br>0.00</td>
					<td></td>
				</tr>	
			</tbody>
		</table>
	</div>
	<div id="addDialog"></div>
	<div id="expDialog"></div>
	
<script type="text/javascript">
$(document).ready(function(){
	var winHeight = $(window).height();
    var queryBlockHeight = $("#queryBlock").height();
    var toolBlock = $("#toolBlock").height();
	$("#data").datagrid({ 
		onLoadSuccess:function(data){
			$(".datagrid-cell-check")[data.rows.length-1].innerHTML = "";
	    },
	    onSelectAll:function(rows){
	    	 $('#data').datagrid('unselectRow',rows.length-1);
	    },
	    onSelect:function(index,row){
	    	var rows  = $('#data').datagrid("getRows");
	    	if(index == rows.length-1){
	    		$('#data').datagrid('unselectRow', index);
	    	}
	    },
		height:winHeight -queryBlockHeight -toolBlock-50,
		pagination: true,
        rownumbers: true,
        fitColumns: false,
        //fit: true,
        pageList: [15,20,25],
        pagePosition: "top"
	});
	
	var pagger = $('#data').datagrid('getPager');  
	$(pagger).pagination({
		total: $("#pageTotal").val(),
		pageNumber: parseInt($("#page").val()),
		showPageList: true,
		showRefresh:false,
	    onSelectPage: function(pageNumber, pageSize){
	    	$('#page').val(pageNumber);
	    	$('#pageSize').val(pageSize);
	    	$('#inputForm').submit();
	    }
	});
});

function deleteRecord(id){
	var ids = [];
	var rows = $('#data').datagrid('getSelections');
	var length = rows.length;
	if(length < 1){
		$.messager.alert('警告','请至少选择一条记录。','warning');
		return false;
	}
	$.messager.confirm("确认", "您确认删除选定的记录吗？", function (deleteAction) {
	    if (!deleteAction) {
			return false;
	    }
		showLoading();
		for(var i=0; i<rows.length; i++) ids.push(rows[i].id);
		Public.ajaxGet('delete', {ids : ids}, function(e) {
			if (200 == e.status) {
				form_check();
			} else{
				hideLoading();
				$.messager.alert('错误','删除失败！' + e.msg,'error');
			}
		});
	});
}

function edit(id){
	var rows = $('#data').datagrid('getSelections');
	var length = rows.length;
	if(length == 0 ){
		$.messager.alert('警告','请选择一条记录！','warning');
		return false;
	}
	if(length > 1){
		$.messager.alert('警告','只能选择一条记录！','warning');
		return false;
	}
	var id = rows[0].id;
	
	document.location.href = "${pageContext.request.contextPath}/graiReg/editInput?id=" + id;
}
function add(id){
	document.location.href = "${pageContext.request.contextPath}/graiReg/editInput";
}

function closeEdiDialog(){
	$('#provEvalEditDlg').dialog('close');
}

function viewReport(){
	var year = $("#year").val();
	var companyCode = $("#companyCode").combobox('getValue');
	var companyName = $("#companyCode").combobox('getText');
	var beginDate = $("#beginDate").val();
	var endDate = $("#endDate").val();
	
	var param = 'year='+year + "&companyCode=" + companyCode + "&companyName=" + companyName + "&t=" + (new Date).getTime();
	param += "&beginDate=" + beginDate;
	param += "&endDate=" + endDate;
	
	Public.ajaxGet("checkExcel?"+param, {},
		function(e) {
		if (200 == e.status) {
			if(e.data > 0){
				window.open("expExcel?"+param);
			}else{
				$.messager.alert('提示','没有可导出的数据。','info');
			}
		} else {
			$.messager.alert('提示','导出失败。' + e.msg,'info');
		}
	});
}

function view(){
	var rows = $('#data').datagrid('getSelections');
	var length = rows.length;
	if(length == 0 ){
		$.messager.alert('警告','请选择一条记录！','warning');
		return false;
	}
	if(length > 1){
		$.messager.alert('警告','只能选择一条记录！','warning');
		return false;
	}
	var id = rows[0].id;
	
	$('#addDialog').dialog({
	    title: '查看',
	    width: 650,
	    height: 410,
	    closed: false,
	    cache: false,
	    href: 'view?id=' + id + "&t=" + (new Date).getTime(),
	    modal: true
	});
}
function form_check(){
	var beginDate =$.trim($("#beginDate").datebox('getValue'));
	var endDate =$.trim($("#endDate").datebox('getValue'));
	if(!dateCompare(beginDate,endDate)){
		$.messager.alert('警告','预报日期开始日不能大于结束日。','warning');	
		return false;
	}
	showLoading();
	$('#inputForm').submit();
}
</script>
</body>
</html>