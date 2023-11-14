<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
	<title>GDS Bistrot - Prenota</title>
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
	<link rel="stylesheet" type="text/css" href="css/wickedpicker.min.css">
	<link rel="stylesheet" type="text/css" href="css/gdsbistrot.css">
<!--===============================================================================================-->
</head>
<!-- gestione JSON CALENDARIO -->
<c:import var="cal_json" url="/cal_001.json"/>
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
			<h2>Prenotazioni</h2>
		</section>

	<!-- Content page -->
	<section class="bg0 p-b-116 box-prenotazioni" >
		<div class="container">
			<div class="flex-w flex-tr">
				<div class="col-md-12">
					<p>Vuoi prenotare un tavolo?<br>
					Facilissimo!<br>
					Dicci quando lo vuoi e in quanti siete, dacci il tuo numero di telefono o la tua email, e ci pensiamo noi!<br>
					Sarai ricontattato al pi&ugrave; presto!
					</p>
				</div>

				<div class="size-210 bor10 p-lr-15-lg w-full-md" id="colonna-chiara">
					<form id="contact_form">
						<h4 class="mtext-105 cl2">

						<div class="bor8 m-b-20 how-pos4-parent">
							<input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text" id="input_name" name="input_name" placeholder="Il tuo nome e cognome" required>
								<img class="how-pos4 pointer-none" src="images/icons/icon-name.png"
								alt="ICON">
						</div>

						<div class="bor8 m-b-20 how-pos4-parent">
							<input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="email" id="input_mail" name="input_mail" placeholder="Il tuo indirizzo email" required>
								<img class="how-pos4 pointer-none" src="images/icons/icon-email.png"
								alt="ICON">
						</div>

						<div class="bor8 m-b-20 how-pos4-parent">
							<input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text" id="input_phone" name="input_phone" placeholder="Il tuo numero di telefono cellulare" required>
								<img class="how-pos4 pointer-none" src="images/icons/icon-phone.png" alt="ICON">
						</div>

						<div class="bor8 m-b-20 how-pos4-parent">
	                        Quando vuoi prenotare? <br>
								<input type="date" id="data_prenotazione" name="data_prenotazione" class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" required>
<!-- 								<img class="how-pos4 pointer-none" src="images/icons/icon-calendar.png" alt="ICON" style="margin-top:20px"> -->
<!-- 								<img class="how-pos4 pointer-none" src="images/icons/icon-phone.png" alt="ICON"> -->

						</div>

						<div class="bor8">
						  	A che ora? <br>
<!-- 							<h2 style="width: 100%;"> -->
<!-- 								<input style="width: 100%;" type="text" id="ora_consegna" name="ora_consegna" class="timepicker stext-111 cl2 plh3 size-116 p-l-62 p-r-30" /> -->
<!-- 								<img class="how-pos4 pointer-none" src="images/icons/icon-time.png" alt="ICON"> -->
<!-- 							</h2> -->
<!-- 								<img class="how-pos4 pointer-none" src="images/icons/icon-time.png" alt="ICON" style="margin-top:10px"> -->
						</div>

						<div class="bor8 m-b-20 how-pos4-parent">
							<input class="timepicker stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text" id="ora_prenotazione" name="ora_prenotazione" required>
								<img class="how-pos4 pointer-none" src="images/icons/icon-time.png" alt="ICON">
						</div>

						<div class="bor8 m-b-20 how-pos4-parent">
							<input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30"
								type="number"
								min="1" max="9"
								id="input_quanti"
								name="input_quanti" placeholder="S&igrave;, ma quanti siete?" required>
								<img class="how-pos4 pointer-none" src="images/icons/icon-heart-01.png" alt="ICON">
						</div>


						<div class="bor8 m-b-30">
							DISTANZIAMENTO COVID-19 e NOTE <br>
							<textarea class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25" id="input_message" name="input_message" placeholder="Fate parte di un unico nucleo familiare o necessitate di distanziamento COVID-19?"></textarea>
						</div>

						<button id="send_contact_form" class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">
							Invia
						</button>
					</form>
				</div>

				<div class="size-210 flex-w flex-col-m w-full-md" id="colonna-scura">

					<iframe
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2805.812093015444!2d8.843847315940659!3d45.31222127909949!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4786fcc8818289ff%3A0x4cdabff22ebbdcae!2sViale%20dei%20Mille%2C%209%2C%2027029%20Vigevano%20PV!5e0!3m2!1sit!2sit!4v1610318009163!5m2!1sit!2sit"
						width="100%" height="460px" frameborder="0" style="border:0;"
						allowfullscreen=""></iframe>


					<div class="flex-w w-full p-b-42" id="contatti-booking">
						 <p>
							<i class="fa fa-flag-o" aria-hidden="true"></i><strong>Indirizzo</strong><br>
							Viale dei Mille 9, 27029 Vigevano (PV)
						</p>

						<p>
							<i class="fa fa-clock-o" aria-hidden="true"></i><strong>Orari</strong><br>
							<strong>Bar:</strong> dalle 8.00 alle 18.30<br>
							<strong>Bistrot</strong> dalle 12.00 alle 23.00<br>
<%-- 							<strong>Chiuso la domenica</strong> --%>
						</p>

						<p>

							<strong>Prenota telefonicamente</strong><br>
							<i class="fa fa-phone" aria-hidden="true"></i><a href="tel:+3903811976703">+39 0381 1976703</a>
							<br>
							<i class="fa fa-phone" aria-hidden="true"></i><a href="tel:+3903515071743">+39 351 5071743</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="includes/footer.jsp" %>

	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>


<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog" style="z-index:99999!important">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Attendere prego</h4>
        </div>
        <div class="modal-body">
          <p>Aspetta un momentino che controllo...</p>
        </div>
<!--         <div class="modal-footer"> -->
<!--           <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button> -->
<!--         </div> -->
      </div>
    </div>
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
		$('#myModal').modal('hide');
		var datastring = $("#contact_form").serialize();
		$.ajax({
		    type: "POST",
		    url: "sendmail-prenotazione.jsp",
		    data: datastring,
		    dataType: "json",
		    success: function(data) {
		    	alert ("La tua prenotazione � stata inviata, grazie.\n\nTi ricontatteremo al pi� presto!\n\nTieni il telefono acceso!");
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
	<script type="text/javascript" src="js/wickedpicker.min.js"></script>
	<script id="json_calendar" type="application/json" src="cal_001.json"></script>

<script>

$(document).ready(function () {
		setTimeout(function(){$('#myModal').modal('hide')},3000);

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
			now: str_rounded, 									//hh:mm 24 hour format only, defaults to current time
			twentyFour: true, 									//Display 24 hour format, defaults to false
			upArrow: 'wickedpicker__controls__control-up', 		//The up arrow class selector to use, for custom CSS
			downArrow: 'wickedpicker__controls__control-down', 	//The down arrow class selector to use, for custom CSS
			close: 'wickedpicker__close', 						//The close class selector to use, for custom CSS
			hoverState: 'hover-state', 							//The hover state class to use, for custom CSS
			title: 'Ora di arrivo', 							//The Wickedpicker's title,
			showSeconds: false, 								//Whether or not to show seconds,
			secondsInterval: 1, 								//Change interval for seconds, defaults to 1
			minutesInterval: 10, 								//Change interval for minutes, defaults to 1
			beforeShow: null, 									//A function to be called before the Wickedpicker is shown
			show: null, 										//A function to be called when the Wickedpicker is shown
			clearable: false, 									//Make the picker's input clearable (has clickable "x")
		};

		$('.timepicker').wickedpicker(options);

		Date.prototype.toDateInputValue = (function() {
		    var local = new Date(this);
		    local.setMinutes(this.getMinutes() - this.getTimezoneOffset());
		    return local.toJSON().slice(0,10);
		});

	    $('#data_prenotazione').val(new Date().toDateInputValue());

	var controllo_data = true;
	var festivo = false;

	$("#data_prenotazione").change(function() {
			festivo = false;
			// alert( $("#data_prenotazione").val());
			var d = new Date($("#data_prenotazione").val());

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

	$("#ora_prenotazione").change(function() {
		var time = $("#ora_prenotazione").val().trim();
		var ora = time.substring(0,2);
		var minuti = time.substring(5,7);
		var valore = timeConvert(ora, minuti);
		var giorno = new Date($("#data_prenotazione").val()).getDay();
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

	$("#input_quanti").change(function() {
	  // alert( $("#data_prenotazione").val());
	  var quanti = ($("#input_quanti").val());

	  if (quanti > 9){
	  	alert("Per prenotazioni di oltre 9 persone, ti preghiamo di contattarci telefonicamente!");
	  }
	});

	$("#send_contact_form").click(function() {
		event.preventDefault();

	    if ($("#contact_form")[0].checkValidity()) {

		} else {
        	$("#contact_form")[0].reportValidity();
        	return;
		}

	    // $('#myModal').modal('show');
		// alert("Fammi controllare...");
		// event.preventDefault();
		// event.stopPropagation();

	   	var time = $("#ora_prenotazione").val().trim();
		var ora = time.substring(0,2);
		var minuti = time.substring(5,7);
		var valore = timeConvert(ora, minuti);
		var giorno = new Date($("#data_prenotazione").val()).getDay();
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

		var calculed_date = new Date($("#data_prenotazione").val() + " " + ora + ":" + minuti);

		// giorno festivo?
		if (festivo == true ){
		    $('#myModal').modal('hide');
			alert ("Spiacenti, ma siamo chiusi...");
			return;
		}

		// la data è antecedente?
		if (calculed_date < new Date()){
			event.preventDefault();
		    $('#myModal').modal('hide');
			alert ("Siamo spiacenti, ma non abbiamo ancora la macchina del tempo!");
			return;
		}

		// siamo aperti?
		var d = new Date($("#data_prenotazione").val());
		var aperto = isOpen(d.getDay());
		if (aperto == false){
			event.preventDefault();
		    $('#myModal').modal('hide');
			alert ("Spiacenti, ma siamo chiusi...");
			return;
		}

		if ((check_1 == true) || check_2 == true ) {
			$("#send_contact_form").submit();
		} else {
			event.preventDefault();
		    $('#myModal').modal('hide');
			alert ("Oh no... mi spiace, ma per quest'ora non accettiamo prenotazioni!");
		}

		$('#myModal').modal('hide');
	});
});

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
	} else if (giorno == 1) { // lunedì
		return data.calendar.fascia[fascia - 1]._1;
	} else if (giorno == 2) { // martedì
		return data.calendar.fascia[fascia - 1]._2;
	} else if (giorno == 3) { // mercoledì
		return data.calendar.fascia[fascia - 1]._3;
	} else if (giorno == 4) { // giovedì
		return data.calendar.fascia[fascia - 1]._4;
	} else if (giorno == 5) { // venerdì
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