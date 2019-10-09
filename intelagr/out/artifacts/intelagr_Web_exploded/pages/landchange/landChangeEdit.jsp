<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
		<form id="editForm" name="editForm" method="post" action="../landChange/list">
			<fieldset class="fieldset_common_style">
				<input type="hidden" name="id" id="id" value=""/>
				<input type="hidden" name="status" id="statusEdit" value="01"/>
				<table style="width: 100%" align="center">
					<tr>
						<td>
							
							
								<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="return save();">
									保存
								</a>
								<a href="#" class="easyui-linkbutton" onclick="return submitAudit();">
									<span class="l-btn-left">
										<span class="l-btn-text icon-ok l-btn-icon-left">提交申请</span></span>
								</a>
							
							
						</td>
					</tr>
				</table>	
			</fieldset>
			<fieldset class="fieldset_common_style">
				<table style="width: 100%" align="left">
					<tr>
						<td class="table_common_td_label_style">申请批次号：</td>
						<td class="table_common_td_txt_style">
							<input type="hidden" id="applyBatchNo" name="applyBatchNo" value="BG20170521000001">
							BG20170521000001
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
							
							
								

		<select id="companyCode1" name="companyCode" class="easyui-combobox" style="width:187px;height:25px" data-options="editable:true">
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

		 <input type="hidden" id="companyCode1_companyName" name="companyName" value="">

		 <script type="text/javascript">

			 $(document).ready(function(){ 

				 $('#companyCode1_companyName').val($('#companyCode1 option:selected').text());

				 $('#companyCode1').combobox({ 

					 onChange:function(newValue,oldValue){

						 var ops = document.getElementById('companyCode1').options;

						 for(var i=0;i<ops.length;i++){ 

							 if(ops[i].value == newValue){ 

								 $('#companyCode1_companyName').val(ops[i].text); 

								 break; 

							 } 

						 } 

						 return false;; 

					 } 

				 });


				 $('#companyCode1').combobox('textbox').bind('focus',function(){
					 var value = $('#companyCode1').combobox('getValue');
					 var opts = $('#companyCode1').combobox('getData');
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
								 $('#companyCode1').combobox('setValue', '');
							 }
						 }
					 if(value == ''){
						 $('#companyCode1').combobox('setText','');
					 }
				 }); 
				 $('#companyCode1').combobox('textbox').bind('blur',function(){  
					 var value = $('#companyCode1').combobox('getValue');
					 if(value == ''){
						 $('#companyCode1').combobox('setText','-=请选择=-');
					 }
				 });
			 });

		</script>

							
							<span class="span_common_mustinput_style">*</span>
						</td>
					</tr>
					<tr>
						<td class="table_common_td_label_style">证件类型：</td>
					<td class="table_common_td_txt_style editableFalse">
						


		<select id="idType" name="idType" class="easyui-combobox" style="width:187px;height:25px" data-options="editable:false">
<option value="" selected>-=请选择=-</option>
			<option value="01" selected>身份证</option>

			<option value="02">军官证</option>

			<option value="03">行政、企事业单位机构代码证或法人代码证</option>

			<option value="04">户口簿</option>

			<option value="05">护照</option>

			<option value="06">其他证件</option>

		</select>

		 <script type="text/javascript">

			 $(document).ready(function(){ 

				 $('#idType').combobox({ 

					 onChange:function(newValue,oldValue){

						 return false;

					 } 

				 });


			 });

		</script>

						<span class="span_common_mustinput_style">*</span>
					</td>
						<td class="table_common_td_label_style">证件类型：</td>
						<td class="table_common_td_txt_style editableFalse">
							<input class="easyui-textbox" type="text" id="contractorID" name="contractorID" value="" style="width:189px;"></input>
						    <span class="span_common_mustinput_style">*</span>
						</td>
						<td align="right" valign="bottom">
	                       	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="return expandInfo();">
	                       		<span class="l-btn-left"><span class="l-btn-text icon-search l-btn-icon-left">查询</span></span>
	                       	</a>
	             		</td>
					</tr>
				</table>
			</fieldset>
			<fieldset class="fieldset_common_style">
				<table style="width: 100%" align="left">
					<tr>
						<td class="table_common_td_label_style">承包方：</td>
						<td class="table_common_td_txt_style">
							<input class="easyui-textbox" type="text" id="contractorName" name="contractorName" value="" style="width:188px;" maxlength="10" readOnly></input>
						</td>
						<td class="table_common_td_label_style">联系方式：</td>
						<td class="table_common_td_txt_style">
							<input class="easyui-textbox" type="text" id="contractorTel" name="contractorTel" value="" style="width:189px;" readOnly></input>
						</td>
					</tr>
					<tr>
						<td class="table_common_td_label_style">住址：</td>
						<td colspan="3" class="table_common_td_txt_style">
							<span style='display:none'>
							<select class="easyui-combobox" id="cityCode" name="cityCode">
								<option value="230184">五常市</option>
							</select>
							</span>
							<select class="easyui-combobox" id="townCodeView" name="townCodeView" data-options="editable:false" style="width:187px;" disabled>
								<option value="" selected></option>
							</select>
							<input type="hidden" id="townCode" name="townCode" value="">
	
							<select class="easyui-combobox" id="countryCodeView" name="countryCodeView" data-options='editable:false' style="width:187px;" disabled>
								<option value="" selected></option>
							</select>
							<input type="hidden" id="countryCode" name="countryCode" value="">
	
							<input type="text" class="easyui-textbox" id="address" name="address" value="" readonly="readonly" style="width:440px;">
						</td>
						
					</tr>
				</table>
			</fieldset>
			<fieldset class="fieldset_common_style">
				<table style="width: 100%" align="left">
					<!--<tr>
						<td align="right" width="100px">类型选择：</td>
						<td colspan="5">
							<input type="checkbox" id="geneRegistType" name="geneRegistType" disabled="true" >普通土地
							&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
							<input  type="checkbox" id="specRegistType" name="specRegistType" disabled="true" onchange="">特殊土地
						</td>
					</tr>	-->	
					<tr>
						<td class="table_common_td_label_style">类型选择：</td>
						<td colspan="5" class="table_common_td_txt_style editableFalse">
										
							
								<input type="checkbox" id="geneRegistType" name="geneRegistType" disabled="true" >普通备案
								&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;
											
								
							
                                 <input  type="checkbox" id="specRegistType" name="specRegistType" disabled="true">特殊备案
								
							<span class="span_common_mustinput_style">*</span>
						</td>
					</tr>			
					<tr>
						<td class="table_common_td_label_comment_style">变更原因：</td>
						<td colspan="5" class="table_common_td_txt_style">
							<textarea class="easyui-textbox" rows="3" id="changeReason" name="changeReason" cols="60" style="font-size:12px;height:100px" data-options="multiline:true"></textarea>
						   <span class="span_common_mustinput_style">*</span>
						</td>
					</tr>
					<tr>
						<td class="table_common_td_label_comment_style">申请人：</td>
						<td class="table_common_td_txt_style">
						
							
						
						    <input class="easyui-textbox" type="text" id="applicant" name="applicant" value="管理员" style="width:100px;"></input>
							
						    <span class="span_common_mustinput_style">*</span>
						</td>
						<td class="table_common_td_label_comment_style">联系方式：</td>
						<td class="table_common_td_txt_style">
							<input class="easyui-textbox" type="text" id="applicantTel" name="applicantTel" value="" style="width:189px;"></input>
						    <span class="span_common_mustinput_style">*</span>
						</td>
						<td colspan="2">
						</td>
					</tr>
				</table>
			</fieldset>
			<fieldset class="fieldset_common_style">
				<legend>申请资料列表</legend>
				<table style="width: 100%" align="center">
					<tr>
						<td align="left">
							<a href="#" class="easyui-linkbutton" onclick="javascript:showUploadDialog('20', '', '举证资料', 'imgPriviewOuter', 'imgPriviewInner');">
								<span class="l-btn-left"><span class="l-btn-text icon-docupload l-btn-icon-left">上传申请凭证</span></span>
							</a>
						</td>
					</tr>
					<tr>
						<td>
							<table id="imgList" height="152px" class="easyui-datagrid" striped="true" singleSelect="true">
								<thead>
									<tr>
										<th field="originalName" width="50%" align="center">申请凭证</td>
										<th field="fileInfo" width="30%" align="center">说明</td>
										<th field="op" width="20%" align="center">操作</td>
									</tr>
								</thead>
							</table>
						</td>
					</tr>
				</table>
			</fieldset>
			<fieldset class="fieldset_common_style">
				<legend>申请资料预览</legend>
				<table id="fileDiv" style="width: 100%;" align="center">
					<tr>
						<td>
							

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/jquery.scrollpic.css">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/jquery.fancybox.css" media="screen" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/jquery.fancybox-buttons.css" />

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.ScrollPic.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.fancybox.js"></script>	

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.fancybox-buttons.js"></script>

<script type="text/javascript">

	$(function(){

	$('.yiz-slider-3').ScrollPic({

		Time: 0,

		speed: 500,

		autoscrooll: false,

		arrowcontrol: true,

		numbercontrol: false

	});

})

$(document).ready(function() {

$('.fancybox-buttons').fancybox({

	openEffect  : 'none',

	closeEffect : 'none',

	prevEffect : 'none',

	nextEffect : 'none',

	closeBtn  : true,

	helpers : {

		title : {

			type : 'inside'

		},

		buttons	: {}

	},

	afterLoad : function() {

		this.title = 'Image ' + (this.index + 1) + ' of ' + this.group.length + (this.title ? ' - ' + this.title : '');

	}

});

});

</script>

<style>
.t1 a:link, .t1 a:visited{}t1 a:hover{}
</style>

<div id='imgPriviewOuter'><div class="yiz-slider-3 yiz-slider" id="imgPriviewInner" data-yiz-slider="3" style="width:420px;height:500px">

 <ul>

<li><img src="${pageContext.request.contextPath}/images/nothing.png" alt="There is nothing to View." /></li>

</ul>

</div></div>

						</td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>
	<div id="bhDialog"></div>
	<div id="uploadDialog"></div>
	
<script type="text/javascript">
    var lastQcIdNumber = "";
	$(document).ready(function(){
		var id = $("#id").val();
		if(id != ""){
			showFileList("20", id, '申请资料', 'imgPriviewOuter', 'imgPriviewInner' );
		}
		
		if($('#contractorID').val()!=""){
			var params = {'companyCode': $("#companyCode1").combobox('getValue'), 'yearCode':$('#year').combobox('getValue'), 'idType':$("#idType").combobox('getValue'), 'contractorID':$('#contractorID').val()};
			Public.ajaxGet('../landChange/queryLandRegInfosCount', params, function(e) {
				if (200 == e.status) {
					 if(parseInt(e.data.geneResultCnt)==0){
						 $("#geneRegistType").prop("disabled", true);
					 }else{
						 $("#geneRegistType").prop("disabled", false);
					 }
					 if(parseInt(e.data.specResultCnt)==0){
						 $("#specRegistType").prop("disabled", true);
					 }else{
						 $("#specRegistType").prop("disabled", false);
					 }
				} else {
					$.messager.alert('错误','操作失败！' + e.msg, 'error');
				}
			});
		}
	});
	
	//动态调整预览图片位置
	var width = $("#fileDiv").width();
	var picWidth = $("#imgPriviewInner").width();
	var paddingLeft = (width - picWidth)/2 + "px";
	$("#fileDiv").css("padding-left", paddingLeft);

	function closeEditDialog(){
		$('#addDialog').dialog('close');
	}

	function save(){
		if(!check()) return ;
		var retFlag = '';
		var a = $('#editForm').toObject();
		Public.ajaxPost('save', JSON.stringify(a), function(e) {
			hideLoading();
			if (200 == e.status) {
				$.messager.alert('提示','操作成功。','info',function(){
					if(retFlag == '1'){
						//retList();
					    document.location.href = '${pageContext.request.contextPath}/landChange/listSearch?year=&companyCode=&beginDate=&endDate=&status=&page=&pageSize=';
					}else if("edit" == "audit"){
					    document.location.href = '${pageContext.request.contextPath}/landChange/listQuerySearch?year=&companyCode=&beginDate=&endDate=&status=&page=&pageSize=';
					} else {
						//document.location.href = '${pageContext.request.contextPath}/landChange/listSearch?year=&companyCode=&beginDate=&endDate=&status=&page=&pageSize=';
					    document.location.href = '${pageContext.request.contextPath}/landChange/editInput';
					}
				});
			} else {
				$.messager.alert('错误','保存失败！' + e.msg,'error');
			}
		});
	}
	
	function closeEdiDialog(){
		$('#addDialog').dialog('close');
	}
	
	function fileUpload(){
		$('#addDialog').dialog({
		    title: '文件上传',
		    width: 550,
		    height: 400,
		    closed: false,
		    cache: false,
		    href: '../file/uploadInit?bizType=landRegChange',
		    modal: true
		});
	}
	//确权查询方法
	var userName='';
	function expandInfo(){ 
		userName='管理员';
		if($("#companyCode1").combobox('getValue')==""){
			$.messager.alert('警告','请选择企业！','warning');
			return false;
		}
		//----只根据证件类型和证件号码查询
		if($("#idType").combobox('getValue')==""){
			$.messager.alert('警告','请选择证件类型！','warning');
			return false;
		}
		if($('#contractorID').val()==""){
			$.messager.alert('警告','请输入证件号码！','warning');
			return false;
		}
		if($("#idType").combobox('getValue')=="01" && $('#contractorID').val()!=""){
			var strError = checkIdNumber($('#contractorID').val());
			if(strError.length>1){
				$.messager.alert('警告',strError,'warning');
				return false;
			}
		}
		var contractorId = $("#contractorID").val();
		var idType = $("#idType").combobox('getValue');
		showLoading();
		lastQcIdNumber = contractorId;
		Public.ajaxGet('../api/getContratorInfo?contratorId=' + contractorId + "&contractorIDType=" + idType, {}, function(e) {
			hideLoading();
			if (0 == e.status) {
				clearDatasTable();
				initInterfaceInfo( e.data );
			} else {
				$.messager.alert('错误', e.msg, 'error');
				//承包方
				$("#contractorName").textbox('setValue', '');
				//联系方式
				$("#contractorTel").textbox('setValue', '');
				//乡
				$("#townCodeView").combobox('setValue', '');
				//村
				$("#countryCodeView").combobox('setValue', '');
				//乡
				$("#townCode").val('');
				//村
				$("#countryCode").val('');
				//屯
				$("#address").textbox('setValue', '');
				
				$("#geneRegistType").prop("disabled", true);
				$("#specRegistType").prop("disabled", true);
				$("#geneRegistType").prop("checked", false);
				$("#specRegistType").prop("checked", false);
				//情况说明
				$("#changeReason").textbox('setValue', '');
				//承包方
				$("#applicant").textbox('setValue', '');
				//联系方式
				$("#applicantTel").textbox('setValue', '');
				clearDatasTable();
			}
		});
	}
	function clearDatasTable(){
		$('#imgList').datagrid('loadData', { total: 0, rows: [] });
	}
	//初始化信息
	function initInterfaceInfo( data ){
		//基本信息
		var contratorInfo = data.peasant;
		//承包方
		$("#contractorName").textbox('setValue', contratorInfo.contractorName );
		//联系方式
		$("#contractorTel").textbox('setValue', contratorInfo.contractorTel );
		var params = {'cityCode': $('#cityCode').combobox('getValue'), 'townCode':contratorInfo.townCode, 'countryCode':contratorInfo.countryCode};
		Public.ajaxGet('../areaDevision/getAreaDevisions', params, function(e) {
			if (200 == e.status) {
				 addTownAndCountryOptions(JSON.parse(e.data));
			} else {
				$.messager.alert('错误','操作失败！' + e.msg, 'error');
			}
		});
		//屯
		$("#address").textbox('setValue', contratorInfo.groupName );
		var params = {'companyCode': $("#companyCode1").combobox('getValue'), 'yearCode':$('#year').combobox('getValue'), 'idType':$("#idType").combobox('getValue'), 'contractorID':$('#contractorID').val()};
		Public.ajaxGet('../landChange/queryLandRegInfosCount', params, function(e) {
			if (200 == e.status) {
				 if(parseInt(e.data.geneResultCnt)==0&&parseInt(e.data.specResultCnt)==0){
						$.messager.alert('警告','该证件号码不存在备案信息，请重新输入。','warning');
						return false;
				 }
				 if(parseInt(e.data.grainResultCnt)>0){
						$.messager.alert('警告','该农户本年度存在收粮信息，不能变更。请重新输入证件号码。','warning');
						return false;
				 }
				 if(parseInt(e.data.geneResultCnt)==0){
					 $("#geneRegistType").prop("disabled", true);
				 }else{
					 $("#geneRegistType").prop("disabled", false);
				 }
				 if(parseInt(e.data.specResultCnt)==0){
					 $("#specRegistType").prop("disabled", true);
				 }else{
					 $("#specRegistType").prop("disabled", false);
				 }
			} else {
				$.messager.alert('错误','操作失败！' + e.msg, 'error');
			}
		});
		
		//情况说明
		$("#changeReason").textbox('setValue', '');
		//承包方
		$("#applicant").textbox('setValue', userName);
		//联系方式
		$("#applicantTel").textbox('setValue', '');
		clearDatasTable();
		
	}
	function addTownAndCountryOptions(obj){
		$('#townCodeView').combobox({
			valueField:'id',
			textField:'text',
			onChange:function(){return false;}
		});
		$('#countryCodeView').combobox({
			valueField:'id',
			textField:'text',
			onChange:function(){return false;}
		});
		$('#townCodeView').combobox('clear');
		$('#countryCodeView').combobox('clear');
		$('#townCodeView').combobox('loadData',[{'id':obj[0].id,'text': obj[0].text}]);
		$('#countryCodeView').combobox('loadData',[{'id':obj[1].id,'text': obj[1].text}]);
		$('#townCodeView').combobox('setValue',obj[0].id);
		$('#countryCodeView').combobox('setValue',obj[1].id);
		$('#townCode').val(obj[0].id);
		$('#countryCode').val(obj[1].id);
	}
function auditOpt( status ){
	if( status == "0" ){   //通过,改变状态
		$("#statusEdit").val( "03" );
		save();
	}else if( status == -1 ){  //驳回,弹窗
		var id = $("#id").val();
		$('#bhDialog').dialog({
		    title: '驳回',
		    width: 500,
		    height: 300,
		    closed: false,
		    cache: false,
		    href: '${pageContext.request.contextPath}/landChange/auditBhInput?id='+id,
		    modal: true
		});
	}
}

//提交申请,只改变状态
function submitAudit(){
	$("#statusEdit").val( "02" );
	save();
}

function retList(){
	var url = "${pageContext.request.contextPath}/landChange/listSearch";
	url += "?year=";
	url += "&page=";
	url += "&pageSize=";
	url += "&companyCode=";
	url += "&beginDate=";
	url += "&endDate=";
	url += "&status=";

	document.location.href = url;
}
function check(){
	if($("#companyCode1").combobox('getValue')==""){
		$.messager.alert('警告','请选择企业！','warning');
		return false;
	}
	if($("#idType").combobox('getValue')==""){
		$.messager.alert('警告','请选择证件类型！','warning');
		return false;
	}
	if($("input[name='contractorID']").val()==""){
		$.messager.alert('警告','请填写承包人证件号码！','warning');
		return false;
	}
	if($("#idType").combobox('getValue')=="01" && $("input[name='contractorID']").val()!=""){
		var strError = checkIdNumber($("input[name='contractorID']").val());
		if(strError.length>1){
			$.messager.alert('警告',strError,'warning');
			return false;
		}
	}
	if(($("input[name='contractorID']").val()+"").length>18){
		$.messager.alert('警告','您输入的证件号码长度超出系统限制！','warning');
		return false;
	}
	
	if (!$('#geneRegistType').attr('checked')&&!$('#specRegistType').attr('checked')){
		$.messager.alert('警告','请选择土地备案类型！','warning');
		return false;
	}
	if($("#changeReason").val()==""){
		$.messager.alert('警告','请输入变更原因！','warning');
		return false;
	}
	if($("input[name='applicant']").val()==""){
		$.messager.alert('警告','请填写申请人！','warning');
		return false;
	}
	if(($("input[name='applicant']").val()+"").length>10){
		$.messager.alert('警告','您输入的申请人姓名长度超出系统限制！','warning');
		return false;
	}
	
	if($("input[name='applicantTel']").val()==""){
		$.messager.alert('警告','请填写申请人电话！','warning');
		return false;
	}
	if(!isTel($("input[name='applicantTel']").val())){
		$.messager.alert('警告','请填写正确的申请人电话号码或者手机号！','warning');
		return false;
	}
	return true;
}
function showVideoList(o, d){}
function closeDialog(){
	$("#addDialog").dialog('close');
}
</script>
</body>
</html>