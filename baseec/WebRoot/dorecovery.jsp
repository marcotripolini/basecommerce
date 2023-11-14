<!DOCTYPE html>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.apache.poi.util.SystemOutLogger"%>
<%@page import="it.gds.utils.Config"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false" %>

<%
String email = request.getParameter("email");
String card = request.getParameter("card");
if (email != null && card != null ) {
	if (!email.equals("")  && !card.equals("") ) {

		Connection conn = DriverManager.getConnection(
				Config.getJDBCCONNECTION(),
				Config.getJDBCUSER(),
				Config.getJDBPASSWORD() );

		String sql = "select * from clienti where email = ? and tessera = ?" ;
		PreparedStatement stmt;
		stmt = conn.prepareStatement(sql);
		stmt.setString(1,email);
		stmt.setString(2,card);

		ResultSet rs= stmt.executeQuery();
		Statement stmt_2 = conn.createStatement();
		while(rs.next()) {
			String codice = codegen();
			String id = rs.getString("id");
			String sql_upd = "update clienti set codice_controllo = '" +  codice + "' where id = " + id;
			stmt_2.executeUpdate(sql_upd);
			sendmail (email, codice);
		}
		stmt.close();
		stmt_2.close();
		conn.close();
	}
}
%>

<%!
public String codegen() {
    int leftLimit = 97; // letter 'a'
    int rightLimit = 122; // letter 'z'
    int targetStringLength = 50;
    Random random = new Random();
    StringBuilder buffer = new StringBuilder(targetStringLength);
    for (int i = 0; i < targetStringLength; i++) {
        int randomLimitedInt = leftLimit + (int)
          (random.nextFloat() * (rightLimit - leftLimit + 1));
        buffer.append((char) randomLimitedInt);
    }
    String generatedString = buffer.toString();
    System.out.println(generatedString);
    return generatedString;
}

public void sendmail(String email, String code) {
	// System.out.println("referer is: " + request.getHeader("referer"));
	String username = "gds-i41_dbuser";
	String password = "dbuser01";

	SimpleDateFormat sdf0 = new SimpleDateFormat("dd-MM-yyyy");
	SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm");

	String message = "Recupero password utente GDSBistrot<br>";
	message += "Gentile utente: per ripristinare la tua password, fai clic sul link seguente: <br>";
	message += "<a href='https://gdsbistrot.it/vg/updatepw.jsp?code=" + code + "'>https://gdsbistrot.it/vg/updatepw.jsp?code="+ code + "</a> <br>";
	message += "Il tuo indirizzo email &egrave;: " + email + "<br><br>";
	message += "<br><br><br>";

	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
				Config.getJDBCCONNECTION(),
				Config.getJDBCUSER(),
				Config.getJDBPASSWORD() );

		String insertTableSQL = "INSERT INTO email_queue" + "(recipients, subject, html, text) VALUES" + "(?,?,?,?)";

		PreparedStatement preparedStatement = conn.prepareStatement(insertTableSQL);
		preparedStatement.setString(1, email);
		preparedStatement.setString(2, "Recupero password utente GDSBistrot");
		preparedStatement.setString(3, message);
		preparedStatement.setString(4, "");
		preparedStatement.executeUpdate();
		preparedStatement.close();
		conn.close();

	} catch(Exception e) {
		  //  Block of code to handle errors
		  e.printStackTrace();
	}

}%>

<html>
<head>
	<title>GDS Bistrot</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" type="text/css" href="css/gdsbistrot.css">
<!--===============================================================================================-->
</head>
<body class="animsition">

	<!-- Header -->
	<%@include file="includes/header.jsp" %>

	<!-- Cart -->
	<div class="wrap-header-cart js-panel-cart">
		<div class="s-full js-hide-cart"></div>

		<div class="header-cart flex-col-l p-l-65 p-r-25">
			<div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2">
					Il tuo carrello
				</span>

				<div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>

			<div class="header-cart-content flex-w js-pscroll">
				<s:action name="cartdet" executeResult="true"/>

			</div>
		</div>
	</div>
<br><br><br>
	<!-- Title page -->
	<section class="gdsbistrot-header-2">
	<h2>Ripristino utente</h2>
	</section>
<div class="container-fluid bg0" id="login-box">
	<div class="row text-center">
		<div class="col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4 col-xs-6 col-xs-offset-3">
		</div>
		<div class="col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4 col-xs-6 col-xs-offset-3">
			<h2>Fatto.</h2>
			<hr>
			<br>
			<h3>Ti abbiamo inviato una email con le istruzioni per aggiornare la tua password.</h3>
			<h3>Potrebbe essere necessario attendere qualche minuto... sii paziente.</h3>
			<h3>Se non trovi il messaggio, controlla nella cartella SPAM... non si sa mai!</h3>
		</div>
	</div>
	<br><br>
	<div class="row">
		<div class="col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4 col-xs-6 col-xs-offset-3">
		</div>
		<div class="text-center col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4 col-xs-6 col-xs-offset-3">
			<p>Non hai un account?
				<a id="register-btn" href="https://gdsmarket.it/home/ext_register.php" target="frame">
					Registrati!</a>
					<br>
			Hai dimenticato la password?
			<a  id="recovery-btn" href="recovery.jsp">
			Recupera</a></p>
		</div>
	</div>
</div>
	<%@ include file="includes/footer.jsp" %>

<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/slick/slick.min.js"></script>
	<script src="js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script src="vendor/parallax100/parallax100.js"></script>
	<script>
        $('.parallax100').parallax100();
	</script>
<!--===============================================================================================-->
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<script>
		$('.gallery-lb').each(function() { // the containers for all your galleries
			$(this).magnificPopup({
		        delegate: 'a', // the selector for gallery item
		        type: 'image',
		        gallery: {
		        	enabled:true
		        },
		        mainClass: 'mfp-fade'
		    });
		});
	</script>
<!--===============================================================================================-->
	<script src="vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2').on('click', function(e){
			e.preventDefault();
		});

		$('.js-addwish-b2').each(function(){
			var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-b2');
				$(this).off('click');
			});
		});

		$('.js-addwish-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-detail');
				$(this).off('click');
			});
		});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
		});

	</script>
<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
<!--===============================================================================================-->

<script src="js/main.js"></script>
</body>
</html>
