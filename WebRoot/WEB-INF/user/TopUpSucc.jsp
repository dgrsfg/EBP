<%@page import="com.oracle.ebp.domain.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	User user = (User)session.getAttribute("user");
	request.getAttribute("addbalance");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title> </title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <body>
     <div >
		<ul>
			<li>
				<font color="red">充值成功！</font>
			</li><br /><br />
			<li>
				本次充值信息如下：
			</li><br /><br />
			<li>
				用户名：${user.userName}&nbsp;&nbsp;&nbsp;充值方式：空中充值&nbsp;&nbsp;&nbsp;充值金额：${addbalance}
			</li><br /><br />
			<li>
				账户余额：${user.balance}
			</li>
		</ul>
	</div>
  </body>
</html>
