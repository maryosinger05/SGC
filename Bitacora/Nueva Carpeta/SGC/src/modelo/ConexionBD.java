package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConexionBD {

    /*Aqui Declaramoslas variables y las inicializamos.*/
    private final String base = "sgc";
    private final String user = "postgres";
    final String clave = "1234";
    private final String url = "jdbc:postgresql://localhost:5432/" + base;
    private Connection con = null;
    
    protected PreparedStatement ps;
    protected ResultSet rs;

    /*constructor para  obtener la conexion de la base de datos*/
    public Connection getConexion() {

        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(this.url, this.user, this.clave);
        } catch (SQLException e) {
            System.err.println(e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;

    }

    public void cerrar() {

        try {
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Connection getCon() {
        return con;
    }
}
