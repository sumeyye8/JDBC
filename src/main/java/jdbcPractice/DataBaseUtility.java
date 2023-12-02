package jdbcPractice;

import java.sql.*;

public class DataBaseUtility {

    private static Connection connection;
    private static Statement statement;
    private static ResultSet resultSet;


    public static void createConnection(){

        String url = "jdbc:postgresql://localhost:5432/techproed";
        String user = "postgres";
        String password = "1234";

        try {
            connection = DriverManager.getConnection(url,user,password);
        } catch ( SQLException e){
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }



}
