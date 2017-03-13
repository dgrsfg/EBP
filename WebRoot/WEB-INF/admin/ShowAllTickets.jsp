<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.oracle.ebp.domain.Ticket"%>
<%@page import="com.oracle.ebp.domain.PageBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'ShowAllTickets.jsp' starting page</title>
		 <style type="text/css">
    	span.time{color: red;}
    </style>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
		<script type="text/javascript" src="js/jquery.ui.datepicker-zh-CN.js"></script>
		<script type="text/javascript" src="js/jquery-ui-1.8.5.custom.min.js"></script>
		<link type="text/css"href="css/ui-lightness/jquery-ui-1.8.5.custom.css" rel="stylesheet" />
		<script type="text/javascript">
	$(ready);
	function ready() {
		$("#datepicker1").attr( {"readonly" : "readonly"}).datepicker();
		$("#datepicker2").attr( {"readonly" : "readonly"}).datepicker();
	}
	
	function checkForm(){
		if($("#datepicker1").val()=="" || $("#datepicker2").val()==""){
			alert("请选择日期");
			return false;
		}
	}
	
	var dataId;
	var dataStatus;
	var hidden;
	var button;
	function change(tid) {
		hidden = "#" + tid + "id";
		dataStatus = $(hidden).val();
		//alert(dataStatus);
		dataId = tid;
		$.ajax( {
			type : "post",
			async : true, // 是否异步加载数据
			url : "admin/allTicketsAction.action",
			data : "tid=" + tid + "&dataStatus=" + dataStatus,
			dataType : "text", //预期服务器返回的数据类型
			success : statechange
	
		});
		//alert(data);
		function statechange(data) {
			//alert(data);
			name = "#" + dataId;
			button = "#" + tid + "button";
			if (data == 0) {
				$(button).attr("value", "售票");//改变button的value属性.
				$(name).html("已停售");//改变售票状态.
				$(hidden).val(data);//把返回的data值重新赋给hidden.
			} else {
				$(button).attr("value", "停售");
				$(name).html("售票中");
				$(hidden).val(data);
			}
		}
	}

</script>
	</head>

	<body>

		<s:form action="/admin/AllTicketsAction" name="form" onsubmit="return checkForm()" theme="simple" method="post">
		<input type="hidden" name="page" value="1"/>
 		起始日期:<s:textfield id="datepicker1" name="stime" />
 		终止日期：<s:textfield id="datepicker2" name="otime" />
			<s:submit value="查询"/><br />
			 
		</s:form>
		&nbsp;&nbsp;<span class="time"></span><br /> 
		<s:if test="#request.listTicket.size != 0">
			<table width="500" height="386" border="1" cellspacing="0"
				align="center">
				<tr>
					<td width="150" height="30">
						<p align="center">
							<strong>编号</strong>
						</p>
					</td>
					<td width="150" height="30">
						<p align="center">
							<strong>描述</strong>
						</p>
					</td>
					<td width="150" height="30">
						<p align="center">
							<strong>时间</strong>
						</p>
					</td>
					<td width="150" height="30">
						<p align="center">
							<strong>总票数</strong>
						</p>
					</td>
					<td width="150" height="30">
						<p align="center">
							<strong>剩余票数</strong>
						</p>
					</td>
					<td width="150" height="30">
						<p align="center">
							<strong>单价</strong>
						</p>
					</td>
					<td width="150" height="30">
						<p align="center">
							<strong>状态</strong>
						</p>
					</td>
					<td width="150" height="30">
						<p align="center">
							<strong>
								<input type="button" value="添加票项" onclick="location.href='AddTicket.jsp'"/>
							</strong>
						</p>
					</td>
				</tr>

				<s:iterator value="#request.listTicket" id="ticket" status="status">

					<tr>
						<td width="150" height="30">
							<p align="center">
								<strong><s:property value="#status.count" />
								</strong>
							</p>
						</td>
						<td width="150" height="30">
							<p align="center">
								<strong><s:property value="descs" />
								</strong>
							</p>
						</td>
						<td width="150" height="30">
							<p align="center">
								<strong><s:property value="startTime" />
								</strong>
							</p>
						</td>
						<td width="150" height="30">
							<p align="center">
								<strong><s:property value="amount" />
								</strong>
							</p>
						</td>
						<td width="150" height="30">
							<p align="center">
								<strong><s:property value="balance" />
								</strong>
							</p>
						</td>
						<td width="150" height="30">
							<p align="center">
								<strong><s:property value="price" />
								</strong>
							</p>
						</td>

						<s:if test="status == 0">
							<td width="150" height="30">
								<p align="center" id=${ticket.tid}>
									<strong>已停售</strong>
								</p>
							</td>
							<td width="150" height="30">
								<p align="center">
									<strong> 
										<input type="hidden" value=${ticket.status} id='${ticket.tid}id' />
										<input type="button" name="" value="售票" id='${ticket.tid}button' onclick="change(${ticket.tid})" />
										<input type="button" value="修改" onclick="location.href='admin/allTicketsaction?tid=${ticket.tid}'" />
								</strong>
								</p>
							</td>
						</s:if>
						<s:elseif test="status==1">
							<td width="150" height="30">
								<p align="center" id=${ticket.tid}>
									<strong>售票中</strong>
								</p>
							</td>
							<td width="150" height="30">
								<p align="center">
									<strong> 
										<input type="hidden" value=${ticket.status} id='${ticket.tid}id' />
									    <input type="button" name="" value="停售" id='${ticket.tid}button' onclick="change(${ticket.tid})" /> 
									    <input type="button" value="修改" onclick="location.href='admin/allTicketsaction?tid=${ticket.tid}'" />
								 </strong>
								</p>
							</td>
						</s:elseif>
					</tr>
				</s:iterator>
			</table>
			<br/>
			<p align="center">
				<a href="admin/AllTicketsAction.action?page=${page - 1 }">上一页</a>
				<a href="admin/AllTicketsAction.action?page=${page + 1}">下一页</a>
			</p>
		</s:if>
		
		
	</body>
</html>
