package jdbc;

import java.sql.*;

public class ExecuteQuery01 {

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        Class.forName("org.postgresql.Driver");
        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/techproed","postgres","1234");
        Statement st =  con.createStatement();

        // 1. Example: companies tablosundan en yuksek ikinci number_of_employees degeri olan company ve number_of_employees degerlerini cagirin
        String sql1 =  "SELECT company, number_of_employees\n" +
                "FROM companies\n" +
                "ORDER BY number_of_employees DESC\n" +
                "OFFSET 1 ROW -- bir sütun atla demek\n" +
                "FETCH NEXT 1 ROW ONLY";

        ResultSet result1 = st.executeQuery(sql1);
        while (result1.next()){
            System.out.println(result1.getString(1)+ " " +result1.getInt(2));
        }

        // 2. Yol Subquery kullanarak

        String sql2 = "SELECT company, number_of_employees\n" +
                "FROM companies\n" +
                "WHERE number_of_employees = (SELECT MAX (number_of_employees)\n" +
                "               FROM companies\n" +
                "               WHERE number_of_employees < (SELECT MAX(number_of_employees)\n" +
                "                FROM companies))";

        ResultSet result2 = st.executeQuery(sql2);
        while (result2.next()){
            System.out.println(result2.getString("company")+" "+result2.getInt("number_of_employees"));
        }

        con.close();
        st.close();
        result1.close();
        result2.close();




    }
}
