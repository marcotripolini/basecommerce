<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

	<title><s:property escapeHtml="false" value="getText('_sitename')" /></title>

    <!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>

	<script>
	// ricarica la pagina se si preme il pulsante back
	window.addEventListener( "pageshow", function ( event ) {
		  var historyTraversal = event.persisted ||
		                         ( typeof window.performance != "undefined" && window.performance.navigation.type === 2 );
		  if ( historyTraversal ) {
		    window.location.reload();
		  }
	});
	</script>
	<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/cookieconsent2/3.1.0/cookieconsent.min.css" />
	<script src="//cdnjs.cloudflare.com/ajax/libs/cookieconsent2/3.1.0/cookieconsent.min.js"></script>
	<script>
	window.addEventListener("load", function(){
	window.cookieconsent.initialise({
	  "palette": {
	    "popup": {
	      "background": "#aa0000",
	      "text": "#ffdddd"
	    },
	    "button": {
	      "background": "#ff0000"
	    }
	  },
	  "content": {
	    "message": "BOOSTech s.r.l. usa i cookie per garantirti un'esperienza di navigazione ottimale.",
	    "dismiss": "Ok",
	    "link": "http://www.gds-italia.it/cookie"
	  }
	})});
	</script>

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-194086150-1"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'UA-194086150-1');
	</script>
</head>