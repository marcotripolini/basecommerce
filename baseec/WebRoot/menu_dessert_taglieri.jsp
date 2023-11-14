<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false" %>
<html>
<head>
	<title>GDS Bistrot - men&ugrave;</title>
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

	<link rel="manifest" href="manifest_1.json">

    <style>
		html,body {
		    width: 100%;
		    height: 100%;
		    margin: 0px;
		    padding: 0px;
		}

		#the-canvas {
		  border: 1px solid black;
		  direction: ltr;
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
		<h2>Dessert e taglieri</h2>
		</section>

	<!-- Content page -->
	<section class="bg0">
	<div class="container p-t-75 p-b-120" style="overflow-x: hidden;"  id="chisiamo">
			<div class="row p-b-148">
				<div class="col-sm-12 col-md-6 col-lg-6">
					<div class="p-t-7 p-r-85 p-r-15-lg p-r-0-md">
						<h3>
							Il nostro men&ugrave;, ogni giorno a casa tua
						</h3>

						<p>
							<span style="font-size: 15pt;""> Le nostre carni provengono solo
								da animali allevati in Italia, con tracciabilit&agrave;
								trasparente e documentata, a garanzia di un prodotto sicuro,
								genuino e garantito.<br> Piatti preparati ogni giorno con la
								massima cura dai nostri chef, che selezionano ogni giorno le
								materie prime migliori, per darti sempre il massimo della <b>qualit&agrave;</b>,
								del <b>gusto</b> e della <b>sicurezza</b>.
							</span>

						</p>
					</div>
				</div>

				<div class="col-sm-12 col-md-6 col-lg-6 m-lr-auto">
					<div class="how-bor1 ">
						<div class="hov-img01">
							<img src="images/pexels-jonathan-borba-2983101.jpg" alt="IMG">
<!-- 							<img src="images/pexels-jens-mahnke-776314.jpg" alt="IMG"> -->
						</div>
					</div>
				</div>
			</div>

			<div class="row" style="width: 100%;">
				<div class="order-md-2 col-sm-12 col-md-7 col-lg-8 p-b-30">
					<div class="p-t-7 p-l-85 p-l-15-lg p-l-0-md">
						<h3>
							La qualit&agrave; in cucina
						</h3>

						<div class="bor16 p-l-29 p-b-9 m-t-22">
							<p>
								<cite>&#171;Le cose non devono per forza cambiare il mondo per essere importanti&#187;</cite>
								<br>- Steve Jobs
							</p>
						</div>
					</div>
				</div>

<!-- 				<div class="order-md-1 col-sm-12 col-md-5 col-lg-4 m-lr-auto p-b-30"> -->
<!-- 					<div class="how-bor2"> -->
<!-- 						<div class="hov-img01"> -->
<!-- 							<img src="images/pexels-jens-mahnke-776314.jpg" alt="IMG"> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
			</div>

<!-- 			<div class="row" style="width: 100%;"> -->
<!-- 			    <iframe src="hamburger.pdf" width="100%" height="100%"> -->
<!-- 			    </iframe> -->
<!-- 			</> -->

			<script src="//mozilla.github.io/pdf.js/build/pdf.js"></script>

			<div class="row">
				<div class="col-sm-12 col-md-7 col-lg-8">
					<div class="p-t-7 p-r-85 p-r-15-lg p-r-0-md">
						<h2>
							Dessert e taglieri.
						</h2>
					</div>
				</div>
			</div>

			<div class="row" style="width: 100%; font-size:24px;">
				  <div class="col-2 float-right" style="font-size:24px;">
					  <a id="prev"><i class="fa fa-backward"></i></a>
				  </div>
				  <div class="col-8 align-self-center" style="font-size:24px;">
					  <span> pag. <span id="page_num"></span> di <span id="page_count"></span></span>
				  </div>
				  <div class="col-2 float-right" style="font-size:24px;">
					  <a id="next"><i class="fa fa-forward"></i></a>
				  </div>
			</div>
			<hr>
			<canvas id="the-canvas" style="width:100% !important">

			</canvas>
        </div>
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
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>

	<script>
	// If absolute URL from the remote server is provided, configure the CORS
	// header on that server.
	// var url = 'hamburger-menu.pdf';
	var url = 'menu/taglieri.pdf';

	// Loaded via <script> tag, create shortcut to access PDF.js exports.
	var pdfjsLib = window['pdfjs-dist/build/pdf'];

	// The workerSrc property shall be specified.
	pdfjsLib.GlobalWorkerOptions.workerSrc = '//mozilla.github.io/pdf.js/build/pdf.worker.js';

	var pdfDoc = null,
	    pageNum = 1,
	    pageRendering = false,
	    pageNumPending = null,
	    scale = 2.5,
	    canvas = document.getElementById('the-canvas'),
	    ctx = canvas.getContext('2d');

	/**
	 * Get page info from document, resize canvas accordingly, and render page.
	 * @param num Page number.
	 */
	function renderPage(num) {
	  pageRendering = true;
	  // Using promise to fetch the page
	  pdfDoc.getPage(num).then(function(page) {
	    var viewport = page.getViewport({scale: scale});
	    canvas.height = viewport.height;
	    canvas.width = viewport.width;

	    // Render PDF page into canvas context
	    var renderContext = {
	      canvasContext: ctx,
	      viewport: viewport
	    };
	    var renderTask = page.render(renderContext);

	    // Wait for rendering to finish
	    renderTask.promise.then(function() {
	      pageRendering = false;
	      if (pageNumPending !== null) {
	        // New page rendering is pending
	        renderPage(pageNumPending);
	        pageNumPending = null;
	      }
	    });
	  });

	  // Update page counters
	  document.getElementById('page_num').textContent = num;
	}

	/**
	 * If another page rendering in progress, waits until the rendering is
	 * finised. Otherwise, executes rendering immediately.
	 */
	function queueRenderPage(num) {
	  if (pageRendering) {
	    pageNumPending = num;
	  } else {
	    renderPage(num);
	  }
	}

	/**
	 * Displays previous page.
	 */
	function onPrevPage() {
	  if (pageNum <= 1) {
	    return;
	  }
	  pageNum--;
	  queueRenderPage(pageNum);
	}
	document.getElementById('prev').addEventListener('click', onPrevPage);

	/**
	 * Displays next page.
	 */
	function onNextPage() {
	  if (pageNum >= pdfDoc.numPages) {
	    return;
	  }
	  pageNum++;
	  queueRenderPage(pageNum);
	}
	document.getElementById('next').addEventListener('click', onNextPage);

	/**
	 * Asynchronously downloads PDF.
	 */
	pdfjsLib.getDocument(url).promise.then(function(pdfDoc_) {
	  pdfDoc = pdfDoc_;
	  document.getElementById('page_count').textContent = pdfDoc.numPages;

	  // Initial/first page rendering
	  renderPage(pageNum);
	});
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
// 	installazione del serviceworker

if ('serviceWorker' in navigator) {
	navigator.serviceWorker.register('service-worker_1.js');
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


</body>
</html>