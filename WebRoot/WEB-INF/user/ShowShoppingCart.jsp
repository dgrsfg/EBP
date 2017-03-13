<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ShowShoppingCart.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function Confirmer() {
            if (confirm("这是一个确认框，请点击确认或取消")) {
                return true
            }
            else{
                return false
            }
        }
	</script>

  </head>
  
  <body>
  <form onsubmit="return Confirmer()" method="post" action="showOrder.action">
    <table class="table table-striped" width="50%" border="1" cellspacing="0" bordercolor="black">
       <tr align="center">
       	 <td>序号</td>
       	 <td>描述</td>
      	 <td>单价（元）</td>
      	 <td>购票数（张）</td>
      	 <td>总金额（元）</td>
      	 <td></td>
       </tr>
       <c:forEach var="orderList" items="${orderList}" varStatus="vs">
  			<tr align="center">
  				<td>${vs.count}</td>
  				<td>${orderList.descs}</td>
  				<td>${orderList.price}</td>
  				<td>${orderList.quantity}</td>
  				<td>${orderList.amount}</td>
  				<td><input  name="descs" value="${orderList.lid}"/>
  				<a href="user/shoppingCart?lid=${orderList.lid}">删除</a></td>
  			</tr>
       </c:forEach>
       <tr align="center">
       	 <td>总计</td>
       	 <td></td>
      	 <td></td>
      	 <td>${olistQuantity}</td>
      	 <td>${olistAmount}<input hidden name="olistAmount" value="${olistAmount}"/></td>
      	 <td></td>
       </tr>
       </table>
       <input type="button" value="继续订票" onclick="location.href='user/gotoAddShoppingCart'"/>&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;<input type="submit" value="结账"/></form>
  </body>
</html>
