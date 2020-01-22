<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Meta: załączanie czcionek, CSS-a, kodowanie i import java.sql -->
    <%@include file="components/meta.jsp" %>
    <title>Twoja lista życzeń | SKLEPZG.PL</title>
</head>
<body>
    <!-- Menu, banner i przyciski logowania/rejestracji -->
    <%@include file="components/menu.jsp" %>
    <%
        //HttpSession session1 = request.getSession(false);
        if(session == null || session.getAttribute("loggedUser") == null) {
            out.print("<h3>Zaloguj się, aby mieć dostęp do listy życzeń.</h3>" +
                    "<p class='center-content'>Nie masz konta? <a href='login.jsp' class='decorated-link'>Zarejestruj się już teraz</a> i stwórz własną listę życzeń!</p>");
        }
        else {
            out.print("<h3>Lista życzeń</h3>");

            String polaczenieURL = "jdbc:mysql://localhost/projekt?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&user=root&password=";
            Connection conn = null;

            //Ustawiamy sterownik MySQL
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

            //Ustawiamy dane dotyczące podłączenia
            conn = DriverManager.getConnection(polaczenieURL);
            String query = "SELECT lista.Klient, lista.Produkt_ID, produkty.* FROM lista, produkty WHERE lista.Klient = ? AND lista.Produkt_ID = produkty.ID";
            PreparedStatement preparedStmt = conn.prepareStatement(query);
            preparedStmt.setString(1, session.getAttribute("loggedUser").toString());
            final ResultSet rs = preparedStmt.executeQuery();

            while (rs.next()) { %>
                <a href="oferta.jsp?id=<%= rs.getString("ID") %>">
                    <div id="lista_produkt">
                        <img src="<%= rs.getString("Zdjęcie") %>">
                        <p id="lista_nazwa"><%=rs.getString("Nazwa")%></p>
                        <p id="lista_cena">
                            <% if (rs.getInt("Ilosc_sztuk") == 0) {
                            %>
                            <span style="background-color: red;" title="Produkt niedostępny"></span>
                            <%
                            }
                            else if(rs.getInt("Ilosc_sztuk") > 0 && rs.getInt("Ilosc_sztuk") < 10) {
                            %>
                            <span style="background-color: orange;" title="Ilość: mało"></span>
                            <%
                            }
                            else {
                            %>
                            <span style="background-color: green;" title="Ilość: dużo"></span>
                            <%
                                }
                            %>
                            <%=rs.getString("Cena")%> PLN
                        </p>
                    </div>
                </a>
                <hr>
            <% }
            conn.close();
        }
    %>
    <!-- Stopka i skrypt aktualizowania koszyka -->
    <%@include file="components/footer.jsp" %>
</body>
</html>
