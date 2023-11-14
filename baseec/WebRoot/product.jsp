<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false"%>
<%-- <%@ include file="/includes/head.jsp" %> --%>
<%@ page import="it.gds.utils.Config"%>
<%
Boolean related = false;
Boolean social = false;
%>
<html lang="it">
<head>
<title>Dettaglio prodotto</title>
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
<meta property="og:url"                content='<%=request.getScheme() + "://" + request.getHeader("host") + "/vg/product.html?" + request.getQueryString()%>' />
<meta property="og:type"               content="article" />
<meta property="og:title"              content="<s:property escape="true" value='%{prodotto.titolo}'/>" />
<meta property="og:description"        content='<s:property escape="false" value="prodotto.dettaglio" />' />
<meta property="og:image"              content='/product_images/<s:property value="%{prodotto.codice_gds}" />/<s:property value="%{prodotto.nome_immagine}" />' />

</head>
<style>
/*the container must be positioned relative:*/
.custom-select {
	position: relative;
	font-family: Arial;
}

.custom-select select {
	display: none; /*hide original SELECT element:*/
}

.select-selected {
	background-color: DodgerBlue;
}

/*style the arrow inside the select element:*/
.select-selected:after {
	position: absolute;
	content: "";
	top: 14px;
	right: 10px;
	width: 0;
	height: 0;
	border: 6px solid transparent;
	border-color: #fff transparent transparent transparent;
}

/*point the arrow upwards when the select box is open (active):*/
.select-selected.select-arrow-active:after {
	border-color: transparent transparent #fff transparent;
	top: 7px;
}

/*style the items (options), including the selected item:*/
.select-items div, .select-selected {
	color: #ffffff;
	padding: 8px 16px;
	border: 1px solid transparent;
	border-color: transparent transparent rgba(0, 0, 0, 0.1) transparent;
	cursor: pointer;
	user-select: none;
}

/*style items (options):*/
.select-items {
	position: absolute;
	background-color: DodgerBlue;
	top: 100%;
	left: 0;
	right: 0;
	z-index: 99;
}

/*hide the items when the select box is closed:*/
.select-hide {
	display: none;
}

.select-items div:hover, .same-as-selected {
	background-color: rgba(0, 0, 0, 0.1);
}
</style>
<body class="animsition">

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
		<h2><s:property escape="true" value='%{prodotto.titolo}'/></h2>
		</section>

	<!-- Product Detail -->
	<section class="sec-product-detail bg0 p-t-65 p-b-60">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-7 p-b-30">
<!-- 					<button onclick="window.history.back();" -->
<!-- 						class="flex-c-m stext-101 cl5 size-101 bg2 bor1 hov-btn1 p-lr-15 trans-04"> -->
<%-- 						<span class="fa fa-chevron-left"></span>&nbsp; Indietro --%>
<!-- 					</button> -->
<!-- 					<br> -->

					<div class="p-l-25 p-r-30 p-lr-0-lg">
						<div class="wrap-slick3 flex-sb flex-w">
							<div class="wrap-slick3-dots"></div>
							<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

							<div class="slick3 gallery-lb">
								<div class="item-slick3"
									data-thumb="images/product_images/<s:property value="%{prodotto.nome_immagine}"/>">
									<div class="wrap-pic-w pos-relative">
										<img
											src="images/product_images/<s:property value="%{prodotto.nome_immagine}"/>"
											alt="IMG-PRODUCT"> <a
											class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
											href="images/product_images/<s:property value="%{prodotto.nome_immagine}" />">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>

								<s:if test="prodotto.nome_immagine2 != null">
									<div class="item-slick3"
										data-thumb="images/product_images/<s:property value="%{prodotto.nome_immagine2}"/>">
										<div class="wrap-pic-w pos-relative">
											<img
												src="images/product_images/<s:property value="%{prodotto.nome_immagine2}"/>"
												alt="IMG-PRODUCT"> <a
												class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
												href="images/product_images/<s:property value="%{prodotto.nome_immagine2}"/>">
												<i class="fa fa-expand"></i>
											</a>
										</div>
									</div>
								</s:if>

								<s:if test="prodotto.nome_immagine3 != null">
									<div class="item-slick3"
										data-thumb="images/product_images/<s:property value="%{prodotto.nome_immagine3}"/>">
										<div class="wrap-pic-w pos-relative">
											<img
												src="images/product_images/<s:property value="%{prodotto.nome_immagine3}"/>"
												alt="IMG-PRODUCT"> <a
												class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
												href="images/product_images/<s:property value="%{prodotto.nome_immagine3}"/>">
												<i class="fa fa-expand"></i>
											</a>
										</div>
									</div>
								</s:if>

								<s:if test="prodotto.nome_immagine4 != null">
									<div class="item-slick3"
										data-thumb="images/product_images/<s:property value="%{prodotto.nome_immagine4}"/>">
										<div class="wrap-pic-w pos-relative">
											<img
												src="images/product_images/<s:property value="%{prodotto.nome_immagine4}"/>"
												alt="IMG-PRODUCT"> <a
												class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
												href="images/product_images/<s:property value="%{prodotto.nome_immagine4}"/>">
												<i class="fa fa-expand"></i>
											</a>
										</div>
									</div>
								</s:if>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-6 col-lg-5 p-b-30">
					<div class="p-r-50 p-t-5 p-lr-0-lg">
						<form class="form-inline">
							<input type="hidden" name="codice_gds"
								value="<s:property value='%{prodotto.codice_gds}'/>" /> <input
								type="hidden" name="descrizione"
								id="DESC_<s:property value='%{prodotto.codice_gds}'/>"
								value="<s:property value="%{marchio.marchio}"/> - <s:property escape="true" value='%{prodotto.titolo}'/>"
								data-value="<s:property value="%{marchio.marchio}"/> - <s:property value='%{prodotto.titolo}'/>" />
							<p>
								<s:if test="#session.CLIENTE==null">
									<input type="hidden" name="prezzo"
										value="<s:property value='%{prodotto.p_alpubblico_0}'/>"
										id="HPR_<s:property value='%{prodotto.codice_gds}'/>" />
								</s:if>
								<s:if
									test="#session.CLIENTE.ctessera.tessera.equals('NOCARD') || #session.CLIENTE.tessera.tessera.contains('TAV')">
									<input type="hidden" name="prezzo"
										value="<s:property value='%{prodotto.p_alpubblico_0}'/>"
										id="HPR_<s:property value='%{prodotto.codice_gds}'/>" />
								</s:if>
								<s:elseif test="#session.CLIENTE.ctessera.livello_listino == 0">
									<input type="hidden" name="prezzo"
										value="<s:property value='%{prodotto.p_alpubblico_1}'/>"
										id="HPR_<s:property value='%{prodotto.codice_gds}'/>" />
								</s:elseif>
								<s:elseif test="#session.CLIENTE.ctessera.livello_listino == 1">
									<input type="hidden" name="prezzo"
										value="<s:property value='%{prodotto.p_alpubblico_2}'/>"
										id="HPR_<s:property value='%{prodotto.codice_gds}'/>" />
								</s:elseif>
								<s:elseif test="#session.CLIENTE.ctessera.livello_listino == 2">
									<input type="hidden" name="prezzo"
										value="<s:property value='%{prodotto.p_alpubblico_3}'/>"
										id="HPR_<s:property value='%{prodotto.codice_gds}'/>" />
								</s:elseif>
								<s:elseif test="#session.CLIENTE.ctessera.livello_listino == 3">
									<input type="hidden" name="prezzo"
										value="<s:property value='%{prodotto.p_alpubblico_4}'/>"
										id="HPR_<s:property value='%{prodotto.codice_gds}'/>" />
								</s:elseif>
								<s:elseif test="#session.CLIENTE.ctessera.livello_listino == 4">
									<input type="hidden" name="prezzo"
										value="<s:property value='%{prodotto.p_alpubblico_5}'/>"
										id="HPR_<s:property value='%{prodotto.codice_gds}'/>" />
								</s:elseif>
							</p>
							<h4 class="mtext-105 cl2 js-name-detail p-b-14">
								<s:property escape="false" value='%{prodotto.titolo}' />
							</h4>

							<div style="width:100%">
								<p style="font-size:22px;">
									<s:if test="#session.CLIENTE == null">
										<s:if test="%{prodotto.unita_misura == 'cf'}">
											&euro; <s:property
												value="getText('{0,number,#,##0.00}',{prodotto.p_alpubblico_0})" />&nbsp;
										</s:if>
										<s:else>
											&euro; <s:property
												value="getText('{0,number,#,##0.00}',{prodotto.p_alpubblico_0/10})" />&nbsp;/ etto
										</s:else>
									</s:if>

									<s:if
										test="#session.CLIENTE.ctessera.tessera.equals('NOCARD') || #session.CLIENTE.tessera.tessera.contains('TAV') || #session.CLIENTE == null">
										<s:if test="%{prodotto.unita_misura == 'cf'}">
											&euro; <s:property
												value="getText('{0,number,#,##0.00}',{prodotto.p_alpubblico_0})" />&nbsp;
										</s:if>
										<s:else>
											&euro; <s:property
												value="getText('{0,number,#,##0.00}',{prodotto.p_alpubblico_0/10})" />&nbsp;/ etto
										</s:else>
									</s:if>
									<s:elseif test="#session.CLIENTE.ctessera.livello_listino == 0">
										<del>
											<s:if test="%{prodotto.unita_misura == 'cf'}">
												&euro; <s:property
													value="getText('{0,number,#,##0.00}',{prodotto.p_alpubblico_0})" />&nbsp;
											</s:if>
											<s:else>
												&euro; <s:property
													value="getText('{0,number,#,##0.00}',{prodotto.p_alpubblico_0/10})" />&nbsp;/ etto
											</s:else>
										</del>
											&nbsp;
										<span class="mtext-106 cl2">
											<s:if test="%{prodotto.unita_misura == 'cf'}">
												&euro; <s:property
													value="getText('{0,number,#,##0.00}',{prodotto.p_alpubblico_1})" />&nbsp;
											</s:if> <s:else>
												&euro; <s:property
													value="getText('{0,number,#,##0.00}',{prodotto.p_alpubblico_1/10})" />&nbsp;/ etto
											</s:else>
										</span>
									</s:elseif>
									<s:elseif test="#session.CLIENTE.ctessera.livello_listino == 1">
										<del>
											<s:if test="%{prodotto.unita_misura == 'cf'}">
												&euro; <s:property
													value="getText('{0,number,#,##0.00}',{prodotto.p_alpubblico_0})" />&nbsp;
											</s:if>
											<s:else>
												&euro; <s:property
													value="getText('{0,number,#,##0.00}',{prodotto.p_alpubblico_0/10})" />&nbsp;/ etto
											</s:else>
										</del>
											&nbsp;
										<span class="mtext-106 cl2">
											<s:if test="%{prodotto.unita_misura == 'cf'}">
												&euro; <s:property
													value="getText('{0,number,#,##0.00}',{prodotto.p_alpubblico_2})" />&nbsp;
											</s:if> <s:else>
												&euro; <s:property
													value="getText('{0,number,#,##0.00}',{prodotto.p_alpubblico_2/10})" />&nbsp;/ etto
											</s:else>
										</span>
									</s:elseif>
									<s:elseif test="#session.CLIENTE.ctessera.livello_listino == 2">
										<del>
											<s:if test="%{prodotto.unita_misura == 'cf'}">
												&euro; <s:property
													value="getText('{0,number,#,##0.00}',{prodotto.p_alpubblico_0})" />&nbsp;
											</s:if>
											<s:else>
												&euro; <s:property
													value="getText('{0,number,#,##0.00}',{prodotto.p_alpubblico_0/10})" />&nbsp;/ etto
											</s:else>
										</del>
											&nbsp;
										<span class="mtext-106 cl2">
											<s:if test="%{prodotto.unita_misura == 'cf'}">
												&euro; <s:property
													value="getText('{0,number,#,##0.00}',{prodotto.p_alpubblico_3})" />&nbsp;
											</s:if> <s:else>
												&euro; <s:property
													value="getText('{0,number,#,##0.00}',{prodotto.p_alpubblico_3/10})" />&nbsp;/ etto
											</s:else>
										</span>
									</s:elseif>
									<s:elseif test="#session.CLIENTE.ctessera.livello_listino == 3">
										<del>
											<s:if test="%{prodotto.unita_misura == 'cf'}">
												&euro; <s:property
													value="getText('{0,number,#,##0.00}',{prodotto.p_alpubblico_0})" />&nbsp;
											</s:if>
											<s:else>
												&euro; <s:property
													value="getText('{0,number,#,##0.00}',{prodotto.p_alpubblico_0/10})" />&nbsp;/ etto
											</s:else>
										</del>
											&nbsp;
										<span class="mtext-106 cl2">
											<s:if test="%{prodotto.unita_misura == 'cf'}">
												&euro; <s:property
													value="getText('{0,number,#,##0.00}',{prodotto.p_alpubblico_4})" />&nbsp;
											</s:if> <s:else>
												&euro; <s:property
													value="getText('{0,number,#,##0.00}',{prodotto.p_alpubblico_4/10})" />&nbsp;/ etto
											</s:else>
										</span>
									</s:elseif>
									<s:elseif test="#session.CLIENTE.ctessera.livello_listino == 4">
										<del>
											<s:if test="%{prodotto.unita_misura == 'cf'}">
												&euro; <s:property
													value="getText('{0,number,#,##0.00}',{prodotto.p_alpubblico_0})" />&nbsp;
											</s:if>
											<s:else>
												&euro; <s:property
													value="getText('{0,number,#,##0.00}',{prodotto.p_alpubblico_0/10})" />&nbsp;/ etto
											</s:else>
										</del>
											&nbsp;
										<span class="mtext-106 cl2">
											<s:if test="%{prodotto.unita_misura == 'cf'}">
												&euro; <s:property
													value="getText('{0,number,#,##0.00}',{prodotto.p_alpubblico_5})" />&nbsp;
											</s:if> <s:else>
												&euro; <s:property
													value="getText('{0,number,#,##0.00}',{prodotto.p_alpubblico_5/10})" />&nbsp;/ etto
											</s:else>
										</span>
									</s:elseif>
								</p>
							</div>
							<br> <br> <br>
							<p class="stext-102 cl3 p-t-23">
								<s:property escape="false" value="prodotto.dettaglio" />
							</p>
							<div class="p-t-33">
								<div class="flex-w flex-l-m p-b-10">
										<s:if test="%{prodotto.HTML_CODE!=null}">
											<div class="col-4">
											</div>
											<div class="col-8">
												PERSONALIZZA
											</div>
										</s:if>
								</div>
								<div class="flex-w flex-l-m p-b-10">
										<s:if test="%{prodotto.HTML_CODE!=null}">

											<div class="col-12">
												<s:property value='%{prodotto.HTML_DESC}' escapeHtml='false' />&nbsp;&nbsp;
											</div>
											<div class="col-12">
												<select id="vars" name="vars" style="font-size:1.2em; letter-spacing:0.01em">
													<s:property value='%{prodotto.HTML_CODE}' escapeHtml='false' />
												</select>
											</div>
										</s:if>
								</div>

								<div class="flex-w flex-l-m p-b-10">
									<s:if test="%{prodotto.HTML_CODE_2!=null}">
										<div class="col-12">
											<s:property value='%{prodotto.HTML_DESC_2}' escapeHtml='false' />&nbsp;&nbsp;
										</div>
										<div class="col-12">
											<select id="vars_2" name="vars_2" style="font-size:1.2em; letter-spacing:0.01em">
												<s:property value='%{prodotto.HTML_CODE_2}' escapeHtml='false' />
											</select>
										</div>
									</s:if>
								</div>

								<div class="flex-w flex-l-m p-b-10">
									<s:if test="%{prodotto.HTML_CODE_3!=null}">
										<div class="col-12">
											<s:property value='%{prodotto.HTML_DESC_3}' escapeHtml='false' />&nbsp;&nbsp;
										</div>
										<div class="col-12">
											<select id="vars_3" name="vars_3" style=" font-size:1.25em;">
												<s:property value='%{prodotto.HTML_CODE_3}' escapeHtml='false' />
											</select>
										</div>
									</s:if>
								</div>

								<div class="flex-w flex-l-m p-b-10">
									<s:if test="%{prodotto.HTML_CODE_4!=null}">
										<div class="col-12">
											<s:property value='%{prodotto.HTML_DESC_4}' escapeHtml='false' />&nbsp;&nbsp;
										</div>
										<div class="col-12">
											<select id="vars_4" name="vars_4" style=" font-size:1.25em;">
												<s:property value='%{prodotto.HTML_CODE_4}' escapeHtml='false' />
											</select>
										</div>
									</s:if>
								</div>

								<div class="flex-w flex-l-m p-b-10">
									<s:if test="%{prodotto.HTML_CODE_5!=null}">
										<div class="col-12">
											<s:property value='%{prodotto.HTML_DESC_5}' escapeHtml='false' />&nbsp;&nbsp;
										</div>
										<div class="col-12">
											<select id="vars_5" name="vars_5" style=" font-size:1.25em;">
												<s:property value='%{prodotto.HTML_CODE_5}' escapeHtml='false' />
											</select>
										</div>
									</s:if>
								</div>

							</div>

							<!--  -->
							<div class="p-t-33">
								<div class="flex-w flex-r-m p-b-10">
									<div class="flex-w flex-m">
										<s:if test="%{prodotto.unita_misura=='cf'}">
											<div class="wrap-num-product flex-w m-tb-10">
												<div
													class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
													<i class="fs-16 zmdi zmdi-minus"></i>
												</div>

												<input class="mtext-104 cl3 txt-center num-product"
													type="number" min="1" name="quantita" value="1">

												<div
													class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
													<i class="fs-16 zmdi zmdi-plus"></i>
												</div>
											</div>
										</s:if>
										<s:else>
											<div style="margin: 0 auto;"
												class="wrap-num-product flex-w mtext-104 cl3 txt-center">
												<select id="weight" name="weight"
													class="custom-select mtext-104 cl3 txt-center"
													style="width: 100%; height: 45px; border:none; font-family: 'raleway', sans-serif;">
													<option class="mtext-104 cl3 txt-center" value="100">100
														g</option>
													<option class="mtext-104 cl3 txt-center" value="150">150
														g</option>
													<option class="mtext-104 cl3 txt-center" value="200">200
														g</option>
													<option class="mtext-104 cl3 txt-center" value="250">250
														g</option>
													<option class="mtext-104 cl3 txt-center" value="300">300
														g</option>
													<option class="mtext-104 cl3 txt-center" value="450">350
														g</option>
													<option class="mtext-104 cl3 txt-center" value="400">400
														g</option>
													<option class="mtext-104 cl3 txt-center" value="450">450
														g</option>
													<option class="mtext-104 cl3 txt-center" value="500">500
														g</option>
												</select>
											</div>
										</s:else>
										<br style="line-height: 100px">
										<button
											class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail aggiungi"
											style="margin:0 auto">Aggiungi al carrello</button>

										<input id="<s:property value='%{prodotto.codice_gds}'/>"
											style="z-index:0" type="hidden" class="form-control"
											value="<s:property value='%{prodotto.p_alpubblico_0}'/>"
											readonly>
									</div>

								</div>
								<p class="stext-102 cl3 p-t-23">
									<s:property escape="false" value="prodotto.dettaglio2" />
								</p>
							</div>

<% if (social == true) { %>
							<!--  -->
							<div class="flex-w flex-m p-l-100 p-t-40 respon7">
								<div class="flex-m bor9 p-r-10 m-r-11">
									<a href="#"
										class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100"
										data-tooltip="Add to Wishlist"> <i
										class="zmdi zmdi-favorite"></i>
									</a>
								</div>

								<a href="#"
									class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
									data-tooltip="Facebook"> <i class="fa fa-facebook"></i>
								</a> <a href="#"
									class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
									data-tooltip="Twitter"> <i class="fa fa-twitter"></i>
								</a> <a href="#"
									class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
									data-tooltip="Google Plus"> <i class="fa fa-google-plus"></i>
								</a>
							</div>
<% } %>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- Related Products -->
<% if (related == true) { %>
	<section class="sec-relate-product bg0 p-t-45 p-b-105">
		<div class="container">

			<div class="p-b-45">
				<h3 class="ltext-106 cl5 txt-center">Prodotti correlati</h3>
			</div>

			<!-- Slide2 -->
			<div class="wrap-slick2">
				<div class="slick2">

					<s:iterator value="prodotti" status="incr">
						<div
							class="col-sm-12 col-md-12 col-lg-12 p-b-35 isotope-item women">
							<!-- Block2 -->
							<div class="block2">
								<div class="block2-pic hov-img0">
									<img
										src="/product_images<s:property value="%{nome_immagine}" />"
										onerror="$(this).attr('src', 'images/noimg.jpg');" /> <a
										href="product.html?codice_gds=<s:property value='%{codice_gds}'/>"
										class="block2-btn flex-c-m stext-103 cl0 size-102 bg1 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
										Mostra </a>
								</div>

								<div class="block2-txt flex-w flex-t p-t-14">
									<div class="block2-txt-child1 flex-col-l">
										<a
											href="product.html?codice_gds=<s:property value='%{codice_gds}'/>"
											class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
											<s:property escape="true" value='%{titolo}' escapeHtml="true" />
										</a> <span class="stext-105 cl3"> &euro; <s:property
												value="getText('{0,number,#,##0.00}',{p_alpubblico_0})"
												escapeHtml="false" />
										</span> <span class="stext-105 cl3"> <s:property
												value='%{marchio.marchio}' />
										</span>
									</div>
									<!--  <div class="block2-txt-child2 flex-r p-t-3">
											<a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
												<img class="icon-heart1 dis-block trans-04" src="images/icons/icon-heart-01.png" alt="ICON">
												<img class="icon-heart2 dis-block trans-04 ab-t-l" src="images/icons/icon-heart-02.png" alt="ICON">
											</a>
										</div>
									-->
								</div>
							</div>
						</div>
					</s:iterator>
				</div>
			</div>
		</div>
	</section>
<% } %>

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
	<script>
		$(".js-select2").each(function() {
			$(this).select2({
				minimumResultsForSearch : 20,
				dropdownParent : $(this).next('.dropDownSelect2')
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
				delegate : 'a', // the selector for gallery item
				type : 'image',
				gallery : {
					enabled : true
				},
				mainClass : 'mfp-fade'
			});
		});
	</script>
	<!--===============================================================================================-->
	<script src="vendor/isotope/isotope.pkgd.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2, .js-addwish-detail').on('click', function(e) {
			e.preventDefault();
		});

		$('.js-addwish-b2').each(function() {
			var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
			$(this).on('click', function() {
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-b2');
				$(this).off('click');
			});
		});

		$('.js-addwish-detail').each(function() {
			var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

			$(this).on('click', function() {
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-detail');
				$(this).off('click');
			});
		});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(function() {
			var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
			$(this).on('click', function() {
				swal(nameProduct, "Aggiunto al carrello!", "success");
			});
		});
	</script>
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
	<script>
		$(document).ready(function() {
			$(".aggiungi").click(
				function(e) {
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
						}
					});
				});
		});
	</script>
	<script>
	var x, i, j, selElmnt, a, b, c;
	/*look for any elements with the class "custom-select":*/
	x = document.getElementsByClassName("custom-select");
	for (i = 0; i < x.length; i++) {
	  selElmnt = x[i].getElementsByTagName("select")[0];
	  /*for each element, create a new DIV that will act as the selected item:*/
	  a = document.createElement("DIV");
	  a.setAttribute("class", "select-selected");
	  a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
	  x[i].appendChild(a);
	  /*for each element, create a new DIV that will contain the option list:*/
	  b = document.createElement("DIV");
	  b.setAttribute("class", "select-items select-hide");
	  for (j = 1; j < selElmnt.length; j++) {
	    /*for each option in the original select element,
	    create a new DIV that will act as an option item:*/
	    c = document.createElement("DIV");
	    c.innerHTML = selElmnt.options[j].innerHTML;
	    c.addEventListener("click", function(e) {
	        /*when an item is clicked, update the original select box,
	        and the selected item:*/
	        var y, i, k, s, h;
	        s = this.parentNode.parentNode.getElementsByTagName("select")[0];
	        h = this.parentNode.previousSibling;
	        for (i = 0; i < s.length; i++) {
	          if (s.options[i].innerHTML == this.innerHTML) {
	            s.selectedIndex = i;
	            h.innerHTML = this.innerHTML;
	            y = this.parentNode.getElementsByClassName("same-as-selected");
	            for (k = 0; k < y.length; k++) {
	              y[k].removeAttribute("class");
	            }
	            this.setAttribute("class", "same-as-selected");
	            break;
	          }
	        }
	        h.click();
	    });
	    b.appendChild(c);
	  }
	  x[i].appendChild(b);
	  a.addEventListener("click", function(e) {
	      /*when the select box is clicked, close any other select boxes,
	      and open/close the current select box:*/
	      e.stopPropagation();
	      closeAllSelect(this);
	      this.nextSibling.classList.toggle("select-hide");
	      this.classList.toggle("select-arrow-active");
	    });
	}
	function closeAllSelect(elmnt) {
	  /*a function that will close all select boxes in the document,
	  except the current select box:*/
	  var x, y, i, arrNo = [];
	  x = document.getElementsByClassName("select-items");
	  y = document.getElementsByClassName("select-selected");
	  for (i = 0; i < y.length; i++) {
	    if (elmnt == y[i]) {
	      arrNo.push(i)
	    } else {
	      y[i].classList.remove("select-arrow-active");
	    }
	  }
	  for (i = 0; i < x.length; i++) {
	    if (arrNo.indexOf(i)) {
	      x[i].classList.add("select-hide");
	    }
	  }
	}
	/*if the user clicks anywhere outside the select box,
	then close all select boxes:*/
	document.addEventListener("click", closeAllSelect);
</script>

</body>
</html>