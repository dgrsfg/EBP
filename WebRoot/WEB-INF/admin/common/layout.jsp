<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
	<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="<c:url value='/css/style.css'/>" rel="stylesheet" type="text/css" />
	</head>

	<body>
		<div id="main_page">
		
			<div id="header">
				<img src="<c:url value='/images/image-logo.png'/>" />
				<br/><br/><br/>
				<a href="admin/Login.jsp">登录</a>
				<a href="admin/logout">退出</a>
			</div>
			
			<div id="body">
			
				<div id="navigation">
					<jsp:include page="/WEB-INF/admin/common/navigation.jsp" />
				</div>
				
				<div id="content">
				
					<div class="title">
						<p>
							<img src="<c:url value='/images/icon-title.jpg'/>" />
							${pageTitle}
						</p>
					</div>
					
					<jsp:include page="/WEB-INF/admin/${mainBody}" />
				</div>
				
				<!--content-->
			</div>
			
			
			
			<!--body-->
			
		</div>
	</body>
</html>
