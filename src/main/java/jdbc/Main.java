package jdbc;

import java.sql.Connection;

public class Main {
    public static void main(String[] args) throws ClassNotFoundException {

        // DBWork objesini olustur
        DBWork db = new DBWork();

        // Connection methodunu database'den cagir
        Connection con = db.connect_to_db("techproed", "postgres" , "1234");

        // Yeni table olusturma methodunu cagir
        db.createTable(con, "employees");

    }
}
