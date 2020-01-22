<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Meta: załączanie czcionek, CSS-a, kodowanie i import java.sql -->
    <%@include file="components/meta.jsp" %>
    <title>Złóż zamówienie | SKLEPZG.PL</title>
</head>
<body>
    <!-- Menu, banner i przyciski logowania/rejestracji -->
    <%@include file="components/menu.jsp" %>
    <%
        if(request.getParameter("bought") != null && request.getParameter("bought").equals("1")) { %>
            <script>clearCart();</script>
            <div class="center-content">
                <div id="alert" class="alert-box center-content">
                    <a href="javascript:void(0)" onClick="alertOFF()" class="fas fa-times"></a>
                    Zamówienie o numerze <%= request.getParameter("order") %> zostało złożone!
                </div>
            </div>
        <% } else if(request.getParameter("bought") != null && request.getParameter("bought").equals("0")) { %>
            <script>
                removeFromCart("<%= request.getParameter("product") %>");
            </script>
            <div class="center-content">
                <div id="error" class="alert-box center-content">
                    <a href="javascript:void(0)" onClick="alertOFF()" class="fas fa-times"></a>
                    Produkt nr <%= request.getParameter("product") %> nie został zamówiony, ponieważ skończył się w naszym magazynie.
                </div>
            </div>
        <% }
        if(session == null || session.getAttribute("loggedUser") == null) {
            // Zaloguj lub bez logowania
            %>
            <div id="lewy">
                <!-- Formularz logowania -->
                <jsp:include page="components/login-form.jsp"></jsp:include>
            </div>
            <div id="prawy">
                <h3>Zakupy bez rejestracji</h3>
                <form action="scripts/buy.jsp" method="POST">
                    <input type="text" name="name" placeholder="Imię" maxlength="20" required style="width: 195px;" />
                    <input type="text" name="surname" placeholder="Nazwisko" maxlength="20" required style="width: 200px;" /><br>
                    <input type="email" name="email" placeholder="Adres e-mail" maxlength="50" required style="width: 400px;" pattern="[A-z0-9._%+-]+@[A-z0-9.-]+\.[A-z]{2,}$" /><br>
                    <input type="text" name="phone" placeholder="Numer telefonu" maxlength="9" required style="width: 400px;" pattern="\d{9}" title="Wpisz nr telefonu w formacie 9-cyfrowym" /><br>
                    <input type="text" name="street" placeholder="Ulica" maxlength="35" required style="width: 300px;" />
                    <input type="text" name="number" placeholder="Nr domu" maxlength="8" required style="width: 95px;" /><br>
                    <input type="text" name="postcode" placeholder="Kod" maxlength="6" required style="width: 95px;" pattern="\d{2}-\d{3}" title="XX-XXX" />
                    <input type="text" name="city" placeholder="Miejscowość" maxlength="30" required style="width: 300px;" /><br>
                    <p>
                        <b>Twój koszyk:</b><br>
                        <span></span>
                    </p>
                    <input type="submit" class="button" value="Złóż zamówienie" />
                </form>
            </div>
        <%
        }
        else { %>
            <form action="scripts/buy.jsp" method="POST" class="center-content">
                <p>
                    <b>Twój koszyk:</b><br>
                    <span></span>
                </p>
                <input type="submit" class="button" value="Złóż zamówienie" />
            </form>
        <% }
    %>
    <script>
        $("body").on('DOMSubtreeModified', "#panel_koszyk span", function() {
            $("form p span").html($('#panel_koszyk span').html());
            if(getCookie("koszyk") == "")
                $("form .button").attr("disabled", true);
            else
                $("form .button").attr("disabled", false);
        });
        if(getCookie("koszyk") == "")
            $("form .button").attr("disabled", true);
        else
            $("form .button").attr("disabled", false);
    </script>
    <!-- Stopka i skrypt aktualizowania koszyka -->
    <%@include file="components/footer.jsp" %>
</body>
</html>
