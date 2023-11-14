<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:iterator value="categorie">
<li>
	<a href="category.html?cat=<s:property value='%{categoria_gds}'/>"><s:property value='%{categoria_2.toUpperCase()}'/></a>
</li>
</s:iterator>
