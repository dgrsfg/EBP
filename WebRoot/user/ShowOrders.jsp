<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pageTitle" scope="request">我的订单</c:set>
<c:set var="mainBody" scope="request">ShowOrders.jsp</c:set>

<jsp:include page="/WEB-INF/user/common/layout.jsp" />