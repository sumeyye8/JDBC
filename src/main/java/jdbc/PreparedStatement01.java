package jdbc;

import java.sql.*;

public class PreparedStatement01 {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {

        Class.forName("org.postgresql.Driver");
        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/techproed", "postgres", "1234");
        Statement st = con.createStatement();

        // 1. Example: Prepared statement kullanarak company adi IBM olan number_of_employees degerini 9999 olarak guncelleyin


        // 1. Adim:  Prepared statement query'sini olustur
        String sql1 = "UPDATE companies SET number_of_employees = ? WHERE company = ?";


        // 2. Adim: PreparedStatement objesini olustur
        PreparedStatement pst1 = con.prepareStatement(sql1);


        // 3. Adim: set...() methodlari ile soru isaretleri icin deger gir
        pst1.setInt(1, 9999);
        pst1.setString(2, "IBM");

        // 4. Adim: Execute query
        int updateRowSayisi = pst1.executeUpdate();
        System.out.println(updateRowSayisi + " satır güncellendi.");

        String sql2 = "SELECT * FROM companies";
        ResultSet result2 = st.executeQuery(sql2);

        while (result2.next()) {

            System.out.println(result2.getInt(1) + "--" + result2.getString(2) + "--" + result2.getInt(3));
        }


        // Google icin degisiklik
        pst1.setInt(1, 15000);
        pst1.setString(2, "GOOGLE");

        int updateRowSayisi2 = pst1.executeUpdate();
        System.out.println(updateRowSayisi2 + " satır güncellendi.");

        String sql3 = "SELECT * FROM companies";
        ResultSet result3 = st.executeQuery(sql3);

        while (result3.next()) {

            System.out.println(result3.getInt(1) + "--" + result3.getString(2) + "--" + result3.getInt(3));
        }


        // 2. Example: "SELECT * FROM <table name>" query'sini prepared statement ile kullanin
        System.out.println("==================");
        read_data(con, "countries");

    }
        // Bir tablonun istenilen datasini prepared statement ile cagırmak icin kullanilan method
        public static void read_data(Connection con, String tableName ){

            try {

                String query = String.format("SELECT * FROM %s",tableName);//Format() methodu dinamik String oluşturmak için kullanılır.

                Statement statement = con.createStatement();
                //SQL query'yi çalıştır.
                ResultSet rs = statement.executeQuery(query);//Datayı çağırıp ResultSet konteynırına koyuyoruz.

                while (rs.next()){//Tüm datayı çağıralım.

                    System.out.println(rs.getString(1) + " - " + rs.getString(2) + " - " + rs.getInt(3));

                }

            }catch (Exception e){
                System.out.println(e);
            }

        }
    }

