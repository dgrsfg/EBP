<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 	<base href="<%=basePath%>">
    <title>注册页面</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
	<script type="text/javascript" src="js/textlimit.js"></script>
	<style type="text/css">
		    #commentForm {width: 500px;}
		    #commentForm label {width: 250px;}
		    #commentForm input.submit {margin-left: 253px;}
	</style>
	<script type="text/javascript">
		$(function(){
		    jQuery("#userName").textlimit("span.counter1", 8);
			jQuery("#password").textlimit("span.counter2", 8);
			jQuery("#password").textlimit("span.counter3", 8);
			jQuery("#name").textlimit("span.counter4",8);
			jQuery("#idCard").textlimit("span.counter5",18);
			jQuery("#address").textlimit("span.counter6",36);
			jQuery("#telno").textlimit("span.counter7",11);
		});
	</script>
  </head>
  <body bgcolor='white'>
   		<s:form id="commentForm" action="user/register" theme="simple">
   			<fieldset>
   				<legend>请输入个人信息</legend>
   					<p>
   						用&nbsp;户&nbsp;名：<input type="textfield" id="userName" name="userName" value=""/>&nbsp;&nbsp;还有<span class="counter1"></span>字符可以输入<s:fielderror><s:param>username1</s:param></s:fielderror>
   					</p>
   					<p>
   						密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password" id="password" name="password" value=""/>&nbsp;&nbsp;还有<span class="counter2"></span>字符可以输入<s:fielderror><s:param>password2</s:param></s:fielderror>
   					</p>
   					<p>
   						密码确认：<input type="password" id="password2" name="password2" value=""/>&nbsp;&nbsp;还有<span class="counter3"></span>字符可以输入<s:fielderror><s:param>password</s:param></s:fielderror>
   					</p>
   					<hr/>
   					<p>
   						真实姓名：<input type="textfield" id="name" name="name" value=""/>&nbsp;&nbsp;还有<span class="counter4"></span>字符可以输入<s:fielderror><s:param>name</s:param></s:fielderror>
   					</p>
   					<p>
   						性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：<input type="radio" name="gender" value="男"/>男
   						<input type="radio" name="gender" value="女"/>女
   					</p>
   					<p>
   						身份证号：<input type="textfield" id="idCard" name="idCard" value=""/>&nbsp;&nbsp;还有<span class="counter5"></span>字符可以输入<s:fielderror><s:param>idnumber</s:param></s:fielderror>
   					</p>
   					<p>
   						年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：26
   					</p>
   					<p>
   						通讯地址：<input type="textfield" id="address" name="address" value=""/>&nbsp;&nbsp;还有<span class="counter6"></span>字符可以输入<s:fielderror><s:param>telno</s:param></s:fielderror>
   					</p>
   					<p>
   						联系电话：<input type="textfield" id="telno" name="telno" value=""/>&nbsp;&nbsp;还有<span class="counter7"></span>字符可以输入<s:fielderror><s:param>telno</s:param></s:fielderror>
   					</p>
   					<p>
   						&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="" value="注册"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   						<input type="reset" name="" value="重置"/>
   					</p>
   			</fieldset>
 		</s:form>
  </body>
</html>