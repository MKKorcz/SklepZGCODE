package javastart.SklepZG.model;

/*import java.util.HashMap;
//zmiana Hashmapy na mechanizm łączący się z rzeczywista bazą danych
public class DataSource {

    private HashMap<String, String> userSource;

    public DataSource() {
        userSource = new HashMap<String, String>();
        generateTestData();
    }

    public void register(String name, String password) {
        userSource.put(name, password);
    }

    public boolean userExists(User user) {
        String passwordFromSource = userSource.get(user.getName());
        if(passwordFromSource != null) {
            return user.getPassword().equals(passwordFromSource);
        } else
            return false;
    }

    private void generateTestData() {
        userSource.put("admin", "test");
        userSource.put("user", "passUser");
    }
}*/

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.security.spec.PKCS8EncodedKeySpec;
import java.sql.*;
import java.util.Base64;

public class DataSource {
    String name;
    String surname;
    String email;
    int phone;
    String street;
    String number;
    String postcode;
    String city;
    String login;
    String password;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    int result;
    public int getResult() {
        return result;
    }

    public void setResult(int result) {
        this.result = result;
    }

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

    public void register() {
        try {
            result = -1;
            //Ustawiamy sterownik MySQL
            //Class.forName("com.mysql.cj.jdbc.Driver");

            //Ustawiamy dane dotyczące podłączenia
            //conn = DriverManager.getConnection(polaczenieURL);

            //Uruchamiamy zapytanie do bazy danych
            Statement stmt = conn.createStatement();

            //jesli user istnieje to wypisz komunikat
            if (userExists(login, "Login") == true) {
                result = 0;
            }
            else if (userExists(email, "Adres_email") == true) {
                result = 0;
            }
            else if (userExists(phone+"", "Numer_telefonu") == true) {
                result = 0;
            }
            //jesli user nie istnieje to uaktualnij baze o nowego uzytkownika
            else {
                String hash = BCrypt.hashpw(password, BCrypt.gensalt());

                String query = "INSERT INTO klienci(Imie, Nazwisko, Adres_email, Numer_telefonu, Adres, Kod_pocztowy, Miasto, Login, Haslo) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement preparedStmt = conn.prepareStatement(query);
                preparedStmt.setString(1, name);
                preparedStmt.setString(2, surname);
                preparedStmt.setString(3, email);
                preparedStmt.setString(4, phone+"");
                preparedStmt.setString(5, street+" "+number);
                preparedStmt.setString(6, postcode);
                preparedStmt.setString(7, city);
                preparedStmt.setString(8, login);
                preparedStmt.setString(9, hash);
                preparedStmt.execute();
                result = 1;
            }
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean userExists(String zmienna, String kolumna) {
        final String queryCheck = "SELECT COUNT(*) FROM klienci WHERE "+kolumna+" = ?";
        PreparedStatement ps;
        try {
            ps = conn.prepareStatement(queryCheck);
            ps.setString(1, zmienna);
            final ResultSet resultSet = ps.executeQuery();
            if(resultSet.next()) {
                final int count = resultSet.getInt(1);
                if(count > 0) {
                    return true;
                }
                else {
                    return false;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void log() {
        try {
            result = -1;
            //Ustawiamy sterownik MySQL
            //Class.forName("com.mysql.cj.jdbc.Driver");

            //Ustawiamy dane dotyczące podłączenia
            //conn = DriverManager.getConnection(polaczenieURL);

            //Uruchamiamy zapytanie do bazy danych
            Statement stmt = conn.createStatement();

            //jesli user istnieje to wypisz komunikat
            if (userExists(login, "login") == false) {
                result = 0;
            }
            //jesli user nie istnieje to uaktualnij baze o nowego uzytkownika
            else {
                String query = "SELECT Haslo FROM klienci WHERE Login = ?";
                PreparedStatement preparedStmt = conn.prepareStatement(query);
                preparedStmt.setString(1, login);
                final ResultSet rs = preparedStmt.executeQuery();
                if(rs.next()) {
                    if(BCrypt.checkpw(password, rs.getString("Haslo")))
                        result = 1;
                    else
                        result = 0;
                }
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}