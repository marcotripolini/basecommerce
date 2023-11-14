<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@page import="it.gds.beans.Carrello"%>
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">No fly zone
        	<img alt="" class="img-fluid" src="img/logo_web.png" style="width:36px; height:32px">
        </a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fa fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav text-uppercase ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="index.html"><i class="fa fa-home fa-2x"></i></a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="index.html#categories">Prodotti</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="index.html#portfolio">In evidenza</a>
            </li>
<!--             <li class="nav-item"> -->
<!--               <a class="nav-link js-scroll-trigger" href="index.html#about">Chi siamo</a> -->
<!--             </li> -->
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#contact">Contatti</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="https://www.gdsmarket.it">Market</a>
            </li>
      		<% if (session.getAttribute("CLIENTE") == null) { %>
	            <li class="nav-item">
		        		<a class="nav-link js-scroll-trigger" href="login.html">Login</a>
				</li>
			<% } else {%>
	            <li class="nav-item">
					<li class="dropdown" style="padding-top: 0.5rem; font-size:90%; font-family: 'Montserrat', 'Helvetica Neue', Helvetica, Arial, sans-serif;">
						<a href="#" class="dropdown-toggle nav-link js-scroll-trigger" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user"></i><span class="user-name">&nbsp;<%=((it.gds.beans.ClientiETessera)session.getAttribute("CLIENTE")).getNome()%></span> <span class="caret"></span></a>
						<ul class="dropdown-menu" style="padding-left:5px; background:black;">
							<li style="padding-left:5px; background:black;">
								<form method="post" action="http://authentication.gdsmarket.it/logout.php">
									<input type="hidden" name="refer_url" value="http://noflyzone.gdsmarket.it/" />
									<input type="hidden" name="dologout" />
								</form>
								<a id="logout" href="#">Esci</a>
							</li>
						</ul>
					</li>
				</li>
				<li class="nav-item">
					<a href="cart.html" class="nav-link js-scroll-trigger">
						<i class="fa fa-shopping-cart"></i>
						<span id="updcart">
							<%=session.getAttribute("CARRELLO") != null ? (((Carrello)session.getAttribute("CARRELLO")).getTotdett()) : ("0")%>
						</span>
					</a>
				</li>
			<% } %>
          </ul>
        </div>
      </div>
    </nav>
<%-- ********************************************************************** --%>
<script type="text/javascript">
$(document).ready(
	function() {
		$("#logout").click(
			function(e) {
				e.preventDefault();
				$(this).prev("form").submit();
			});
});
</script>