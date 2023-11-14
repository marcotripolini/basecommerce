<%@page import="java.sql.SQLException"%>
<%@page import="it.gds.utils.Config"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="org.hibernate.impl.SessionImpl"%>
<%@page import="it.gds.hibernate.HibernateUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Connection conn = ((SessionImpl) HibernateUtil.getSessionFactory().openSession()).connection();
String strsql = "SELECT * FROM istat_comuni WHERE sigla_provincia ='" + request.getParameter("district") + "'";
Statement stmt = null;
ResultSet rs = null;
try {
	stmt = conn.createStatement();
	rs = stmt.executeQuery(strsql);
	while (rs.next()) {
		out.println( "<option value='" + rs.getString("nome_comune") + "|" +  rs.getString("cap") + "'>" + rs.getString("nome_comune") + "</option>");
	}
	rs.close();
	stmt.close();
	conn.close();
} catch (SQLException e) {
	e.printStackTrace();
}
%>