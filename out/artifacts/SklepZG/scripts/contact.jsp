<%@ page import="java.time.LocalDate" %>
<%@ include file="functions.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="script.js"></script>
<%@page import="java.sql.*"%>

<%
    String polaczenieURL = "jdbc:mysql://localhost/projekt?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&user=root&password=";
    Connection conn = null;
    request.setCharacterEncoding("UTF-8");

    //Ustawiamy sterownik MySQL
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    //Ustawiamy dane dotyczące podłączenia
    conn = DriverManager.getConnection(polaczenieURL);
    String query;

    String name = request.getParameter("name");
    String surname = request.getParameter("surname");
    String email = request.getParameter("email");
    String description = request.getParameter("description");
    String login = null;
    if(session.getAttribute("loggedUser") != null) {
        login = session.getAttribute("loggedUser").toString();
    }
    query = "INSERT INTO kontakt (`Imie`, `Nazwisko`, `Adres_email`, `Opis`, `Login`) VALUES (?, ?, ?, ?, ?)";
    PreparedStatement ps = conn.prepareStatement(query);
    ps.setString(1, name);
    ps.setString(2, surname);
    ps.setString(3, email);
    ps.setString(4, description);
    ps.setString(5, login);
    ps.execute();

    conn.close();
    response.sendRedirect("../kontakt.jsp?send");
%>