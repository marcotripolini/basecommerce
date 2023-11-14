<%@page import="java.text.DecimalFormat"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="it.gds.beans.Carrello"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
&euro; <%=session.getAttribute("CARRELLO") != null
					? new DecimalFormat("#.00").format((((Carrello) session.getAttribute("CARRELLO")).getTotcart()))
					: ("0")%>