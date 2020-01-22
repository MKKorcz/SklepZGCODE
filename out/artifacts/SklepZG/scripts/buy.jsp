<%@ page import="java.time.LocalDate" %>
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
    String query;
    LocalDate data = LocalDate.now();

    String name = request.getParameter("name");
    String surname = request.getParameter("surname");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String street = request.getParameter("street");
    String number = request.getParameter("number");
    String postcode = request.getParameter("postcode");
    String city = request.getParameter("city");
    PreparedStatement ps = null;

    //Obrobienie koszyka
    String koszyk = null;
    Cookie cookies[];
    cookies = request.getCookies();
    if(cookies != null) {
        for (int i = 0; i < cookies.length; i++) {
            if(cookies[i].getName().equals("koszyk")) {
                koszyk = cookies[i].getValue();
            }
        }
    }
    String k[] = koszyk.split("\\|");
    int k2[] = new int[k.length];
    for (int i = 0; i < k.length; i++) {
        k2[i] = Integer.parseInt(k[i]);
    }
    Integer koszykObrobiony[][] = numberOfOccurences(k2);

    boolean isErrorOccured = false;
    for(int i = 0; i < koszykObrobiony[0].length; i++) {
        ps = conn.prepareStatement("SELECT Ilosc_sztuk, ID FROM produkty WHERE ID = ? AND Ilosc_sztuk < ?");
        ps.setInt(1, koszykObrobiony[0][i]);
        ps.setInt(2, koszykObrobiony[1][i]);
        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
            isErrorOccured = true;
            response.sendRedirect("../kup.jsp?bought=0&product="+rs.getString("ID")+"");
            break;
        }
    }
    if(!isErrorOccured) {
        if(session.getAttribute("loggedUser") == null) {
            query = "INSERT INTO klienci (`Imie`, `Nazwisko`, `Adres_email`, `Numer_telefonu`, `Adres`, `Kod_pocztowy`, `Miasto`)" +
                    "VALUES (?, ?, ?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, surname);
            ps.setString(3, email);
            ps.setString(4, phone);
            ps.setString(5, street+" "+number);
            ps.setString(6, postcode);
            ps.setString(7, city);
            ps.execute();

            query = "INSERT INTO zamowienia (`Data`, `ID_klienta`) VALUES (?, (SELECT LAST_INSERT_ID()))";
            ps = conn.prepareStatement(query);
            ps.setDate(1, Date.valueOf(data));
        }
        else {

            query = "INSERT INTO zamowienia (`Data`, `ID_klienta`) VALUES (?, (SELECT ID FROM klienci WHERE Login = ?))";
            ps = conn.prepareStatement(query);
            ps.setDate(1, Date.valueOf(data));
            ps.setString(2, session.getAttribute("loggedUser").toString());
        }
        ps.execute();

        for(int i = 0; i < koszykObrobiony[0].length; i++) {
            out.print(koszykObrobiony[0][i] + " ");
            query = "INSERT INTO produkty_has_zamowienia (`Produkty_ID_produktu`, `Zamowienia_ID_zamowienia`, `Ilosc_sztuk`) " +
                                                "VALUES (?, (SELECT LAST_INSERT_ID()), ?)";
            ps = conn.prepareStatement(query);
            ps.setInt(1, koszykObrobiony[0][i]);
            ps.setInt(2, koszykObrobiony[1][i]);
            ps.execute();

            ps = conn.prepareStatement("UPDATE produkty SET Ilosc_sztuk = Ilosc_sztuk - ? WHERE Ilosc_sztuk >= ? AND ID = ?");
            ps.setInt(1, koszykObrobiony[1][i]);
            ps.setInt(2, koszykObrobiony[1][i]);
            ps.setInt(3, koszykObrobiony[0][i]);
            ps.execute();
        }

        int ID_zamowienia = getID("zamowienia", request);
        if(!response.isCommitted())
            response.sendRedirect("../kup.jsp?bought=1&order="+ID_zamowienia);
        conn.close();
    }
%>