<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html style="width:100%;height:100%;overflow:hidden">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ajaxfileupload.js"></script>
</head>
<body class="easyui-layout">
	<div region="center" border="false" style="padding:5px;">
		<fieldset id="queryBlock" class="fieldset_common_style">
			<form id="landpicform" name="landpicform" method="post" action="${pageContext.request.contextPath}/landPic/list?flag=2">
			<table class="table_common_style">
				<tr>
					<td class="table_common_td_label_query_style">年度：</td>
					<td>
						

		<select id="year" name="year" class="easyui-combobox" style="width:170px;height:25px" data-options="editable:false">

			<option value="2015" selected>2015年</option>

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

						<input type='hidden' id="pageTotal" name="pageTotal" value="0" />
						<input type="hidden" id="page" name="page" value="1">
						<input type="hidden" id="pageSize" name="pageSize" value="15">
					</td>
					<td class="table_common_td_label_query_style">企业名称：</td>
					<td nowrap>
						

		<select id="companyCode" name="companyCode" class="easyui-combobox" style="width:200px;height:25px" data-options="editable:true">
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

					</td>
					<td align="right" valign="bottom">
                       	<a href="#" class="easyui-linkbutton" onclick="onSubmit()">
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
						<a href="#" class="easyui-linkbutton" onclick="viewLandPic();">
							<span class="l-btn-left">
								<span class="l-btn-text icon-view l-btn-icon-left">查看</span>
							</span>
						</a>
						<a href="#" class="easyui-linkbutton" onclick="addLandPic();">
							<span class="l-btn-left">
								<span class="l-btn-text icon-add l-btn-icon-left">添加</span>
							</span>
						</a>
						<a href="#" class="easyui-linkbutton" onclick="editLandPic();">
							<span class="l-btn-left">
								<span class="l-btn-text icon-edit l-btn-icon-left">修改</span>
							</span>
						</a>
						<a href="#" class="easyui-linkbutton" onclick="deleteLandPic();">
							<span class="l-btn-left">
								<span class="l-btn-text icon-remove l-btn-icon-left">删除</span>
							</span>
						</a>
					</td>
				</tr>
			</table>	
		</fieldset>
		<table id="data" class="easyui-datagrid" striped="true" checkbox="true" singleSelect="false" singleSelect="true" pageSize="15" pageNumber="1">
			<thead>
				<tr>
					<th field="id" width="140" checkbox="true"  align="center"></th>
					<th field="cityName" width="140"  align="center">市 </th>
					<th field="townName" width="140" align="center">乡镇</th>
					<th field="picInfo" width="140"  align="center">图片说明</th>
				</tr>
			</thead>
			<tbody>
						
			</tbody>
		</table>
	</div>
	<div id="addDialog"></div>
<script type="text/javascript">
	$(document).ready(function(){
		var winHeight = $(window).height();
	    var queryBlockHeight = $("#queryBlock").height();
	    var toolBlock = $("#toolBlock").height();
		$("#data").datagrid({ 
			height:winHeight -queryBlockHeight -toolBlock-48,
			pagination: true,
	        rownumbers: true,
	        fitColumns: true,
	        //fit: true,
	        pageList: [15,20,25],
	        pagePosition: "top"
	});
	
	var pagger = $('#data').datagrid('getPager');  
	$(pagger).pagination({
		total: $("#pageTotal").val(),
		pageNumber: parseInt($("#page").val()),
		showPageList: true,
		showRefresh: false,
	    onSelectPage: function(pageNumber, pageSize){
	    	$('#page').val(pageNumber);
	    	$('#pageSize').val(pageSize);
	    	onSubmit();
	    }
	});
});
	
function addLandPic(){
	var year = $("#year").val();
	var companyCode = $("#companyCode").val();
		$('#addDialog').dialog({
	    title: '添加土地图片',
	    width: 800,
	    height: 380,
	    closed: false,
	    cache: false,
	    href: 'landPicAdd.jsp?year='+year+"&companyCode="+companyCode,
	    modal: true
	});
}

function viewLandPic(){
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
	    title: '查看土地图片',
	    width: 800,
	    height: 380,
	    closed: false,
	    cache: false,
	    href: '${pageContext.request.contextPath}/landPic/viewPic?id='+id,
	    modal: true
	});
}

function editLandPic(){
	var year = $("#year").val();
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
	    title: '修改土地图片',
	    width: 800,
	    height: 380,
	    closed: false,
	    cache: false,
	    href: '${pageContext.request.contextPath}/landPic/editPicInit?id='+id+"&year="+year,
	    modal: true
	});
}

function deleteLandPic(){
	var ids = [];
	var rows = $('#data').datagrid('getSelections');
	var length = rows.length;
	for(var i=0; i<rows.length; i++) ids.push(rows[i].id);
	if(ids.length == 0){
		$.messager.alert('警告','至少选择一条记录。','warning');
		return false;
	}
	
	$.messager.confirm("确认", "您确认删除选定的记录吗？", function (deleteAction) {
		if (deleteAction) {
			showLoading();
			Public.ajaxGet('${pageContext.request.contextPath}/landPic/delete', {ids : ids}, function(e) {
				hideLoading();
				if (200 == e.status) {
					Public.tips({
						content : "成功！"
					});
					$('#landpicform').submit();
				} else
					Public.tips({
						type : 1,
						content : "失败！" + e.msg
					});
			});
		}
	});
}

function onSubmit(){
	showLoading();
	$('#landpicform').submit();
}
</script>
</body>
</html>