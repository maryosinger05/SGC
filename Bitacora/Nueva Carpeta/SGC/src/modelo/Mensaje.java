package modelo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import sgc.SGC;

public class Mensaje extends ConexionBD {

    private Integer id;
    private String asunto;
    private String contenido;
    private Usuario emisor = new Usuario();
    private String fecha;
    private ArrayList<Usuario> receptores = new ArrayList();
    private Boolean leido;

    private Connection con;

    public Boolean actualizarLeido() {
        try {
            ps = null;
            rs = null;
            con = getConexion();

            String sql = "UPDATE puente_mensaje_usuario SET leido = true WHERE id_mensaje = ? AND receptor = ?;";

            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, SGC.usuarioActual.getId());

            if (ps.executeUpdate() == 1) {
                return true;
            }

            return false;

        } catch (SQLException e) {
            System.err.println(e);
            return false;

        } finally {
            try {
                con.close();

            } catch (SQLException e) {
                System.err.println(e);
            }
        }
    }

    public Boolean buscarId() {
        try {
            ps = null;
            rs = null;
            con = getConexion();

            String sql = "SELECT MAX(id) AS id FROM mensaje;";

            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                setId(rs.getInt("id"));
                return true;
            }

            return false;

        } catch (SQLException e) {
            System.err.println(e);
            return false;

        } finally {
            try {
                con.close();

            } catch (SQLException e) {
                System.err.println(e);
            }
        }
    }

    public boolean eliminarEnviado() {
        ps = null;
        con = getConexion();
       
        String sql = "UPDATE mensaje SET activo_emisor = false WHERE id = ?";

        try {
            int i = 1;

            ps = con.prepareStatement(sql);
            ps.setInt(i++, getId());

            if (ps.executeUpdate() == 1) {
                return true;
            }
            
            return false;

        } catch (SQLException e) {
            System.err.println(e);
            return false;

        } finally {
            try {
                con.close();

            } catch (SQLException e) {
                System.err.println(e);

            }

        }
    }
    
    public boolean eliminarRecibido() {
        ps = null;
        con = getConexion();
       
        String sql = "UPDATE puente_mensaje_usuario SET activo_receptor = false WHERE id_mensaje = ? AND receptor = ?";

        try {
            int i = 1;

            ps = con.prepareStatement(sql);
            ps.setInt(i++, getId());
            ps.setInt(i++, SGC.usuarioActual.getId());

            if (ps.executeUpdate() == 1) {
                return true;
            }
            
            return false;

        } catch (SQLException e) {
            System.err.println(e);
            return false;

        } finally {
            try {
                con.close();

            } catch (SQLException e) {
                System.err.println(e);

            }

        }
    }


    public ArrayList<Mensaje> listar(Integer usuario, String bandeja) {
        try {
            ArrayList<Mensaje> lista = new ArrayList();
            Mensaje item;
            Usuario receptor;
            con = getConexion();
            ps = null;
            ResultSet rs2;

            String sql = "";

            if (bandeja.equals("Recibidos")) {
                sql = "SELECT * FROM v_bandeja_entrada WHERE receptor = ?;";

            } else if (bandeja.equals("Enviados")) {
                sql = "SELECT * FROM v_bandeja_salida WHERE id_emisor = ?;";
            }

            ps = con.prepareStatement(sql);
            ps.setInt(1, SGC.usuarioActual.getId());

            rs = ps.executeQuery();

            sql = "SELECT * FROM v_mensaje_usuario WHERE id_mensaje = ?";
            ps = con.prepareStatement(sql);

            while (rs.next()) {
                item = new Mensaje();
                item.setId(rs.getInt("id"));
                item.setAsunto(rs.getString("asunto"));
                item.setContenido(rs.getString("contenido"));
                item.setFecha(rs.getString("fecha"));
                item.emisor = new Usuario();
                item.emisor.setId(rs.getInt("id_emisor"));
                item.emisor.getPersona().setpNombre(rs.getString("nombre"));
                item.emisor.getPersona().setpApellido(rs.getString("apellido"));

                if (bandeja.equals("Recibidos")) {
                    item.leido = rs.getBoolean("leido");
                }

                ps.setInt(1, item.id);
                rs2 = ps.executeQuery();

                while (rs2.next()) {
                    receptor = new Usuario();
                    receptor.setId(rs2.getInt("id_receptor"));
                    receptor.setPersona(new Persona());
                    receptor.getPersona().setCedula(rs2.getString("cedula"));
                    receptor.getPersona().setpNombre(rs2.getString("nombre"));
                    receptor.getPersona().setpApellido(rs2.getString("apellido"));

                    item.receptores.add(receptor);
                }

                lista.add(item);
            }

            return lista;

        } catch (SQLException ex) {
            Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } finally {
            try {
                con.close();

            } catch (SQLException e) {
                System.err.println(e);

            }
        }
    }

    public boolean enviarMensaje() {

        try {
            con = getConexion();
            ps = null;

            String sql = "INSERT INTO mensaje(asunto, contenido, emisor) VALUES (?,?,?);";

            int i;
            i = 1;

            ps = con.prepareStatement(sql);
            ps.setString(i++, getAsunto());
            ps.setString(i++, getContenido());
            ps.setInt(i++, SGC.usuarioActual.getId());

            ps.execute();

            if (buscarId()) {

                if (registrarReceptores()) {
                    return true;
                }
            }

            return false;

        } catch (SQLException e) {
            System.err.println(e);
            return false;

        } finally {
            try {
                con.close();

            } catch (SQLException e) {
                System.err.println(e);
            }
        }
    }

    private Boolean registrarReceptores() {
        try {
            int ind;
            ps = null;
            con = getConexion();

            String sql = "INSERT INTO puente_mensaje_usuario(id_mensaje, receptor) VALUES (?,?);";
            ps = con.prepareStatement(sql);

            ind = 1;
            ps.setInt(ind++, getId());

            for (int i = 0; i < receptores.size(); i++) {
                ps.setInt(ind, receptores.get(i).getId());
                ps.execute();
            }

            return true;

        } catch (SQLException e) {
            System.err.println(e);
            return false;

        } finally {
            try {
                con.close();

            } catch (SQLException e) {
                System.err.println(e);
            }
        }
    }
    
    public void eliminarMensaje() {
        
      try{ 
          
      ps = null;
      con = getConexion();
      String sql = "SELECT limpiar_mensaje();";
      ps = con.prepareStatement(sql);
      ps.executeQuery();
      
      } 
      catch (SQLException e){
          System.err.println(e);
      }finally{
          cerrar();
      }     

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAsunto() {
        return asunto;
    }

    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public Boolean getLeido() {
        return leido;
    }

    public void setLeido(Boolean leido) {
        this.leido = leido;
    }

    public Usuario getEmisor() {
        return emisor;
    }

    public void setEmisor(Usuario emisor) {
        this.emisor = emisor;
    }

    public ArrayList<Usuario> getReceptores() {
        return receptores;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public void setReceptores(ArrayList<Usuario> receptores) {
        this.receptores = receptores;
    }

}
