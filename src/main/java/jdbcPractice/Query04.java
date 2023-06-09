package jdbcPractice;

import java.sql.*;

public class Query04 {

    public static void main(String[] args) throws ClassNotFoundException, SQLException {

        Class.forName("org.postgresql.Driver");
        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/techproed", "postgres", "1234");
        // Statement st = con.createStatement();

        PreparedStatement ps = con.prepareStatement("insert into ogrenciler values(?, ?, ?, ?) ");
        ps.setInt(1, 200);
        ps.setString(2, "Veli Can");
        ps.setString(3, "12");
        ps.setString(4, "E");

        ps.executeUpdate(); // bize int dondurur

        System.out.println("Veri girisi yapildi");



    }
}
