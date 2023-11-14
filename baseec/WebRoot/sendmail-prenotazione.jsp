<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.io.IOException"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="it.gds.utils.ReadProperty"%>
<%@page import="org.apache.commons.lang3.StringEscapeUtils"%>

<%@ page language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
// System.out.println("referer is: " + request.getHeader("referer"));
if(request.getHeader("referer") != null) {
	if (request.getHeader("referer").contains("gdsbistrot.it")) {
		String username = "gds-i41_dbuser";
		String password = "dbuser01";
		String destinazione1= "tm@boostech.it";
		String destinazione2= "info@boostech.it";
		String destinazione3= "ca@boostech.it";

		String nome = request.getParameter("input_name");
		String telefono = request.getParameter("input_phone");
		String email = request.getParameter("input_mail");
		String messaggio = request.getParameter("input_message");
		String ora_prenotazione = request.getParameter("ora_prenotazione");
		String data_prenotazione = request.getParameter("data_prenotazione");
		String quanti = request.getParameter("input_quanti");

		messaggio = StringEscapeUtils.escapeHtml4(messaggio);

		String destinazione4=email;;

		SimpleDateFormat sdf0 = new SimpleDateFormat("dd-MM-yyyy");
		SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm");

		String message = "Prenotazione da sito web gdsbistrot Vigevano <br>";
		message += "Nome: " + nome + "<br>";
		message += "Telefono: " + telefono + "<br>";
		message += "Email: " + email + "<br><br>";
		message += "data prenotazione: " + data_prenotazione + "<br>";
		message += "ora prenotazione: " + ora_prenotazione + "<br>";
		message += "numero di posti prenotati: " + quanti + "<br><br>";
		message += "Messaggio: " + messaggio + "<br>";
		message += "<br><br><br>";
		message += "ricevuto il " + sdf0.format(new Date()) + " alle ore " + sdf1.format(new Date())
				+ "<br><br><hr>";

		String message_1 = "Gentile " + nome + " <br>";
		message_1 += "la ringraziamo per aver prenotato nel nostro locale <br>";
		message_1 += "le ricordiamo i dati che ci ha fornito: <br>";
		message_1 += "Telefono: " + telefono + "<br>";
		message_1 += "Email: " + email + "<br><br>";
		message_1 += "Ha prenotato il giorno: " + data_prenotazione + "<br>";
		message_1 += "alle ore: " + ora_prenotazione + "<br>";
		message_1 += "per: " + quanti + " persone <br><br>";
		message_1 += "<br><br><br>";
		message_1 += "Grazie da parte del team GDS Bistrot!<br>";

		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://mysql.gds-italia.it:3306/gds-i41_master?" + "user=" + username + "&password=" + password + "");
		String insertTableSQL = "INSERT INTO email_queue" + "(recipients, subject, html, text) VALUES" + "(?,?,?,?)";

		PreparedStatement preparedStatement = conn.prepareStatement(insertTableSQL);
		preparedStatement.setString(1, destinazione1);
		preparedStatement.setString(2, "Prenotazione da sito web gdsbistrot Vigevano");
		preparedStatement.setString(3, message);
		preparedStatement.setString(4, "");
		preparedStatement.executeUpdate();
		preparedStatement.close();

		preparedStatement = conn.prepareStatement(insertTableSQL);
		preparedStatement.setString(1, destinazione2);
		preparedStatement.setString(2, "Prenotazione da sito web gdsbistrot Vigevano");
		preparedStatement.setString(3, message);
		preparedStatement.setString(4, "");
		preparedStatement.executeUpdate();
		preparedStatement.close();

		preparedStatement = conn.prepareStatement(insertTableSQL);
		preparedStatement.setString(1, destinazione3);
		preparedStatement.setString(2, "Prenotazione da sito web gdsbistrot Vigevano");
		preparedStatement.setString(3, message);
		preparedStatement.setString(4, "");
		preparedStatement.executeUpdate();
		preparedStatement.close();

		String str = readAllBytesJava7 (ReadProperty.getInstance().getRealPath() + "/mails/001_email_prenotazione.html");

		String[] parts = data_prenotazione.split("-");
		String data_ita = parts[2] + "/" + parts[1] + "/" + parts[0];

		str = str.replace("__nome__" , nome);
		str = str.replace("__telefono__" , telefono);
		str = str.replace("__email__" , email);
		str = str.replace("__data__" , data_ita);
		str = str.replace("__ora__" , ora_prenotazione);
		str = str.replace("__quanti__" , quanti);

		preparedStatement = conn.prepareStatement(insertTableSQL);
		preparedStatement.setString(1, destinazione4);
		preparedStatement.setString(2, "Conferma prenotazione GDS Bistrot Vigevano");
		preparedStatement.setString(3, str);
		preparedStatement.setString(4, "");
		preparedStatement.executeUpdate();
		preparedStatement.close();

		conn.close();
 	}
}
%>

<%!
private static String readAllBytesJava7(String filePath) {
    String content = "";
    try {
        content = new String ( Files.readAllBytes( Paths.get(filePath) ) );
    } catch (IOException e)  {
        e.printStackTrace();
    }
    return content;
}
%>
0
