<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<!-- Meta: załączanie czcionek, CSS-a, kodowanie i import java.sql -->
		<%@include file="components/meta.jsp" %>
		<title>SKLEPZG.PL</title>
	</head>
	<body>
		<!-- Menu, banner i przyciski logowania/rejestracji -->
		<%@include file="components/menu.jsp" %>
		<%
		if((request.getParameter("logged") != null) && (session.getAttribute("loggedUser") != null)) { %>
		<div class="center-content">
			<div id="alert" class="alert-box center-content">
				<a href="javascript:void(0)" onClick="alertOFF()" class="fas fa-times"></a>
				Zalogowano pomyślnie! Witaj <%= session.getAttribute("loggedUser") %>!
			</div>
		</div>
		<% } %>
		<div class="center-content">
			<h3>
				Witamy w SKLEPZG.PL! Znajdziesz tu największy wybór licencjonowanych gadżetów marki ZGSPORT.PL!<br>
				Przejdź do zakładki <i><a href="produkty.jsp" class="decorated-link">Produkty</a></i> i wybierz coś dla siebie...
			</h3>
		</div>
		<!-- Stopka i skrypt aktualizowania koszyka -->
		<%@include file="components/footer.jsp" %>
	</body>
</html>