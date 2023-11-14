<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
.ribbon {
    background: #cd2c24;
    height: 66px;
    width: auto;
    display: inline-block;
    padding: 0 10px 0 10px;
    margin: auto;
    position: relative;
    color: #fff;
    line-height: 56px;
    font-size: 36px;
    text-align: center;
    margin-left: 100px;
    border-radius: 0px 0px 20px 20px;
    box-shadow: 0 0 5px rgb(128, 128, 128), 0 0 7px rgb(128, 128, 128);
    &:before{
      content: '';
      border: 28px solid #cd2c24;
      border-left-color: transparent;
      border-left-width: 12px;
      position: absolute;
      top: 0;
      left: -60px;
    }
    &:after {
      content: '';
      border: 48px solid transparent;
      border-left-color: #cd2c24;
      border-left-width: 12px;
      position: absolute;
      top: 0;
      right: -60px;
    }
}

.ribbon2 {
    background: rgb(173, 95, 37);
    height: 66px;
    width: auto;
    display: inline-block;
    padding: 0 10px 0 10px;
    margin: auto;
    position: relative;
    color: #fff;
    line-height: 56px;
    font-size: 36px;
    text-align: center;
    margin-left: 88px;
    border-radius: 0px 0px 20px 20px;
    box-shadow: 0 0 5px rgb(128, 128, 128), 0 0 7px rgb(128, 128, 128);
    &:before{
      content: '';
      border: 28px solid #cd2c24;
      border-left-color: transparent;
      border-left-width: 12px;
      position: absolute;
      top: 0;
      left: -60px;
    }
    &:after {
      content: '';
      border: 48px solid transparent;
      border-left-color: rgb(173, 95, 37);
      border-left-width: 12px;
      position: absolute;
      top: 0;
      right: -60px;
    }
}
</style>

				<s:iterator value="prodotti" status="incr" >
					<div class="col-sm-6 col-md-6 col-lg-4 p-b-35 isotope-item women" data-product="product" data-category="<s:property value='%{marchio.marchio}'/>">
						<!-- Block2 -->
							<div class="block2-pic hov-img0">
							<s:if test="%{titolo.indexOf('NOVIT')>0}">
								<div class="ribbon" style="z-index:99">Nuovo</div>
							</s:if>
							<s:if test="%{codice_gds.indexOf('_O')>0}">
								<div class="ribbon2" style="z-index:99">Offerta</div>
							</s:if>

<%-- 								<%@include file="imageloading.jsp"%> --%>
					            <a href="product.html?id=<s:property value='%{codice_gds}'/>">
						            <img src="images/product_images/<s:property value="%{nome_immagine}" />" onerror="$(this).attr('src', 'images/noimg.jpg');" />
									<a href="product.html?codice_prodotto=<s:property value='%{codice_gds}'/>"
										class="block2-btn flex-c-m stext-103 cl0 size-102 bg1 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
										Mostra
									</a>
								</a>
							</div>

							<div class="block2-txt flex-w flex-t p-t-14">
								<div class="block2-txt-child1 flex-col-l ">
									<a href="product.html?codice_gds=<s:property value='%{codice_gds}'/>" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6 js-name-detail">
										<s:property value='%{titolo}' escapeHtml="false" />
									</a>

									<%@include file="/includes/prices.jsp" %>
<%-- 									<span class="stext-105 cl3"> --%>
<%-- 										&euro; <s:property value="getText('{0,number,#,##0.00}',{p_alpubblico_0})" escapeHtml="false" /> --%>
<%-- 									</span> --%>

									<form class="form-inline">
										<input type="hidden" name="codice_gds" value="<s:property value='%{codice_gds}'/>" /> <input
											type="hidden" name="descrizione"
											id="DESC_<s:property value='%{codice_gds}'/>"
											value="<s:property value="%{marchio.marchio}"/> - <s:property value='%{titolo}'/>"
											data-value="<s:property value="%{marchio.marchio}"/> - <s:property value='%{titolo}'/>" />
										<p>
											<s:if test="#session.CLIENTE==null">
												<input type="hidden" name="prezzo"
													value="<s:property value='%{p_alpubblico_0}'/>"
													id="HPR_<s:property value='%{codice_gds}'/>" />
											</s:if>
											<s:if
												test="#session.CLIENTE.ctessera.tessera.equals('NOCARD') || #session.CLIENTE.tessera.tessera.contains('TAV')">
												<input type="hidden" name="prezzo"
													value="<s:property value='%{p_alpubblico_0}'/>"
													id="HPR_<s:property value='%{codice_gds}'/>" />
											</s:if>
											<s:elseif test="#session.CLIENTE.ctessera.livello_listino == 0">
												<input type="hidden" name="prezzo"
													value="<s:property value='%{p_alpubblico_1}'/>"
													id="HPR_<s:property value='%{codice_gds}'/>" />
											</s:elseif>
											<s:elseif test="#session.CLIENTE.ctessera.livello_listino == 1">
												<input type="hidden" name="prezzo"
													value="<s:property value='%{p_alpubblico_2}'/>"
													id="HPR_<s:property value='%{codice_gds}'/>" />
											</s:elseif>
											<s:elseif test="#session.CLIENTE.ctessera.livello_listino == 2">
												<input type="hidden" name="prezzo"
													value="<s:property value='%{p_alpubblico_3}'/>"
													id="HPR_<s:property value='%{codice_gds}'/>" />
											</s:elseif>
											<s:elseif test="#session.CLIENTE.ctessera.livello_listino == 3">
												<input type="hidden" name="prezzo"
													value="<s:property value='%{p_alpubblico_4}'/>"
													id="HPR_<s:property value='%{codice_gds}'/>" />
											</s:elseif>
											<s:elseif test="#session.CLIENTE.ctessera.livello_listino == 4">
												<input type="hidden" name="prezzo"
													value="<s:property value='%{p_alpubblico_5}'/>"
													id="HPR_<s:property value='%{codice_gds}'/>" />
											</s:elseif>
										</p>
											<input type="hidden" class="mtext-104 cl3 txt-center num-product" type="number" min="1" name="quantita" value="1">

											<input id="<s:property value='%{codice_gds}'/>" style="z-index:0" type="hidden" class="form-control" value="<s:property value='%{p_alpubblico_0}'/>"
												readonly>

											<s:if test="%{HTML_CODE == null}">
												<button
													class="flex-c-m 2text-103 cl0 size-102 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail aggiungi"
													style="margin:0 auto">Aggiungi al carrello</button>
											</s:if>
											<s:else>
												<button
													class="flex-c-m 2text-103 cl0 size-102 bg1 bor1 hov-btn1 p-lr-15 trans-04 scegli"
													style="margin:0 auto" data-codice_gds="<s:property value='%{codice_gds}'/>" >Scegli</button>
											</s:else>

									</form>
								</div>

<!-- 								<div class="block2-txt-child2 flex-r p-t-3"> -->
<!-- 									<a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2"> -->
<!-- 										<img class="icon-heart1 dis-block trans-04" src="images/icons/icon-heart-01.png" alt="ICON"> -->
<!-- 										<img class="icon-heart2 dis-block trans-04 ab-t-l" src="images/icons/icon-heart-02.png" alt="ICON"> -->
<!-- 									</a> -->
<!-- 								</div> -->
							</div>
						</div>
				</s:iterator>

<script>
	$(document).ready(function() {

		$(".scegli").click(
			function(e) {
				e.preventDefault();
				var codice_gds = $(this).attr("data-codice_gds");
				window.open("product.html?codice_gds=" + codice_gds,"_self");
			});


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

		$('.js-addcart-detail').each(function() {
			var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();
			$(this).on('click', function() {
				swal(nameProduct, "Aggiunto al carrello!", "success");
			});
		});
	});
</script>


