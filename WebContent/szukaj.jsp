<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Meta: załączanie czcionek, CSS-a, kodowanie i import java.sql -->
        <%@include file="components/meta.jsp" %>
        <title>Wyszukaj produkt | SKLEPZG.PL</title>
    </head>
    <body>
        <!-- Menu, banner i przyciski logowania/rejestracji -->
        <%@include file="components/menu.jsp" %>
        <%
            request.setCharacterEncoding("UTF-8");
            String q = "";
            if(request.getParameter("q") != null) {
                q = request.getParameter("q");
            }
        %>
        <form>
            <div class="center-content"><input type="search" name="q" placeholder="Wyszukaj..." <% if(!q.equals("")) out.print("value='"+q+"'"); %> /></div>
            <div id="sub"><input type="submit" class="button" value="Szukaj" /></div>
        </form>
        <%
        if(!q.equals("")) {
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

            ResultSet rs;
            String query;

            query = "SELECT * FROM produkty WHERE Nazwa LIKE ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, "%"+q+"%");
            rs = ps.executeQuery();
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
                <hr> <%
            }
            conn.close();
        }
        %>
        <!-- Stopka i skrypt aktualizowania koszyka -->
        <%@include file="components/footer.jsp" %>
    </body>
</html>