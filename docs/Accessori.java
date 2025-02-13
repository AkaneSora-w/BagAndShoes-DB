import java.sql.*;

public class Accessori {

    static final String DB_URL = "jdbc:mysql://localhost:3306/accessori";
    static final String USER = "root";
    static final String PASS = "Sql4906";
    static final String INSERT_QUERY = "INSERT INTO Dipendente (CF, nome, cognome, stipendio, posizione, Negozio)" +
            "VALUES ('DIP006', 'Marco', 'Rossi', 3000, 'Manager', 'PIVA001');";

    static final String PRINT_DIPENDENTE = "SELECT CF, nome, cognome, stipendio, posizione, Negozio FROM Dipendente;";

    public static void main (String[] args){
        try(Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
            Statement st = conn.createStatement()) {

                int righeInserite = st.executeUpdate(INSERT_QUERY);
                System.out.println("RIghe inserite: " + righeInserite);

                ResultSet rs = st.executeQuery(PRINT_DIPENDENTE);
                    while (rs.next()) {
                        System.out.print("CF: " + rs.getString("CF"));
                        System.out.print(" nome: " + rs.getString("nome"));
                        System.out.print(" cognome: " + rs.getString("cognome"));
                        System.out.print(" stipendio: " + rs.getInt("stipendio"));
                        System.out.print(" posizione: " + rs.getString("posizione"));
                        System.out.println(" negozio: " + rs.getString("Negozio"));
                    }

        } catch (SQLException e) {
            e.printStackTrace();
        } ;
    }
}

