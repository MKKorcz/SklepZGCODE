<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
if(request.getParameter("id") == null) 
	response.sendRedirect("produkty.jsp");
%>
<!DOCTYPE html>
<html>
<head>
	<!-- Meta: załączanie czcionek, CSS-a, kodowanie i import java.sql -->
	<%@include file="components/meta.jsp" %>
	<title>Oferta | SKLEPZG.PL</title>
	<script>
		var id = "<%= request.getParameter("id") %>";
	</script>
</head>
	<body>
		<!-- Menu, banner i przyciski logowania/rejestracji -->
		<%@include file="components/menu.jsp" %>
        <%
            if(request.getParameter("send") != null) { %>
                <div class="center-content">
                    <div id="alert" class="alert-box center-content">
                        <a href="javascript:void(0)" onClick="alertOFF()" class="fas fa-times"></a>
                        Twój komentarz został opublikowany!
                    </div>
                </div>
            <% } %>
		<div id="oferta_produkt">
		<%
		String polaczenieURL = "jdbc:mysql://localhost/projekt?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&user=root&password=";
		String query = "SELECT produkty.*, AVG(Ocena) AS Srednia, COUNT(Ocena) AS Liczba FROM produkty " +
				"INNER JOIN oceny ON produkty.ID = oceny.Produkt_ID " +
				"WHERE produkty.ID = ? AND oceny.Produkt_ID = ?";

		Connection conn = null;

		try {
			 //Ustawiamy sterownik MySQL
			 Class.forName("com.mysql.cj.jdbc.Driver");

			 //Ustawiamy dane dotyczące podłączenia
			 conn = DriverManager.getConnection(polaczenieURL);

			 //Uruchamiamy zapytanie do bazy danych
			 PreparedStatement ps = conn.prepareStatement(query);
			 ps.setInt(1, Integer.parseInt(request.getParameter("id")));
			 ps.setInt(2, Integer.parseInt(request.getParameter("id")));
			 ResultSet rs = ps.executeQuery();

			 if(rs.next()) {
				%>
				<div id="oferta_lewy">
					<img src="<%=rs.getString("Zdjęcie")%>" alt="Zdjęcie produktu">
				</div>
				<div id="oferta_srodkowy">
					<div id="oferta_nazwa">
						<span id="productID" style="display: none;"><%= request.getParameter("id") %></span>
						<%= rs.getString("Nazwa") %>
                        <% if(session.getAttribute("loggedUser") != null) { %>
                            <jsp:useBean id="Wishlist" class="javastart.SklepZG.model.Wishlist" scope="request"></jsp:useBean>
                            <%
                            boolean status = Wishlist.checkStatus(session.getAttribute("loggedUser").toString(), Integer.parseInt(request.getParameter("id")));
                            if(status)
                                out.print("<i class=\"fas fa-heart\" title=\"Usuń z listy życzeń\"></i>");
                            else
                                out.print("<i class=\"far fa-heart\" title=\"Dodaj do listy życzeń\"></i>");
                        } %>
					</div>
					<div id="oferta_opis">
						<p><%= rs.getString("Opis") %></p>
						<%
							boolean available;
							if(rs.getInt("Ilosc_sztuk") > 0) {
								out.print("<p><b>Ilość sztuk:</b> "+rs.getString("Ilosc_sztuk")+"</p>");
								available = true;
							}
							else {
								out.print("<p><b>Produkt niedostępny!</b></p>");
								available = false;
							}
						%>
					</div>
				</div>
				<div id="oferta_prawy">
					<div id="oferta_ocena">Ocena produktu:</div>
					<div id="oferta_gwiazdki" title="Średnia ocen: <%= rs.getFloat("Srednia") %>">
						<%
							boolean isRated = true;
							if(session.getAttribute("loggedUser") != null) {
								String starsQuery = "SELECT oceny.Klient_ID FROM oceny, klienci WHERE oceny.Klient_ID = klienci.ID AND klienci.Login = ? AND oceny.Produkt_ID = ?";
								PreparedStatement starsPS = conn.prepareStatement(starsQuery);
								starsPS.setString(1, session.getAttribute("loggedUser").toString());
								starsPS.setInt(2, Integer.parseInt(request.getParameter("id")));
								ResultSet starsRS = starsPS.executeQuery();
								if(!starsRS.next()) {
									isRated = false;
								}
							}
						%>
						<span class="fa fa-star<%= (rs.getFloat("Srednia") > 0) ? " checked" : "" %><%= (!isRated) ? " rate" : "" %>" value="1"></span>
						<span class="fa fa-star<%= (rs.getFloat("Srednia") >= 1.5) ? " checked" : "" %><%= (!isRated) ? " rate" : "" %>" value="2"></span>
						<span class="fa fa-star<%= (rs.getFloat("Srednia") >= 2.5) ? " checked" : "" %><%= (!isRated) ? " rate" : "" %>" value="3"></span>
						<span class="fa fa-star<%= (rs.getFloat("Srednia") >= 3.5) ? " checked" : "" %><%= (!isRated) ? " rate" : "" %>" value="4"></span>
						<span class="fa fa-star<%= (rs.getFloat("Srednia") >= 4.5) ? " checked" : "" %><%= (!isRated) ? " rate" : "" %>" value="5"></span>
					</div>
					<script src="scripts/rate.js"></script>
					<div id="oferta_cena">Cena: <%= rs.getString("Cena") %> PLN</div>
					<% if(available) { %>
						<a id="oferta_kup" href="kup.jsp?id=<%= rs.getString("ID") %>"><div class="oferta_kup">Kup teraz</div></a>
						<a href="javascript:void(0);" id="koszyk_dodaj"><div class="oferta_kup">Dodaj do koszyka</div></a>
					<% } %>
				</div>
				<%
			 }
		}
		 catch(ClassNotFoundException wyjatek) {
			 System.out.println("Problem ze sterownikiem");
		}
		%>
		</div>
        <hr>
		<script src="scripts/wishlist.js"></script>
        <div id="komentarze" class="center-content">
            <h3>Komentarze</h3>
            <%
            String comment = "SELECT * FROM komentarze WHERE Produkt_ID = ?";
            PreparedStatement ps = conn.prepareStatement(comment);
            ps.setInt(1, Integer.parseInt(request.getParameter("id")));
            ResultSet rs = ps.executeQuery();

            while(rs.next()) { %>
                <p>
					<%= "Użytkownik <b>"+rs.getString("Login")+"</b> dnia <i>"+rs.getString("Data")+"</i> napisał:" %><br>
					<%= rs.getString("Tresc") %>
				</p>
            <% }
            conn.close(); %>
            <form action="scripts/comment.jsp" type="POST">
                <% if(session == null || session.getAttribute("loggedUser") == null) { %>
                <input type="text" name="nick" id="nick" placeholder="Nick" maxlength="20" required style="width: 400px;" /><br>
				<div id="sprawdznick" class="error"></div>
                <% } %>
                <textarea name="comment" placeholder="Komentarz" maxlength="300" required style="width: 400px"></textarea><br>
                <input type="hidden" name="ID" value="<%= request.getParameter("id") %>" />
                <input type="submit" class="button" value="Wyślij komentarz" />
            </form>
			<script src="scripts/sprawdzlogin.js"></script>
        </div>
		<!-- Stopka i skrypt aktualizowania koszyka -->
		<%@include file="components/footer.jsp" %>
	</body>
</html>