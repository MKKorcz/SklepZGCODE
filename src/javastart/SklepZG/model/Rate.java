package javastart.SklepZG.model;

import java.sql.*;

public class Rate {
    String polaczenieURL = "jdbc:mysql://localhost/projekt?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&user=root&password=";
    Connection conn;
    {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(polaczenieURL);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    public float rating(int product, String client, int rate) throws SQLException {
        String insert = "INSERT INTO oceny (Produkt_ID, Klient_ID, Ocena) VALUES (?, (SELECT ID FROM klienci WHERE Login = ?), ?)";
        PreparedStatement ps = conn.prepareStatement(insert);
        ps.setInt(1, product);
        ps.setString(2, client);
        ps.setInt(3, rate);
        ps.execute();

        String select = "SELECT AVG(Ocena) AS Srednia FROM oceny WHERE Produkt_ID = ?";
        ps = conn.prepareStatement(select);
        ps.setInt(1, product);
        ResultSet rs = ps.executeQuery();
        if(rs.next())
            return rs.getFloat("Srednia");
        else
            return 0;
    }
}
