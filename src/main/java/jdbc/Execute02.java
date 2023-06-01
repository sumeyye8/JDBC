package jdbc;

import java.sql.*;

public class Execute02 {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {

        Class.forName("org.postgresql.Driver");
        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/techproed","postgres","1234");
        Statement st =  con.createStatement();

        // 1. Example: region id'si 1 olan "country name" degerlerini cagirin
        String sql1 = "SELECT country_name FROM countries WHERE region_id = 1"; // select = data cagirma (query data)
        boolean r1 = st.execute(sql1);
        System.out.println(r1); // true ya da false verir cunku data cagirma islemi yaptik

        ResultSet result1 = st.executeQuery(sql1);

        // Recordlari gormek icin executeQuery() methodu kullanmaliyiz
        while ( (result1.next())){  // next, pointer'i siradaki dataya goturur -boolean verir. sirada data oldugu surece true verecektir

            System.out.println(result1.getString("country_name"));   // columnLabel : sutun etiketi

        }

        // 2. Example: "region_id"nin 2'den buyuk oldugu "country_id" ve "country_name" degerlerini cagirin
        String sql2 = "SELECT country_id, country_name, FROM countries WHERE region_id > 2 ";
        ResultSet result2 = st.executeQuery(sql2);
        while ( result2.next()){
            System.out.println(result2.getString("country_id")+"-->"+result2.getString("country_name"));

        }

        //3.Example : "number_of_employees" degeri en dusuk olan satirin tum degerlerini cagirin
        String sql3 = "SELECT * FROM companies WHERE  number_of_employees = ( SELECT MIN(number_of_employees) FROM companies)";
        ResultSet result3 = st.executeQuery(sql3);

        while (result3.next()){
            System.out.println(result3.getInt("1")+"-->"+ result3.getString("2"+"-->"+result3.getInt("3"))); // calumnLabel , calumnIndex'e doner normalde ama burda donmedi
        }

        con.close();
        st.close();
    }


    }
