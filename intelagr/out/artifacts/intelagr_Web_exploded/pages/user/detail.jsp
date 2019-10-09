<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html style="width:100%;height:100%;overflow:hidden">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
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
	<div region="center" border="false" style="padding:0 10px;">	
		<form id="fm" name="fm" class="easyui-form" method="post" data-options="novalidate:true">
			<table cellpadding="8" style="text-align:center;" align="center">
				<tr>
					<td height="20px;">&nbsp;</td>
				</tr>
				<tr>
	    			<td width="30%" align="right">用户姓名:</td>
	    			<td>
	    			<input class="easyui-textbox" type="text" id="userName" name="userName" style="width:200px;" value="${user.userName }"></input>
	    			<input type="hidden" name="userID" style="width:200px;" value="${user.userID }"></input>
	    			</td>
    			</tr>
    			<tr>
	    			<td width="30%" align="right">联系方式:</td>
	    			<td>
	    				<input class="easyui-textbox" type="text" id="tel" name="tel" style="width:200px;" value="${user.tel }"></input>
	    			</td>
    			</tr>
    			<tr>
	    			<td width="30%" align="right">电子邮件:</td>
	    			<td>
	    				<input class="easyui-textbox" type="text" id="email" name="email" style="width:200px;" value="${user.email }"></input>
	    			</td>
    			</tr>

			</table>
		</form>
	</div>

</body>
</html>