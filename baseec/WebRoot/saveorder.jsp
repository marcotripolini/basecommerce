<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false" %>
<html>
<head>
	<title>Ordine confermato</title>
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

			<div id="carrello" class="header-cart-content flex-w js-pscroll">
				<s:action name="cartdet" executeResult="true"/>
			</div>
		</div>
	</div>

			<!-- Title page -->
			<section class="gdsbistrot-header">
				<h2>Grazie</h2>
				</section>


	<!-- Content page -->
	<section class="bg0 p-t-104 p-b-116 gds-bistrot-page">
		<div class="container">
			<div class="flex-w flex-tr">
				<div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md" style="border: 5px solid whitesmoke; border-radius: 20px;">
					<form id="contact_form">
						<h2 class="mtext-105 cl2 txt-center p-b-30">
							Grazie per il tuo ordine!<br>

						</h2>

						<h4 class="mtext-105 cl2 txt-center p-b-30">
							Riceverai a breve un messaggio di conferma!<br>
						</h4>
						<h3 class="mtext-105 cl2 txt-center p-b-30">
							<i class="fa fa-heart"></i> Buon appetito! <i class="fa fa-heart"></i>
						</h3>

					</form>
				</div>

				<div class="size-210 bor10 flex-w flex-col-m p-lr-93 p-tb-30 p-lr-15-lg w-full-md" style="background-color: whitesmoke; border-radius: 20px; border: 0;">
					<div class="flex-w w-full p-b-42">
						<span class="fs-18 cl5 txt-center size-211">
							<span class="lnr lnr-map-marker"></span>
						</span>

						<div class="size-212 p-t-2">
							<span class="mtext-110 cl2">
								Indirizzo
							</span>

							<p class="stext-115 cl6 size-213 p-t-18">
								sede legale: via privata del Gonfalone 3, 20123 Milano (MI) <br>
								sede operativa: viale dei Mille 9, 27029 Vigevano (PV) <br>
								P.IVA 10387470965<br>
								R.E.A. MI-2527420<br>
							</p>
						</div>
					</div>

					<div class="flex-w w-full p-b-42">
						<span class="fs-18 cl5 txt-center size-211">
							<span class="lnr lnr-phone-handset"></span>
						</span>

						<div class="size-212 p-t-2">
							<span class="mtext-110 cl2">
								Parla con noi
							</span>

							<p class="stext-115 cl1 size-213 p-t-18">
								+39 0381 1976703
							</p>
							<p class="stext-115 cl1 size-213 p-t-18">
								+39 351 5071743, anche WhatsApp<br>								
							</p>
						</div>
					</div>

					<div class="flex-w w-full">
						<span class="fs-18 cl5 txt-center size-211">
							<span class="lnr lnr-envelope"></span>
						</span>

						<div class="size-212 p-t-2">
							<span class="mtext-110 cl2">
								Supporto vendita, spedizioni e rimborsi.
							</span>

							<p class="stext-115 cl1 size-213 p-t-18">
								vigevano@gdsbistrot.it
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<div id="map" style="width:100%;height:450px;">
		<iframe
			src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2805.812093015444!2d8.843847315940659!3d45.31222127909949!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4786fcc8818289ff%3A0x4cdabff22ebbdcae!2sViale%20dei%20Mille%2C%209%2C%2027029%20Vigevano%20PV!5e0!3m2!1sit!2sit!4v1610318009163!5m2!1sit!2sit"
			width="100%"
			height="100%"
			frameborder="0"
			style="border:0;"
			allowfullscreen="" aria-hidden="false" tabindex="0">
		</iframe>
	</div>

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
<script>

$(document).ready(function () {
    // Handler for .ready() called.
    window.setTimeout(function () {
        location.href = "index.html";
    }, 20000);
});
</script>
</body>
</html>