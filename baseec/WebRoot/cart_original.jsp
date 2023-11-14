<!DOCTYPE html>
<%@ page import="it.gds.beans.Coupon"%>
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

	<br>

	<!-- Shoping Cart -->
	<form class="bg0 p-t-75 p-b-85">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
					<div class="m-l-25 m-r--38 m-lr-0-xl">
						<button onclick="window.history.back();"
							class="flex-c-m stext-101 cl5 size-101 bg2 bor1 hov-btn1 p-lr-15 trans-04">
							<span class="fa fa-chevron-left"></span>&nbsp; Indietro
						</button>
						<br>

						<div class="wrap-table-shopping-cart">
							<table class="table-shopping-cart">
								<tr class="table_head">
									<th class="column-1" style="font-weight: 300;">Prodotto</th>
									<th class="column-2"></th>
									<th class="column-3" style="font-weight: 300;">Prezzo</th>
									<th class="column-4" style="font-weight: 300;">Quantit&agrave;</th>
									<th class="column-5" style="font-weight: 300;">Totale</th>
								</tr>

								<s:iterator value="c.dettagli" status="stat">

									<tr class="table_row">
										<td class="column-1">
											<div class="how-itemcart1" onclick="removprod2('<s:property value="%{codice_gds}"/>','<s:property value="%{descrizione}"/>');">
												<img width="120px"
													src="https://www.gdsmarket.it/immagini/<s:property value="%{prodotto.codice_gds}" />/<s:property value="%{prodotto.nome_immagine}" />.jpg" onclick="removprod2('<s:property value="%{codice_gds}"/>','<s:property value="%{descrizione}"/>');"
													onerror="this.src='images/dish.jpg'"
													alt="IMG">
											</div>
										</td>
										<td class="column-2">
											<a href="product.html?codice_gds=<s:property value='%{codice_gds}'/>" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
												<span id="desc_<s:property value='%{codice_gds}'/>"><s:property escape="false" value='%{descrizione}'/></span>
											</a>

										</td>
										<s:if test="prodotto.unita_misura=='cf'">
											<td class="column-3">&euro; <span id="pu_<s:property value='%{codice_gds}'/>"> <s:property value="getText('{0,number,#,##0.00}',{prezzo})"/></span></td>
										</s:if>
										<s:else>
											<td class="column-3">&euro; <span id="pu_<s:property value='%{codice_gds}'/>"> <s:property value="getText('{0,number,#,##0.00}',{prezzo/10})"/> / etto</span></td>
										</s:else>
										<td class="column-4">
											<s:if test="prodotto.unita_misura=='cf'">

												<div class="wrap-num-product flex-w m-l-auto m-r-0">
													<div class="btn-num-product-down1 cl8 hov-btn3 trans-04 flex-c-m" data-description="<s:property value='%{descrizione}'/>">
														<i class="fs-16 zmdi zmdi-minus"></i>
													</div>

													<input class="mtext-104 cl3 txt-center num-product" type="number" name="num-product1" data-id="<s:property value='%{codice_gds}'/>" value="<s:number name='%{quantita}' type='integer'/>">

													<div class="btn-num-product-up1 cl8 hov-btn3 trans-04 flex-c-m" data-description="<s:property value='%{descrizione}'/>">
														<i class="fs-16 zmdi zmdi-plus"></i>
													</div>
												</div>
											</s:if>
											<s:else>
												<s:property value='%{(quantita * 1000).toString().replace(".",",")}'/> g
<!-- 												<input -->
<!-- 													class="mtext-104 cl3 txt-center num-product" -->
<!-- 													type="number" -->
<!-- 													name="num-product1" -->
<%-- 													data-id="<s:property value='%{codice_gds}'/>" --%>
<%-- 													value="<s:property value='%{quantita * 1000}'/>"> --%>
											</s:else>
										</td>
										<td class="column-5">&euro; <span id="pt_<s:property value='%{codice_gds}'/>"> <s:property value="getText('{0,number,#,##0.00}',{prezzo * quantita})"/></span></td>
									</tr>
								</s:iterator>
							</table>
						</div>

						<div class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
							<s:if test="%{#session.CLIENTE.ctessera.tessera != null}">
								<div class="flex-w flex-m m-r-20 m-tb-5">
									<form id="form_coupon" method="post">
										<input
											class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5"
												type="text"
												name="coupon"
												id="coupon"
												placeholder="Codice sconto"
												onkeyup="this.value = this.value.toUpperCase();">

										<button onclick="usacoupon(); return false;" class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5">
											Applica sconto
										</button>
									</form>
								</div>
								<button onclick="rimuovisconto(); return false;" class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10">
									Rimuovi sconto
								</button>
							</s:if>
							<s:else>
								Devi registrarti e fare login per poter usare i coupon!
							</s:else>

						</div>
					</div>
				</div>

				<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
					<div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
						<h4 class="mtext-109 cl2 p-b-30">
							Totale carrello
						</h4>

						<div class="flex-w flex-t bor12 p-b-13">
							<div class="size-208">
								<span class="stext-110 cl2">
									Subtotale:
								</span>
							</div>

							<div class="size-209">

								<span id="subtotale" class="mtext-110 cl2">
									&euro; <s:property value="getText('{0,number,#,##0.00}',{c.totcart})"/>
								</span>
							</div>
						</div>

						<div class="flex-w flex-t bor12 p-t-15 p-b-30">
							<div class="size-208 w-full-ssm">
								<span class="stext-110 cl2">
									Sconti:
								</span>
							</div>

							<div class="size-209 p-r-18 p-r-0-sm w-full-ssm">
								<p class="stext-111 cl6 p-t-2">
									<s:if test="%{#session.CARRELLO.c != null}">
										<s:property value="%{#session.CARRELLO.c.descrizione}"/>
									</s:if>
									<s:else>
										Non sono stati applicati sconti!
									</s:else>
								</p>
							</div>
						</div>

						<div class="flex-w flex-t p-t-27 p-b-33">
							<div class="size-208">
								<span class="mtext-101 cl2">
									Totale:
								</span>
							</div>

							<div class="size-209 p-t-1">
								<span id="totale" class="mtext-110 cl2">
									&euro; <s:property value="getText('{0,number,#,##0.00}',{c.totcartwithdiscount})"/>
								</span>
							</div>
						</div>


						<a href="delivery.html" class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer">
							Procedi
						</a>
						<br>
						<div class="bg-warning" style="font-size:0.9em!important" >
							Hai allergie o intolleranze alimentari?<br>Oppure una persona per cui stai ordinando ne ha?
							Contattaci immediatamente al numero<br>.
							<i class="fa fa-phone"></i><a href="tel:0321 1832471"> 0321 1832471</a>  <i class="fa fa-phone"></i>.
						</div>

					</div>
				</div>
			</div>
		</div>
	</form>

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
		function usacoupon() {
			var coupon = $("#coupon").val();
			$("#coupon").val("");
			if (coupon != "" && coupon != null) {
				$.get({
					url : "cart.html?coupon=" + coupon,
					context : document.body
				}).done(function() {
					$("#coupon").val("");
					location.reload();
					location.reload(false);
				});
			}
		}

		function rimuovisconto() {
			$.get({
				url : "removediscount.html",
				context : document.body
			}).done(function() {
				alert("sconto rimosso");
				location.reload();
				location.reload(false);
			});
		}

		// [ +/- num product ]*/
		$('.btn-num-product-down1').on('click',
				function() {
					var numProduct = Number($(this).next().val());
					if (numProduct == 0) {
						numProduct = 1;
						return;
					}
					id = ($(this).next().attr("data-id"));
					prezzounitario = parseFloat(($("#pu_" + id).text().replace(/,/g, ".")));
					prezzototale = prezzounitario * (numProduct - 1);
// 					descrizione = $("#desc_" + id).text();
					descrizione = $(this).attr("data-description");
// 					$("#pt_" + id).text(Number(prezzototale).toFixed(2));
// 					$(this).parent().closest("#pt_" + id).text(Number(prezzototale).toFixed(2));
					$(this).parent().parent().parent().find("#pt_" + id).text(Number(prezzototale).toFixed(2));

					if (numProduct > 0)
						$(this).next().val(numProduct - 1);
					$.ajax(
							{
								url : "updqta.html?codice_gds=" + id + "&quantita=" + (numProduct - 1) + "&descrizione=" + descrizione,
								context : document.body
							}).done(function() {
						$("#carticon").load("updcart.html");
						$("#carticon-mobile").load("updcart.html");
						$("#carrello").load("cartdet.html");
						$("#subtotale").load("updcart2.jsp");
						$("#totale").load("updcart2.jsp");
					});

					if ((numProduct - 1) == 0) {
						removprod2(id,descrizione);
					}
				});

		$('.btn-num-product-up1')
				.on(
						'click',
						function() {
							var numProduct = Number($(this).prev().val());
							id = ($(this).prev().attr("data-id"));
							prezzounitario = parseFloat(($("#pu_" + id).text().replace(/,/g, ".")));
							prezzototale = prezzounitario * (numProduct + 1);
// 							descrizione = $("#desc_" + id).text();
							descrizione = $(this).attr("data-description");
// 							$("#pt_" + id).text(Number(prezzototale).toFixed(2));
// 							$(this).parent().closest("#pt_" + id).text(Number(prezzototale).toFixed(2));
							$(this).parent().parent().parent().find("#pt_" + id).text(Number(prezzototale).toFixed(2));
							$(this).prev().val(numProduct + 1);

							$.ajax(
									{
										url : "updqta.html?codice_gds=" + id + "&quantita=" + (numProduct + 1) + "&descrizione=" + descrizione,
										context : document.body
									}).done(function() {
								$("#carticon").load("updcart.html");
								$("#carticon-mobile").load("updcart.html");
								$("#carrello").load("cartdet.html");
								$("#subtotale").load("updcart2.jsp");
								$("#totale").load("updcart2.jsp");
							});

							if ((numProduct + 1) == 0) {
								var r = confirm("Vuoi rimuovere questo prodotto dal carrello?");
								if (r == true) {
									$
											.ajax(
													{
														url : "remfromcart.html?codice_gds="
																+ codice_gds + "&descrizione=" + descrizione,
														context : document.body
													})
											.done(
													function() {
														// alert("eliminazione");
														$("#carticon").load(
																"updcart.html");
														$("#carticon-mobile")
																.load(
																		"updcart.html");
														$("#carrello").load(
																"cartdet.html");
														location.reload();
														location.reload(false);
														// alert("fine eliminazione");
													});
								}
							}

						});

		$(".js-select2").each(function() {
			$(this).select2({
				minimumResultsForSearch : 20,
				dropdownParent : $(this).next('.dropDownSelect2')
			});
		})

		function removprod2(codice_gds, descrizione) {
			var r = confirm("Vuoi rimuovere questo prodotto dal carrello?");
			descrizione = encodeURIComponent(descrizione);
			if (r == true) {
				$.ajax({
					type: "POST",
					url : "remfromcart.html?codice_gds=" + codice_gds + "&descrizione=" + descrizione,
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