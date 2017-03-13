<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>jQuery Demo</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
	<script type="text/javascript" src="js/textlimit.js"></script>
	
	<script type="text/javascript">
		$(function (){
			$("#textlimit1").textlimit("span.counter1", 36);
			$("#textlimit2").textlimit("span.counter2", 16);
		});
	</script>
  </head>
  
  <body>
  	 <h2>Text Limiter</h2>
	 <form>
	    <textarea name="textlimit1" cols="40" rows="2" id="textlimit1" ></textarea>
	    &nbsp;还有<span class="counter1"></span>字符可以输入
	    <br /><br />
	    <input type="text" name="textlimit2" value="" id="textlimit2" />
	    &nbsp;还有<span class="counter2"></span>字符可以输入
	</form>
  </body>
</html>
