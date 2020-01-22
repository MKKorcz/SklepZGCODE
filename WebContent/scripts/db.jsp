<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    int szt = Integer.parseInt(request.getParameter("szt"));

    String polaczenieURL = "jdbc:mysql://localhost/projekt?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&user=root&password=";
    Connection conn;

    //Ustawiamy sterownik MySQL
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    //Ustawiamy dane dotyczące podłączenia
    conn = DriverManager.getConnection(polaczenieURL);

    String query = "SELECT * FROM produkty WHERE ID = ?";
    PreparedStatement ps = conn.prepareStatement(query);
    ps.setInt(1, id);
    ResultSet rs = ps.executeQuery();

    if(rs.next()) {
        float suma = szt * rs.getFloat("Cena");
        DecimalFormat df = new DecimalFormat("#.##");
        out.print(rs.getString("Nazwa")+" – "+szt+" x "+rs.getFloat("Cena")+" zł = "+df.format(suma)+" zł");
        out.print("<input type='hidden' id='suma' value='"+df.format(suma)+"' />");
        out.print("<input type='hidden' id='ID_Produktu' value='"+rs.getInt("ID")+"' />");
    }
    //out.print("<br><h4>Suma: "+suma+"</h4>");
    conn.close();
%>