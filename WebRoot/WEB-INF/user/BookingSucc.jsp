<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.oracle.ebp.domain.Order"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.oracle.ebp.domain.OrderList"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% 
	List<OrderList> olist=(List<OrderList>)session.getAttribute("olist");
	Order order=(Order)session.getAttribute("order");
	int olistQuantity=0;
	int olistAmount=0;
	for(OrderList ol:olist){
		olistQuantity+=ol.getQuantity();
		olistAmount+=ol.getAmount();
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
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
  	您的预定已成功！<br/>
  	订单号：${order.oid}&nbsp;&nbsp;订单生成时间：${order.commitTime}<br/>
  	以下是该订单的详细信息<br/>
    <table class="table table-striped"  width="50%" border="1" cellspacing="0" bordercolor="black">
       <tr align="center">
       	 <td>序号</td>
       	 <td>描述</td>
      	 <td>单价（元）</td>
      	 <td>购票数（张）</td>
      	 <td>总金额（元）</td>
       </tr>
       <c:forEach var="orderList" items="${olist}" varStatus="vs">
       
  			<tr align="center">
  				<td>${vs.count}</td>
  				<td>${orderList.descs}</td>
  				<td>${orderList.price}</td>
  				<td>${orderList.quantity}</td>
  				<td>${orderList.amount}</td>
  			</tr>
       </c:forEach>
       <tr align="center">
       	 <td>总计</td>
       	 <td></td>
      	 <td></td>
      	 <td><%=olistQuantity %></td>
      	 <td><%=olistAmount %>${olistAmount}</td>
       </tr>
       </table>
       <font color="blue">该订单已出票，两日内将通过快递送达，请注意查收。</font>
  </body>
</html>
