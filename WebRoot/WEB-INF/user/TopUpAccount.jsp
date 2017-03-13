<%@page import="com.oracle.ebp.domain.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	User user = (User)session.getAttribute("user");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title></title>
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
		<s:form action="/user/TopUpAccount" method="post" theme="simple">
			<ul>
				<li>
					用户名：${user.userName}
				</li><br /><br />
				<li>
					账户余额：${user.balance}
				</li><br /><br />
				<li>
					充值方式：<select name="test" size="1">
						<option value="option1">空中充值
					</select>
				</li><br /><br />
				<li>
					充值金额：<s:textfield name="addbalance"/>元
				</li><br /><br />
				<li>
					<s:submit value="充值"/>
				</li>
			</ul>
		</s:form>
	</div>
  </body>
</html>
