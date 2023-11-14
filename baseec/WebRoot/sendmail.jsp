<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.net.InetAddress"%>
<%@page import="org.apache.commons.lang3.StringEscapeUtils"%>


<%@ page language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
//*********************************************************************************************************
System.out.println(request.getHeader("referer"));
if(request.getHeader("referer") != null) {
	// if (request.getHeader("referer").contains("boostech.it")) {
		String username = "gds-i41_dbuser";
		String password = "dbuser01";
		String destinazione0= "tm@boostech.it";
		String destinazione1= "ca@boostech.it";
		String destinazione2= "andreacolamarco65@gmail.com";

// 		String nome = request.getParameter("input_name");
// 		String telefono = request.getParameter("input_phone");
		String email = request.getParameter("input_mail");
		String messaggio = request.getParameter("input_message");
		messaggio = StringEscapeUtils.escapeHtml4(messaggio);

		SimpleDateFormat sdf0 = new SimpleDateFormat("dd-MM-yyyy");
		SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm");

		String message = "Messaggio dal sito web gdsbistrot.it/vg <br>";
// 		message += "Nome: " + nome + "<br>";
// 		message += "Telefono: " + telefono + "<br>";
		message += "Email: " + email + "<br>";
		message += "Messaggio: " + messaggio + "<br>";
		message += "<br><br><br>";
		message += "ricevuto il " + sdf0.format(new Date()) + " alle ore " + sdf1.format(new Date())
				 + "<br><br><br>";

		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://mysql.gds-italia.it:3306/gds-i41_master?"
				+ "user=" + username + "&password=" + password + "");
		String insertTableSQL = "INSERT INTO email_queue" + "(recipients, subject, html, text) VALUES"
				+ "(?,?,?,?)";
		PreparedStatement preparedStatement = conn.prepareStatement(insertTableSQL);
		preparedStatement.setString(1, destinazione0);
		preparedStatement.setString(2, "Messaggio dal sito gdsbistrot.it/vg");
		preparedStatement.setString(3, message);
		preparedStatement.setString(4, "");
		preparedStatement.executeUpdate();

		preparedStatement.setString(1, destinazione1);
		preparedStatement.setString(2, "Messaggio dal sito gdsbistrot.it/vg");
		preparedStatement.setString(3, message);
		preparedStatement.setString(4, "");
		preparedStatement.executeUpdate();

		preparedStatement.setString(1, destinazione2);
		preparedStatement.setString(2, "Messaggio dal sito gdsbistrot.it/vg");
		preparedStatement.setString(3, message);
		preparedStatement.setString(4, "");
		preparedStatement.executeUpdate();

		preparedStatement.close();
		conn.close();
	// }
}


//*********************************************************************************************************
%>
0
