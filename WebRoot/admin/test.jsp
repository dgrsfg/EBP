<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
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
  ${listTicket[0].descs}
  <table>
    <s:iterator value="#request.listTicket"  id="ticket" status="status">
    	<tr>
    		<td width="150" height="30"><p align="center"><strong><s:property value="#status.count"/></strong></p></td>
    		<td width="150" height="30"><p align="center"><strong><s:property value="descs"/></strong></p></td>
    		<td width="150" height="30"><p align="center"><strong><s:property value="startTime"/></strong></p></td>
    		<td width="150" height="30"><p align="center"><strong><s:property value="amount"/></strong></p></td>
    		<td width="150" height="30"><p align="center"><strong><s:property value=" balance"/></strong></p></td>
    		<td width="150" height="30"><p align="center"><strong><s:property value="price"/></strong></p></td>
    		<td width="150" height="30"><p align="center"><strong><s:property value="status"/></strong></p></td>
    		<td width="150" height="30"><p align="center"><strong><s:property value="status"/></strong></p></td>     
    	</tr>
       </s:iterator>
       </table>
  </body>
</html>
