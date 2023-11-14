<%@ page import="java.sql.DriverManager"%>
<%@ page import="it.gds.beans.Carrello"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

 <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"
	data-notify='<%=session.getAttribute("CARRELLO") != null ? (((Carrello)session.getAttribute("CARRELLO")).getNumarticoli()) : ("0")%>'>
	<i class="zmdi zmdi-shopping-cart"></i>
</div>

<script>
	/*==================================================================
	[ Cart ]*/
	$('.js-show-cart').on('click',function(){
	    $('.js-panel-cart').addClass('show-header-cart');
	});

	$('.js-hide-cart').on('click',function(){
	    $('.js-panel-cart').removeClass('show-header-cart');
	});

</script>
