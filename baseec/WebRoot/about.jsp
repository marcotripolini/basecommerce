<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false" %>
<html>
<head>
	<title>GDS Bistrot - Contatti</title>
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

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400&display=swap" rel="stylesheet">

    <style>
    html,body {
    width: 100%;
    height: 100%;
    margin: 0px;
    padding: 0px;
}

    </style>
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

			<div id="carrello" class="header-cart-content flex-w js-pscroll">
				<s:action name="cartdet" executeResult="true"/>
			</div>
		</div>
	</div>

	<!-- Title page -->
	<section class="gdsbistrot-header">
		<h2>Chi siamo</h2>
		</section>

	<!-- Content page -->
	<section class="bg0">
	<div class="container p-t-75 p-b-120" style="overflow-x: hidden;"  id="chisiamo">
			<div class="row p-b-148">
				<div class="col-sm-12 col-md-7 col-lg-8">
					<div class="p-t-7 p-r-85 p-r-15-lg p-r-0-md">
						<h3>
							La nostra storia
						</h3>

						<p>
							GDS Point &egrave; un concetto innovativo di bar e vendita al dettaglio. In un ambiente moderno e accogliente potrai concederti una ricca colazione, una pausa pranzo sana e gustosa, un aperitivo sfizioso scegliendo dalle proposte del nostro menu.
						</p>

						<p>
							Non solo bar, ma anche &#8220;degusteria&#8221;: i piatti creati dal nostro personale sono realizzati con prodotti tipici di alta qualit&agrave;. GDS Point ha selezionato le eccellenze del territorio piemontese per offrire un assaggio che soddisfer&agrave; ogni palato.
						</p>
						<p>
							Mentre degusti le varie specialit&agrave;, potrai effettuare i tuoi acquisti: tramite tablet, smartphone oppure utilizzando i nostri totem, visualizzi il nostro catalogo e con un semplice clic riempi il tuo carrello. &Egrave; facile e veloce, grazie anche alla nostra app scaricabile su tutti i telefoni cellulari di nuova generazione.

						</p>

						<p>
							GDS Point &egrave; dotato anche di una zona panetteria che ogni giorno ti vizia con pane fresco, pizze e focacce fragranti.

						</p>

						<p>
							Ti aspettiamo in via dei Mille 1/A, Novara.
						</p>

						<p>
							*Non hai ancora la nostra tessera? Richiedila e scopri tutti i vantaggi!
						</p>

					</div>
				</div>

				<div class="col-sm-12 col-md-5 col-lg-4 m-lr-auto">
					<div class="how-bor1 ">
						<div class="hov-img01">
							<img src="images/mary_totem.jpg" alt="IMG">
						</div>
					</div>
				</div>
			</div>

			<div class="row" style="width: 100%;">
				<div class="order-md-2 col-sm-12 col-md-7 col-lg-8 p-b-30">
					<div class="p-t-7 p-l-85 p-l-15-lg p-l-0-md">
						<h3>
							Il nostro impegno, al tuo servizio
						</h3>

						<div class="bor16 p-l-29 p-b-9 m-t-22">
							<p>
								<cite>&#171;Le cose non devono per forza cambiare il mondo per essere importanti&#187;</cite>
								<br>- Steve Jobs
							</p>
						</div>
					</div>
				</div>

				<div class="order-md-1 col-sm-12 col-md-5 col-lg-4 m-lr-auto p-b-30">
					<div class="how-bor2">
						<div class="hov-img01">
							<img src="images/tavolino.jpg" alt="IMG">
						</div>
					</div>
				</div>
			</div>
        </div>
	</section>

	<!-- Map -->
<!-- 	<div class="map"> -->
<!-- 		<div class="size-303" id="google_map" data-map-x="40.691446" data-map-y="-73.886787" data-pin="images/icons/pin.png" data-scrollwhell="0" data-draggable="1" data-zoom="11"></div> -->
<!-- 	</div> -->



	<%@ include file="includes/footer.jsp" %>

	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

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
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
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

	<script>
	$('#contact_form').submit(function(event) {
		var datastring = $("#contact_form").serialize();
		$.ajax({
		    type: "POST",
		    url: "sendmail.jsp",
		    data: datastring,
		    dataType: "json",
		    success: function(data) {
		    	alert ("Il tuo messaggio è stato inviato, grazie.\n\nTi ricontatteremo al più presto!");
		    	$("#send_contact_form").attr("disabled", "disabled");
		    	$('#contact_form').each(function(){
		    	    this.reset();
		    	});
		    },
		    error: function() {
		        alert('mmmmmm che strano... non riesco a inviare il messaggio!');
		    }
		});
		event.preventDefault();
	});
</script>

<!--===============================================================================================-->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKFWBqlKAGCeS1rMVoaNlwyayu0e0YRes"></script>
	<script src="js/map-custom.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>