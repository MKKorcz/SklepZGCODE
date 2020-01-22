package javastart.SklepZG.model;

import java.sql.*;

public class Wishlist {
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

    public void add(String klient, int productID) throws SQLException {
        String select = "SELECT Produkt_ID FROM lista WHERE Klient = ? AND Produkt_ID = ?";
        PreparedStatement ps = conn.prepareStatement(select);
        ps.setString(1, klient);
        ps.setInt(2, productID);
        ResultSet rs = ps.executeQuery();

        if(!rs.next()) {
            String query = "INSERT INTO lista(Klient, Produkt_ID) VALUES (?, ?)";
            PreparedStatement preparedStmt = conn.prepareStatement(query);
            preparedStmt.setString(1, klient);
            preparedStmt.setInt(2, productID);
            preparedStmt.execute();
        }
    }
    public void remove(String klient, int productID) throws SQLException {
        String query = "DELETE FROM lista WHERE Klient = ? AND Produkt_ID = ?";
        PreparedStatement preparedStmt = conn.prepareStatement(query);
        preparedStmt.setString(1, klient);
        preparedStmt.setInt(2, productID);
        preparedStmt.execute();
    }
    public boolean checkStatus(String klient, int productID) throws SQLException {
        String query = "SELECT * FROM lista WHERE Klient = ? AND Produkt_ID = ?";
        PreparedStatement preparedStmt = conn.prepareStatement(query);
        preparedStmt.setString(1, klient);
        preparedStmt.setInt(2, productID);
        ResultSet resultSet = preparedStmt.executeQuery();
        if(resultSet.next())
            return true;
        else
            return false;
    }
}
