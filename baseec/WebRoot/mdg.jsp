<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false"%>
<html lang="it">
<head>
<title>GDS Bistrot - menu del giorno</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/gdsbistrot.css">
<!--===============================================================================================-->
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400&display=swap"
	rel="stylesheet">

<style>
/* The container */
.contenitore {
	display: block;
	position: relative;
	padding-left: 60px;
	margin-bottom: 20px;
	margin-top: 20px;
	cursor: pointer;
	font-size: 25px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

/* Hide the browser's default radio button */
.contenitore input {
	position: absolute;
	opacity: 0;
	cursor: pointer;
}

/* Create a custom radio button */
.checkmark {
	position: absolute;
	top: 0;
	left: 0;
	height: 40px;
	width: 40px;
	background-color: #eee;
	border-radius: 50%;
}

/* On mouse-over, add a grey background color */
.contenitore:hover input ~ .checkmark {
	background-color: #ccc;
}

/* When the radio button is checked, add a blue background */
.contenitore input:checked ~ .checkmark {
	background-color: #375fa8;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
.checkmark:after {
	content: "";
	position: absolute;
	display: none;
}

/* Show the indicator (dot/circle) when checked */
.contenitore input:checked ~ .checkmark:after {
	display: block;
}

/* Style the indicator (dot/circle) */
.contenitore .checkmark:after {
	top: 12px;
	left: 12px;
	width: px;
	height: 0px;
	border-radius: 50%;
	background: white;
}

.card-style {
	width: 100%;
	background-color: whitesmoke;
	color: #333333;
	text-decoration: none;
	border-radius: 30px;
	display: inline-block;
	padding-top: 0px;
	padding-bottom: 0px;
	margin-bottom: 20px;
	font-size: 1.5em;
	line-height: 1.5em;
	font-family: 'Poppins', sans-serif;
}

.card-style:hover, .card-style:active {
	cursor: pointer;
}

.card-title {
	text-align: left;
	width: 100%;
	background-color: #375fa8;
	color: #fff;
	text-decoration: none;
	border-radius: 30px;
	display: inline-block;
	padding-left: 30px;
	padding-top: 20px;
	padding-bottom: 20px;
	margin-bottom: 40px;
	font-size: 1.6em;
	font-family: 'Poppins', sans-serif;
}

.acc-btn button {
	height: 100%;
	color: #333333;
	padding-top: 20px;
	padding-bottom: 20px;
	padding-left: 30px;
	padding-right: 30px;
	border-radius: 30px;
	border-bottom-left-radius: 0px;
	text-decoration: none;
	font-family: 'Poppins', sans-serif;
	background: rgb(255, 255, 255);
	background: -moz-linear-gradient(45deg, rgba(255, 255, 255, 0.9) 0%,
		rgba(255, 255, 255, 0.8) 100%);
	background: -webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.9) 0%,
		rgba(255, 255, 255, 0.8) 100%);
	background: linear-gradient(45deg, rgba(255, 255, 255, 0.9) 0%,
		rgba(255, 255, 255, 0.8) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#ffffff",
		endColorstr="#ffffff", GradientType=1);
}

.card-style button {
	margin-left: 0px;
}

.card-content {
	width: 90%;
	margin-top: 20px;
	margin-left: 5%;
	margin-right: 5%;
	margin-bottom: 20px;
	border-radius: 20px;
	padding: 20px 15px;
	background-color: #fff;
	font-size: 1.5em;
	font-family: 'Quicksand', sans-serif;
	box-shadow: 0px 3px 15px rgba(0, 0, 0, 0.1);
}

.info-btn {
	color: #fff;
	text-decoration: none;
	border-radius: 0px;
	padding: 10px 20px;
	background-color: #333333;
	font-size: 0.8em;
	font-family: 'Quicksand', sans-serif;
}

.info-btn:active, .info-btn:hover {
	color: #fff;
	text-decoration: none;
	background-color: #375fa8;
	opacity: 1;
	cursor: pointer;
}

.acc-header-style {
	visibility: hidden;
	opacity: 0;
	position: fixed;
	top: 100px;
	z-index: 1000;
}

.popover-header {
	background-color: whitesmoke;
	color: #333333;
	font-size: 2em;
	font-family: 'Quicksand', sans-serif;
}

.popover-body {
	background-color: #fff;
	color: #333333;
	font-size: 1.3em;
	border-radius: 0px;
	border: none;
	font-family: 'Quicksand', sans-serif;
}

</style>

</head>

<body class="animsition gdsbistrot-body">

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

	<!-- Title page -->
	<section class="gdsbistrot-header">
		<h2>Il men&ugrave; di oggi</h2>
	</section>

	<!-- Content page -->
	<section class="bg0 p-t-75 p-b-75">
		<div class="container">
			<!--     <div class="row "> -->
			<!--     	<div class="col-lg-12 text-center"> -->
			<%-- 			<h2>Menu di oggi, <s:property value="data_formattata"/></h2> --%>
			<!-- 		</div> -->
			<!-- 	</div> -->

			<div class="row">
				<div class="col-lg-12">
					<button onclick="window.history.back();"
						class="m-t-20 stext-101 trans-04">
						<i class="fa fa-arrow-left" aria-hidden="true"></i> &nbsp; Indietro
					</button>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-12 componi-menu">
					<h3 id="start_procedure" class="card-title">Componi il tuo men&ugrave;</h3>

					<h4>
						<!-- 						Seleziona il primo, il secondo e il contorno che preferisci.<br> -->
						<!-- 						Devi scegliere almeno un primo o un secondo; a parte questo, puoi -->
						<!-- 						comporre qualsiasi combinazione.<br> Il prezzo varia secondo -->
						<!-- 						la tua selezione, da &euro; 7,00 a &euro; 12,00 per il menu -->
						<!-- 						completo.<br> <br> -->
						Men&ugrave; da &euro; 7,00 a &euro; 12,00; acqua e caff&eacute;
						sempre inclusi!
						<a
							id="info_button"
							tabindex="0"
							class="info-btn" role="button" data-placement="bottom"
							data-toggle="popover" data-trigger="focus" title="Istruzioni"
							data-html="true"
							data-content="
							Seleziona il primo, il secondo e il contorno che preferisci.<br>
							Devi scegliere almeno un primo o un secondo; a parte questo, puoi
							comporre qualsiasi combinazione.<br>
							Il prezzo varia secondo la tua selezione, da &euro; 7,00 a &euro; 12,00 per il menu completo.<br> <br>
							<strong>
							E ricorda, il menu include sempre acqua e caff&egrave;!</strong>">
							Scopri come funziona
						</a>
					</h4>

					<br>

					<div id="accordion">
						<div id="card1" class="card-style"
							style="background-image: url('images/primo.jpg'); background-position: center; background-repeat: no-repeat; background-size: cover;">
							<div class="acc-btn" id="headingOne" data-toggle="collapse"
								data-target="#collapseOne" aria-expanded="false"
								aria-controls="collapseOne">
								<button style="width:15em;">Scegli il tuo primo</button>
							</div>
							<div id="collapseOne" class="collapse show"
								aria-labelledby="headingOne" data-parent="#accordion">
								<div class="card-content">
									<s:iterator value="primi">
										<s:if test="titolo != 'Altro'">
											<div class="radio">
												<label class="contenitore"> <s:property
														value="titolo" /> <input type="radio" name="opt_primi"
													data-toggle="collapse" data-target="#collapseTwo"
													aria-expanded="true" aria-controls="collapseTwo"
													data-codice_gds='<s:property value="codice_gds"/>'
													data-description='<s:property value="titolo"/>'> <span
													class="checkmark"></span>
												</label>
											</div>
										</s:if>
									</s:iterator>

									<label class="contenitore"> Oggi il primo non mi va
										proprio... <input type="radio" name="opt_primi"
										id="opt_primi_n" data-toggle="collapse"
										data-target="#collapseTwo" aria-expanded="true"
										aria-controls="collapseTwo"> <span class="checkmark"></span>
									</label>

								</div>
							</div>
						</div>

						<div class="card-style"
							style="background-image: url('images/secondo.jpg'); background-position: center; background-repeat: no-repeat; background-size: cover;">
							<div class="acc-btn" id="headingTwo" data-toggle="collapse"
								data-target="#collapseTwo" aria-expanded="false"
								aria-controls="collapseTwo">
								<button style="width:15em;">Seleziona il secondo</button>
							</div>
							<div id="collapseTwo" class="collapse"
								aria-labelledby="headingTwo" data-parent="#accordion">
								<div class="card-content">

									<s:iterator value="secondi">
										<s:if test="titolo != 'Altro'">
											<div class="radio">
												<label class="contenitore"><s:property
														value="titolo" /> <input type="radio" name="opt_secondi"
													data-toggle="collapse" data-target="#collapseThree"
													aria-expanded="true" aria-controls="collapseThree"
													data-codice_gds='<s:property value="codice_gds"/>'
													data-description='<s:property value="titolo"/>'> <span
													class="checkmark"></span> </label>
											</div>
										</s:if>
									</s:iterator>

									<label class="contenitore"> No, grazie... <input
										type="radio" name="opt_secondi" data-toggle="collapse"
										id="opt_secondi_n" data-target="#collapseThree"
										aria-expanded="true" aria-controls="collapseThree"> <span
										class="checkmark"></span>
									</label>

								</div>
							</div>
						</div>

						<div class="card-style" style="background-image: url('images/contorno.jpg'); background-position: center; background-repeat: no-repeat; background-size: cover;">
							<div class="acc-btn" id="headingThree" data-toggle="collapse"
								data-target="#collapseThree" aria-expanded="false"
								aria-controls="collapseThree">
								<button style="width:15em;">Vuoi un contorno?</button>
							</div>

							<div id="collapseThree" class="collapse"
								aria-labelledby="headingThree" data-parent="#accordion">
								<div class="card-content">
									<s:iterator value="contorni">
										<s:if test="titolo != 'Altro'">
											<div class="radio">
												<label class="contenitore"><s:property
														value="titolo" /> <input type="radio" name="opt_contorni"
													data-toggle="collapse" data-target="#collapseFour"
													aria-expanded="true" aria-controls="collapseFour"
													data-codice_gds='<s:property value="codice_gds"/>'
													data-description='<s:property value="titolo"/>'> <span
													class="checkmark"></span> </label>
											</div>
										</s:if>
									</s:iterator>

									<label class="contenitore"> No, grazie... <input
										type="radio" name="opt_contorni" data-toggle="collapse"
										id="opt_contorni_n" data-target="#collapseFour"
										aria-expanded="true" aria-controls="collapseFour"> <span
										class="checkmark"></span>
									</label>

								</div>
							</div>
						</div>

						<div class="card-style"
							style="background-image: url('images/acqua.jpg'); background-position: center; background-repeat: no-repeat; background-size: cover;">
							<div class="acc-btn" id="headingFour" data-toggle="collapse"
								data-target="#collapseFour" aria-expanded="false"
								aria-controls="collapseFour">
								<button style="width:15em;">Acqua</button>
							</div>
							<div id="collapseFour" class="collapse"
								aria-labelledby="headingFour" data-parent="#accordion">
								<div class="card-content">

									<label class="contenitore"> Naturale <input
										type="radio" name="opt_acqua" data-toggle="collapse"
										data-target="#collapseFive" aria-expanded="true"
										aria-controls="collapseFive" data-description='acqua naturale'
										id="opt_acqua_n"> <span class="checkmark"></span>
									</label> <label class="contenitore"> Frizzante <input
										type="radio" name="opt_acqua" data-toggle="collapse"
										data-target="#collapseFive" aria-expanded="true"
										aria-controls="collapseFive"
										data-description='acqua frizzante'> <span
										class="checkmark"></span>
									</label> <label class="contenitore"> No, grazie... <input
										type="radio" name="opt_acqua" data-toggle="collapse"
										data-target="#collapseFive" aria-expanded="true"
										aria-controls="collapseFive"> <span class="checkmark"></span>
									</label>

								</div>
							</div>
						</div>

						<div class="card-style"
							style="background-image: url('images/cafe.jpg'); background-position: center; background-repeat: no-repeat; background-size: cover;">
							<div class="acc-btn" id="headingFive" data-toggle="collapse"
								data-target="#collapseFive" aria-expanded="false"
								aria-controls="collapseFive">
								<button style="width:15em;">Caff&eacute;</button>
							</div>
							<div id="collapseFive" class="collapse"
								aria-labelledby="headingFive" data-parent="#accordion">
								<div class="card-content">
									<label class="contenitore"> Espresso <input
										type="radio" name="opt_caffe" data-toggle="collapse"
										data-target="#collapseSix" aria-expanded="true"
										aria-controls="collapseSix" data-description='caffè espresso'
										id="opt_caffe_n"> <span class="checkmark"></span>
									</label> <label class="contenitore"> Macchiato caldo <input
										type="radio" name="opt_caffe" data-toggle="collapse"
										data-target="#collapseSix" aria-expanded="true"
										aria-controls="collapseSix"
										data-description='caffè macchiato caldo'> <span
										class="checkmark"></span>
									</label> <label class="contenitore"> Macchiato freddo <input
										type="radio" name="opt_caffe" data-toggle="collapse"
										data-target="#collapseSix" aria-expanded="true"
										aria-controls="collapseSix"
										data-description='caffè macchiato freddo'> <span
										class="checkmark"></span>
									</label> <label class="contenitore"> No, grazie... <input
										type="radio" name="opt_caffe" data-toggle="collapse"
										data-target="#collapseSix" aria-expanded="true"
										aria-controls="collapseSix"> <span class="checkmark"></span>

									</label>

								</div>
							</div>
						</div>

						<div class="card-style"
							style="background-image: url('images/menu.jpg'); background-position: center; background-repeat: no-repeat; background-size: cover;">
							<div class="acc-btn" id="headingSix" data-toggle="collapse"
								data-target="#collapseSix" aria-expanded="false"
								aria-controls="collapseSix">
								<button style="width:15em;">Il tuo men&ugrave;</button>
							</div>
							<div id="collapseSix" class="collapse"
								aria-labelledby="headingSix" data-parent="#accordion">
								<div class="card-content">
									<div class="col-lg-12">
										<h3>Il tuo men&ugrave;</h3>
										<br>
										<h4>
											<div id="mymenu"></div>
										</h4>
										<br>
									</div>

									<div class="col-lg-12">
										<form class="form-inline">
											<input type="hidden" name="codice_gds"
												id="custom_menu_codice_gds"
												value="<s:property value='%{codice_gds}'/>" /> <input
												type="hidden" name="descrizione"
												id="custom_menu_description" class="js-name-detail"
												value="<s:property value='%{titolo}'/>"
												data-value="<s:property value='%{titolo}'/>" />
											<h2>
												<div id="custom_menu_price_visible">&euro; 0.00</div>
											</h2>
											<br>
											<br>
											<p>
												<input type="hidden" name="prezzo" id="custom_menu_price"
													value="0" />
											</p>
											<br> <input type="hidden"
												class="mtext-104 cl3 txt-center num-product" type="number"
												min="1" name="quantita" id="custom_menu_quantita" value="1" />

											<input type="hidden"
												class="mtext-104 cl3 txt-center num-product" type="number"
												min="1" name="vars" value="" /> <input
												id="<s:property value='%{codice_gds}'/>" style="z-index: 0"
												type="hidden" class="form-control"
												value="<s:property value='%{p_alpubblico_0}'/>" readonly />
											<button id="custom_menu_submit"
												class="flex-c-m text-105 cl0 size-102 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail aggiungi"
												style="margin: 0 auto; font-size: 0.4em!important; margin-top: 25px;">Aggiungi
												al carrello</button>

											<button id="custom_menu_retry"
												class="flex-c-m text-103 cl0 size-102 bg1 bor1 hov-btn1 p-lr-15 trans-04 ancora"
												style="margin: 0 auto; font-size: 0.4em!important; margin-top: 25px;">Ne
												voglio un altro!</button>


										</form>
										<!-- 											<button id="custom_menu_retry" -->
										<!-- 												class="flex-c-m text-103 cl0 size-102 bg1 bor1 hov-btn1 p-lr-15 trans-04 ancora" -->
										<!-- 												style="margin:0 auto; margin-top: 25px; "> -->
										<!-- 											</button> -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container row" style="margin: 0 auto; text-align: left;">
			<h2 class="card-title">Vuoi qualcos'altro?</h2>
		</div>

		<div class="container row box-altro" style="margin: 0 auto; text-align: left;">
			<s:action name="categoriesb" executeResult="true" />
		</div>


	</section>


	<%@ include file="includes/footer.jsp"%>
	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>

	<!-- <script type="text/javascript">
	$(".card1, .card2, .card3, .card4, .card5, .card6").click(function(){
		  $(this).addClass("totop");
		});
	</script>
<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".card1").click(function() {
				var self = this;
				setTimeout(function() {
					theOffset = $(self).offset();
					$('body,html').animate({
						scrollTop : theOffset.top - 100
					});
				}, 100);
			});
		});
	</script>

<!--

	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".card2, .card3, .card4, .card5, .card6").click(function() {
				var self = this;
				setTimeout(function() {
					theOffset = $(self).offset();
					$('body,html').animate({
						scrollTop : theOffset.top - 300
					});
				}, 100);
			});
		});
	</script>
 -->

	<script>
		jQuery(document).ready(function($) {

			$('.card-style').click(function() {
				var pane = $(this);
				setTimeout(function() {
					var $panel = pane.closest('.card-style');
					$('html,body').animate({
						scrollTop : ($panel.offset().top - 90)
					}, 500);
				}, 300);
			});

		});
	</script>

	<!--
	<script type="text/javascript">

	$( '#card1' ).click( function( ) {
        $('html, body').animate({
            scrollTop: ($('#card1').offset().top -100)
        },500);
    });

    $( '#card2' ).click( function( ) {
        $('html, body').animate({
            scrollTop: ($('#card2').offset().top -100)
        },500);
    });

    $( '#card3' ).click( function( ) {
        $('html, body').animate({
            scrollTop: ($('#card3').offset().top -100)
        },500);
    });

    $( '#card4' ).click( function( ) {
        $('html, body').animate({
            scrollTop: ($('#card4').offset().top -100)
        },500);
    });

    $( '#card5' ).click( function( ) {
        $('html, body').animate({
            scrollTop: ($('#card5').offset().top -100)
        },500);
    });

    $( '#card6' ).click( function( ) {
        $('html, body').animate({
            scrollTop: ($('#card6').offset().top -100)
        },500);
    });


 	</script>

 -->

	<!--

	<script>
		$(".js-select2").each(function() {
			$(this).select2({
				minimumResultsForSearch : 20,
				dropdownParent : $(this).next('.dropDownSelect2')
			});
		})
	</script>
	 -->
	<!--===============================================================================================-->
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
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
	<script src="vendor/sweetalert/sweetalert.min.js"></script>

	<script>
		$(document).ready(
			function() {

				$(".scegli").click(
					function(e) {
						e.preventDefault();
						var codice_gds = $(this)
							.attr("data-codice_gds");
						window.open("product.html?codice_gds="
							+ codice_gds, "_self");
					});

				$(".aggiungi").click(function(e) {
					e.preventDefault();
					var t = $(this);
					$.ajax({
						type : "post",
						url : "addtocart.html",
						data : t.parents("form").serialize(),
						success : function(data) {
							$("#carticon").load("updcart.html");
							$("#carticon-mobile").load("updcart.html");
							$("#carrello").load("cartdet.html");
							// disabilito il pulsante di aggiunta
							$("#custom_menu_submit").attr("disabled", true);
							$('#custom_menu_submit').prop('disabled', true).css('opacity', 0.5);

							var selector = "#custom_menu_codice_gds";
							$(selector).val("");

							var selector = "#custom_menu_description";
							$(selector).val("");

							var selector = "#custom_menu_price";
							$(selector).val("");

							var selector = "#custom_menu_price_visible";
							$(selector).html("&euro; " + (parseFloat(0)).toFixed(2));

							$("#opt_primi_n").prop("checked", true);
							$("#opt_secondi_n").prop("checked", true);
							$("#opt_contorni_n").prop("checked", true);
							$("#opt_acqua_n").prop("checked", true);
							$("#opt_caffe_n").prop("checked", true);

						}
					});
				});
				$('.js-addcart-detail').each(
					function() {
						var nameProduct = $(this).parent().parent()
							.parent().parent().find(
							'.js-name-detail').html();
						$(this).on(
							'click',
							function() {
								swal(nameProduct,
									"Aggiunto al carrello!",
									"success");
							});
					});
			});
	</script>

	<script>
		// **********************************************************************
		//																		*
		// NUOVA FUNZIONE PER MENU COMPONIBILE DAL CLIENTE						*
		//																		*
		// **********************************************************************
		$(document).ready (
				function() {

			$("#opt_primi_n").prop("checked", true);
			$("#opt_secondi_n").prop("checked", true);
			$("#opt_contorni_n").prop("checked", true);
			$("#opt_acqua_n").prop("checked", true);
			$("#opt_caffe_n").prop("checked", true);
			$('#collapseOne').collapse('hide');

			$(function () {
				$('[data-toggle="popover"]').popover();
				});

			$("#custom_menu_retry").click(function(e) {
				e.preventDefault();
				$("#opt_primi_n").prop("checked", true);
				$("#opt_secondi_n").prop("checked", true);
				$("#opt_contorni_n").prop("checked", true);
				$("#opt_acqua_n").prop("checked", true);
				$("#opt_caffe_n").prop("checked", true);
				$('#collapseOne').collapse('hide');
				$('#collapseTwo').collapse('hide');
				$('#collapseThree').collapse('hide');
				$('#collapseFour').collapse('hide');
				$('#collapseFive').collapse('hide');
				refresh_mymenu();

// 				animazione
// 				$('html, body').animate({ scrollTop: 0 }, 'fast');


// 				$('html,body').scrollTop(0);
// 				scroll(0,0);
//				window.location.href = "#info_button";


// 		        $('html, body').animate({
// 		            scrollTop: ($('#card1').offset().top - 1000)
// 		        },500);

// 				$('body, html').animate({
// 					    scrollTop: ($('#info_button').offset().top)
// 					},500);
			});

			// disabilito il pulsante di aggiunta
			$("#custom_menu_submit").attr("disabled", true);
			$('#custom_menu_submit').prop('disabled', true).css('opacity', 0.5);

			$('input[name="opt_primi"]').change(
											function() {
												selected_value = $(
														"input[name='opt_primi']:checked")
														.attr("data-codice_gds");
												selected_description = $(
														"input[name='opt_primi']:checked")
														.attr(
																"data-description");
												refresh_mymenu();
											});

			$('input[name="opt_secondi"]')
									.change(
											function() {
												selected_value = $(
														"input[name='opt_secondi']:checked")
														.attr("data-codice_gds");
												selected_description = $(
														"input[name='opt_secondi']:checked")
														.attr(
																"data-description");
												refresh_mymenu();
											});

			$('input[name="opt_contorni"]')
									.change(
											function() {
												selected_value = $(
														"input[name='opt_contorni']:checked")
														.attr("data-codice_gds");
												selected_description = $(
														"input[name='opt_contorni']:checked")
														.attr(
																"data-description");
												refresh_mymenu();
											});

			$('input[name="opt_acqua"]')
									.change(
											function() {
												selected_value = $(
														"input[name='opt_acqua']:checked")
														.attr("data-codice_gds");
												selected_description = $(
														"input[name='opt_acqua']:checked")
														.attr(
																"data-description");
												refresh_mymenu();
											});

			$('input[name="opt_caffe"]')
									.change(
											function() {
												selected_value = $(
														"input[name='opt_caffe']:checked")
														.attr("data-codice_gds");
												selected_description = $(
														"input[name='opt_caffe']:checked")
														.attr(
																"data-description");
												refresh_mymenu();
											});

				function refresh_mymenu() {
								var text = "";

								if ($("input[name='opt_primi']:checked").attr(
										"data-description") != undefined) {
									text = text
											+ ""
											+ $(
													"input[name='opt_primi']:checked")
													.attr("data-description")
											+ ", ";
								}

								if ($("input[name='opt_secondi']:checked")
										.attr("data-description") != undefined) {
									text = text
											+ ""
											+ $(
													"input[name='opt_secondi']:checked")
													.attr("data-description")
											+ ", ";
								}

								if ($("input[name='opt_contorni']:checked")
										.attr("data-description") != undefined) {
									text = text
											+ ""
											+ $(
													"input[name='opt_contorni']:checked")
													.attr("data-description")
											+ ", ";
								}

								if ($("input[name='opt_acqua']:checked").attr(
										"data-description") != undefined) {
									text = text
											+ ""
											+ $(
													"input[name='opt_acqua']:checked")
													.attr("data-description")
											+ ", ";
								}

								if ($("input[name='opt_caffe']:checked").attr(
										"data-description") != undefined) {
									text = text
											+ ""
											+ $(
													"input[name='opt_caffe']:checked")
													.attr("data-description")
											+ ".";
								}

								var description = text;
								var codice_gds_primo = $(
										"input[name='opt_primi']:checked")
										.attr("data-codice_gds");
								var codice_gds_secondo = $(
										"input[name='opt_secondi']:checked")
										.attr("data-codice_gds");
								var codice_gds_contorno = $(
										"input[name='opt_contorni']:checked")
										.attr("data-codice_gds");

								var _primo = false
								var _secondo = false
								var _contorno = false;
								var price = 0;

								if (codice_gds_primo != undefined) {
									_primo = true;
								}

								if (codice_gds_secondo != undefined) {
									_secondo = true;
								}

								if (codice_gds_contorno != undefined) {
									_contorno = true;
								}

								var CODICE_GDS = "";

								if ((_primo == true) && (_secondo == true)
										&& (_contorno == true)) {
									price = "<s:property value='menu_completo.p_alpubblico_0'/>";
									codice_gds = "<s:property value='menu_completo.codice_gds'/>";
									// menu_completo
								}

								if ((_primo == true) && (_secondo == false)
										&& (_contorno == false)) {
									price = "<s:property value='menu_primo.p_alpubblico_0'/>";
									codice_gds = "<s:property value='menu_primo.codice_gds'/>";
									// menu_primo
								}

								if ((_primo == false) && (_secondo == true)
										&& (_contorno == false)) {
									price = "<s:property value='menu_secondo.p_alpubblico_0'/>";
									codice_gds = "<s:property value='menu_secondo.codice_gds'/>";
									// menu_secondo
								}

								if ((_primo == true) && (_secondo == false)
										&& (_contorno == true)) {
									price = "<s:property value='menu_primo_contorno.p_alpubblico_0'/>";
									codice_gds = "<s:property value='menu_primo_contorno.codice_gds'/>";
									// menu_primo_contorno
								}

								if ((_primo == false) && (_secondo == true)
										&& (_contorno == true)) {
									price = "<s:property value='menu_secondo_contorno.p_alpubblico_0'/>";
									codice_gds = "<s:property value='menu_secondo_contorno.codice_gds'/>";
									// menu_secondo_contorno
								}

								if ((_primo == true) && (_secondo == true)
										&& (_contorno == false)) {
									price = "<s:property value='menu_primo_secondo.p_alpubblico_0'/>";
									codice_gds = "<s:property value='menu_primo_secondo.codice_gds'/>";
									// menu_primo_secondo
								}

								var last_char = (text.substr(text.length-2, 2));
								if (last_char == ', ') {
									text = ((text.substr(0, text.length-2)))
									text = text + "."
								}

								text = text.toLowerCase();
								var lcase_description = text[0].toUpperCase() + text.slice(1); ;
								lcase_description = lcase_description.replace("è", "&egrave;");
								lcase_description = lcase_description.replace("ù", "&ugrave;");
								lcase_description = lcase_description.replace("ì", "&igrave;");
								lcase_description = lcase_description.replace("ò", "&ograve;");
								lcase_description = lcase_description.replace("à", "&agrave;");

								text = text + "<br>";

								var selector = "#custom_menu_codice_gds";
								$(selector).val(codice_gds);

								var selector = "#custom_menu_description";
								$(selector).val(lcase_description);

								var selector = "#custom_menu_price";
								$(selector).val(price);

								var selector = "#custom_menu_price_visible";
								$(selector).html("&euro; " + (parseFloat(price)).toFixed(2));

								if (price == 0) {
									$("#custom_menu_submit").attr("disabled", true);
									$('#custom_menu_submit').prop('disabled',true).css('opacity',0.5);
								} else {
									$("#custom_menu_submit").removeAttr("disabled");
									$('#custom_menu_submit').css('opacity',1);
								}

								$( "#mymenu").html(text);							}
						});
	</script>

</body>
</html>