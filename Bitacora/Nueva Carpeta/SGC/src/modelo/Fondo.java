/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author rma
 */
public class Fondo extends ConexionBD {

    private String tipo;
    private java.sql.Date fecha;
    private double monto_inicial;
    private String observacion;
    private String descripcion;
    private double saldo;
    private String id_condominio;

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public double getMonto_inicial() {
        return monto_inicial;
    }

    public void setMonto_inicial(double monto_inicial) {
        this.monto_inicial = monto_inicial;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    public String getId_condominio() {
        return id_condominio;
    }

    public void setId_condominio(String id_condominio) {
        this.id_condominio = id_condominio;
    }

    public boolean registrar(Fondo modfon) {

        PreparedStatement ps = null;
        Connection con = getConexion();

        String sql = "INSERT INTO fondos(tipo, fecha, descripcion, observaciones, monto_inicial, saldo, id_condominio) VALUES (?, ?, ?, ?, ?, ?, ?);";

        try {

            ps = con.prepareStatement(sql);
            ps.setString(1, getTipo());
            ps.setDate(2, getFecha());
            ps.setString(3, getDescripcion());
            ps.setString(4, getObservacion());
            ps.setDouble(5, getMonto_inicial());
            ps.setDouble(6, getMonto_inicial());
            ps.setString(7, getId_condominio());
            ps.execute();

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

    public ArrayList<Fondo> listar() {
        ArrayList listaFondo = new ArrayList();
        Fondo modfon;

        Connection con = getConexion();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT tipo, fecha, descripcion, observaciones, monto_inicial, saldo FROM fondos where id_condominio=?;";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, getId_condominio());
            rs = ps.executeQuery();

            while (rs.next()) {

                modfon = new Fondo();

                modfon.setTipo(rs.getString(1));
                modfon.setFecha(rs.getDate(2));
                modfon.setDescripcion(rs.getString(3));
                modfon.setObservacion(rs.getString(4));
                modfon.setMonto_inicial(rs.getDouble(5));
                modfon.setSaldo(rs.getDouble(6));

                listaFondo.add(modfon);
            }
        } catch (Exception e) {
        }

        return listaFondo;
    }
    
    public boolean buscar(Fondo modfon) {

        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection con = getConexion();
        String sql = "SELECT fecha, descripcion, observaciones, monto_inicial, saldo FROM fondos where id_condominio=? and tipo=?;";

        try {

            ps = con.prepareStatement(sql);
            ps.setString(1, modfon.getId_condominio());
            ps.setString(2, modfon.getTipo());
            rs = ps.executeQuery();
            if (rs.next()) {

                modfon.setFecha(rs.getDate("fecha"));
                modfon.setDescripcion(rs.getString("descripcion"));
                modfon.setObservacion(rs.getString("observaciones"));
                modfon.setMonto_inicial(rs.getInt("monto_inicial"));
                modfon.setSaldo(rs.getDouble("saldo"));

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
    
    public boolean modificar(Fondo modfon) {

        PreparedStatement ps = null;
        Connection con = getConexion();

        String sql = "UPDATE fondos SET  fecha=?, descripcion=?, observaciones=?, monto_inicial=?, saldo=? WHERE tipo=? and id_condominio=?";

        try {

            ps = con.prepareStatement(sql);
            ps.setDate(1, getFecha());
            ps.setString(2, getDescripcion());
            ps.setString(3, getObservacion());
            ps.setDouble(4, getMonto_inicial());
            ps.setDouble(5, getSaldo());
            
            ps.setString(6, getTipo());
            ps.setString(7, getId_condominio());
            ps.execute();

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
    
    public boolean eliminar(Fondo modfon){
        
        PreparedStatement ps = null;
        Connection con = getConexion();
        
        String sql = "DELETE FROM fondos WHERE tipo=? and id_condominio=?";
        
        try {
            
            ps = con.prepareStatement(sql);
            ps.setString(1, getTipo());
            ps.setString(2, getId_condominio());
            ps.execute();
            
            return true;
            
        } catch (SQLException e) {
            
           System.err.println(e);
           return false;
            
        }finally{
            try {
                
                con.close();
                
            }catch (SQLException e) {
            
           System.err.println(e);
           
            }
        
        }
        
     }  

}