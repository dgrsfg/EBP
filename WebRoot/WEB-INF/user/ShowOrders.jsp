<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
  </head>
  <body>
       <table class="table table-striped" width="50%" border="1" cellspacing="0" bordercolor="black">
       <tr align="center">
       	 <td>订单号</td>
      	 <td>时间</td>
      	 <td>金额</td>
       </tr>
  			<tr align="center">
  				<td  width="100" height="30"><p align="center">${order.oid}</td>
    			<td  width="100" height="30"><p align="center">${order.committime}</td>
    			<td  width="100" height="30"><p align="center">${order.amount}</td>
  			</tr>
      </table>
  </body>
</html>
