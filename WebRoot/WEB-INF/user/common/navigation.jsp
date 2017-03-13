<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

	<div id="inner">
		<p>
			当前用户： ${sessionScope.user.name}
		</p>
		<ul>
			<li>
				<a href="user/index.jsp" class="index">首&nbsp;&nbsp;&nbsp;&nbsp;页</a>
			<li>
			<li>
				<a href="user/showTickets" class="examlog">在线订票</a>
			<li>
			<li>
				<a href="user/TopUpAccount.jsp" class="exam">账户充值</a>
			<li>
			<li>
				<a href="user/userInfo?page=PersonInfo" class="personal">会员信息</a>
			<li>
			<li>
				<a href="user/ShowOrders.jsp" class="logout">我的定单</a>

</a>
			<li>
		</ul>
	</div>

