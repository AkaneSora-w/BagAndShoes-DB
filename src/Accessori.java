import java.sql.*;

public class Accessori {

    static final String DB_URL = "jdbc:mysql://localhost:3306/accessori";
    static final String USER = "root";
    static final String PASS = "Sql4906";

    public static String eseguiQuery(String query) {
        StringBuilder risultato = new StringBuilder();

        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
             Statement stmt = conn.createStatement()) {

            if (query.trim().toUpperCase().startsWith("SELECT")) {
                ResultSet rs = stmt.executeQuery(query);
                ResultSetMetaData rsmd = rs.getMetaData();
                int columnCount = rsmd.getColumnCount();

                
                for (int i = 1; i <= columnCount; i++) {
                    risultato.append(rsmd.getColumnName(i)).append("\t");
                }
                risultato.append("\n");


                while (rs.next()) {
                    for (int i = 1; i <= columnCount; i++) {
                        risultato.append(rs.getString(i)).append("\t");
                    }
                    risultato.append("\n");
                }
            } else {
                int rowsAffected = stmt.executeUpdate(query);
                risultato.append("Query eseguita correttamente. Righe modificate: ").append(rowsAffected);
            }

        } catch (SQLException e) {
            risultato.append("Errore durante l'esecuzione della query: ").append(e.getMessage());
        }

        return risultato.toString();
    }
}
