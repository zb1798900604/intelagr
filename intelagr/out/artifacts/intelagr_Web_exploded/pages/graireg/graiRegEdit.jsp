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
<!-- 图片播放 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/jquery.fancybox.css" media="screen" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/jquery.fancybox-buttons.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.fancybox.js"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.fancybox-buttons.js"></script>
<script>
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

	<script>
		var root = "${pageContext.request.contextPath}";
	</script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/grainreg.js"></script>

</head>
<body class="easyui-layout">
	<div region="center" border="false" style="padding:5px;">
		<form id="editForm" name="editForm" method="post" action="../graiReg/list">
			<input type="hidden" name="id" id="id" value=""/>
			<input type="hidden" name="actualMu" id="actualMu" value=""/>
			<input type="hidden" name="measurementMu" id="measurementMu" value=""/>
			<input type="hidden" name="estimateTotalYield" id="estimateTotalYield" value=""/>
			<input type="hidden" name="soldYield" id="soldYield" value=""/>
			<input type="hidden" name="surplusYield" id="surplusYield" value=""/>
			<input type="hidden" name="retFlag" id="retFlag" value=""/>
			<!-- 功能按钮 -->
			<fieldset class="fieldset_common_style">
				<table class="table_common_style">
					<tr>
						<td>
							<a href="#" class="easyui-linkbutton"  data-options="iconCls:'icon-save'" onclick="return save();">保存</a>
							
						</td>
					</tr>
				</table>
			</fieldset>
			<fieldset class="fieldset_common_style">
				<table class="table_common_style">
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
						<td class="table_common_td_txt_style">
							

	

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


							<span class="span_common_mustinput_style">*</span>
						</td>
					</tr>
				</table>
			</fieldset>
			<fieldset class="fieldset_common_style">
				<table class="table_common_style">
					<tr>
						<td class="table_common_td_label_style">身份证号：</td>
						<td class="table_common_td_txt_style">
							<input class="easyui-textbox" type="text" name="idNumber" id="idNumber" value="" style="width:225px;"></input>
							<span class="span_common_mustinput_style">*</span>
						</td>
						<td>
							<a href="#" class="easyui-linkbutton"  onclick="return queryLand();">
								<span class="l-btn-left"><span class="l-btn-text icon-search l-btn-icon-left">查询</span>
							</a>
						</td>
					</tr>
				</table>
			</fieldset>
			<fieldset class="fieldset_common_style">
				<legend>确权信息</legend>
				<table class="table_common_style">
					<tr>
						<td class="table_common_td_label_style" nowrap="nowrap">姓名：</td>
						<td class="table_common_td_txt_style" colspan="5">
							<input class="easyui-textbox" type="text" name="farmerName" readonly="readonly" id="farmerName" value="" style="width:150px;"></input>
						</td>
					</tr>
					<tr>
						
						<td class="table_common_td_label_style">地址：</td>
						<td class="table_common_td_txt_style" colspan="5">
							<span style='display:none'>
							<select class="easyui-combobox" id="cityCode" name="cityCode">
								<option value="230184">五常市</option>
							</select>
							</span>
							<select class="easyui-combobox" id="tmp_townCodeView" name="tmp_townCodeView" data-options='editable:false' style="width:150px" disabled>
								<option value="" selected></option>
							</select>
							<input type="hidden" id="townCode" name="townCode" value="">
							<select class="easyui-combobox" id="tmp_countryCodeView" name="tmp_countryCodeView" data-options='editable:false' style="width:150px" disabled>
								<option value="" selected></option>
							</select>
							<input type="hidden" id="countryCode" name="countryCode" value="">
							<input type="text" class="easyui-textbox" id="groupName" name="groupName" value="" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td class="table_common_td_label_style">地块总面积(亩)：</td>
						<td class="table_common_td_txt_style">
							<input  class="easyui-numberbox" readonly="readonly" precision="2" style="width:120px;" min="0.00" max="9999999.99" type="text" name="dkzmj" value="" id="dkzmj"/>
						</td>
						<td class="table_common_td_label_style">
							已备案地块面积(亩)：
						</td>
						<td class="table_common_td_txt_style">
							<input  class="easyui-numberbox" readonly="readonly" precision="2" style="width:120px;" min="0.00" max="9999999.99" type="text" name="registeredTotalYield" value="" id="registeredTotalYield"/>
						</td>
						<td class="table_common_td_label_style">收粮面积(亩)：</td>
						<td class="table_common_td_txt_style">
							<input  class="easyui-numberbox" readonly="readonly" precision="2" style="width:120px;" min="0.00" max="9999999.99" type="text" name="grainTotalYield" value="" id="grainTotalYield"/>
						</td>
					</tr>
					<tr>
						<td colspan="6">
							<table height="150px;" id="datas" width="100%" class="easyui-datagrid" striped="true" singleSelect="true">
								<thead>	
								<tr>
									<th field="landType" width="20%" height="20" align="center" nowrap >土地类型</td>
									<th field="aMu" width="15%" height="20" align="center" nowrap>实（亩）</td>
									<th field="cMu" width="15%" height="20" align="center" nowrap>测量（亩）</td>
									<th field="landClass" width="20%" height="20" align="center" nowrap>土地类别</td>
									<th field="landName" width="30%" height="20" align="center" nowrap>地块名称</td>
								</tr>
								</thead>
								<tbody>
								
								</tbody>
							</table>
						</td>
					</tr>
				</table>
			</fieldset>
			<fieldset class="fieldset_common_style">
				<legend>地块举证材料</legend>
				<table class="table_common_style">
					<tr>
						<td>
							<a href="#" class="easyui-linkbutton" onclick="javascript:landUpload();">
								<span class="l-btn-left"><span class="l-btn-text icon-docupload l-btn-icon-left">
								上传地块举证材料
								</span></span>
							</a>
						</td>
					</tr>
					<tr>
						<td>
							<table height="100px;" id="imgList" class="easyui-datagrid" striped="true" singleSelect="true">
								<thead>
									<tr>
										<th field="originalName" width="50%" align="center">举证凭证</td>
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
				<legend>购种信息录入</legend>
				<table>
					<tr>
						<td class="table_common_td_label_style">
							购种重量（斤）：
						</td>
						<td class="table_common_td_txt_style">
							<input  class="easyui-numberbox" precision="2" min="0.00" max="9999999.99" type="text" name="seedPurchaseTotal" value="" id="seedPurchaseTotal"/>
							<span class="span_common_mustinput_style">*</span>
						</td>
					</tr>
				</table>
			</fieldset>
			<fieldset class="fieldset_common_style">
				<legend>购种举证材料</legend>
				<table class="table_common_style">
					<tr>
						<td>
							<a href="#" class="easyui-linkbutton" onclick="javascript:gzUpload();">
								<span class="l-btn-left"><span class="l-btn-text icon-docupload l-btn-icon-left">
								上传购种举证材料</span></span>
							</a>
						</td>
					</tr>
					<tr>
						<td>
							<table height="100px;" id="imgList1" class="easyui-datagrid" striped="true" singleSelect="true">
								<thead>
									<tr>
										<th field="originalName" width="50%" align="center">举证凭证</td>
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
				<legend>收粮信息</legend>
				<table class="table_common_style">
					<tr>
						<td class="table_spec_td_label_style">预估产量（斤）： <span id="ygDiv">0.00</span> </td>
						<td class="table_spec_td_label_style">
							已卖出重量（斤）： <span id="ymcDiv">0.00</span> 
						</td>
						<td class="table_spec_td_label_style">可卖重量（斤）： <span id="kmDiv">0.00</span> </td>
					</tr>
					<tr>
						<td class="table_common_td_label_style">
							本次卖出重量（斤）：
						</td>
						<td colspan="2" class="table_common_td_txt_style">
							<input name="thisWeight" id="thisWeight" class="easyui-numberbox" precision="2" min="0.00" max="9999999.99" value="" style="width:150px;">
							<span class="span_common_mustinput_style">*</span>
						</td>
					</tr>
					<tr>
						<td class="table_common_td_label_style" >处理人：</td>
						<td class="table_common_td_txt_style">
							<input name="operatorName" id="operatorName" value="" class="easyui-textbox" style="width:150px;">
							<span class="span_common_mustinput_style">*</span>
						</td>
						<td class="table_common_td_label_style" >处理日期：</td>
						<td class="table_common_td_txt_style editableFalse">
							<input class="easyui-datebox" name="operatorDate" id="operatorDate" value="Sun May 21 00:00:00 CST 2017"
	            data-options="required:true,showSeconds:false" style="width:100px" editable="false">
							<span class="span_common_mustinput_style">*</span>
						</td>
					</tr>
				</table>
			</fieldset>
			<fieldset class="fieldset_common_style">
				<legend>超产举证材料</legend>
				<table class="table_common_style">
					<tr>
						<td>
							<a href="#" class="easyui-linkbutton"  onclick="ccUpload();">
								<span class="l-btn-left"><span class="l-btn-text icon-docupload l-btn-icon-left">
								上传超产举证材料</span></span>
							</a>
						</td>
					</tr>
					<tr>
						<td> 
							<table height="100px;" id="imgList2" class="easyui-datagrid" striped="true" singleSelect="true">
								<thead>
									<tr>
										<th field="originalName" width="50%" align="center">举证凭证</td>
										<th field="fileInfo" width="30%" align="center">说明</td>
										<th field="op" width="20%" align="center">操作</td>
									</tr>
								</thead>
							</table>
						</td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>
	<div id="bhDialog"></div>
	<div id="uploadDialog"></div>
<script type="text/javascript">
	var zmj = parseFloat("");
	var maxYield = parseFloat("0.0");  //最大亩产
	var ymcls = parseFloat("0");        //已卖出粮食
	var ygcl = 0;                  //预估产量
	var kmzl = 0;                  //可卖重量
	var lastQcIdNumber = "";        //上次确认身份证号
	$(document).ready(function(){
		lastQcIdNumber = "";  //上次确认身份证号
		//初始化文件
		//showFileList('14', '', '土地举证材料', 'imgPriviewOuter', 'imgPriviewInner', '', 'imgList');
		//showFileList('15', '', '购种举证材料', 'imgPriviewOuter', 'imgPriviewInner', '', 'imgList1');
		//showFileList('16', '', '超产举证材料', 'imgPriviewOuter', 'imgPriviewInner', '', 'imgList2');
		
		$("#seedPurchaseTotal").numberbox({
		    "onChange":function(){
		    	comValue($("#seedPurchaseTotal").numberbox('getValue'));
		    }
		});
		comValue($("#seedPurchaseTotal").numberbox('getValue'));
	});

	function closeEditDialog(){
		$('#addDialog').dialog('close');
	}

	function save(){
		if(!check()) return ;
		if( lastQcIdNumber != $("#idNumber").val() ){
			$.messager.alert('警告','身份证号发生了变化，请确权后再操作！','warning');
			return false;
		}
		//如果	本次卖出重量和可卖重量要大,提交必须上传超产凭证
		if( kmzl < $("#thisWeight").val() ){
			var fc = $('#imgList2').datagrid('getData');
			//alert( obj.rows.length );
			//var s = document.getElementById("imgList2");  //超产附件div
			//var fc = s.firstChild;   //获得s的第一个子节点--附件
			if( fc.rows.length == 0 ){
				$.messager.alert('警告','本次卖出重量大于可卖重量，必须上传超产举证材料。','warning');
				return false;
			}
		}
		
		if( parseFloat($("#thisWeight").val()) <= 0 ){
			$.messager.alert('警告','本次卖出重量数无效。','warning');
			return;
		}
		
		var a = $('#editForm').toObject();
		Public.ajaxPost('getYmcls', JSON.stringify(a), function(e) {
			if (200 == e.status) {
				var newYmc = e.data.ymcls;
				if( newYmc == ymcls ){
					var retFlag = '';
					showLoading();
					Public.ajaxPost('save', JSON.stringify(a), function(e) {
						if (200 == e.status) {
							$.messager.alert('提示','保存成功。','info',function(){
						        if(retFlag == '1'){
						          //document.location.href = '${pageContext.request.contextPath}/graiReg/list';
						          retList();
						        } else {
						          document.location.href = '${pageContext.request.contextPath}/graiReg/editInput';
						        }
						    });
						} else {
							hideLoading();
							$.messager.alert('错误','保存失败！' + e.msg,'error');
						}
					});
				}else{
					hideLoading();
					$.messager.alert('错误','已卖出粮食发生了变化，请重新确权后操作或退出系统后再操作！','error');
				}
			}else{
				$.messager.alert('错误','操作失败！' + e.msg,'error');
			}
		});
	}
	
	//地块
	function landUpload(){
		var id = $("#id").val();
		showUploadDialog('14', id, '举证材料', 'imgPriviewOuter', 'imgPriviewInner', 'imgList');
	}
	//购种
	function gzUpload(){
		var id = $("#id").val();
		showUploadDialog('15', id, '举证材料', 'imgPriviewOuter', 'imgPriviewInner', 'imgList1');
	}
	//超产
	function ccUpload(){
		var id = $("#id").val();
		showUploadDialog('16', id, '举证材料', 'imgPriviewOuter', 'imgPriviewInner', 'imgList2');
	}
	
	var aMu = 0;   //合同亩
	var sMu = 0;   //测亩
	//调用接口查询土地信息
	function queryLand(){
		var contractorType = "01";   //默认为农户
		var contractorId = $("#idNumber").val();   //身份证号
		var idType = "01";   //默认为身份证--新需求只根据二个参数取数据:证件类型和证件号码
		if(contractorId!=""){
			var strError = checkIdNumber(contractorId);
			if(strError.length>1){
				$.messager.alert('警告',strError,'warning');
				return false;
			}
		}else{
			$.messager.alert('警告','身份证号不能为空。','warning');
			return;
		}
		showLoading();
		lastQcIdNumber = contractorId;
		Public.ajaxGet('../api/getContratorInfo?contratorId=' + contractorId + "&contractorIDType=" + idType + "&year=" + $("#year").combobox('getValue'), {}, function(e) {
			if (0 == e.status) {
				clearDatasTable();
				initInterfaceInfo( e.data );
			} else{
				$.messager.alert('错误', e.msg, 'error');
				//承包方
				$("#farmerName").textbox('setValue', '' );
				//联系方式
				//$("#tmp_contractorTel").textbox('setValue', contratorInfo.contractorTel );
				//乡
				$("#townCode").val('');
				//村--乡赋值后有延时,所以放后面
				$("#countryCode").val('');
				//屯
				$("#groupName").textbox('setValue', '' );
				//乡
				$("#tmp_townCodeView").combobox('setValue', '');
				//村
				$("#tmp_countryCodeView").combobox('setValue', '');
				
				//设值面积
				$("#actualMu").val('');
				$("#measurementMu").val('');
				$("#ygDiv").html( '0.00' );
				$("#kmDiv").html( '0.00' );
				$("#ymcDiv").html( '0.00' );
				$("#zmj").val( '0.00' );
				$("#registeredTotalYield").val( '0.00' );
				
				//$("#townCode").combobox({disabled: true});
				//$("#countryCode").combobox({disabled: true});
				clearDatasTable();
			}
		});
		hideLoading();
	}
	//初始化信息
	function initInterfaceInfo( data ){
		//基本信息
		var contratorInfo = data.peasant;
		//承包方
		$("#farmerName").textbox('setValue', contratorInfo.contractorName );
		//联系方式
		//$("#tmp_contractorTel").textbox('setValue', contratorInfo.contractorTel );
		//乡
		//$("#townCode").combobox( 'setValue', contratorInfo.townCode );
		//村--乡赋值后有延时,所以放后面
		//$("#countryCode").combobox('setValue', contratorInfo.countryCode );
		//屯
		$("#groupName").textbox('setValue', contratorInfo.groupName );
		var params = {'cityCode': $('#cityCode').combobox('getValue'), 'townCode':contratorInfo.townCode, 'countryCode':contratorInfo.countryCode};
		Public.ajaxGet('../areaDevision/getAreaDevisions', params, function(e) {
			if (200 == e.status) {
				 addTownAndCountryOptions(JSON.parse(e.data));
			} else {
				$.messager.alert('错误','操作失败！' + e.msg, 'error');
			}
		});
		//土地列表信息
		var landInfo = data.contract;
		for( var contract in landInfo ){
			//类型
			var landType = landInfo[contract].landTypeName==null?'':landInfo[contract].landTypeName;
			//合同面积
			var actuMu = landInfo[contract].contractArea;
			aMu += actuMu;
			//实测面积
			var measurementMu = landInfo[contract].measurementMu;
			sMu += measurementMu;
			//类别
			var landClass = landInfo[contract].landClassName==null?'':landInfo[contract].landClassName;
			//alert( landClass );
			//位置
			var landlocation = landInfo[contract].landName;
			
			//addRow("datas", landType, actuMu, measurementMu, landClass, landlocation );
			$('#datas').datagrid('appendRow', {
				landType: landType,
				aMu : actuMu,
				cMu: measurementMu,
				landClass: landClass,
				landName:landlocation
			});
		}
		
		$("#dkzmj").textbox('setValue', data.zmj );
		$("#registeredTotalYield").textbox('setValue', data.yba );
		$("#grainTotalYield").textbox('setValue', data.kba );
		//设值面积
		$("#actualMu").val( aMu );
		$("#measurementMu").val( sMu );
		
		
		//alert($("#townCode").combobox('getText'));
		//alert($("#countryCode").combobox('getText'));
		
		//$('#townCode').combobox("clear");
		//$("#townCode").combobox();
		//$("#countryCode").combobox();
		//setEasyUISelectReadOnly('townCode');
		//setEasyUISelectReadOnly('countryCode');
		
		zmj = parseFloat(data.zmj);
		ymcls = parseFloat(data.ymcls);
		comValue($('#seedPurchaseTotal').val());
	}
	//添加行--土地信息
	function addRow(tableId, landTypeText, actuMu, measurementMu, landClassText, landlocation ){
		var testTbl = document.getElementById(tableId);
		var maxRowNum =  testTbl.rows.length;  //获取最大行数
		//添加一行
		var newTr = testTbl.insertRow( maxRowNum );
		//添加5列
		var landType = newTr.insertCell(0);
		landType.setAttribute("align", "center");
		landType.setAttribute("height", "20");
		landType.innerHTML = landTypeText;
		var sm = newTr.insertCell(1);
		sm.setAttribute("align", "center");
		sm.innerHTML= actuMu;
		var cm = newTr.insertCell(2);
		cm.setAttribute("align", "center");
		cm.innerHTML= measurementMu;
		var landClass = newTr.insertCell(3);
		landClass.setAttribute("align", "center");
		landClass.innerHTML = landClassText;
		var landLocation = newTr.insertCell(4);
		landLocation.setAttribute("align", "center");
		landLocation.innerHTML = landlocation;
	}
	function comValue( num ){
		if(num==null||num==''||num==0){
			return;
		}
		if(zmj==undefined || zmj==null || zmj=='' || zmj==0){
			$.messager.alert('警告','土地面积为0，请先确权。','warning');
			return false;
		}
		//计算值 :测量亩累加值  购种重量/10 取最小的  * 最大亩产    =   预估产量
		var slmj = $("#grainTotalYield").textbox('getValue' );
		if( (num / 10) < slmj ){   //这前是与zmj相比,现在改成收粮面积相比
			ygcl = maxYield * (num /10);
		}else{
			ygcl = maxYield * slmj;
		}
		$("#ygDiv").html( numberDecimalDigits(ygcl,2) );
		kmzl = ygcl - ymcls;
		$("#kmDiv").html(numberDecimalDigits( kmzl,2) );
		$("#ymcDiv").html( numberDecimalDigits(ymcls,2) );
		//隐藏域赋值
		$("#estimateTotalYield").val( numberDecimalDigits(ygcl,2) );
		$("#soldYield").val(numberDecimalDigits(ymcls,2));
		$("#surplusYield").val(numberDecimalDigits( kmzl,2) );
	}
	

	function clearDatasTable(){
		//$("#datas").html("<tr><th width=100 height=20 align=center nowrap >土地类型</th><th width=100 height=20 align=center nowrap>实（亩）</th><th width=100 height=20 align=center nowrap>测量（亩）</th><th width=100 height=20 align=center nowrap>土地类别</th><th width=120 height=20 align=center nowrap>地块名称</th></tr>");
		$('#datas').datagrid('loadData', { total: 0, rows: [] });
	}
	function check(){
		if( $("#companyCode").combobox('getValue') == "" ){
			$.messager.alert('警告','请选择企业。','warning');
			return false;
		}
		if($("#farmerName").val()==""){
			$.messager.alert('警告','请填写姓名。','warning');
			return false;
		}
		if($("#idNumber").val()==""){
			$.messager.alert('警告','请填写身份证号。','warning');
			return false;
		}
		
		if($('#idNumber').val()!=""){
			var strError = checkIdNumber($('#idNumber').val());
			if(strError.length>1){
				$.messager.alert('警告',strError,'warning');
				return false;
			}
		}
		if($("#countryCode").val()==""||$("#townCode").val()==""||$("#groupName").val()==""){
			$.messager.alert('警告','请选择或填写地址。','warning');
			return false;
		}
		if($("#seedPurchaseTotal").val()==""){
			$.messager.alert('警告','请填写手工登记购种数量。','warning');
			return false;
		}else if (!isNumber($("#seedPurchaseTotal").val())){
			$.messager.alert('警告','手工登记购种数量请输入数字。','warning');
			return false;
		}			
		if($("#thisWeight").val()==""){
			$.messager.alert('警告','请填写本次卖出重量。','warning');
			return false;
		}else if (!isNumber($("#thisWeight").val())){
			$.messager.alert('警告','本次卖出重量请输入数字。','warning');
			return false;
		}			
		if($("#operatorName").val()==""){
			$.messager.alert('警告','请填写处理人。','warning');
			return false;
		}
		if( ($("#operatorName").val() +"").length > 20  ){
			$.messager.alert('警告','处理人长度不能超过20。','warning');
			return false;
		}
		
		return true;
	}	
	
	function addTownAndCountryOptions(obj){
		$('#tmp_townCodeView').combobox({
			valueField:'id',
			textField:'text',
			onChange:function(){return false;}
		});
		$('#tmp_countryCodeView').combobox({
			valueField:'id',
			textField:'text',
			onChange:function(){return false;}
		});
		$('#tmp_townCodeView').combobox('clear');
		$('#tmp_countryCodeView').combobox('clear');
		$('#tmp_townCodeView').combobox('loadData',[{'id':obj[0].id,'text': obj[0].text}]);
		$('#tmp_countryCodeView').combobox('loadData',[{'id':obj[1].id,'text': obj[1].text}]);
		$('#tmp_townCodeView').combobox('setValue',obj[0].id);
		$('#tmp_countryCodeView').combobox('setValue',obj[1].id);
		$('#townCode').val(obj[0].id);
		$('#countryCode').val(obj[1].id);
	}
	
	function setEasyUISelectReadOnly(selectId){
		var _tempV = $('#' + selectId).combobox('getValue');
		var _tempT = $('#' + selectId).combobox('getText');
		$('#' + selectId).combobox({
			valueField:'id',
			textField:'text',
			onChange:function(){return false;}
		});
		$('#' + selectId).combobox('clear');
		$('#' + selectId).combobox('loadData',[{'id':_tempV,'text': _tempT}]);
		$('#' + selectId).combobox('setValue',_tempV);
	}
	function retList(){
		var url = "${pageContext.request.contextPath}/graiReg/list";
		url += "?year=";
		url += "&page=";
		url += "&pageSize=";
		url += "&companyCode=";
		url += "&beginDate=";
		url += "&endDate=";
		
		window.document.location.href = url;
	}
</script>
</body>
</html>