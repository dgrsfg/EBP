<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AddTicket.jsp' starting page</title>
    <style type="text/css">
    	span.descs1{color: red;}
    	span.startTime{color: red;}
    	span.amount{color: red}
    	span.balance{color: red;}
    	span.price{color: red;}
    </style>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
	<script type="text/javascript" src="js/jquery.ui.datepicker-zh-CN.js"></script>
	<script type="text/javascript" src="js/jquery-ui-1.8.5.custom.min.js"></script>
	<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.5.custom.css" rel="stylesheet" />
	<script type="text/javascript" src="js/textlimit.js"></script>
	<script type="text/javascript">
	
	$(ready);
	  	function ready(){
	  		$("#datepicker").attr({"readonly":"readonly"}).datepicker();
	  		$("#textlimit1").textlimit("span.counter1", 255);
	  		$("#textlimit2").textlimit("span.counter2", 11);
	  		$("#textlimit3").textlimit("span.counter3", 11);
	  		$("#textlimit4").textlimit("span.counter4", 11);
	  	}
	  	
	  	function checkForm(){
	  		var regu = "^[0-9]+$";  
			var re = new RegExp(regu);
			var re1 = /^[-]{0,1}(\d+)[\.]+(\d+)$/;
			  
	  		if($("#textlimit1").val() == ""){
	  			$(".descs1").text(".请输入描述信息");
	  			return false;
	  		}
	  		if($("#datepicker").val() == ""){
	  			$(".startTime").text(".请输入开始时间");
	  			return false;
	  		}
	  		if($("#textlimit2").val() == ""){
	  			$(".amount").text(".请输入总票数");
	  			return false;
	  		}
	  		if($("#textlimit2").val().search(re) != -1){
	  		}else{
	  			 $(".amount").text(".总票数应为正整数");
	  			 return false;
	  		}
	  		if($("#textlimit3").val() == ""){
	  			$(".balance").text(".请输入剩余票数");
	  			return false;
	  		}
	  		if($("#textlimit3").val().search(re) != -1){
	  		}else{
	  			 $(".balance").text(".剩余票数数应为正整数");
	  			 return false;
	  		}
	  		if(parseInt($("#textlimit3").val()) > parseInt($("#textlimit2").val())){
	  			$(".balance").text(".余票不可以大于总票数");
	  			return false;
	  		}
	  		if($("#textlimit4").val() == ""){
	  			$(".price").text(".请输入票价");
	  			return false;
	  		}
	  		if(re1.test($("#textlimit4").val())){
	  			 if (RegExp.$1 == 0 && RegExp.$2 == 0) {
	  			 	$(".price").text(".价格应为小数格式");  
					return false;
				}  
	  		}else{
	  			$(".price").text(".价格应为小数格式");
	  			return false;
	  		}
	  		return true;
	  	}
	</script>

  </head>
  
  <body>
    <s:form action="/admin/AddTicketAction" name="form" onSubmit="return checkForm()" theme="simple" method="post">
              描述:&nbsp;<textarea name="descs" cols="40" rows="4" id="textlimit1"></textarea>
                 &nbsp;还有<span class="counter1"></span>字符可以输入<br />
                 &nbsp;&nbsp;<span class="descs1"></span><br />    
              时间:&nbsp;<input type="text"  id="datepicker" name="startTime" /><br /> 
                 &nbsp;&nbsp;<span class="startTime"></span><br />  
   	  总票数:&nbsp;<input type="text" name="amount" value="" id="textlimit2"/>
   	             &nbsp; 还有<span class="counter2"></span>字符可以输入<br />
   	             &nbsp;&nbsp;<span class="amount"></span><br /> 
  	  剩余票数:&nbsp;<input type="text" name="balance" value="" id="textlimit3"/>
  	             &nbsp; 还有<span class="counter3"></span>字符可以输入<br />
  	             &nbsp;&nbsp;<span class="balance"></span><br /> 
               单价:&nbsp;<input type="text" name="price" value="" id="textlimit4"/>
                &nbsp; 还有<span class="counter4"></span>字符可以输入<br />
                &nbsp;&nbsp;<span class="price"></span><br />           
              状态:&nbsp;<input type="radio" name="status" value="0" />已停售
        <input type="radio" name="status" value="1" checked="checked"/>售票中
        <br/>                   
     &nbsp;<s:submit value="确定" />
     </s:form>
  </body>
</html>
