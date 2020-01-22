<%@ include file="functions.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="script.js"></script>
<%@page import="java.sql.*"%>

<%
    String polaczenieURL = "jdbc:mysql://localhost/projekt?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&user=root&password=";
    Connection conn;
    request.setCharacterEncoding("UTF-8");

    //Ustawiamy sterownik MySQL
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    //Ustawiamy dane dotyczące podłączenia
    conn = DriverManager.getConnection(polaczenieURL);

    String nick = request.getParameter("nick");
    if(nick == null)
        nick = session.getAttribute("loggedUser").toString();

    String query = "INSERT INTO komentarze(Produkt_ID, Login, Tresc) VALUES (?, ?, ?)";
    PreparedStatement ps = conn.prepareStatement(query);
    ps.setString(1, request.getParameter("ID"));
    ps.setString(2, nick);
    ps.setString(3, request.getParameter("comment"));
    ps.execute();

    conn.close();
    response.sendRedirect("../oferta.jsp?id="+request.getParameter("ID")+"&send");
%>