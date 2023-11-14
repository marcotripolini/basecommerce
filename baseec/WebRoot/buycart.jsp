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
			<h2>Riepilogo</h2>
			</section>

<section class="bg0 p-t-30 p-b-0 gds-bistrot-page">

<div class="container-fluid">
	<div class="container bg-opaque">
		<div class="row">
		<br>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<h2 class="bigtitle">Concludi il tuo ordine</h2>
			</div>
		</div>
		<div class="row">
			<div class="rowd colmobile col-lg-12 col-md-12 col-sm-12 col-xs-12 col">
				<div class="col50 rowmobile background2" style="display: none;">
	                <table class="cart">
						<s:iterator value="c.dettagli" status="stat">
							<li class="header-cart-item flex-w flex-t m-b-12">
								<div class="header-cart-item-img" onclick="removprod('<s:property value="%{codice_gds}"/>');">
									<img width="80px" src="https://www.gdsmarket.it/immagini/<s:property value="%{prodotto.codice_gds}" />/<s:property value="%{prodotto.nome_immagine}" />.jpg"
									onerror="this.src='images/dish.jpg'"
									alt="IMG">
								</div>
								<div class="header-cart-item-txt p-t-8">
									<a href="product.html?codice_gds=<s:property value='%{codice_gds}'/>" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
										<s:property value='%{descrizione}' />
									</a>
									<span class="header-cart-item-info">
										<s:property value='%{quantita}'/> x &euro; <s:property value="getText('{0,number,#,##0.00}',{prezzo})"/>
									</span>
								</div>
							</li>
						</s:iterator>

						<tr>
							<td colspan="4">&nbsp;</td>
						</tr>

						<s:if test="discount > 0">
							<tr>
								<td style="padding:5px" align="right" colspan="4">
									<span>
										Applicazione <b>sconto del
										<s:text name="format.number">
											<s:param value="%{discount}" />
										</s:text>
										</b>%: &euro;
										<s:text name="format.number">
											<s:param value="%{#session.CARRELLO.totcartwithdiscount}" />
										</s:text>
										</b>
									</span>
								</td>
							</tr>
						</s:if>
	                </table>
                </div>

                <div class="col100 rowmobile background1">
                    <table class="cart">
					<tr>
						<td style="padding:5px" align="left" colspan="4">
							<span>Spese di spedizione &euro;&nbsp;<b>
							<s:property value="getText('{0,number,#,##0.00}',{#session.CARRELLO.spesesped.importo_sped})"/>
<%-- 								<s:text name="format.number"> --%>
<%-- 									<s:param value="%{#session.CARRELLO.spesesped.importo_sped}" /> --%>
<%-- 								</s:text> --%>
								</b>
							</span>
						</td>
					</tr>
					<tr>
						<td style="padding:5px" align="left" colspan="4">
							<span>TOTALE &euro;&nbsp;
								<b>
									<s:property value="getText('{0,number,#,##0.00}',{#session.CARRELLO.totale})"/>
									<s:property value="%{#session.CARRELLO.totale}" />
								</b>
							</span>
						</td>
					</tr>
					
<%-- 					coupon <s:property value="{#session.CARRELLO.c}"/><br> --%>
<%-- 					code <s:property value="{#session.CARRELLO.c.code}"/><br> --%>
					
					<s:if test="%{#session.CARRELLO.c != null }">
						<tr>
							<td style="padding:5px" align="left" colspan="4">
								<span>COUPON &nbsp;
									<b>
										<s:property value="%{#session.CARRELLO.coupon}"/>
									</b>
								</span>
							</td>
						</tr>
	
						<tr>
							<td style="padding:5px" align="left" colspan="4">
								<span>TOTALE SCONTATO &euro;&nbsp;
									<b>
										<s:property value="getText('{0,number,#,##0.00}',{#session.CARRELLO.totcartwithdiscount})"/>
									</b>
								</span>
							</td>
						</tr>
					</s:if>
				</table>
				<br>
				 <table class="cart">
					<tr>
						<td style="padding:5px" align="left" colspan="4">
							<p>Modalit&agrave; di pagamento:
								<s:if test='#session.PAYMENT_TYPE == "cc"'>
									<b>Carta di credito</b>
								</s:if>
								<s:else>
									<b>Alla consegna, in contanti o con bancomat o carta</b>
								</s:else>
							</p>
						</td>
					</tr>

<!-- 					<tr> -->
<!-- 						<td style="padding:5px" align="left" colspan="4"> -->
<%-- 							<p>Modalit&agrave; di spedizione: <b><s:property value="%{#session.CARRELLO.spesesped.descrizione}" /></b></p> --%>
<!-- 						</td> -->
<!-- 					</tr> -->
				</table>
				<br><br>
				<div class="condizioni">
					<%-- <%@ include file="condizioni.html" %> --%>
				</div>
				<br/>
                </div>
                </div>

                <div class="colmobile">
				<p><a href="http://www.gds-italia.it/web/download/CGdV.pdf" style="color: #555;" target="_blank">
					<span class="fa fa-file"></span>
					<strong>Leggi</strong></a> le Condizioni generali di vendita in formato pdf.</p>
					<br>

						<form method="post" action="executeorder.html">
							<input type="hidden" name="paytype" value="<s:property value="p" />" />
							<input type="hidden" name="importo" value="<s:property value="#session.CARRELLO.totcart" />" />
							<input type="hidden" name="spesesped" value="<s:property value="#session.CALC" />" />
							<table>
								<tr>
									<td><input type="checkbox" id="ck1" required /> Dichiaro di aver letto e accettato le condizioni generali di vendita riportate sopra.</td>
								</tr>
								<tr><td><br></td></tr>
								<tr>
									<td>
										<input type="checkbox" id="ck2" required />
										Ai sensi e per gli effetti degli artt. 1341 e seguenti del codice civile,
										la parte prende attenta visione e dichiara di accettare espressamente i
										seguenti articoli: art. 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22
										delle condizioni generali di vendita riportate sopra.
									</td>
								</tr>
							</table>
							<br>
							<div class="container bg-opaque" style="padding-left:0px!important;">
								<table class="table" style="padding: 0rem!important;">
									<tr>
                                        <td>
                                        	<button type="button" class="btn btn-danger flex-c-m cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5" id="back" onclick="history.back()">
                                        		<i class="fa fa-chevron-left"></i>
                                        		&nbsp;Indietro
                                        	</button>

                                       	</td>
						                <td align="right">

								<s:if test='#session.PAYMENT_TYPE == "cb"'>
						                <button type="submit" name="next" class="btn btn-primary flex-c-m cl0 size-118 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer" style="margin-top: 5px; border: 0; border-color: transparent; ">Conferma
						                  &nbsp;<i class="fa fa-check-circle"></i>
						                </button>
								</s:if>

								<s:elseif test='#session.PAYMENT_TYPE == "co"'>
						                <button type="submit" name="next" class="btn btn-primary flex-c-m cl0 size-118 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer" style="margin-top: 5px; border: 0; border-color: transparent; ">Conferma
						                  &nbsp;<i class="fa fa-check-circle"></i>
						                </button>
								</s:elseif>

								<!--  
								<s:else>
							
										<script src="https://www.paypalobjects.com/api/checkout.js"></script>

										<div id="paypal-button-container"></div>
										<script>
										    // Render the PayPal button
										    paypal.Button.render({
										        // Set your environment
										        env: 'sandbox', // sandbox | production
										        // Specify the style of the button
										        style: {
										            label: 'paypal',
										            size:  'large',    // small | medium | large | responsive
										            shape: 'pill',     // pill | rect
										            color: 'silver',     // gold | blue | silver | black
										            tagline: false
										        },
										        // PayPal Client IDs - replace with your own
										        // Create a PayPal app: https://developer.paypal.com/developer/applications/create
										        client: {
										            sandbox:    'AXaU2EYdA84aKLkkb-s2ZCSiDpaah_q0nSrPH9dKMVF5FOiksVYUMgAozaz-qulZsFbsDB3MwwzXeVok',
										            production: 'ATU-EiLLIJ_yWDHLjKEC2NERjOXOhxM3WqGXMWnwD0kso6jw5wEreg7T4KZ3AangEDdTIao_8ZaieFMp'
										        },

										        // Show the buyer a 'Pay Now' button in the checkout flow
										        commit: true,

										        // payment() is called when the button is clicked
										        payment: function(data, actions) {
										          // Make a call to the REST API to set up the payment
										          return actions.payment.create({
										            payment: {
										              transactions: [
										           		{
										                  amount: { total: '<s:property value="#session.CARRELLO.totaleNumber" />', currency: 'EUR' }
										                }
										              ],
										              redirect_urls: {
										                return_url: 'https://example.com',
										                cancel_url: 'https://example.com'
										              }
										            }
										          });
										        },

										        // onAuthorize() is called when the buyer approves the payment
										        onAuthorize: function(data, actions) {

										          // Make a call to the REST API to execute the payment
										          return actions.payment.execute().then(function() {
										            actions.redirect();
										            }
										          );
										        },

										        onCancel: function(data, actions) {
										          actions.redirect();
										          }
										      }, '#paypal-button-container');
										</script>
								</s:else>
								-->


						                </td>
									   </tr>
								</table>
							</div>
						</form>
					<br>
				</div>
			</div>
		</div>
	</div>
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