<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ShowAllOrders.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
	<script type="text/javascript" src="js/jquery.ui.datepicker-zh-CN.js"></script>
	<script type="text/javascript" src="js/jquery-ui-1.8.5.custom.min.js"></script>
	<link type="text/css"href="css/ui-lightness/jquery-ui-1.8.5.custom.css" rel="stylesheet" />
		
  </head>
  
  <body>
     <s:form action="AllOrdersAction" theme="simple" method="post">
     	起始日期:<s:textfield id="datepicker1" name="stime" />
 		终止日期：<s:textfield id="datepicker2" name="otime" />
 		<s:submit value="查询"></s:submit>
      <br />
     	订单号:<s:textfield name="oid"/>
     	姓名/用户名:<s:textfield name="name"/>
     	身份证号:<s:textfield name="idCard"/>
     	<s:submit value="查询"/> 
     </s:form>
     <input type="hidden" value='${defaultId}' id="defaultId" />
     <table border="1" cellspacing="0" >
     <tr>
     	<td width="150" height="30"><p align="center"><strong>编号</strong></p></td>
    	<td width="150" height="30"><p align="center"><strong>订单号</strong></p></td>
    	<td width="150" height="30"><p align="center"><strong>订单内容</strong></p></td>
    	<td width="150" height="30"><p align="center"><strong>成交时间</strong></p></td>
    	<td width="150" height="30"><p align="center"><strong>金额</strong></p></td>
    	<td width="150" height="30"><p align="center"><strong>姓名</strong></p></td>
    	<td width="150" height="30"><p align="center"><strong>用户名</strong></p></td>
    	<td width="150" height="30"><p align="center"><strong>身份证号</strong></p></td>
    </tr>
     <s:iterator value="#request.listAllOrder" id="order" status="status">
     	 <s:iterator value="orderList" id="list" status="status">
     	<tr>
    		<td width="150" height="30"><p align="center"><strong><s:property value="#status.count"/></strong></p></td>
    		<td width="150" height="30"><p align="center"><strong><s:property value="order.oid"/></strong></p></td>
    		<td width="150" height="30"><p align="center"><strong><s:property value="descs"/></strong></p></td>    
    		<td width="150" height="30"><p align="center"><strong><s:property value="order.commitTime"/></strong></p></td>
    		<td width="150" height="30"><p align="center"><strong><s:property value="amount"/></strong></p></td>
    		<td width="150" height="30"><p align="center"><strong><s:property value="order.user.name"/></strong></p></td> 
    		<td width="150" height="30"><p align="center"><strong><s:property value="order.user.userName"/></strong></p></td> 
    		<td width="150" height="30"><p align="center"><strong><s:property value="order.user.idCard"/></strong></p></td>     
    	</tr>
    	 </s:iterator>
     	</s:iterator>
     </table>
     <script type="text/javascript">
	$(ready);
	function ready() {
		$("#datepicker1").attr( {"readonly" : "readonly"}).datepicker();
		$("#datepicker2").attr( {"readonly" : "readonly"}).datepicker();
		
		if($("#defaultId").val() == -1){
			alert("没有找到相关内容");
		}
	}
	</script>
  </body>
</html>
