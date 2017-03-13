<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<title>登录页面</title>
<head>
<base href="<%=basePath%>">
<title>My JSP 'UserLogin.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<body bgcolor="#0591C2">
				<img src="<c:url value='/images/image-login-left.jpg'/>" />
				<center>
					<img src="<c:url value='/images/image-adminlogin.jpg'/>" />
				</center>
				<s:actionerror />
				<s:form action="/user/login" method="post" theme="simple">
					<p>
						用户名：
						<s:textfield name="username" />
						<s:fielderror>
							<s:param>username</s:param>
						</s:fielderror>
					</p>
					<p>
						密&nbsp;&nbsp;&nbsp;&nbsp;码：
						<s:password name="password" />
						<s:fielderror>
							<s:param>password</s:param>
						</s:fielderror>
					</p>
					<p>
						&nbsp;&nbsp;&nbsp;<input type="submit" name="" value="登录" />&nbsp;&nbsp;&nbsp;
						<input type="reset" name="" value="取消" />
					</p>
				</s:form>
</body>
</html>
