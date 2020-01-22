<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Meta: załączanie czcionek, CSS-a, kodowanie i import java.sql -->
    <%@include file="components/meta.jsp" %>
    <title>Wyślij | SKLEPZG.PL</title>
</head>
<body>
<!-- Menu, banner i przyciski logowania/rejestracji -->
<%@include file="components/menu.jsp" %>
<%
    if(request.getParameter("send") != null) { %>
<div class="center-content">
    <div id="alert" class="alert-box center-content">
        <a href="javascript:void(0)" onClick="alertOFF()" class="fas fa-times"></a>
        Wysłano wiadomość!
    </div>
    <% } %>
</div>
<div class="center-content">
    <h3>Kontakt</h3>
    <form action="scripts/contact.jsp" method="POST">
        <% if(session == null || session.getAttribute("loggedUser") == null) { %>
        <input type="text" name="name" placeholder="Imię" maxlength="20" required style="width: 195px;" />
        <input type="text" name="surname" placeholder="Nazwisko" maxlength="20" required style="width: 200px;" /><br>
        <input type="email" name="email" placeholder="Adres e-mail" maxlength="50" required style="width: 400px;" pattern="[A-z0-9._%+-]+@[A-z0-9.-]+\.[A-z]{2,}$" /><br>
        <% } %>
        <textarea name="description" placeholder="Opis" maxlength="500" required style="..."></textarea><br>

        <input type="submit" class="button" value="Wyślij" />
    </form>
</div>

<!-- Stopka i skrypt aktualizowania koszyka -->
<%@include file="components/footer.jsp" %>
</body>
</html>