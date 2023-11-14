<!DOCTYPE html>
<%@ page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

	<s:property escapeHtml="false" value='%{c.dettagli.count}'/>

	<s:if test="%{c == null}">
	   	<h3>Il tuo carrello &egrave; vuoto.</h3>
		<h2>&#128546;</h2>
	</s:if>

	<s:if test="%{c.getDettagli().isEmpty() == true}">
	    <h3>Il tuo carrello &egrave; vuoto.</h3>
		<h3>&#128546;</h3>
	</s:if>

	<s:else>
		<ul class="header-cart-wrapitem w-full">
			<s:iterator value="c.dettagli" status="stat">
				<li class="header-cart-item flex-w flex-t m-b-12">
					<div class="header-cart-item-img"
						onclick="removprod('<s:property value="%{codice_prodotto}"/>','<s:property escape="true" value="%{descrizione}"/>');">
						<img width="80px" src="https://www.gdsmarket.it/immagini/<s:property value="%{prodotto.codice_prodotto}" />/<s:property value="%{prodotto.nome_immagine}" />.jpg"
						onerror="this.src='images/dish.jpg'"
						alt="IMG">
					</div>
					<div class="header-cart-item-txt p-t-8">
						<a href="product.html?codice_gds=<s:property value='%{codice_gds}'/>" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
							<s:property escape="false" value='%{descrizione}' />
						</a>
						<span class="header-cart-item-info">
							<s:number name='%{quantita}' type='integer'/> x &euro; <s:property value="getText('{0,number,#,##0.00}',{prezzo})"/>
						</span>
					</div>
				</li>
			</s:iterator>
		</ul>

		<div class="w-full">
			<div class="header-cart-total w-full p-tb-40">
				Totale: &euro;
				<%=
					new DecimalFormat("#,##0.00")
						.format(((it.gds.beans.Carrello) session.getAttribute("CARRELLO") != null)
								? ((it.gds.beans.Carrello) session.getAttribute("CARRELLO")).getTotcart()
								: 0)
				%>
			</div>

			<div class="header-cart-buttons flex-w w-full">
				<a href="cart.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
					Carrello
				</a>
<%-- 				<s:if test="%{#session.CARRELLO.numarticoli >0}"> --%>
<!-- 					<a href="delivery.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10"> -->
<!-- 						Acquista -->
<!-- 					</a> -->
<%-- 				</s:if> --%>
			</div>

			<div class="bg-warning" style="font-size:0.9em!important" >
				Hai allergie o intolleranze alimentari?<br>Oppure una persona per cui stai ordinando ne ha?
				Contattaci immediatamente al numero<br>
				<i class="fa fa-phone"></i><a href="tel:03811976703"> 0381 1976703</a>  <i class="fa fa-phone"></i>.
			</div>
		</div>
	</s:else>
<script>
	function removprod (codice_prodotto, descrizione){
 		descrizione = encodeURIComponent(descrizione);
		$.ajax({
		  		type: "POST",
				url : "remfromcart.html?codice_prodotto=" + codice_prodotto + "&descrizione=" + descrizione,
				context : document.body
			}).done(function() {
				alert("Prodotto rimosso");
				$("#carticon").load("updcart.html");
				$("#carticon-mobile").load("updcart.html");
				$("#carrello").load("cartdet.html");
			});
		}
</script>