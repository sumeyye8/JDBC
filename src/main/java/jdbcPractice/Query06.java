package jdbcPractice;

public class Query06 {
    public static void main(String[] args) {
        createConnection();

        String query = "select *  from ogrencilerr";
        System.out.println("Sutun isimleri : " getColumnNames(Query));

        System.out.println("Okul No : " + getColumnData(query, "okul_no"));
        System.out.println("Ogrenci ismi : " + getColumnData(query, "ogrenci_nismi"));
        System.out.println("Sinif : " + getColumnData(query, "sinif"));
        System.out.println("Cinsiyet : " + getColumnData(query, "cinsiyet"));

    }
}
