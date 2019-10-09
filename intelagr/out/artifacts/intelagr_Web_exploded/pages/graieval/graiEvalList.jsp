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
<body class="easyui-layout" >
	<div region="center" border="false" style="padding:5px;">
		<fieldset id="queryBlock" class="fieldset_common_style">	
			<form id="inputForm" name="inputForm" method="get" action="../graiEval/list">
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
						<a href="#" class="easyui-linkbutton" onclick="add();">
							<span class="l-btn-left">
								<span class="l-btn-text icon-add l-btn-icon-left">添加</span>
							</span>
						</a>
						<a href="#" class="easyui-linkbutton" onclick="edit();">
							<span class="l-btn-left">
								<span class="l-btn-text icon-edit l-btn-icon-left">修改</span>
							</span>
						</a>
						<a href="#" class="easyui-linkbutton" onclick="return deleteRecord();">
							<span class="l-btn-left">
								<span class="l-btn-text icon-remove l-btn-icon-left">删除</span>
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
					<th field="year" width="120" align="center">年度</th>
					<th field="code" width="120" align="center">品种</th>
					<th field="minYield" width="120" align="center">最小亩产量（斤）</th>
					<th field="maxYield" width="120" align="center">最大亩产量（斤）</th>
					<th field="milledriceRate" width="120" align="center">出米率</th>
				</tr>
			</thead>
			<tbody>
						
			</tbody>
		</table>
	</div>
	<div id="addDialog" style="overflow:hidden"></div>
	
<script type="text/javascript">
	$(document).ready(function(){
		var winHeight = $(window).height();
	    var queryBlockHeight = $("#queryBlock").height();
	    var toolBlock = $("#toolBlock").height();
		$("#data").datagrid({ 
			height:winHeight -queryBlockHeight -toolBlock-52,
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
		$.messager.alert('警告','请选择一条记录。','warning');
		return false;
	} 
	$.messager.confirm("确认", "您确定要删除选中的记录吗？", function (deleteAction) {
		if (deleteAction) {
			for(var i=0; i<rows.length; i++) ids.push(rows[i].id);
			Public.ajaxGet('delete', {ids : ids}, function(e) {
				if (200 == e.status) {
					$.messager.alert('提示','删除成功。','info');
					form_check();
				} else
					$.messager.alert('错误','删除失败！'+ e.msg,'error');
			});
		}
	});
}

function edit(id){
	var rows = $('#data').datagrid('getSelections');
	var length = rows.length;
	if(length == 0){
		$.messager.alert('警告','请选择一条记录。','warning');
		return false;
	}
	if(length > 1){
		$.messager.alert('警告','只能选择一条记录。','warning');
		return false;
	}
	var id = rows[0].id;
	$('#addDialog').dialog({
	    title: '编辑粮食评估参数',
	    width: 420,
	    height: 320,
	    closed: false,
	    cache: false,
	    href: 'editInput?id='+ id,
	    modal: true
	});
	}

function add(){
	$('#addDialog').dialog({
	    title: '添加粮食评估参数',
	    width: 420,
	    height: 320,
	    closed: false,
	    cache: false,
	    href: 'graiEvalEdit.jsp',
	    modal: true
	   
	});
}

function closeEdiDialog(){
	$('#graiEvalEditDlg').dialog('close');
}

function form_check(){
	showLoading();
	$('#inputForm').submit();
}
</script>
</body>
</html>