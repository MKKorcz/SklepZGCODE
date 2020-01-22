<%@ page import="java.sql.*" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.ArrayList" %>
<%!
    public int getID(String table, HttpServletRequest request) throws SQLException {
        String polaczenieURL = "jdbc:mysql://localhost/projekt?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&user=root&password=";
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        conn = DriverManager.getConnection(polaczenieURL);
        String query = null;
        if(table.equals("zamowienia"))
            query = "SELECT `ID` FROM zamowienia ORDER BY `ID` DESC";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        if(rs.next())
            return rs.getInt("ID");
        else
            return 0;
    }

    Integer[][] numberOfOccurences(int[] tab) {
        int prev = 0;
        ArrayList<Integer> a = new ArrayList<Integer>();
        ArrayList<Integer> b = new ArrayList<Integer>();

        Arrays.sort(tab);
        for(int i = 0; i < tab.length; i++) {
            if (tab[i] != prev) {
                a.add(tab[i]);
                b.add(1);
            } else {
                int x = b.get(b.size()-1) + 1;
                b.set(b.size()-1, x);
            }
            prev = tab[i];
        }
        Integer[] a1 = new Integer[a.size()];
        a1 = a.toArray(a1);
        Integer[] b1 = new Integer[b.size()];
        b1 = b.toArray(b1);
        Integer[][] arr = new Integer[][] {a1, b1};
        return arr;
    }
%>