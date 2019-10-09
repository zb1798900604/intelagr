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
	<div region="center" border="false" style="padding:0 10px;">	
		
			<form id="inputForm" name="inputForm" method="get" action="../landChange/listQuerySearch">
			<input type='hidden' id="pageTotal" name="pageTotal" value="0" />
			<input type="hidden" id="page" name="page" value="1">
			<input type="hidden" id="pageSize" name="pageSize" value="15">
		<fieldset id="queryBlock" class="fieldset_common_style">	
				<table style="width: 100%" align="center">
					<tr>
						<td width="100" height="20" align="right" nowrap >年度：</td> 
						<td nowrap>
							

		<select id="year" name="year" class="easyui-combobox" style="width:211px;height:25px" data-options="editable:true">

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
						<td width="100" height="20" align="right" nowrap >企业：</td>
						<td nowrap>
							


	

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



						</td>
					</tr>
					<tr>
						<td class="table_common_td_label_query_style" width="100" height="20" align="right" >申请日期：</td>
						<td class="table_common_td_txt_query_style editableFalse">
							<input class="easyui-datebox" id="beginDate" name="beginDate" value=""
	            				data-options="required:false,showSeconds:false" style="width:100px" editable="false"/>
							~
							<input class="easyui-datebox" id="endDate" name="endDate" value=""
	            				data-options="required:false,showSeconds:false" style="width:100px" editable="false"/>
						</td>
						<td width="100" height="20" align="right" nowrap >状态：</td>
						<td nowrap>
							

		<select id="status" name="status" class="easyui-combobox" style="width:187px;height:25px" data-options="editable:true">
<option value="" selected>-=请选择=-</option>
			<option value="01">待申请</option>

			<option value="02">待审核</option>

			<option value="03">已审核</option>

			<option value="04">已驳回</option>

		</select>

		 <script type="text/javascript">

			 $(document).ready(function(){ 

				 $('#status').combobox({ 

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
			</fieldset>
			<fieldset id="toolBlock" class="fieldset_common_style">
			<table class="n_input">	
				<tr>
					<td colspan="10">
					<a href="#" class="easyui-linkbutton" onclick="return viewInfo();">
						<span class="l-btn-left">
							<span class="l-btn-text icon-view l-btn-icon-left">查看</span>
						</span>
					</a>
					<a href="#" class="easyui-linkbutton" onclick="return auditInput();">
						<span class="l-btn-left">
							<span class="l-btn-text icon-audit l-btn-icon-left">审核</span>
						</span>
					</a>
					</td>
				</tr>
			</table>
			</fieldset>	
			</form>
		
		<table id="data" class="easyui-datagrid" striped="true" singleSelect="false" pageSize="15" pageNumber="1">
			<thead>
				<tr>
					<th field="id" width="140" align="center" checkbox="true"></th>
					<th field="applyBatchNo" width="100" align="center">申请批次号</th>
					<th field="year" width="60" align="center">年度</th>
					<th field="CompanyName" width="150" align="center">企业</th>
					<th field="date1" width="80" align="center">申请日期</th>
					<th field="applicant" width="80" align="center">申请人</th>
					<th field="applicantTel" width="150" align="center">联系方式</th>
					<th field="contractorName" width="80" align="center">承包方</th>
					<th field="idType" width="60" align="center">证件类型</th>
					<th field="contractorID" width="150" align="center">证件号码</th>
					<th field="changeReason" width="200" align="center">变更情况说明</th>
					<th field="PurchaseQuantity" width="80" align="center">状态</th>
					<th field="PurchasingAgent" width="120" align="center">驳回原因</th>
					<th field="PurchaseDate" width="80" align="center">审核人</th>
					<th field="view" width="160" align="center">审核时间</th>
					<th field="spstatus" width="0" align="center" hidden='true'></th>
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
		var toolBlockHeight = $("#toolBlock").height();
		$("#data").datagrid({ 
			height:winHeight -queryBlockHeight -toolBlockHeight -45,
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
		    	showLoading();
		    	$('#inputForm').submit();
		    }
		});
	});
	//查看
	function viewInfo(){
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
		
		var year = $('#year').combobox('getValue');
		var companyCode = $('#companyCode').combobox('getValue');
		var status = $('#status').combobox('getValue');
		var beginDate = $('#beginDate').val();
		var endDate = $('#endDate').val();
		
		var url = "${pageContext.request.contextPath}/landChange/view?id=" + id + "&gotoPage=2";
		url += "&year=" + year;
		url += "&companyCode=" + companyCode;
		url += "&status=" + status;
		url += "&beginDate=" + beginDate;
		url += "&endDate=" + endDate;
		document.location.href = url;
		
	}
	function deleteUser(id){
		$.messager.confirm("确认", "您确定要删除选中的记录吗？", function (deleteAction) {
		    if (deleteAction) {
				Public.ajaxPost('delete?id='+id, {}, function(e) {
					if (200 == e.status) {
						$.messager.alert('提示','删除成功。','info');
						$('#userform').submit();
					} else
						$.messager.alert('错误','删除失败！'+ e.msg,'error');
				});
		    }
		});

	}
	
	function auditInput(){
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

		if(rows[0].spstatus=='04'){
			$.messager.alert('警告','已驳回状态的土地备案变更申请信息不可被审核！','warning');
			return false;
		}
		if(rows[0].spstatus=='03'){
			$.messager.alert('警告','已审核通过的土地备案变更申请信息不可被审核！','warning');
			return false;
		}
		showLoading();
	var url = "${pageContext.request.contextPath}/landChange/editInput?flag=audit&id="+id;
	url += getQueryCond();
	document.location.href = url;
	
	}
	
	function getQueryCond(){
		var page = $("#page").val();
		var pageSize = $("#pageSize").val();
		var year = $("#year").combobox("getValue");
		var companyCode = $("#companyCode").combobox("getValue");
		var beginDate = $("#beginDate").val();
		var endDate = $("#endDate").val();
		var status = $("#status").val();
		
		var str = "";
		str += "&page=" + page;
		str += "&pageSize=" + pageSize;
		str += "&year=" + year;
		str += "&companyCode=" + companyCode;
		str += "&beginDate=" + beginDate;
		str += "&endDate=" + endDate;
		str += "&status=" + status;
		
		return str;
	}
	
	function form_check(){
		var beginDate =$.trim($("#beginDate").datebox('getValue'));
		var endDate =$.trim($("#endDate").datebox('getValue'));
		if(!dateCompare(beginDate,endDate)){
			$.messager.alert('警告','申请日期开始日不能大于结束日。','warning');
			return false;
		}
		showLoading();
		$('#inputForm').submit();
	}
</script>
</body>
</html>