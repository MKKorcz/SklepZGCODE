<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="banner">
	<a href="index.jsp"><img src="img/banner.jpg" alt="Banner"></a>
</div>
<div id="nawigacja">
    <% if(session.getAttribute("loggedUser") != null) { %>
    <a href="uzytkownik.jsp" title="Historia zamówień">
        <i class="fas fa-user"></i>
    </a>
    |
    <% } %>
    <a href="javascript:void(0);" onClick="panelON()" title="Koszyk">
        <div id="koszyk_info">
            <i class="fa fa-shopping-cart"></i>
            <b></b>
        </div>
    </a>
</div>
<script>
    if(getCookie("koszyk") != "")
        var x = getCookie("koszyk").split("|");
    else
        var x = [];
    document.getElementById("koszyk_info").lastElementChild.innerHTML = x.length;
</script>
<div id="menu">
	<a href="index.jsp">Strona główna</a>
	<a href="produkty.jsp">Produkty</a>
	<a href="szukaj.jsp">Wyszukaj</a>
    <a href="lista.jsp">Lista życzeń</a>
    <a href="reklamacja.jsp">Reklamacje</a>
	<a href="kontakt.jsp">Kontakt</a>
    <%
        if(session.getAttribute("loggedUser") == null)
            out.print("<a href=\"login.jsp\">Zaloguj</a>");
        else
            out.print("<a href=\"scripts/logout.jsp\">Wyloguj</a>");
    %>

</div>
<div id="overlay">
    <div class="panel" id="panel_koszyk">
        <h2>TWÓJ KOSZYK ZAKUPÓW</h2>
        <a href="javascript:void(0)" onClick="panelOFF()" class="fas fa-times"></a>
        <span></span><br>
        <a href="kup.jsp" class="button">IDŹ DO KASY</a>
        <a href="javascript:void(0);" class="button" id="koszyk_usun">OPRÓŻNIJ KOSZYK</a>
    </div>
</div>