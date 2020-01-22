<%@ page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<script src="scripts/koszyk.js"></script>
<footer class="center-content">
	<a href="https://zgsport.pl" target="_blank">© SKLEPZG.PL & ZGSPORT.PL 2019-<%= Calendar.getInstance().get(Calendar.YEAR) %></a>
</footer>
<script>
	updateCart();
</script>