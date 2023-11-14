
<% boolean localimage = true; %>

<% if (localimage == true) { %>
	<img
		src="https://javadream.it/img/getimg.jsp?name=<s:property value='%{codice_gds.replace("_O", "")}' />/<s:property value="%{nome_immagine}" />.jpg&mode=2"
		onerror="$(this).attr('src', 'images/noimg.jpg');" >
			<s:if test="pp.offerta_quantita.offerta_quantita_limite_1 > 0" >
				<div class="ribbon ribbon-top-right"><span style="font-size:10px;">sconto quantit&agrave;</span></div>
			</s:if>
	</img>
<% } else { %>
        <img
           src="images/product_images/<s:property value="%{nome_immagine}" />"
           onerror="$(this).attr('src', 'images/noimg.jpg');" >
           <s:if test="pp.offerta_quantita.offerta_quantita_limite_1 > 0" >
				<div class="ribbon ribbon-top-right"><span style="font-size:10px;">sconto quantit&agrave;</span></div>
			</s:if>
		</img>
<% } %>


