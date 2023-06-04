package jdbc;

import java.sql.*;

public class CallableStatement01 {

    /*
    Java'da methodlar return type sahibi olsa da, void olsa da method olarak adlandırılır.
    SQL'de ise data return ediyorsa "function" denir. Return yapmıyorsa "procedure" diye adlandırılır.
     */

    public static void main(String[] args) throws ClassNotFoundException, SQLException {

        Class.forName("org.postgresql.Driver");
        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/techproed", "postgres", "1234");
        Statement st = con.createStatement();

        //1. Example: İki parametre ile calisip bu parametreleri toplayarak return yapan bir fonksiyon olusturun

        // 1. Adim: Fonksiyon kodunu yaz
        String sql1 = "CREATE OR REPLACE FUNCTION toplamaF(x NUMERIC, y NUMERIC)\n" +
                "RETURNS NUMERIC\n" +
                "LANGUAGE plpgsql\n" +
                "AS\n" +
                "$$\n" +
                " BEGIN \n" +
                "\n" +
                " RETURN x+y;\n" +
                "\n" +
                " END\n" +
                "$$";

        // 2. Adim: Fonksiyonu calistir
        st.execute(sql1);

        // 3. Adim: Fonksiyonu cagir
        CallableStatement cst1 = con.prepareCall("{? = call toplamaF(?, ?)}"); // bu fonksiyonu bana şu parametrelerle cagir dedik
                                                    // functional cagirma syntax'i


        // 4. Adim: Return icin registerOutParameter() methodunu, parametreler icin set() methodlarindan uygun olanlari kullan
        cst1.registerOutParameter(1, Types.NUMERIC);
        cst1.setInt(2, 15);
        cst1.setInt(3, 25);

        // 5. Adim: Calistirmak icin execute() methodu kullan
        cst1.execute();

        // 6. Adim: Sonucu cagırmak icin return data tipine gore "get" methodlarindan uygun olani kullan
        System.out.println(cst1.getBigDecimal(1));



        //  * * * * * * * * * * * * * * * * * * * * * * * * * * * *


        // 2. Example: Koninin hacmini hesaplayan bir function yazin

        // 1. Adim: Fonksiyon kodunu yaz
        String sql2 = "CREATE OR REPLACE FUNCTION koniHacmi(r NUMERIC, h NUMERIC)\n" +
                "RETURNS NUMERIC\n" +
                "LANGUAGE plpgsql\n" +
                "AS\n" +
                "$$\n" +
                " BEGIN\n" +
                " \n" +
                " RETURN 3.14 * r * r * h / 3;\n" +
                " \n" +
                " END\n" +
                "$$";


        // 2. Adim: Fonksiyonu calistir
        st.execute(sql2);

        // 3. Adim: Fonksiyonu cagir
        CallableStatement cst2 = con.prepareCall("{? = call koniHacmi(?, ?)}");

        // 4. Adim: Return icin registerOutParameter() methodunu, parametreler icin set() methodlarindan uygun olanlari kullan
        cst2.registerOutParameter(1, Types.NUMERIC);
        cst2.setInt(2,1);
        cst2.setInt(3,1);

        // 5. Adim: Calistirmak icin execute() methodu kullan
        cst2.execute();

        // 6. Adim: Sonucu cagırmak icin return data tipine gore "get" methodlarindan uygun olani kullan
        System.out.println(cst2.getBigDecimal(1));



    }

}
