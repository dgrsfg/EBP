<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ShowTickets.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.5.custom.css" rel="stylesheet" />
	
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
	<script type="text/javascript" src="js/jquery.ui.datepicker-zh-CN.js"></script>
	<script type="text/javascript" src="js/jquery-ui-1.8.5.custom.min.js"></script>
	<script type="text/javascript" src="dwr/engine.js"></script>
	<script type="text/javascript" src="dwr/util.js"></script>
	<script type="text/javascript" src="dwr/interface/verifyDatepicker.js"></script>
	<script type="text/javascript">
	    $(ready);
	  	function ready(){
	  		$("#datepicker").attr({"readonly":"readonly"}).datepicker();
	  	}
	  	
	    function addShoppingCart(){	
	    	//提交form
			document.ticketsForm.action="${pageContext.request.contextPath }/addOrderlistById.action";
			document.ticketsForm.submit();
		} 
	    
		function queryTickets(){
			//提交form
			document.ticketsForm.action="${pageContext.request.contextPath }/retriveAllTicket.action";
			document.ticketsForm.submit();
		}
		
		function showTickets(){
			//提交form
			document.ticketsForm.action="${pageContext.request.contextPath }/showTickets.action";
			document.ticketsForm.submit();
		}
		
		function addShoppingCart(buyNameId){	
			dataUrl = "addOrderlistById";
			var name = "#quantity" + buyNameId;
			var dataInfo = "quantity="+$(name).val() + "&tid=" + buyNameId;
	
			 $.ajax({
				type : "post",
				async : true,
				url : dataUrl,
				data : dataInfo,
				dataType : "html",
				success : statechange
			}); 
		} 
		
		function statechange(data){
			if(data == '0') {
				alert("添加失败");
			}else{
				var name = "#buyAmount" + data;
				$(name).val("");
				alert("添加成功");
			}
		}
	</script>
  </head>
  
  <body> 
  <br/>
  <br/>
  	         请选择起始日期（查询7天以内票项）：<br/><br/>
  	   <form name="ticketsForm" action=showOrder.acton method="post">
  	   <input type="text" name="datepicker" id="datepicker"/>&nbsp;&nbsp;6666
  	     <fmt:formatDate value="${today}" /> 7777
  	   <input type="submit" value="查询" onclick="queryTickets()"/></form>
  	   <br/>
       <table class="table table-striped" width="50%" border="1" cellspacing="0" bordercolor="black">
       <tr align="center">
       	 <td>序号</td>
       	 <td>描述</td>
      	 <td>时间</td>
      	 <td>总票数</td>
      	 <td>剩余票数</td>
      	 <td>单价（元）</td>
      	 <td>状态</td>
      	 <td>购票数</td>
      	 <td></td>
       </tr>
       <c:forEach var="ticket" items="${ticketList}" varStatus="vs">
  			<tr align="center">
  				<td>${vs.count}</td>
  				<td>${ticket.descs}</td>
  				<td><fmt:formatDate value="${ticket.starttime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
  				<td>${ticket.amount}</td>
  				<td>${ticket.balance}</td>
  				<td>${ticket.price}</td>
  				<c:if test="${ticket.status == 0}">
					<td>已停售</td>
					<td>--</td>
					<td>--</td>
				</c:if>
				<c:if test="${ticket.status == 1}">
					<td>售票中</td>
  					<td><input type="text" name="quantity" id="quantity${ticket.tid}"/></td>
  					<td><input type="button" value="加入购物车" onclick="addShoppingCart(${ticket.tid})"/></td>
  				</c:if>
  			</tr>
       </c:forEach>
       </table>
       <input type="button" value="查看购物车/结账" onclick="showTickets()" />
  </body>
</html>
