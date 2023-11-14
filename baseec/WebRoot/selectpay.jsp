<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false" %>
<html>
<head>
	<title>Carrello</title>
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
			<h2>Pagamento</h2>
	</section>

	<section class="bg0 p-t-23 p-b-140 gds-bistrot-page">

<form method="post" action="buycart.html">
	<br>
	<div class="container bg-opaque">
		<div class="row">
			<div class="col-md-12">
				<h2>TIPO DI PAGAMENTO</h2>
			</div>
		</div>

		<table class="table">
			<tr>
				<td><button type="button" class="btn btn-danger flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5" id="back" onclick="history.back()"><i class="fa fa-chevron-left"></i> &nbsp;Indietro</button></td>
				<td align="right"><button type="submit" name="next" class="btn btn-primary flex-c-m cl0 size-118 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer" style="margin-top: 5px; border: 0; border-color: transparent">Prosegui &nbsp;<i class="fa fa-chevron-right"></i></button></td>
			</tr>
		</table>

		<table class="table" style="font-size:1.5em;">
<!-- 			<tr> -->
<!-- 				<td > -->
<!-- 					<input type="radio" name="payment" value="cc" >&nbsp;Carta di credito, pagamenti elaborati con PayPal:<br> -->
<!-- 						<img src="images/payments/electron.png"> -->
<!-- 						<img src="images/payments/maestro.png"> -->
<!-- 						<img src="images/payments/mastercard.png"> -->
<!-- 						<img src="images/payments/paypal.png"> -->
<!-- 						<img src="images/payments/postepay.png"> -->
<!-- 						<img src="images/payments/visa.png"> -->
<!-- 				</td> -->
<!-- 			</tr> -->
			<tr>
				<td>
					<input type="radio" name="payment" value="co" checked>&nbsp;Alla consegna, in contanti:<br>
						<img src="images/payments/5_euro.jpg" height="31px">
						<img src="images/payments/10_euro.jpg" height="31px">
						<img src="images/payments/money.jpg" height="31px">

				</td>
			</tr>
			<tr>
				<td>
					<input type="radio" name="payment" value="cb" >&nbsp;Alla consegna, con Bancomat o carta:<br>
						<img src="images/payments/bancomat.jpg" height="26px">
						<img src="images/payments/maestro.png">
						<img src="images/payments/mastercard.png">
						<img src="images/payments/paypal.png">
						<img src="images/payments/postepay.png">
						<img src="images/payments/visa.png">
				</td>
			</tr>

<!-- 			<tr> -->
<!-- 				<td><input type="radio" name="payment" value="p">&nbsp;FIAS Card -->
<!-- 					<ul class="payments"> -->
<!-- 						<li><img src="images/payments/card-fias.png"></li> -->
<!-- 					</ul>	 -->
<!-- 				</td> -->
<!-- 			</tr> -->
		</table>


	</div>

	<div class="container bg-opaque">
		<table class="table">
			<tr>
				<td><button type="button" class="btn btn-danger flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5" id="back" onclick="history.back()"><i class="fa fa-chevron-left"></i>&nbsp; Indietro</button></td>
				<td align="right"><button type="submit" name="next" class="btn btn-primary flex-c-m cl0 size-118 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer" style="margin-top: 5px; border: 0; border-color: transparent">Prosegui &nbsp;<i class="fa fa-chevron-right"></i></button></td>
			</tr>
		</table>
	</div>

</form>

</section>
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

	    // [ +/- num product ]*/
	    $('.btn-num-product-down1').on('click', function(){
	        var numProduct = Number($(this).next().val());
	        if (numProduct == 0) {
				numProduct = 1;
				return;
			}
	        id = ($(this).next().attr("data-id"));
			prezzounitario = parseFloat(($("#pu_" + id ).text().replace(/,/g, ".")));
			prezzototale = prezzounitario * (numProduct - 1);
			$("#pt_" + id).text(Number(prezzototale).toFixed(2));
	        if(numProduct > 0) $(this).next().val(numProduct - 1);

	        $.ajax({
				url : "updqta.html?codice_gds=" + id + "&quantita=" + (numProduct - 1),
				context : document.body
			}).done(function() {
				$("#carticon").load("updcart.html");
				$("#carticon-mobile").load("updcart.html");
				$("#carrello").load("cartdet.html");
				$("#subtotale").load("updcart2.jsp");
				$("#totale").load("updcart2.jsp");
			});

			if ((numProduct - 1) == 0){
				removprod2(id);
			}
	    });

	    $('.btn-num-product-up1').on('click', function(){
	        var numProduct = Number($(this).prev().val());
	        id = ($(this).prev().attr("data-id"));
			prezzounitario = parseFloat(($("#pu_" + id ).text().replace(/,/g, ".")));
			prezzototale = prezzounitario * (numProduct + 1);
			$("#pt_" + id).text(Number(prezzototale).toFixed(2));
	        $(this).prev().val(numProduct + 1);

	        $.ajax({
				url : "updqta.html?codice_gds=" + id + "&quantita=" + (numProduct + 1),
				context : document.body
			}).done(function() {
				$("#carticon").load("updcart.html");
				$("#carticon-mobile").load("updcart.html");
				$("#carrello").load("cartdet.html");
				$("#subtotale").load("updcart2.jsp");
				$("#totale").load("updcart2.jsp");
			});

			if ((numProduct + 1) == 0){
				var r = confirm("Vuoi rimuovere questo prodotto dal carrello?");
				if (r == true) {
					$.ajax({
						url : "remfromcart.html?codice_gds=" + codice_gds,
						context : document.body
					}).done(function() {
						// alert("eliminazione");
						$("#carticon").load("updcart.html");
						$("#carticon-mobile").load("updcart.html");
						$("#carrello").load("cartdet.html");
						location.reload();
						location.reload(false);
						// alert("fine eliminazione");
					});
				}
			}

	    });

		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})

	function removprod2 (codice_gds){
			var r = confirm("Vuoi rimuovere questo prodotto dal carrello?");
			if (r == true) {
				$.ajax({
					url : "remfromcart.html?codice_gds=" + codice_gds,
					context : document.body
				}).done(function() {
					// alert("eliminazione");
					$("#carticon").load("updcart.html");
					$("#carticon-mobile").load("updcart.html");
					$("#carrello").load("cartdet.html");
					location.reload();
					location.reload(false);
					// alert("fine eliminazione");
				});
			}
		}
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
	<script type="text/javascript">
		$(document).ready(function() {
			$("#c").load("cartdetail.html");
			$("#updcart").load("updcart.html");
			$("#logout").click(function(e) {
				e.preventDefault();
				$(this).prev("form").submit();
			});
		});
	</script>

<!--===============================================================================================-->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKFWBqlKAGCeS1rMVoaNlwyayu0e0YRes"></script>
	<script src="js/map-custom.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>