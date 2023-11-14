<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.net.InetAddress"%>

<%!
	String getURL01 () {
		String _username = "root";
		String _password = "Tripolo.8691";
		String url = "";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://62.171.138.211:3306/gds-i41_bistrotnovara?"
					+ "user=" + _username + "&password=" + _password + "");
			Statement stmt = conn.createStatement();
			String sql = "SELECT URL_01 FROM urls where id = 1";
	    	ResultSet rs = stmt.executeQuery(sql);
	    	while(rs.next()){
		      	url  = rs.getString("URL_01");
	    	}
		  	rs.close();
			stmt.close();
			conn.close();
			return url;
	    } catch (Exception e) {
     		System.out.println("Something went wrong.");
	    }
		return url;
	}

	String getURL02 () {
		String _username = "root";
		String _password = "Tripolo.8691";
		String url = "";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://62.171.138.211:3306/gds-i41_bistrotnovara?"
					+ "user=" + _username + "&password=" + _password + "");
			Statement stmt = conn.createStatement();
			String sql = "SELECT URL_01 FROM urls where id = 2";
	    	ResultSet rs = stmt.executeQuery(sql);
	    	while(rs.next()){
		      	url  = rs.getString("URL_01");
	    	}
		  	rs.close();
			stmt.close();
			conn.close();
			return url;
	    } catch (Exception e) {
     		System.out.println("Something went wrong.");
	    }
		return url;
	}

	String getURL03 () {
		String _username = "root";
		String _password = "Tripolo.8691";
		String url = "";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://62.171.138.211:3306/gds-i41_bistrotnovara?"
					+ "user=" + _username + "&password=" + _password + "");
			Statement stmt = conn.createStatement();
			String sql = "SELECT URL_01 FROM urls where id = 3";
	    	ResultSet rs = stmt.executeQuery(sql);
	    	while(rs.next()){
		      	url  = rs.getString("URL_01");
	    	}
		  	rs.close();
			stmt.close();
			conn.close();
			return url;
	    } catch (Exception e) {
     		System.out.println("Something went wrong.");
	    }
		return url;
	}
%>


<html lang="it">
<meta charset="UTF-8">

<head>
<style>
@media ( max-width : 1023px) {
	.img1 {
		background-image: url(images/slide-01_s.jpg);
	}
	.img2 {
		background-image: url(images/slide-02_s.jpg);
	}
	.img3 {
		background-image: url(images/slide-03_s.jpg);
	}
	.img4 {
		background-image: url(images/slide-04_s.jpg);
	}
	.img5 {
		background-image: url(images/slide-05_s.jpg);
	}
}

@media ( min-width : 1024px) {
	.img1 {
		background-image: url(images/slide-01.jpg);
	}
	.img2 {
		background-image: url(images/slide-02.jpg);
	}
	.img3 {
		background-image: url(images/slide-03.jpg);
	}
	.img4 {
		background-image: url(images/slide-04.jpg);
	}
	.img5 {
		background-image: url(images/slide-05.jpg);
	}
}

html, body {
	right: 0;
	left: 0;
	padding: 0;
	margin: 0 auto;
	width: 100%;
	height: 100%;
	font-family: 'quicksand', sans-serif;
}

.btn-webapp {
	background-color: #375fa8;
	border-radius: 30px;
	padding: 10px 20px;
	color: white;
	text-decoration: none;
}

.btn-webapp:hover {
	background-color: #333333;
	text-decoration: none;
	color: white;
}
</style>

<title>GDS Bistrot</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="manifest.json">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.png" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/aos/aos.css">
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/gdsbistrot.css">
<!--===============================================================================================-->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400&display=swap"
	rel="stylesheet">

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-194086150-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-194086150-1');
</script>

</head>
<body class="animsition">

	<!-- Header -->
	<%@include file="includes/header.jsp"%>

	<!-- Cart -->
	<div class="wrap-header-cart js-panel-cart">
		<div class="s-full js-hide-cart"></div>

		<div class="header-cart flex-col-l p-l-65 p-r-25">
			<div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2"> Il tuo carrello </span>

				<div
					class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>

			<div id="carrello" class="header-cart-content flex-w js-pscroll">
				<s:action name="cartdet" executeResult="true" />
			</div>
		</div>
	</div>

	<!-- Sezione Hero -->

	<section class="gds-hero">
		<div class="gds-hero-wrapper">
			<div id="hero-desktop">
				<img src="./images/themes/hero-header.webp" alt="gds bistrot">
			</div>
			<div id="hero-mobile">
				<img src="./images/themes/hero-header-mobile.webp" alt="gds bistrot">
			</div>
		</div>

		<div class="gds-hero-content">
			<div class="gds-dicitura" data-aos="zoom-in"
				data-aos-easing="ease-in-back" data-aos-delay="50"
				data-aos-duration="500">
				<span></span>
			</div>
			<h2 data-aos="zoom-in" data-aos-delay="50" data-aos-duration="500">
				The purrfect store
			</h2>
		</div>
	</section>

	<section class="gds-idea-ristorazione">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="gds-dicitura" data-aos="fade-right" data-aos-delay="50"
						data-aos-duration="500" style="color:black!important">La nostra idea di ristorazione</div>
				</div>

				<div class="col-md-5">
					<h2 data-aos="fade-right" data-aos-delay="100"
						data-aos-duration="500">
						Tradizione<br>innovazione
					</h2>
				</div>

				<div class="col-md-7">
					<div class="box-riso" data-aos="zoom-in" data-aos-delay="150"
						data-aos-duration="500">
						<img src="images/themes/riso.png" alt="riso">
					</div>
				</div>
			</div>
			<div class="row testo-wrapper">
				<div class=" col-sm-6 col-md-5">
					<div class="testo" data-aos="zoom-in" data-aos-delay="200"
						data-aos-duration="500">
						<p style="color:rgb(64, 0, 64)!important; font-weight: bold !important; font-style: italic !important; ">
							A Vigevano, piatti creativi e proposte tradizionali si fondono in
							una sapiente rivisitazione gourmet per ritrovare i sapori, gli
							odori e il piacere della buona cucina, della familiarit&agrave; e
							dell&#8217;innovazione.<br> Men&ugrave; esclusivi e gustosi,
							accompagnati dai migliori vini per deliziare occhi e palato. Per
							tornare a sentire, prima col naso e poi con la bocca, per
							assaporare, per gustare, per godersi un piatto delizioso. Piaceri
							che abbiamo dimenticato e di cui vogliamo riappropriarci. Con
							questo intento nasce GDS Bistrot a Vigevano, accogliente e caldo
							luogo d&#8217;incontro e condivisione.
						</p>

					</div>
				</div>
				<div class=" col-sm-6 col-md-7" id="carousel-blocco">

					<!--Carousel interni-->
					<div id="carousel-interni"
						class="carousel slide carousel-fade z-depth-1-half"
						data-ride="carousel" data-aos="flip-left" data-aos-delay="100"
						data-aos-duration="500">
						<!--Slides-->
						<div class="carousel-fondo"></div>
						<div class="carousel-inner" role="listbox">
							<!--First slide-->
								<div class="carousel-item active">
									<a href="<%=getURL01()%>">
										<img class="d-block w-100" src="images/themes/interni-01.jpg" alt="Interni">
									</a>
								</div>
							<!--Second slide-->
								<div class="carousel-item">
									<a href="<%=getURL02()%>">
										<img class="d-block w-100" src="images/themes/interni-02.jpg"
										alt="Interni">
									</a>
								</div>
							<!--Third slide-->
								<div class="carousel-item">
									<a href="<%=getURL03()%>">
										<img class="d-block w-100" src="images/themes/interni-03.jpg"
											alt="Interni">
									</a>
								</div>
							<!--/Third slide-->
						</div>
						<!--/.Slides-->
						<!--Controls-->
						<a class="carousel-control-prev" href="#carousel-interni"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Prec</span>
						</a> <a class="carousel-control-next" href="#carousel-interni"
							role="button" data-slide="next"> <span
							class="carousel-control-next-icon" aria-hidden="true"></span> <span
							class="sr-only">Succ</span>
						</a>
						<!--/.Controls-->
					</div>
				</div>
				<!--/.Carousel interni-->
			</div>
		</div>

		</div>
	</section>

	<section class="gds-home-ingredienti">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="gds-dicitura" data-aos="fade-right" data-aos-delay="50"
						data-aos-duration="500" style="color:rgb(0, 0, 0)!important">L'attenzione al territorio</div>
				</div>

				<div class="col-sm-6 col-md-5">
					<h2 data-aos="fade-right" data-aos-delay="100"
						data-aos-duration="500">
						Ingredienti<br>di Lomellina
					</h2>
					<div class="testo-wrapper testo" >
						<p data-aos="zoom-in" data-aos-delay="150" data-aos-duration="500"
							style="color:rgb(64, 0, 64)!important; font-weight: bold !important; font-style: italic !important; ">
							Una proposta fatta di piatti semplici, preparati con prodotti
							forniti direttamente dalla campagna o dall'allevamento nostrano.
							Semplice, economica, genuina, ma anche molto originale ed
							appetitosa, dai sapori concreti e robusti, sempre gustosi e
							nutrienti, la cucina delle nostre parti merita di essere
							riscoperta.</p>

<!-- 						<a class="btn btn-primary" href="menu.html" role="button" -->
<!-- 							data-aos="zoom-in" data-aos-delay="200" data-aos-duration="500"> -->
<!-- 							Menu da asporto</a> -->

						<a class="btn btn-primary" href="menu_hamburger.jsp" role="button"
							data-aos="zoom-in" data-aos-delay="200" data-aos-duration="500">
							Hamburger</a>

						<a class="btn btn-primary" href="menu_aperitivi.jsp" role="button"
							data-aos="zoom-in" data-aos-delay="200" data-aos-duration="500">
							Taglieri</a>

						<a class="btn btn-primary" href="menu_antipasti_primi.jsp" role="button"
							data-aos="zoom-in" data-aos-delay="200" data-aos-duration="500">
							Antipasti e primi</a>

						<a class="btn btn-primary" href="menu_secondi_contorni.jsp" role="button"
							data-aos="zoom-in" data-aos-delay="200" data-aos-duration="500">
							Secondi e contorni</a>

<!-- 						<a class="btn btn-primary" href="menu_2.jsp" role="button" -->
<!-- 							data-aos="zoom-in" data-aos-delay="200" data-aos-duration="500"> -->
<!-- 							Pasqua 2021!</a> -->

					</div>
				</div>
				<div class="col-sm-6 col-md-7" id="ingredienti-img"
					data-aos="flip-left" data-aos-delay="100" data-aos-duration="500">
					<img src="images/themes/lomellina.png" alt="lomellina">
				</div>
			</div>
		</div>
		</div>

		<div class="home-piatti-lomellina">
			<img src="images/themes/fascia/fascia-piatti.webp">
		</div>
	</section>

	<section class="gds-home-sicurezza">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="griglia-img-sicurezza">
						<div class="row">
							<div class="col-6" data-aos="zoom-in" data-aos-delay="50"
								data-aos-duration="500">
								<img src="images/themes/sicurezza_1.jpg"
									alt="bistrot in sicurezza">
							</div>
							<div class="col-6" data-aos="zoom-in" data-aos-delay="100"
								data-aos-duration="2000">
								<img src="images/themes/sicurezza_2.jpg"
									alt="bistrot in sicurezza">
							</div>
						</div>
						<div class="row">
							<div class="col-6" data-aos="zoom-in" data-aos-delay="150"
								data-aos-duration="500">
								<img src="images/themes/sicurezza_3.jpg"
									alt="bistrot in sicurezza">
							</div>
							<div class="col-6" data-aos="zoom-in" data-aos-delay="200"
								data-aos-duration="500">
								<img src="images/themes/sicurezza_4.jpg"
									alt="bistrot in sicurezza">
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-6">
					<div class="gds-dicitura-2" data-aos="fade-left"
						data-aos-delay="50" data-aos-duration="2000">I nostri
						clienti sono importanti</div>
					<h2 data-aos="fade-left" data-aos-delay="200"
						data-aos-duration="500">
						Al bistrot<br>in sicurezza
					</h2>
					<p data-aos="fade-left" data-aos-delay="300"
						data-aos-duration="500">
						Pulizia e igiene sono per noi una priorit&agrave;<br>
						Adottiamo le misure giuste per prenderci cura di voi.
					</p>
					<ul data-aos="fade-up" data-aos-delay="400" data-aos-duration="500">
						<li><span>App per ordinare dal tavolo in autonomia</span></li>
						<li><span>Sanificazione degli ambienti</span></li>
						<li><span>Personale attento e totale rispetto delle
								norme</span></li>
					</ul>
				</div>
			</div>
		</div>
	</section>


<!--
	<section class="gds-home-app">
		<div class="container">
			<div class="row">
				<div class="col-3 col-md-2 app-logo" data-aos="flip-left"
					data-aos-delay="50" data-aos-duration="500">
					<img src="images/themes/app-gds.png" alt="app-gds">
				</div>
				<div class="col-9 col-md-6">
					<h3 data-aos="zoom-in" data-aos-delay="200" data-aos-duration="500">
						Scarica la nostra app<br>e ordina in sicurezza
					</h3>
				</div>
				<div class="col-6 col-md-2 app-market" data-aos="flip-left"
					data-aos-delay="300" data-aos-duration="500">
					<a href="javascript:void(0);"> <img
						src="images/themes/appstore.png" alt="app store"></a>
				</div>
				<div class="col-6 col-md-2 app-market" data-aos="flip-left"
					data-aos-delay="400" data-aos-duration="500">
					<a href="javascript:void(0);"><img
						src="images/themes/googleplay.png" alt="google play"></a>
				</div>
			</div>

		</div>
	</section>
-->

	<section class="gds-home-delivery">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-5">
					<div class="gds-dicitura-2" data-aos="fade-right"
						data-aos-delay="50" data-aos-duration="500">Consegne a
						domicilio gratuite</div>
					<h2 data-aos="fade-right" data-aos-delay="200"
						data-aos-duration="500">
						Bistrot &egrave;<br>anche delivery
					</h2>
					<p data-aos="zoom-in" data-aos-delay="300" data-aos-duration="500">
						Paga alla consegna in contanti o con bancomat e carte.<br>
						<br> <strong>La consegna a domicilio &egrave;
							gratuita</strong>
					</p>
					<p>Il tuo pranzo o la tua cena, presto a casa tua, senza
						pensieri.</p>
					<div class="row">
						<div class="col-6 btn-call" data-aos="flip-left"
							data-aos-delay="400" data-aos-duration="500">
							<a href="tel:+3903811976703" title="chiamaci" target="_blank">
								<!-- 				 			<font size = 5> Telefono: 3903811976703</font> -->
								<img src="images/themes/button_chiama.jpg" alt="chiama">
							</a>
						</div>
						<div class="col-6 btn-call" data-aos="flip-left"
							data-aos-delay="500" data-aos-duration="500">
							<a href="https://wa.me/393515071743" title="chatta con whatsapp"
								target="_blank">
								<img src="images/themes/button_whatsapp.jpg"></a>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-7" id="delivery-img"
					data-aos="fade-left" data-aos-delay="600" data-aos-duration="500">
					<img src="images/themes/delivery.jpg">
				</div>
			</div>
		</div>
	</section>

	<section class="gds-home-ritiraspesa">
		<div class="box-borsa">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="gds-dicitura" data-aos="fade-right"
							data-aos-delay="300" data-aos-duration="2000" style="color:rgb(0, 0, 0)!important">Il tuo tempo
							&egrave; prezioso, risparmialo</div>
						<h2 data-aos="fade-right" data-aos-delay="600"
							data-aos-duration="1500">
							Ritira la tua spesa<br>da Bistrot
						</h2>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-md-5">
					<p data-aos="zoom-in" data-aos-delay="300" data-aos-duration="2000"
						style="color:rgb(64, 0, 64)!important; font-weight: bold !important; font-style: italic !important;">
						GDS Bistrot non &egrave; solo food.<br> Siamo convenzionati con i
						migliori punti vendita della zona. Fai la tua spesa da noi e
						risparmia. Puoi ritirarla da noi quando vuoi o richiedere la
						consegna a domicilio.<br> Vai su: <a href="https://www.gdsmarket.it"> GDS Market</a>
					</p>
					<a class="btn btn-primary"
						href="www.gdsmarket.it"
						role="button"
						data-aos="zoom-in" data-aos-delay="1200" data-aos-duration="2000">Scopri
						come funziona</a>
				</div>
				<div class="col-md-7" id="spesa-img" data-aos="flip-left"
					data-aos-delay="900" data-aos-duration="2000">
					<img src="images/themes/spesa.png" alt="spesa">
				</div>
			</div>
		</div>
	</section>

<!--
	<section class="gds-home-negozi">
		<div class="gds-home-negozi-fascia">
			<img src="images/themes/fascia/fascia-marchi-up.jpg" alt="negozi">
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="gds-dicitura-2" data-aos="fade-right"
						data-aos-delay="50" data-aos-duration="2000">I negozi di
						vicinato che aderiscono all'iniziativa</div>
					<div class="marchi-slider">
						<div data-aos="zoom-in" data-aos-delay="50"
							data-aos-duration="500">
							<img src="images/themes/logo-gds-bistrot.png" alt="gds bistrot">
						</div>
						<div data-aos="zoom-in" data-aos-delay="110"
							data-aos-duration="500">
							<img src="images/themes/logo-gds-bistrot.png" alt="gds bistrot">
						</div>
						<div data-aos="zoom-in" data-aos-delay="120"
							data-aos-duration="500">
							<img src="images/themes/logo-gds-bistrot.png" alt="gds bistrot">
						</div>
						<div data-aos="zoom-in" data-aos-delay="130"
							data-aos-duration="500">
							<img src="images/themes/logo-gds-bistrot.png" alt="gds bistrot">
						</div>
						<div data-aos="zoom-in" data-aos-delay="140"
							data-aos-duration="500">
							<img src="images/themes/logo-gds-bistrot.png" alt="gds bistrot">
						</div>
						<div data-aos="zoom-in" data-aos-delay="150"
							data-aos-duration="500">
							<img src="images/themes/logo-gds-bistrot.png" alt="gds bistrot">
						</div>
						<div data-aos="zoom-in" data-aos-delay="160"
							data-aos-duration="500">
							<img src="images/themes/logo-gds-bistrot.png" alt="gds bistrot">
						</div>
						<div data-aos="zoom-in" data-aos-delay="170"
							data-aos-duration="500">
							<img src="images/themes/logo-gds-bistrot.png" alt="gds bistrot">
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
-->

	<section class="gds-home-mappa">
		<div id="googleMap">
			<!-- <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2799.0893644695043!2d8.609599115835309!3d45.44785527910061!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47865a22cea2d5e5%3A0xc49ca277a83deb7d!2sVia+Francesco+Alcarotti%2C+3%2C+28100+Novara+NO!5e0!3m2!1sit!2sit!4v1562071192462!5m2!1sit!2sit" width="100%" height="450" frameborder="0" style="border:0" allowfullscreen></iframe> -->
			<iframe
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2805.812093015444!2d8.843847315940659!3d45.31222127909949!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4786fcc8818289ff%3A0x4cdabff22ebbdcae!2sViale%20dei%20Mille%2C%209%2C%2027029%20Vigevano%20PV!5e0!3m2!1sit!2sit!4v1610318009163!5m2!1sit!2sit"
				width="100%" height="100%" frameborder="0" style="border:0;"
				allowfullscreen="" aria-hidden="false" tabindex="0">
			</iframe>
<!-- 			<iframe -->
<!-- 				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2566.6290854535273!2d8.620131539544495!3d45.45108956881252!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47865a2717e8538f%3A0xcea3e770458f7b9a!2sVia%20dei%20Mille%2C%201%2C%2028100%20Novara%20NO!5e0!3m2!1sit!2sit!4v1576701505965!5m2!1sit!2sit" -->
<!-- 				width="100%" height="100%" frameborder="0" style="border:0;" -->
<!-- 				allowfullscreen=""></iframe> -->
		</div>
	</section>

	<div class="footer">
		<%@ include file="includes/footer.jsp"%>
	</div>



	<!-- Banner -->
	<!-- 	<div class="sec-banner bg0 p-t-80 p-b-50"> -->
	<!-- 		<div class="container"> -->
	<!-- 			<div class="row"> -->
	<%-- 				<s:action name="categoriesb" executeResult="true" /> --%>
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</div> -->

	<!-- Product -->
	<%-- 	<section class="bg0 p-t-23 p-b-140" style="margin-left:2%; margin-right:2%"> --%>
	<!-- 		<div class="container"> -->
	<!-- 			<div class="p-b-10"> -->
	<!-- 				<h3 class="ltext-103 cl5">Prodotti in evidenza</h3> -->
	<!-- 			</div> -->
	<!-- 			<div id="products" class="row products" style="height:1800px;"> -->
	<!-- 			</div> -->
	<!-- 			<div class="flex-c-m flex-w w-full p-t-45"> -->
	<!-- 				<button id="loadmore" -->
	<!-- 					class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04" -->
	<!-- 					onclick="loadMore();">Carica altri...</button> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<%-- 	</section> --%>

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
		$(".js-select2").each(function() {
			$(this).select2({
				minimumResultsForSearch : 20,
				dropdownParent : $(this).next('.dropDownSelect2')
			});
		})
	</script>
	<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/slick/slick.js"></script>
	<script src="js/slick-custom.js"></script>
	<script>

		$('.marchi-slider').slick({
			dots : true,
			infinite : false,
			speed : 300,
			slidesToShow : 6,
			slidesToScroll : 6,
			responsive : [
				{
					breakpoint : 1024,
					settings : {
						slidesToShow : 4,
						slidesToScroll : 4,
						infinite : true,
						dots : true
					}
				},
				{
					breakpoint : 600,
					settings : {
						slidesToShow : 3,
						slidesToScroll : 3
					}
				},
				{
					breakpoint : 480,
					settings : {
						slidesToShow : 2,
						slidesToScroll : 2
					}
				}
			]
		});
	</script>


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
				delegate : 'a', // the selector for gallery item
				type : 'image',
				gallery : {
					enabled : true
				},
				mainClass : 'mfp-fade'
			});
		});
	</script>
	<!--===============================================================================================-->
	<script src="vendor/isotope/isotope.pkgd.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2').on('click', function(e) {
			e.preventDefault();
		});

		$('.js-addwish-b2').each(
			function() {
				var nameProduct = $(this).parent().parent().find(
					'.js-name-b2').html();
				$(this).on('click', function() {
					swal(nameProduct, "is added to wishlist !", "success");

					$(this).addClass('js-addedwish-b2');
					$(this).off('click');
				});
			});

		$('.js-addwish-detail').each(
			function() {
				var nameProduct = $(this).parent().parent().parent().find(
					'.js-name-detail').html();

				$(this).on('click', function() {
					swal(nameProduct, "is added to wishlist !", "success");

					$(this).addClass('js-addedwish-detail');
					$(this).off('click');
				});
			});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(
			function() {
				var nameProduct = $(this).parent().parent().parent()
					.parent().find('.js-name-detail').html();
				$(this).on('click', function() {
					swal(nameProduct, "is added to cart !", "success");
				});
			});
	</script>
	<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function() {
			$(this).css('position', 'relative');
			$(this).css('overflow', 'hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed : 1,
				scrollingThreshold : 1000,
				wheelPropagation : false,
			});

			$(window).on('resize', function() {
				ps.update();
			})
		});
	</script>
	<!--===============================================================================================-->
	<script src="js/main.js"></script>
	<script>

		var quanticaricamenti = 1;
		$(document).ready(function() {
			$('#products').css("height", "auto");

			$.ajax({
				url : "featuredproducts.html?qt=" + quanticaricamenti,
				type : 'GET',
				success : function(data) {
					$('#products').append($(data));
					quanticaricamenti = quanticaricamenti + 1;
					$("#loadmore").fadeIn();
				}
			});
		});

		function loadMore() {
			$("#loadmore").fadeOut(2000);
			$('#products').css("height", "auto");

			$.ajax({
				url : "featuredproducts.html?qt=" + quanticaricamenti,
				type : 'GET',
				success : function(data) {
					$('#products').append($(data));
					quanticaricamenti = quanticaricamenti + 1;
					if (data === "\n\n\n\n\n\t<h2>\n\n\t</h2>\n\n") {
						$("#loadmore").hide();
					} else {
						$("#loadmore").fadeIn();
					}
				}
			});
		}
	</script>

<script>

if ('serviceWorker' in navigator) {
	navigator.serviceWorker.register('./service-worker.js');
}

const installbt = document.getElementById('installbt');
installbt.style.display = "none";

// if (installbt.style.display === "none") {
//     installbt.style.display = "block";
//   } else {
//     installbt.style.display = "none";
//   }

const divInstall = document.getElementById('installContainer');
const butInstall = document.getElementById('butInstall');

/**
 * Warn the page must be served over HTTPS
 * The `beforeinstallprompt` event won't fire if the page is served over HTTP.
 * Installability requires a service worker with a fetch event handler, and
 * if the page isn't served over HTTPS, the service worker won't load.
 */

 /*
if (window.location.protocol === 'http:') {
  const requireHTTPS = document.getElementById('requireHTTPS');
  const link = requireHTTPS.querySelector('a');
  link.href = window.location.href.replace('http://', 'https://');
  requireHTTPS.classList.remove('hidden');
} */

let deferredPrompt;
window.addEventListener('beforeinstallprompt', (event) => {
	  console.log('ok', 'beforeinstallprompt', event);
	  // alert("Ciao! sono installabile! ");
	  // Stash the event so it can be triggered later.
	  window.deferredPrompt = event;
	  // Remove the 'hidden' class from the install button container
	  // installbt.classList.toggle('hidden', false);
	  installbt.style.display = "block";

// 	  divInstall.classList.toggle('hidden', false);
	});

butInstall.addEventListener('click', (e) => {
	  // Hide the app provided install promotion
	  // hideMyInstallPromotion();
	  // Show the install prompt
	  deferredPrompt.prompt();
	  // Wait for the user to respond to the prompt
	  deferredPrompt.userChoice.then((choiceResult) => {
	    if (choiceResult.outcome === 'accepted') {
	      console.log('User accepted the install prompt');
	    } else {
	      console.log('User dismissed the install prompt');
	    }
	  })
	});

butInstall.addEventListener('click', () => {
	  console.log('ok', 'butInstall-clicked');
	  const promptEvent = window.deferredPrompt;
	  if (!promptEvent) {
	    // The deferred prompt isn't available.
	    return;
	  }
	  // Show the install prompt.
	  promptEvent.prompt();
	  // Log the result
	  promptEvent.userChoice.then((result) => {
	    console.log('ok', 'userChoice', result);
	    // Reset the deferred prompt variable, since
	    // prompt() can only be called once.
	    window.deferredPrompt = null;
	    // Hide the install button.
	    divInstall.classList.toggle('hidden', true);
	  });
	});
	</script>

	<!--===============================================================================================-->
	<script src="vendor/aos/aos.js"></script>
	<script>
		AOS.init();
	</script>
</body>
</html>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.net.InetAddress"%>
<%
	if (request.getParameter("src") != null) {
		if (request.getParameter("src").contains("f")) {
			String username = "gds-i41_dbuser";
			String password = "dbuser01";
			String destinazione = "info@boostech.it";

			String message = "contatto fb home page www.gdsbistrot.it/vg/ ";
			message += "ricevuto il "
					+ (new SimpleDateFormat("dd-MM-yyyy")).format(new Date()) + " alle ore "
					+ (new SimpleDateFormat("HH:mm")).format(new Date()) + "<hr><br><br>";

			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager
					.getConnection("jdbc:mysql://mysql.gds-italia.it:3306/gds-i41_master?" + "user=" + username
							+ "&password=" + password + "");

			String insertTableSQL = "INSERT INTO email_queue" + "(recipients, subject, html, text) VALUES"
					+ "(?,?,?,?)";
			PreparedStatement preparedStatement = conn.prepareStatement(insertTableSQL);
			preparedStatement.setString(1, destinazione); 						//destinatario
			preparedStatement.setString(2, "Messaggio dal sito gdsbistrot.it"); 	// oggetto
			preparedStatement.setString(3, message); 							// messaggio
			preparedStatement.setString(4, message);
			preparedStatement.executeUpdate();
			preparedStatement.close();
			conn.close();
		}
	}
%>
