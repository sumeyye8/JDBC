package jdbc;

import java.sql.*;

public class ExecuteUpdate01 {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        Class.forName("org.postgresql.Driver");
        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/techproed","postgres","1234");
        Statement st =  con.createStatement();

        // 1. Example: number_of_employees degeri ortalama calısan sayisindan az olan number_of_employees degerlerini 16000 olarak UPDATE edin

        String sql1 = "UPDATE companies\n" +
                "SET number_of_employees = 16000\n" +
                "WHERE number_of_employees < (SELECT AVG(number_of_employees)\n" +
                "                             FROM companies)";

        int updateSatirSayisi = st.executeUpdate(sql1); // Update edilen satir sayisini return eder
        System.out.println("updateSatirSayisi = " + updateSatirSayisi);

        String sql2 = "SEELCT * FROM companies";

        ResultSet result1 = st.executeQuery(sql2);

        while (result1.next()) {
            System.out.println(result1.getInt(1)+"-->" + result1.getString(2)+ "-->" + result1.getInt(3));
        }
        con.close();
        st.close();
    }
}
