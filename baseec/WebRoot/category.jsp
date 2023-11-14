<!DOCTYPE html>
<%@page import="it.gds.utils.Config"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false" %>
<html>
<head>
	<title><s:property value="%{category}"/></title>
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
<link href="css/filterOnBrands.css" rel="stylesheet">
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

			<div id="carrello" class="header-cart-content flex-w js-pscroll" style="left-margin:2%;">
				<s:action name="cartdet" executeResult="true"/>
			</div>
		</div>
	</div>
<br>
<br>
<br>
<%--
// **********************************************************************************
	ABILITAZIONE FILTRO MARCHI
	VARIABILE: _abilita_filtro_marchi
// **********************************************************************************
--%>
<% if (Config.getABILITAFILTROMARCHI() == 1) { %>
<section class="brand-sidebar fob-left fob-floating fob-inactive">
    <div class="brand-sidebar-wrap">
        <header class="brand-sidebar-title">
            <h3>Marchi</h3>
        </header>
        <div class="wrap-filters">
				<ul class="brand-filter" style="min-height:120px">
					<s:iterator value="marchi" status="incr" >
						<li class="list-item">
							<button type="button" id='btn_marchio_<s:property value="id"/>'
								onclick="ricercaMarchio(<s:property value="id"/>);"
								data-id='<s:property value="id"/>' name="btn_marchio"
								value="<s:property value='marchio'/>"
								style="text-align:left; margin-left:10px; width:100%;">
								<s:property value='marchio'/>
							</button>
							</li>
					</s:iterator>
				</ul>
			</div>
    </div>
    <button class="brand-sidebar-btnTitle">Filtri</button>
</section>
<script type="text/javascript">
$(document).ready(
		function() {
			$('#register-btn').click(
					function() {
						$('#ext-modal').modal("show");
					});
			$('#recovery-btn').click(
					function() {
						$('#ext-modal').modal("show");
					});

		});
</script>
<% } %>
	<!-- Product -->

	<section class="bg0 p-t-23 p-b-140" style="margin-left:0%; margin-right:0%">

	<!-- Title page -->
	<div class="gdsbistrot-header-2">
		<h2><s:property value="%{category}" /></h2>
	</div>

		<div class="container">
		<!--	<div class="p-b-10">
				<h3 class="ltext-103 cl5">
					<s:property value="%{category}" />
				</h3>
			</div> -->

<!-- 			<button onclick="window.history.back();" -->
<!-- 				class="flex-c-m stext-101 cl5 size-101 bg2 bor1 hov-btn1 p-lr-15 trans-04"> -->
<%-- 				<span class="fa fa-chevron-left"></span>&nbsp; Indietro --%>
<!-- 			</button> -->
<!-- 			<hr> -->

			<div id="products" class="row " style="height:auto !important">
				<img id="loader" alt="" src="images/loading.gif" style ="display: block;margin-left: auto; margin-right: auto; width: 50%; height:50%;" >
			</div>

			<!-- Load more -->
			<div class="flex-c-m flex-w w-full p-t-45">
				<s:if test="%{next == true}">
					<button id="loadmore" class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04" onclick="loadMore();">
						Carica altri...
					</button>
				</s:if>
			</div>
		</div>
	</section>

	<%@ include file="includes/footer.jsp" %>

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
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/slick/slick.min.js"></script>
	<script src="js/slick-custom.js"></script>
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
		        delegate: 'a', // the selector for gallery item
		        type: 'image',
		        gallery: {
		        	enabled:true
		        },
		        mainClass: 'mfp-fade'
		    });
		});
	</script>
<!--===============================================================================================-->
	<script src="vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2').on('click', function(e){
			e.preventDefault();
		});

		$('.js-addwish-b2').each(function(){
			var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-b2');
				$(this).off('click');
			});
		});

		$('.js-addwish-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-detail');
				$(this).off('click');
			});
		});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
		});

	</script>
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
<!--===============================================================================================-->
	<script src="js/main.js"></script>

	<script>
		$( document ).ready(function() {
			$('#products').css("height", "auto");
			var categoria = '<s:property value="%{cat}" escapeHtml="false" />';
		});

		var quanticaricamenti = 1;

		$(document).ready(function() {
			var categoria = '<s:property value="%{cat}" escapeHtml="false" />';
			$('#products').css("height", "auto");
			$.ajax ({
				url : "categorynext.html?cat=" + categoria + "&qt=" + quanticaricamenti,
				type : 'GET',
				success : function(data) {
					$('#loader').hide();
					$('#products').append($(data));
					quanticaricamenti = quanticaricamenti + 1;
					$("#loadmore").fadeIn();
				    window.scrollTo(0,0);
				}
			});
		});

		function loadMore() {
			var categoria = '<s:property value="%{cat}" escapeHtml="false" />';
			$("#loadmore").fadeOut(2000);
			$('#products').css("height", "auto");

			$.ajax ({
				url : "categorynext.html?cat=" + categoria + "&qt=" + quanticaricamenti,
				type : 'GET',
				success : function(data) {
					$('#products').append($(data));
					quanticaricamenti = quanticaricamenti + 1;
					if (data === "<!DOCTYPE html>\r\n\r\n\r\n\t\t\t\t\r\n") {
						$("#loadmore").hide();
					} else {
						$("#loadmore").fadeIn();
					}
				}
			});
		}
	</script>
<script>
function ricercaMarchio(id) {
	var categoria = '<s:property value="%{cat}" escapeHtml="false" />';
	$('#products').css("height", "auto");
	$('#products').html("");
	$.ajax ({
		url : "searchbybrand.html?brand=" + id +"&category=" + categoria,
		type : 'GET',
		success : function(data) {
			$('#products').append($(data));
			quanticaricamenti = quanticaricamenti + 1;
			$("#loadmore").hide();
	        $('.brand-sidebar').toggleClass('fob-inactive', 'fob-active');
		}
	});
}
</script>
<script>
$(document).ready(function(){
	$('.brand-sidebar-btnTitle').click(function() {
        $('.brand-sidebar').toggleClass('fob-inactive', 'fob-active');
	});
});
//**********************************************************************************
</script>
<script>
	$(document).ready(function() {
		$(".aggiungi").click(
			function(e) {
				e.preventDefault();
				alert ("0");
				var t = $(this);
				alert ("1");
				$.ajax({
					type : "post",
					url : "addtocart.html",
					data : t.parents("form").serialize(),
					success : function(data) {
						$("#carticon").load("updcart.html");
						$("#carticon-mobile").load("updcart.html");
						$("#carrello").load("cartdet.html");
					}
				});
			});
	});
</script>

</body>
</html>