package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Execute01 {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {

        // 1. Adim : Driver'a kaydol
        Class.forName("org.postgresql.Driver");

        // 2. Adim: Database'e baglan
        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/techproed","postgres","1234");

        // 3. Adim: Statement olustur
        Statement st = con.createStatement();

        // 4. Adim: Query calistir

        // 1. Example: "workers" adinda bir table olusturup "worker_id, worker_name, worker_salary" sutunlarini ekleyin
        String sql1 = "CREATE TABLE workers(worker_id VARCHAR(50), worker_name VARCHAR(50), worker_salary INT)";
        boolean result = st.execute(sql1);
        System.out.println(result); // False return yapar cunku data cagirilmadi sadece islem yapildi

        // 2. Example: Alter Table'a worker_adress sutunu ekleyerek alter yapin
        String sql2 = "ALTER TABLE workers ADD worker_adress VARCHAR(80)";
        st.execute(sql2);

        // 3. Example: Drop workers table
        String sql3 = "DROP TABLE workers";
        st.execute(sql3);

        // 5. Adim : Baglanti ve Statement'i kapat // bunu after methoduna koyarız ve her defasinda yazmamiza gerek kalmaz
        con.close();
        st.close();

    }
}
