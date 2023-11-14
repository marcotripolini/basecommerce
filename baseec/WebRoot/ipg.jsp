<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="it.gds.utils.IPGIntegrationUtil" %>
<%
// 	IPGIntegrationUtil pay = new IPGIntegrationUtil("10035546951","9B9PXT9YrF",session.getAttribute("TOTCART").toString(), "978");
%>
<html>
	<%@ include file="/includes/head.jsp"%>
<body>

<s:if test='#session.PAYMENT_TYPE == "cb"'>
	<%
    	String redirectURL = "saveorder.html";
    	response.sendRedirect(redirectURL);
	%>
</s:if>

<s:if test='#session.PAYMENT_TYPE == "co"'>
	<%
    	String redirectURL = "saveorder.html";
    	response.sendRedirect(redirectURL);
	%>
</s:if>

</body>

<script type="text/javascript">
$(document).ready(
		function() {
			// document.forms['gotopay'].submit();
			window.location.href = "ccresponse.html";
		});
</script>

</html>