<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<s:iterator value="categorie">
	<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto" >
		<!-- Block1 -->
		<div class="block1 wrap-pic-w">
			<img src="images/categories/<s:property value='%{categoria_gds}'/>.jpg" alt="IMG-BANNER" onerror="this.src='images/categories/NOCAT.jpg'" >

			<a href="category.html?cat=<s:property value='%{categoria_gds}'/>" class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
				<div class="block1-txt-child1 flex-col-l">
					<span class="block1-name ltext-102 trans-04 p-b-8">
						<s:property value='%{categoria_2}'/>
					</span>

					<span class="block1-info stext-102 trans-04">
						Menu primavera 2021
					</span>
				</div>

				<div class="block1-txt-child2 p-b-4 trans-05">
					<div class="block1-link stext-101 bg0 p-lr-10 p-tb-10 cl1 trans-09">
						Visualizza ora
					</div>
				</div>
			</a>
		</div>
	</div>
</s:iterator>
