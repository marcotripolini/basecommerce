<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
									<s:if test="#session.CLIENTE==null">
										<span class="mtext-106 cl2">
											<s:if test="%{unita_misura == 'cf'}">
												&euro; <s:property value="getText('{0,number,#,##0.00}',{p_alpubblico_0})"/>
											</s:if>
											<s:else>
												&euro; <s:property value="getText('{0,number,#,##0.00}',{p_alpubblico_0/10})"/> / etto
											</s:else>
										</span>
									</s:if>
									<s:elseif test="#session.CLIENTE.ctessera.tessera.equals('NOCARD') || #session.CLIENTE.tessera.tessera.contains('TAV')">
										<span class="mtext-106 cl2">
											<s:if test="%{unita_misura == 'cf'}">
												&euro; <s:property value="getText('{0,number,#,##0.00}',{p_alpubblico_0})"/>
											</s:if>
											<s:else>
												&euro; <s:property value="getText('{0,number,#,##0.00}',{p_alpubblico_0/10})"/> / etto
											</s:else>
										</span>
									</s:elseif>
									<s:else>
										<s:if test="%{codice_gds.contains('_O') == true}">
											<span class="mtext-106 cl2">
												<s:if test="%{unita_misura == 'cf'}">
													&euro; <s:property value="getText('{0,number,#,##0.00}',{p_alpubblico_0})"/>
												</s:if>
												<s:else>
													&euro; <s:property value="getText('{0,number,#,##0.00}',{p_alpubblico_0/10})"/> / etto
												</s:else>
											</span>
										</s:if>
										<s:else>
											<s:if test="#session.CLIENTE.ctessera.livello_listino == 0">
													<span style="font-size: 14px; text-decoration: overline;" >
														<del>
															<s:if test="%{unita_misura == 'cf'}">
																&euro; <s:property value="getText('{0,number,#,##0.00}',{p_alpubblico_0})"/>
															</s:if>
															<s:else>
																&euro; <s:property value="getText('{0,number,#,##0.00}',{p_alpubblico_0/10})"/> / etto
															</s:else>
														</del>
													</span>
													&nbsp;
												<span class="mtext-106 cl2">
													<s:if test="%{unita_misura == 'cf'}">
														&euro; <s:property value="getText('{0,number,#,##0.00}',{p_alpubblico_1})"/>
													</s:if>
													<s:else>
														&euro; <s:property value="getText('{0,number,#,##0.00}',{p_alpubblico_1/10})"/> / etto
													</s:else>
												</span>
											</s:if>
											<s:elseif test="#session.CLIENTE.ctessera.livello_listino == 1">
													<span style="font-size: 14px" >
														<del>
															<s:if test="%{unita_misura == 'cf'}">
																&euro; <s:property value="getText('{0,number,#,##0.00}',{p_alpubblico_0})"/>
															</s:if>
															<s:else>
																&euro; <s:property value="getText('{0,number,#,##0.00}',{p_alpubblico_0/10})"/> / etto
															</s:else>
														</del>
													</span>
													&nbsp;
												<span class="mtext-106 cl2">
														<s:if test="%{unita_misura == 'cf'}">
															&euro; <s:property value="getText('{0,number,#,##0.00}',{p_alpubblico_2})"/>
														</s:if>
														<s:else>
															&euro; <s:property value="getText('{0,number,#,##0.00}',{p_alpubblico_2/10})"/> / etto
														</s:else>
												</span>
											</s:elseif>
											<s:elseif test="#session.CLIENTE.ctessera.livello_listino == 2">
													<span style="font-size: 14px" >
														<del style="font-weight: normal;">
															<s:if test="%{unita_misura == 'cf'}">
																&euro; <s:property value="getText('{0,number,#,##0.00}',{p_alpubblico_0})"/>
															</s:if>
															<s:else>
																&euro; <s:property value="getText('{0,number,#,##0.00}',{p_alpubblico_0/10})"/> / etto
															</s:else>
														</del>
													</span>
													&nbsp;
												<span class="mtext-106 cl2">
													<s:if test="%{unita_misura == 'cf'}">
														&euro; <s:property value="getText('{0,number,#,##0.00}',{p_alpubblico_3})"/>
													</s:if>
													<s:else>
														&euro; <s:property value="getText('{0,number,#,##0.00}',{p_alpubblico_3/10})"/> / etto
													</s:else>
												</span>
											</s:elseif>
											<s:elseif test="#session.CLIENTE.ctessera.livello_listino == 3">
												<span class="mtext-106 cl2">
														<span style="font-size: 14px" >
															<del>
																<s:if test="%{unita_misura == 'cf'}">
																	&euro; <s:property value="getText('{0,number,#,##0.00}',{p_alpubblico_0})"/>
																</s:if>
																<s:else>
																	&euro; <s:property value="getText('{0,number,#,##0.00}',{p_alpubblico_0/10})"/> / etto
																</s:else>
															</del>
														</span>
													&nbsp;
													<s:if test="%{unita_misura == 'cf'}">
														&euro; <s:property value="getText('{0,number,#,##0.00}',{p_alpubblico_4})"/>
													</s:if>
													<s:else>
														&euro; <s:property value="getText('{0,number,#,##0.00}',{p_alpubblico_4/10})"/> / etto
													</s:else>

												</span>
											</s:elseif>
											<s:elseif test="#session.CLIENTE.ctessera.livello_listino == 4">
												<span class="stext-106 cl2">
												<del>
													<span style="font-size: 14px" >
														<s:if test="%{unita_misura == 'cf'}">
															&euro; <s:property value="getText('{0,number,#,##0.00}',{p_alpubblico_0})"/>
														</s:if>
														<s:else>
															&euro; <s:property value="getText('{0,number,#,##0.00}',{p_alpubblico_0/10})"/> / etto
														</s:else>
													</span>
												</del>
													&nbsp;
													<s:if test="%{unita_misura == 'cf'}">
														&euro; <s:property value="getText('{0,number,#,##0.00}',{p_alpubblico_5})"/>
													</s:if>
													<s:else>
														&euro; <s:property value="getText('{0,number,#,##0.00}',{p_alpubblico_5/10})"/> / etto
													</s:else>
												</span>
											</s:elseif>
										</s:else>
									</s:else>

