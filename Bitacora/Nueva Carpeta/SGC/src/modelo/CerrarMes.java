/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author rma
 */
public class CerrarMes extends ConexionBD{
    
    private int mes_cierre;
    private int año_cierre;
    private double monto;
    private String id_unidad;
    private int id_gasto;
    private String id_condominio;
    
    
    public int getMes_cierre() {
        return mes_cierre;
    }

    public void setMes_cierre(int mes_cierre) {
        this.mes_cierre = mes_cierre;
    }

    public int getAño_cierre() {
        return año_cierre;
    }

    public void setAño_cierre(int año_cierre) {
        this.año_cierre = año_cierre;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getId_unidad() {
        return id_unidad;
    }

    public void setId_unidad(String id_unidad) {
        this.id_unidad = id_unidad;
    }

    public int getId_gasto() {
        return id_gasto;
    }

    public void setId_gasto(int id_gasto) {
        this.id_gasto = id_gasto;
    }

    public String getId_condominio() {
        return id_condominio;
    }

    public void setId_condominio(String id_condominio) {
        this.id_condominio = id_condominio;
    }
    
    
    
    public boolean registrarGasto(CerrarMes modc) {

        PreparedStatement ps = null;
        Connection con = getConexion();

        String sql = "INSERT INTO detalle_pagos(id_unidad, mes, anio, monto, id_gasto, id_condominio) VALUES (?, ?, ?, ?, ?, ?);";

        try {

            ps = con.prepareStatement(sql);
            ps.setString(1, getId_unidad());
            ps.setInt(2, getMes_cierre());
            ps.setInt(3, getAño_cierre());
            ps.setDouble(4, getMonto());
            ps.setInt(5, getId_gasto());
            ps.setString(6, getId_condominio());
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
    
    public boolean registrar_cuota(CerrarMes modc) {

        PreparedStatement ps = null;
        Connection con = getConexion();

        String sql = "INSERT INTO detalle_cuotas(id_unidad, id_cuota, mes, anio, id_condominio, monto) VALUES (?, ?, ?, ?, ?, ?);";

        try {

            ps = con.prepareStatement(sql);
            ps.setString(1, getId_unidad());
            ps.setInt(2, getId_gasto());
            ps.setInt(3, getMes_cierre());
            ps.setInt(4, getAño_cierre());
            ps.setString(5, getId_condominio());
            ps.setDouble(6, getMonto());
            
            
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
    
    public boolean buscartotal(CerrarMes modc) {

        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection con = getConexion();
        String sql = "SELECT id_unidad, sum(monto) as total FROM detalle_pagos where id_unidad=? and mes=? and anio=? group by id_unidad;";

        try {

            ps = con.prepareStatement(sql);
            ps.setString(1, modc.getId_unidad());
            ps.setInt(2, modc.getMes_cierre());
            ps.setInt(3, modc.getAño_cierre());
            rs = ps.executeQuery();
            if (rs.next()) {

                modc.setMonto(rs.getDouble("total"));
                

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
    
     public boolean buscartotal2(CerrarMes modc) {

        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection con = getConexion();
        String sql = "SELECT id_unidad, sum(monto) as total FROM detalle_cuotas where id_unidad=? and mes=? and anio=? group by id_unidad;";

        try {

            ps = con.prepareStatement(sql);
            ps.setString(1, modc.getId_unidad());
            ps.setInt(2, modc.getMes_cierre());
            ps.setInt(3, modc.getAño_cierre());
            rs = ps.executeQuery();
            if (rs.next()) {

                modc.setMonto(rs.getDouble("total"));
                

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
     
     public boolean guardarsancionpro(CerrarMes modc) {

        PreparedStatement ps = null;
        Connection con = getConexion();

        String sql = "INSERT INTO detalle_sancion(id_unidad, id_sancion, mes, anio, id_condominio, monto) VALUES (?, ?, ?, ?, ?, ?);";

        try {

            ps = con.prepareStatement(sql);
            ps.setString(1, getId_unidad());
            ps.setInt(2, getId_gasto());
            ps.setInt(3, getMes_cierre());
            ps.setInt(4, getAño_cierre());
            ps.setString(5, getId_condominio());
            ps.setDouble(6, getMonto());
            
            
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
     
     public boolean registrar_interes(CerrarMes modc) {

        PreparedStatement ps = null;
        Connection con = getConexion();

        String sql = "INSERT INTO detalle_interes(id_unidad, id_interes, mes, anio, id_condominio, monto) VALUES (?, ?, ?, ?, ?, ?);";

        try {

            ps = con.prepareStatement(sql);
            ps.setString(1, getId_unidad());
            ps.setInt(2, getId_gasto());
            ps.setInt(3, getMes_cierre());
            ps.setInt(4, getAño_cierre());
            ps.setString(5, getId_condominio());
            ps.setDouble(6, getMonto());
            
            
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
    
    
}