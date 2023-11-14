<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
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
	<link rel="stylesheet" type="text/css" href="css/wickedpicker.min.css">
<!--===============================================================================================-->
  	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="https://jquery.ui.datepicker.mobile.css" />

<style>

@media (max-width: 450px) {

}

html, body {
    position: absolute;
    right: 0;
    left: 0;
    padding: 0;
    margin: 0;
    width: 100%;
    height: 100%;
    font-family: 'quicksand', sans-serif;
}


input {
  text-transform: capitalize;
}
::-webkit-input-placeholder {
    text-transform: none;
}
:-moz-placeholder {
    text-transform: none;
}
::-moz-placeholder {
    text-transform: none;
}
:-ms-input-placeholder {
    text-transform: none;
}

.btn-group .active {
    background-color: #375fa8;
    color: white;
}

.btn-ordine {
    cursor: pointer;
    padding: 10px 15px;
    border-bottom-left-radius: 30px;
    border-top-left-radius: 30px;
}

.btn-ordine2 {
    cursor: pointer;
    padding: 10px 15px;
    border-bottom-right-radius: 30px;
    border-top-right-radius: 30px;
}

.btn-ordine3 {
    cursor: pointer;
    padding: 10px 15px;
    border-bottom-right-radius: 30px;
    border-top-right-radius: 30px;
}

.btn-light {
    background-color: whitesmoke;
}

</style>

</head>

<!-- gestione JSON CALENDARIO -->
<c:import var="cal_json" url="/delivery.json"/>
<%
	String json = ((String)pageContext.getAttribute("cal_json"))
		.replace("\n", "")
		.replace("\r", "")
		.replace("  ", "")
		.replace("   ", "")
		;
 		pageContext.setAttribute("json_calendar",(json));
%>
<!-- gestione JSON CALENDARIO -->


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
			<h2>Consegna</h2>
			</section>

	<section class="bg0 p-t-23 p-b-140 gds-bistrot-page">
		<form method="post" id="contact_form" action="selectpay.html">
			<br>
            <div class="container">
            		<div class="col-md-12">
						<s:if test="%{#session.CLIENTE != null}">
							<h2>
								Ciao, <s:property value="%{#session.CLIENTE.nome}"/> <s:property value="%{#session.CLIENTE.cognome}"/>
							</h2>
							<hr>
						</s:if>
					</div>
				<br>
				<div class="row" style="width: 100%;">
					<div class="col-lg-4" style="display: inline-block;">
						<h2 style="width: 100%; font-weight: 600;">Tipo di ordine</h2>
                    <br>
                    <div class="btn-group btn-group-toggle" data-toggle="buttons">
                          <label class="btn btn-ordine btn-light active">
                            <input type="radio" name="tipo_ordine_1" id="tipo_ordine_1" autocomplete="off" checked>Consegna<br>a domicilio
                          </label>
                          <label class="btn btn-ordine2 btn-light">
                            <input type="radio" name="tipo_ordine_2" id="tipo_ordine_2" autocomplete="off">Ritiro<br> in negozio
                          </label>
<!--                           <label class="btn btn-ordine3 btn-light"> -->
<!--                             <input type="radio" name="tipo_ordine_3" id="tipo_ordine_3" autocomplete="off">Consumo<br>sul posto -->
<!--                           </label> -->
                    </div>
                    </div>

					<div class="col-lg-3" style="display: inline-block;">
						<h2 id="data_di_consegna" style="width: 100%;font-weight: 600;">Data di consegna</h2>
                        <br>
 						<h2 style="width: 100%;">
							<input type="date" id="data_consegna" name="data_consegna" class="border">
						</h2>
					</div>
					<div class="col-lg-5" style="display: inline-block;">
						<h2 id="ora_di_consegna" style="width: 100%;font-weight: 600;">Ora di consegna</h2>
                        <br>
						<h2 style="width: 100%;">
						<input style="width: 100%;" type="text" id="ora_consegna" name="ora_consegna" class="timepicker border"/>
<!-- 							<button id="btn_asap" -->
<!-- 								type="button" -->
<!-- 								name="asap" -->
<!-- 								id="asap" -->
<!-- 								class="asap btn btn-primary flex-c-m stext-101 cl0 size-118 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer" -->
<!-- 								style="margin-top: 5px; border: 0; border-color: transparent"> -->
<!-- 								Prima possibile * -->
<!-- 								</button> -->
						</h2>
					</div>
					<div class="col-md-12">
<!-- 						<h4 id="txt_asap"> -->
<!-- 							* Consigliatissimo per la prima colazione! Prepariamo e consegniamo il pi&ugrave; rapidamente possibile. -->
<!-- 						</h4> -->
					</div>
				</div>
			</div>
            <br>
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<s:if test="%{#session.CLIENTE != null}">
<!-- 							<h2 style="margin: 0 20px;"> -->
<%-- 								Ciao, <s:property value="%{#session.CLIENTE.nome}"/> <s:property value="%{#session.CLIENTE.cognome}"/> --%>
<!-- 							</h2> -->
<!-- 							<hr> -->
						</s:if>
						<s:else>
							<h5>
								La registrazione non &egrave; obbligatoria; devi semplicemente digitare i tuoi dati di spedizione.
							</h5>
							<hr>
							<h5>
								Se sei gi&agrave; registrato, fai <a href="login.html">login</a> usando il tuo codice utente (o la tua email) e la tua password.
								I tuoi dati saranno caricati automaticamente.<br>
							</h5>
							<hr>
							<h5>
								Se esegui la <a href="https://gdsmarket.it/home/ext_register.php">registrazione</a> sul nostro circuito, ti sar&agrave; inviata l'esclusiva Card, che ti permetter&agrave; di avere sconti e offerte imperdibili su tutti i siti web del nostro circuito.
							</h5>
							<hr>
						</s:else>
					</div>
                    <br>
                    <br>
				</div>
				<table class="table col">
					<tr>
						<td><button type="button" class="btn btn-danger flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5" id="back" onclick="history.back()"><i class="fa fa-chevron-left"></i> &nbsp;Indietro</button></td>
						<td align="right">
							<button type="submit"
							name="next"
							class="next btn btn-primary flex-c-m stext-101 cl0 size-118 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer" style="margin-top: 5px; border: 0; border-color: transparent">Prosegui &nbsp;<i class="fa fa-chevron-right"></i></button></td>
					</tr>
				</table>
				<table class="table">
					<div class="col-md-12">
						<h2 style="width: 100%; font-weight: 600;">I TUOI DATI</h2>
<!-- 						<h3>A chi deve essere intestato l'acquisto?</h3> -->
					</div>
					<tr>
						<td class="" style="width:35%"  >
							<label for="nome">Nome *</label>
						</td>
						<td class="" style="width:65%">
							<input type="text" id="nome" name="nome" value="<s:property value="cli.nome" />" class="form-control" required />
						</td>
					</tr>
					<tr>
						<td><label for="cognome">Cognome *</label></td>
						<td><input type="text" id="cognome" name="cognome" value="<s:property value="cli.cognome" />" class="form-control" required /></td>
					</tr>
					<tr>
						<td><label for="indirizzo">Indirizzo *</label></td>
						<td><input type="text" id="indirizzo" name="indirizzo" value="<s:property value="cli.indirizzo" />" class="form-control" maxlength="150" required /></td>
					</tr>
					<tr>
						<td><label for="localita">Localit&agrave; *</label></td>
						<td><input type="text" id="localita" name="localita" value="Vigevano" class="form-control" maxlength="50" required /></td>
					</tr>
					<tr>
						<td><label for="cap">Cap *</label></td>
						<td><input type="text" id="cap" name="cap" value="<s:property value="27029" />" class="form-control" maxlength="5" required /></td>
					</tr>
					<tr>
						<td><label for="provincia">Provincia *</label></td>
						<td><input type="text" id="provincia" name="provincia" readonly onkeyup="this.value = this.value.toUpperCase();" value="PV" class="form-control" maxlength="2" required /></td>
					</tr>

					<tr>
						<td><label for="telefono">Telefono *</label></td>
						<td><input type="text" id="telefono" name="telefono"  value="<s:property value="cli.telefono_a" />" onkeyup="this.value = this.value.toUpperCase();" value="<s:property value="cli.telefono" />" class="form-control" maxlength="12" required /></td>
					</tr>

					<tr>
						<td><label for="email">Email *</label></td>
						<td><input type="text" id="email" name="email" value="<s:property value="cli.email" />" class="form-control" required style="text-transform: lowercase;"/></td>
					</tr>

					<tr>
						<td><label for="d_note">Note (scala, interno, citofonare a...)</label></td>
						<td><input type="text" name="d_note" id="d_note" value="<s:property value="cli.d_note" />" class="form-control" maxlength="250" /></td>
					</tr>

					<tr>
						<td><label><sub>* campi obbligatori</sub></label></td>
					</tr>
				</table>
			</div>

			<div class="container">
				<table class="table">
					<tr>
						<td colspan="2"><input type="checkbox" name="savedata" value="1"/>&nbsp;salva i dati per i prossimi ordini</td>
					</tr>
				</table>
				<table class="table">
					<tr>
						<td><button type="button" class="btn btn-danger flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5" id="back" onclick="history.back()"><i class="fa fa-chevron-left"></i> &nbsp;Indietro</button></td>
						<td align="right">
							<button type="submit" name="next"
								class="next btn btn-primary flex-c-m cl0 size-118 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer"
								style="margin-top: 5px; border: 0; border-color: transparent">
								Prosegui &nbsp;<i class="fa fa-chevron-right"></i>
							</button>
						</td>
					</tr>
				</table>
			</div>
		</form>
</section>

	<%@ include file="includes/footer.jsp" %>

	<!-- Back to top
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>-->

<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script type="text/javascript" src="js/wickedpicker.min.js"></script>

	<script>

	$("#region").change(
			function() {
				$.post("select-districts.jsp", {region: $(this).val()},
						function(data) {
							$("#district").html("<option value=\"\">Seleziona una provincia...</option>").promise().done(
									function() {
										$("#district").append(data);
										$("#district").removeAttr("disabled");
									});
							$("#city").html("<option value=\"\">Seleziona un comune...</option>");
							$("#city").attr("disabled", true);

						});
			});
	$("#region2").change(
			function() {
				$.post("select-districts.jsp", {region: $(this).val()},
						function(data) {
							$("#district2").html("<option value=\"\">Seleziona una provincia...</option>").promise().done(
									function() {
										$("#district2").append(data);
										$("#district2").removeAttr("disabled");
									});
							$("#city2").html("<option value=\"\">Seleziona un comune...</option>");
							$("#city2").attr("disabled", true);

						});
			});

	$("#district").change(
			function() {
				$.post("select-cities.jsp", {district: $(this).val()},
						function(data) {
							$("#city").html("<option value=\"\">Seleziona un comune...</option>").promise().done(
									function() {
										$("#city").append(data);
										$("#city").removeAttr("disabled");
									});
						});
			});

	$("#district2").change(
			function() {
				$.post("select-cities.jsp", {district: $(this).val()},
						function(data) {
							$("#city").html("<option value=\"\">Seleziona un comune...</option>").promise().done(
									function() {
										$("#city2").append(data);
										$("#city2").removeAttr("disabled");
									});
						});
			});

	$("#city").change(
			function() {
				var str = this.value;
				var res = str.split("|");

				$("#localita").val(res[0]);
				$("#cap").val(res[1]);
			});

	$("#city2").change(
			function() {
				var str = this.value;
				var res = str.split("|");

				$("#d_localita").val(res[0]);
				$("#d_cap").val(res[1]);
			});

	$("#district").change(
			function() {
// 				alert(this.value);
				$("#provincia").val(this.value);
			});

	$("#district2").change(
		function() {
			$("#d_provincia").val(this.value);
		});


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


	$("#data_consegna").change(function() {
			festivo = false;
			// alert( $("#data_prenotazione").val());
			var d = new Date($("#data_consegna").val());

			Date.prototype.isValid = function() {
				// If the date object is invalid it
				// will return 'NaN' on getTime()
				// and NaN is never equal to itself.
				alert(this.getTime() === this.getTime());
			};

			var json_cal = '<%=pageContext.getAttribute("json_calendar")%>';
			data = JSON.parse(json_cal);

			for (var i = 0; i < data.calendar.date_chiusura.length; i++) {
			    var str_data = data.calendar.date_chiusura[i];
			    var temp_d = new Date(str_data);
			    d.setHours(0,0,0,0);
			    temp_d.setHours(0,0,0,0);
			    if (d.getTime()  == temp_d.getTime()) {
					festivo = true;
			    }
			}

			var aperto = isOpen(d.getDay());
			var now = new Date();
			now.setHours(0,0,0,0);
			if ( d < now ){
				aperto = false;
				alert ("DOC! Prestami la macchina del tempo! Devo tornare indietro di qualche giorno...");
				$(this).css('color', 'red');
				return;
			} else{
				$(this).css('color', 'black');
				var controllo_data = true;
			}

			if (aperto === false || festivo == true ) {
				$(this).css('color', 'red');
				alert ("Perdindirindella, siamo chiusi!")
				var controllo_data = false;
			} else {
				$(this).css('color', 'black');
				var controllo_data = true;
			}
		});

	$("#ora_consegna").change(function() {
		var time = $("#ora_consegna").val().trim();
		var ora = time.substring(0,2);
		var minuti = time.substring(5,7);
		var valore = timeConvert(ora, minuti);
		var giorno = new Date($("#data_consegna").val()).getDay();
		var controllo_fascia1 = getInterval (giorno,1);
		var controllo_fascia2 = getInterval (giorno,2);
// 		var controllo_fascia3 = getInterval (giorno,3);
// 		var controllo_fascia4 = getInterval (giorno,4);
// 		var controllo_fascia5 = getInterval (giorno,5);

		var dalle_1 = Number(controllo_fascia1.substring(0,4).trim());
		var alle_1 = Number(controllo_fascia1.substring(7).trim());
		var check_1 = false;
		if ((valore >= dalle_1) && (valore <= alle_1)) {
			check_1 = true;
		} else {
			check_1 = false;
		}

		var dalle_2 = Number(controllo_fascia2.substring(0,4).trim());
		var alle_2 = Number(controllo_fascia2.substring(7).trim());
		var check_2 = false;
		if ((valore >= dalle_2) && (valore <= alle_2)) {
			check_2 = true;
		} else {
			check_2 = false;
		}

		if ((check_1 == true) || check_2 == true ) {
			$(this).css('color', 'black');
		} else {
			$(this).css('color', 'red');
		}
	});

	var controllo_data = true;
	var festivo = false;


	$(".next").click(function() {
		event.preventDefault();
		var caps = ["27029", "27023", "27020", "27024", "27025", "27029"];
		var result = false;
		var cap = $("#cap").val().trim();
		// alert(cap);

		for (let _valore of caps) {
			if (cap == _valore){
				result = true;
		  	}
			console.log(valore);
		}

		if (result == false) {
			alert("Non consegniamo presso questo CAP, mi spiace!")
			return;
		}

	    if ($("#contact_form")[0].checkValidity()) {
		} else {
        	$("#contact_form")[0].reportValidity();
        	return;
		}

		// alert("Fammi controllare...");

	   	var time = $("#ora_consegna").val().trim();
		var ora = time.substring(0,2);
		var minuti = time.substring(5,7);
		var valore = timeConvert(ora, minuti);
		var giorno = new Date($("#data_consegna").val()).getDay();

		var controllo_fascia1 = getInterval (giorno,1);
		var controllo_fascia2 = getInterval (giorno,2);
// 		var controllo_fascia3 = getInterval (giorno,3);
// 		var controllo_fascia4 = getInterval (giorno,4);
// 		var controllo_fascia5 = getInterval (giorno,5);

		var dalle_1 = Number(controllo_fascia1.substring(0,4).trim());
		var alle_1 = Number(controllo_fascia1.substring(7).trim());
		var check_1 = false;
		if ((valore >= dalle_1) && (valore <= alle_1)) {
			check_1 = true;
		} else {
			check_1 = false;
		}

		var dalle_2 = Number(controllo_fascia2.substring(0,4).trim());
		var alle_2 = Number(controllo_fascia2.substring(7).trim());
		var check_2 = false;
		if ((valore >= dalle_2) && (valore <= alle_2)) {
			check_2 = true;
		} else {
			check_2 = false;
		}

		// controllo date
		// ***********************************************************************
		festivo = false;
		// alert( $("#data_prenotazione").val());
		var d = new Date($("#data_consegna").val());
		var json_cal = '<%=pageContext.getAttribute("json_calendar")%>';
		data = JSON.parse(json_cal);

		for (var i = 0; i < data.calendar.date_chiusura.length; i++) {
		    var str_data = data.calendar.date_chiusura[i];
		    var temp_d = new Date(str_data);
		    d.setHours(0,0,0,0);
		    temp_d.setHours(0,0,0,0);
		    if (d.getTime()  == temp_d.getTime()) {
				festivo = true;
		    }
		}

		var aperto = isOpen(d.getDay());
		var now = new Date();
		now.setHours(0,0,0,0);
		if ( d < now ){
			aperto = false;
			alert ("DOC! Prestami la macchina del tempo! Devo tornare indietro di qualche giorno...");
			$(this).css('color', 'red');
			return;
		} else{
			$(this).css('color', 'black');
			var controllo_data = true;
		}

		if (aperto === false || festivo == true ) {
			$(this).css('color', 'red');
			alert ("Perdindirindella, siamo chiusi!")
			var controllo_data = false;
		} else {
			$(this).css('color', 'black');
			var controllo_data = true;
		}

		// ***********************************************************************
		// controllo date
		// ***********************************************************************

		if (controllo_data == true){
			if ((check_1 == true) || (check_2 == true )) {
				$("#contact_form").submit();
			} else {
				event.preventDefault();
				alert ("Oh no... mi spiace, ma a quest'ora non eseguiamo consegne!");
			}
		}
	});

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
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src='vendor/datepicker-it.js' type='text/javascript'></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

	<script>

	function check(input) {
		if(input.id == 'ck4') {
			document.getElementById('ck1').checked = false;
			document.getElementById('ck2').checked = false;
			document.getElementById('ck3').checked = false;
		} else {
			document.getElementById('ck4').checked = false;
		}
		if(document.getElementById('ck1').checked || document.getElementById('ck2').checked || document.getElementById('ck3').checked || document.getElementById('ck4').checked) {
			document.getElementById('ck1').setCustomValidity('');
		}
		else
			document.getElementById('ck1').setCustomValidity('E\' necessario selezionare una fascia oraria di consegna.');
	}
	$(document).ready(
			function() {

//	 		$('#selcomuni').change(
//	 				function() {
//	 					var splitted = $(this).val().split('!');
//	 					$('#d_cap').val(splitted[0]);
//	 					$('#d_provincia').val(splitted[1]);
//	 					$('#d_localita').val(splitted[2]);
//	 				});
			$('#back').click(
					function() {
						history.back();
					});

			$('.btn-ordine').click(
				function() {
					$('#btn_asap').show();
					$('#txt_asap').show();
					$('#data_di_consegna').text("Data di consegna");
					$('#ora_di_consegna').text("Ora di consegna");
					var coeff = 1000 * 60 * 10;
					var date = new Date();  //or use any other date
					var rounded = new Date(Math.round(date.getTime() / coeff) * coeff);
					rounded.setMinutes(rounded.getMinutes() + 30);
					Number.prototype.pad = function(size) {
					    var s = String(this);
					    while (s.length < (size || 2)) {s = "0" + s;}
					    return s;
					}
					var str_rounded = (rounded.getHours().pad(2) + " : " + rounded.getMinutes().pad(2));
					$('.timepicker').val(str_rounded);
				});

			$('.btn-ordine2').click(
				function() {
					$('#btn_asap').hide();
					$('#txt_asap').hide();
					$('#data_di_consegna').text("Data di consegna");
					$('#ora_di_consegna').text("Ora di consegna");
				});

			$('.btn-ordine3').click(
				function() {
					alert("3");
					$('#btn_asap').show();
					$('#txt_asap').show();
					$('#data_di_consegna').text("Data di arrivo");
					$('#ora_di_consegna').text("Ora di arrivo");
					var coeff = 1000 * 60 * 10;
					var date = new Date();  //or use any other date
					var rounded = new Date(Math.round(date.getTime() / coeff) * coeff);
					rounded.setMinutes(rounded.getMinutes() + 30);
					Number.prototype.pad = function(size) {
					    var s = String(this);
					    while (s.length < (size || 2)) {s = "0" + s;}
					    return s;
					}
					var str_rounded = (rounded.getHours().pad(2) + " : " + rounded.getMinutes().pad(2));
					$('.timepicker').val(str_rounded);

				});


			$('.asap').click(
				function() {
					$('#ora_consegna').val('Prima possibile');
				});

		});

	</script>

	<script type="text/javascript">
	    $(document).ready(function () {
	       $("#copyvalues").on("click", function (e) {
	          e.preventDefault();
	          var nome = $("#nome").val();
	          var cognome = $("#cognome").val();
	          var indirizzo = $("#indirizzo").val();
	          var localita = $("#localita").val();
	          var cap = $("#cap").val();
	          var provincia = $("#provincia").val();

	          var d_nominativo = nome + " " + cognome;
	          $("#d_nominativo").val(d_nominativo);
	          $("#d_indirizzo").val(indirizzo);
	          $("#d_localita").val(localita);
	          $("#d_cap").val(cap);
	          $("#d_provincia").val(provincia);
	       });

		var coeff = 1000 * 60 * 10;
		var date = new Date();  //or use any other date
		var rounded = new Date(Math.round(date.getTime() / coeff) * coeff);
		rounded.setMinutes(rounded.getMinutes() + 30);
			Number.prototype.pad = function(size) {
				var s = String(this);
				while (s.length < (size || 2)) {
					s = "0" + s;
				}
				return s;
			}
			var str_rounded = (rounded.getHours().pad(2) + ":" + rounded.getMinutes().pad(2));

		// **************************************************************************
		// wickedpicker
		// **************************************************************************
		var options = {
			now: str_rounded, 		//hh:mm 24 hour format only, defaults to current time
			twentyFour: true, 	//Display 24 hour format, defaults to false
			upArrow: 'wickedpicker__controls__control-up', //The up arrow class selector to use, for custom CSS
			downArrow: 'wickedpicker__controls__control-down', //The down arrow class selector to use, for custom CSS
			close: 'wickedpicker__close', //The close class selector to use, for custom CSS
			hoverState: 'hover-state', //The hover state class to use, for custom CSS
			title: 'Orario consegna', //The Wickedpicker's title,
			showSeconds: false, //Whether or not to show seconds,
			secondsInterval: 1, //Change interval for seconds, defaults to 1
			minutesInterval: 10, //Change interval for minutes, defaults to 1
			beforeShow: null, //A function to be called before the Wickedpicker is shown
			show: null, //A function to be called when the Wickedpicker is shown
			clearable: false, //Make the picker's input clearable (has clickable "x")
		};

		$('.timepicker').wickedpicker(options);

		Date.prototype.toDateInputValue = (function() {
		    var local = new Date(this);
		    local.setMinutes(this.getMinutes() - this.getTimezoneOffset());
		    return local.toJSON().slice(0,10);
		});

	    $('#data_consegna').val(new Date().toDateInputValue());

});
    </script>
<script>
$(window).bind('beforeunload', function(){
    localStorage.nome = $('#nome').val();
    localStorage.cognome = $('#cognome').val();
    localStorage.indirizzo = $('#indirizzo').val();
    localStorage.localita = $('#localita').val();
    localStorage.telefono = $('#telefono').val();
    localStorage.note = $('#d_note').val();
    localStorage.email = $('#email').val();
});
// $( window ).unload(function() {
//   alert("Handler for .unload() called.");
// });
$(document).ready(function() {
    loadSettings();
});

function loadSettings() {
    $('#nome').val(localStorage.nome);
    $('#cognome').val(localStorage.cognome);
    $('#indirizzo').val(localStorage.indirizzo);
    $('#telefono').val(localStorage.telefono);
    $('#d_note').val(localStorage.note);
    $('#email').val(localStorage.email);
}

function saveSettings() {
    localStorage.nome = $('#nome').val();
    localStorage.cognome = $('#cognome').val();
    localStorage.indirizzo = $('#indirizzo').val();
    localStorage.localita = $('#localita').val();
    localStorage.telefono = $('#telefono').val();
    localStorage.note = $('#d_note').val();
    localStorage.email = $('#email').val();
}

function getInterval (giorno, fascia) {
	//  giorno è il giorno della settimana, da domenica (0) a sabato (7)
	//  fascia è la fascia oraria, da 1 a 4
	// 	var j = $.getJSON("./cal_001.json");

	// 	$.getJSON("./cal_001.json", function(json) {
	// 	    console.log(json); // this will show the info it in firebug console
	// 	});

	// 	var mydata = JSON.parse(data);
	// 		alert(mydata.length);
	var json_cal = '<%=pageContext.getAttribute("json_calendar")%>';
	data = JSON.parse(json_cal);
	if (giorno == 0) { // domenica
		return data.calendar.fascia[fascia - 1]._0;
	} else if (giorno == 1) { // lunedi
		return data.calendar.fascia[fascia - 1]._1;
	} else if (giorno == 2) { // martedi
		return data.calendar.fascia[fascia - 1]._2;
	} else if (giorno == 3) { // mercoledi
		return data.calendar.fascia[fascia - 1]._3;
	} else if (giorno == 4) { // giovedi
		return data.calendar.fascia[fascia - 1]._4;
	} else if (giorno == 5) { // venerdi
		return data.calendar.fascia[fascia - 1]._5;
	} else if (giorno == 6) { // sabato
		return data.calendar.fascia[fascia - 1]._6;
	} else {
		return "0";
	}
}

function isOpen (giorno) {
	//  giorno è il giorno della settimana, da domenica (0) a sabato (7)
	var json_cal = '<%=pageContext.getAttribute("json_calendar")%>';
	data = JSON.parse(json_cal);
	if (Number(giorno)< 7 ) {
		if (Number(data.calendar.closed) === Number(giorno)) {
			return false;
		} else {
			return true;
		}
	} else {
		return false;
	}
}

function timeConvert(n,m) {
	var minutes = Number (n * 60) + Number (m);
	return minutes;
	console.log(minutes + " Minutes");
}

    </script>
</body>
</html>
