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
			<fieldset class="fieldset_common_style">
				<table class="table_common_style">
					<tr>
						<td>
							<a href="#" class="easyui-linkbutton"  onclick="return save();">
								<span class="l-btn-left">
									<span class="l-btn-text icon-save l-btn-icon-left">
									保存</span></span>
							</a>
							
						</td>
					</tr>
				</table>
			</fieldset>
			<fieldset class="fieldset_common_style">
				<table class="table_common_style">
						<tr>
							<td class="table_common_td_label_style">上报流水号：</td>
							<td colspan="3" class="table_common_td_txt_style">
								<input class="easyui-textbox" readonly type="text" name="applyBatchNo" value="TR20170521000007" style="width:187px;"></input>
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
							<td class="table_common_td_label_style">企业名称：</td>
							<td class="table_common_td_txt_style">
								


	

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
						<tr>
							<td class="table_common_td_label_style">投入品名称：</td>
							<td class="table_common_td_txt_style">
								<input class="easyui-textbox"  type="text" name="inputGoodsName" value="" style="width:187px;"></input>
								<span class="span_common_mustinput_style">*</span>
							</td>
							<td class="table_common_td_label_style">采购量：</td>
							<td class="table_common_td_txt_style">
								<input class="easyui-numberbox" precision="2" min="0.00" max="9999999.99" type="text" name="purchaseQuantity" value="" style="width:100px;"></input>
								

		<select id="inputGoodsUnit" name="inputGoodsUnit" class="easyui-combobox" style="width:85px;height:22px" data-options="editable:true">

			<option value="01">公斤</option>

			<option value="02">斤</option>

			<option value="03">吨</option>

			<option value="04">升</option>

			<option value="05">公升</option>

			<option value="06">克</option>

		</select>

		 <script type="text/javascript">

			 $(document).ready(function(){ 

				 $('#inputGoodsUnit').combobox({ 

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
							<td class="table_common_td_label_style">投入品经销商：</td>
							<td class="table_common_td_txt_style">
								<input class="easyui-textbox" type="text" name="inputGoodsSupplier" value="" style="width:187px;"></input>
								<span class="span_common_mustinput_style">*</span>
							</td>
						</tr>
						<tr>
							<td class="table_common_td_label_style">采购人：</td>
							<td class="table_common_td_txt_style">
								<input class="easyui-textbox" type="text" name="purchasePerson" value="" style="width:187px;"></input>
								<span class="span_common_mustinput_style">*</span>
							</td>
							<td class="table_common_td_label_style">采购日期：</td>
							<td class="table_common_td_txt_style editableFalse">
								<input class="easyui-datebox" name="purchaseDate"  value="Sun May 21 00:00:00 CST 2017"
            data-options="required:true,showSeconds:false" style="width:187px" editable="false">
								<span class="span_common_mustinput_style">*</span>
							</td>
						</tr>
					</table>
			</fieldset>
			<fieldset class="fieldset_common_style">
				<legend>采购凭证上传</legend>
				<table class="table_common_style">
					<tr>
						<td>
							<a href="#" class="easyui-linkbutton" onclick="showUploadDialog('02', '', '采购凭证', 'imgPriviewOuter', 'imgPriviewInner');">
								<span class="l-btn-left"><span class="l-btn-text icon-docupload l-btn-icon-left">
								上传采购凭证</span></span>
							</a>
						</td>
					</tr>
					<tr>	
						<td>
							<table height="216px;" id="imgList" width="100%" class="easyui-datagrid" striped="true" singleSelect="true">
								<thead>
									<tr>
										<th field="originalName" width="50%" align="center">采购凭证</td>
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
				<legend>采购凭证预览</legend>
				<table id="fileDiv" class="table_common_style">
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
	<div id="addDialog"></div>
	<div id="uploadDialog"></div>
</body>
</html>

<script type="text/javascript">
	$(document).ready(function(){
		var id = $("#id").val(); 
		if(id != ""){
			showFileList("02", id, '采购凭证', 'imgPriviewOuter', 'imgPriviewInner' );
		}
	});
	
	//动态调整预览图片位置
	var width = $("#fileDiv").width();
	var picWidth = $("#imgPriviewInner").width();
	var paddingLeft = (width - picWidth)/2 + "px";
	$("#fileDiv").css("padding-left", paddingLeft);

	function save(){
		if(!check()) return ;
		var a = $('#addFrom').toObject();
		var retFlag = '';
		Public.ajaxPost('${pageContext.request.contextPath}/inputReg/save', JSON.stringify(a), function(e) {
			if (200 == e.status) {
				$.messager.alert('提示','保存成功。','info', function(){
					if(retFlag == '1'){
						retList();
						//window.document.location.href = "${pageContext.request.contextPath}/inputReg/list";
					}else{
						window.document.location.href = "${pageContext.request.contextPath}/inputReg/editInput";
					}
				});
			} else {
				$.messager.alert('错误','保存失败！' + e.msg,'error');
			}
		});
	}
	function retList(){
		var url = "${pageContext.request.contextPath}/inputReg/list";
		url += "?year=";
		url += "&page=";
		url += "&pageSize=";
		url += "&companyCode=";
		url += "&beginDate=";
		url += "&endDate=";
		
		window.document.location.href = url;
	}
	function closeEdiDialog(){
		$('#addDialog').dialog('close');
	}
	function check(){
		if( $('#companyCode').combobox('getValue') == "" ){
			$.messager.alert('警告','请选择企业。','warning');
			return false;
		}
		if($("input[name='inputGoodsName']").val()==""){
			$.messager.alert('警告','请填写投入品名称。','warning');
			return false;
		}
		if( $("input[name='inputGoodsName']").val().length > 50 ){
			$.messager.alert('警告','投入品名称长度不能超过50。','warning');
			return false;
		}
		if( $("input[name='inputGoodsSupplier']").val().length > 100 ){
			$.messager.alert('警告','投入品经销商长度不能超过100。','warning');
			return false;
		}
		if($("input[name='purchaseQuantity']").val()==""){
			$.messager.alert('警告','请填写采购量。','warning');
			return false;
		}else if (!isNumber($("input[name='purchaseQuantity']").val())){
			$.messager.alert('警告','采购量请输入数字。','warning');
			return false;
		}
		if($("input[name='purchasePerson']").val()==""){
			$.messager.alert('警告','请填写采购人。','warning');
			return false;
		}
		if( $("input[name='purchasePerson']").val().length > 20 ){
			$.messager.alert('警告','采购人长度不能超过20。','warning');
			return false;
		}
		
		return true;
	}
	function showVideoList(o, d){}
</script>