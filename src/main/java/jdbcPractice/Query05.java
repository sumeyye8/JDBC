package jdbcPractice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Query05 {

    public static void main(String[] args) throws ClassNotFoundException, SQLException {

        Class.forName("org.postgresql.Driver");
        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/techproed", "postgres", "1234");
        Statement st = con.createStatement();


        // Soru: Ogrenciler tablosuna yeni bir kayit ekleyin (300, 'Sena Can', 12, 'K')
        // int s1 = st.executeUpdate("insert into ogrenciler values(300, 'Sena Can', 12, 'K')");

        // System.out.println(s1 + " satir database'e eklendi");

        // Soru: Ogrenciler tablosuna birden fazla veri ekleyin
        // (400, 'Sena Can', 12, 'K'), (401, 'Sena Can', 12, 'K'),(402, 'Sena Can', 12, 'K')


        /* 1. YOL

        String [] data = {"insert into ogrenciler values(400, 'Sena Can', 12, 'K')",
                "insert into ogrenciler values(401, 'Sena Can', 12, 'K')",
                "insert into ogrenciler values(402, 'Sena Can', 12, 'K')"};

        int count = 0;

        for (String each: data){
            count = count + st.executeUpdate(each);
        }
        System.out.println(count + " satir eklendi");

         */

        // 2. YOL


        String [] data2 = {"insert into ogrenciler values(500, 'Sena Can', 12, 'K')",
                "insert into ogrenciler values(501, 'Sena Can', 12, 'K')",
                "insert into ogrenciler values(502, 'Sena Can', 12, 'K')"};

        for (String each : data2) {
            st.addBatch(each);      // Yukaridaki datalarin hepsini birlestiriyor
        }
        st.executeBatch();          // Datalari tek seferde gonderiyor

        System.out.println("Datalar eklendi");
    }
}
