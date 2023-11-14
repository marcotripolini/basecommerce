<%@page import="it.gds.beans.ClientiETessera"%>
<%@ page import="it.gds.beans.Carrello"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%-- <%@ include file="/includes/head.jsp" %> --%>

<!-- Header -->
<header>
	<!-- Header desktop -->
	<div class="container-menu-desktop">

		<div class="wrap-menu-desktop">
			<nav class="limiter-menu-desktop container">

				<div class="row">

					<div class="col-md-10">
						<!-- Logo desktop -->
						<div class="box-logo">
							<a href="#" class="logo"> <img
								src="images/logo.png" alt="Purrfect">
<%-- 								<span>Pavia</span> --%>
							</a>

						</div>
						<!-- Menu desktop -->
						<div class="menu-desktop">
							<ul class="main-menu">

								<li id="mnu_index"><a href="index.html">Home</a></li>

								<li id="mnu_category"><a href="#">Ordina online</a>
									<ul class="sub-menu">
										<s:action name="categories" executeResult="true" />
									</ul>
								</li>

	                            <li id="mnu_newproducts" class="label1" data-label1="hot">
	                                <a href="newproducts.html">Novit&agrave;</a>
	                            </li>

	                            <li>
	                                <a href="blog.html">Blog</a>
	                            </li>

<!-- 								<li id="mnu_booking"><a href="booking.html">Prenota</a></li> -->

<!-- 								<li id="mnu_about"><a href="#">I nostri men&ugrave;</a> -->
<!-- 									<ul class="sub-menu"> -->
<!-- 										<li><a href="menu.html">Croccantezze e piacevolezze</a></li> -->
<!-- 										<li><a href="menu_hamburger.jsp">Hamburger</a></li> -->
<!-- 										<li><a href="menu_bevande_cocktail.jsp">Bevande e cocktail</a></li> -->
<!-- 										<li><a href="menu_carta.jsp">Men&ugrave; alla carta</a></li> -->
<!-- 										<li><a href="menu_dessert_taglieri.jsp">Dessert e taglieri</a></li> -->
<!-- 										<li><a href="menu_aperitivi.jsp">Aperitivi</a></li> -->
<!-- 									</ul></li> -->

								<!--                             <li id="mnu_about"> -->
								<!--                                 <a href="menu.html">I nostri men&ugrave;</a> -->
								<!--                             </li> -->

								<li id="mnu_contacts"><a href="contacts.html">Contatti</a>
								</li>

								<s:if test="%{#session.CLIENTE != null}">
									<li>Ciao <s:property value="%{#session.CLIENTE.nome}" />
										<ul class="sub-menu">
											<a href="logout.html">Logout</a>
										</ul>
									</li>
								</s:if>
								<s:else>
									<li id="mnu_login"><a href="login.html">Login</a></li>
								</s:else>

							</ul>
						</div>
					</div>

					<div class="col-md-2">
						<!-- Icon header -->

						<div class="wrap-icon-header flex-w flex-r-m">
							<div
								class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 js-show-modal-search">
								<i class="zmdi zmdi-search"></i>
							</div>
							<div id="carticon">
								<div
									class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"
									data-notify='<%=session.getAttribute("CARRELLO") != null ? (((Carrello)session.getAttribute("CARRELLO")).getNumarticoli()) : ("0")%>'>
									<i class="zmdi zmdi-shopping-cart"></i>
								</div>
							</div>

							<!--                         <a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti" data-notify="0"> -->
							<!--                             <i class="zmdi zmdi-favorite-outline"></i> -->
							<!--                         </a> -->
						</div>
					</div>
				</div>


			</nav>
		</div>
	</div>

	<!-- Header Mobile -->
	<div class="wrap-header-mobile">
		<!-- Logo mobile -->
		<div class="logo-mobile">
			<a href="index.html"><img
				src="images/logo.png" alt="GDS Bistrot"></a>
<%-- 				<span>Vigevano</span> --%>
		</div>

		<!-- Icon header -->
		<div class="wrap-icon-header flex-w flex-r-m m-r-15">
			<div
				class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
				<i class="zmdi zmdi-search"></i>
			</div>

			<div id="carticon-mobile">
				<div
					class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart"
					data-notify='<%=session.getAttribute("CARRELLO") != null ? (((Carrello)session.getAttribute("CARRELLO")).getNumarticoli()) : ("0")%>'>
					<i class="zmdi zmdi-shopping-cart"></i>
				</div>
			</div>

		</div>

		<!-- Button show menu -->
		<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
			<span class="hamburger-box"> <span class="hamburger-inner"></span>
			</span>
		</div>
	</div>


	<!-- Menu Mobile -->
	<div class="menu-mobile">
		<ul class="topbar-mobile">
			<!--                 <li> -->
			<!--                     <div class="left-top-bar"> -->
			<!--                         Free shipping for standard order over $100 -->
			<!--                     </div> -->
			<!--                 </li> -->

			<!--                 <li> -->
			<!--                     <div class="right-top-bar flex-w h-full"> -->
			<!--                         <a href="#" class="flex-c-m p-lr-10 trans-04"> -->
			<!--                             Help & FAQs -->
			<!--                         </a> -->

			<!--                         <a href="#" class="flex-c-m p-lr-10 trans-04"> -->
			<!--                             My Account -->
			<!--                         </a> -->

			<!--                         <a href="#" class="flex-c-m p-lr-10 trans-04"> -->
			<!--                             EN -->
			<!--                         </a> -->

			<!--                         <a href="#" class="flex-c-m p-lr-10 trans-04"> -->
			<!--                             USD -->
			<!--                         </a> -->
			<!--                     </div> -->
			<!--                 </li> -->
		</ul>

		<ul class="main-menu-m">
			<li><a href="index.html">Home</a></li>

			<li><a>Ordina online</a> <span class="arrow-main-menu-m">
					<i class="fa fa-angle-right" aria-hidden="true"></i>
				</span>
				<ul class="sub-menu-m">

					<s:action name="categories" executeResult="true" />
				</ul>
			</li>

			                <li>
			                    <a href="newproducts.html" class="label1 rs1" data-label1="hot">Novit&agrave;</a>
			                </li>

<!-- 			<li><a href="booking.html">Prenotazioni</a></li> -->

			<li><a>I nostri men&ugrave;</a> <span class="arrow-main-menu-m">
					<i class="fa fa-angle-right" aria-hidden="true"></i>
			</span>
<!-- 				<ul class="sub-menu-m"> -->
<!-- 					<li><a href="menu.html">Croccantezze e piacevolezze</a></li> -->
<!-- 					<li><a href="menu_hamburger.jsp">Hamburger</a></li> -->
<!-- 					<li><a href="menu_bevande_cocktail.jsp">Bevande e cocktail</a></li> -->
<!-- 					<li><a href="menu_carta.jsp">Men&ugrave; alla carta</a></li> -->
<!-- 					<li><a href="menu_dessert_taglieri.jsp">Dessert e taglieri</a></li> -->
<!-- 					<li><a href="menu_aperitivi.jsp">Aperitivi</a></li> -->
<!-- 				</ul></li> -->

			<li><a href="contacts.html">Contatti</a></li>

			<li><a href="login.html">Login</a></li>

		</ul>
	</div>

	<!-- Modal Search -->
	<div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
		<div class="container-search-header">
			<button
				class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
				<img src="images/icons/icon-close2.png" alt="CLOSE">
			</button>

			<form class="wrap-search-header flex-w p-l-15"
				action="searchbykey.html">
				<button class="flex-c-m trans-04">
					<i class="zmdi zmdi-search"></i>
				</button>
				<input class="plh3" type="text" name="key" placeholder="Trova...">
			</form>
		</div>
	</div>
</header>
<script>

	$(document).ready(function() {
		var pagePathName = window.location.pathname;
		var name = pagePathName.substring(pagePathName.lastIndexOf("/") + 1);

		if (name === "index.html") {
			$("#mnu_index").addClass("active-menu");
		} else if (name === "category.html") {
			$("#mnu_category").addClass("active-menu");
		} else if (name === "newproducts.html") {
			$("#mnu_newproducts").addClass("active-menu");
		} else if (name === "about.html") {
			$("#mnu_about").addClass("active-menu");
		} else if (name === "contacts.html") {
			$("#mnu_contacts").addClass("active-menu");
		} else if (name === "login.html") {
			$("#mnu_login").addClass("active-menu");
		}
	});

	function timedRefresh() {
		// do whatever you like here
		$("#carticon").load("updcart.html");
		$("#carticon-mobile").load("updcart.html");
		$("#carrello").load("cartdet.html");
		setTimeout(timedRefresh, 10000);
	}
	timedRefresh();
</script>
