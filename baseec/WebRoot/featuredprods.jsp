<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false" %>

<s:if test="%{getProdotti().isEmpty()}">
	<h2>
<%-- 		<s:property escapeHtml="false" value="getText('_lastprods_nologin_empty')" /> --%>
	</h2>
</s:if>
<s:else>
	<s:iterator value="prodotti" status="incr" >
				<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0">
				            <img
				            src="https://www.gdsmarket.it/immagini/<s:property value="%{codice_gds}" />/<s:property value="%{nome_immagine}" />.jpg" onerror="$(this).attr('src', 'images/noimg.jpg');" />
							<a href="product.html?codice_gds=<s:property value='%{codice_gds}'/>" class="block2-btn flex-c-m stext-103 cl0 size-102 bg1 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
								Mostra
							</a>
						</div>

						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<a href="product.html?codice_gds=<s:property value='%{codice_gds}'/>" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
									<s:property value='%{titolo}' escapeHtml="false" />
								</a>
								<span class="stext-105 cl3">
									&euro; <s:property value="getText('{0,number,#,##0.00}',{p_alpubblico_0})" escapeHtml="false" />
								</span>
								<span class="stext-105 cl3" style="text-align:right;" >
									<s:property value='%{marchio.marchio}'/>
								</span>
							</div>
<!-- 							<div class="block2-txt-child2 flex-r p-t-3"> -->
<!-- 								<a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2"> -->
<!-- 									<img class="icon-heart1 dis-block trans-04" src="images/icons/icon-heart-01.png" alt="ICON"> -->
<!-- 									<img class="icon-heart2 dis-block trans-04 ab-t-l" src="images/icons/icon-heart-02.png" alt="ICON"> -->
<!-- 								</a> -->
<!-- 							</div> -->
						</div>
					</div>
				</div>
	</s:iterator>
</s:else>