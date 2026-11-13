/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import interfaz.SistemaInterface;
import java.sql.ResultSet;
import to.FacturaTO;
import java.sql.*;
import conexion.ConexionMySQL;

/**
 *
 * @author Kevin La Cruz
 */
public class FacturaDAO implements SistemaInterface<FacturaTO>{

    @Override
    public void insert(FacturaTO objObjeto) throws Exception {
        Connection cn=ConexionMySQL.getInstance().getCn();
        String sql="CALL sp_insert_factura(?,?,?,?,?);";
        CallableStatement cs=cn.prepareCall(sql);
        cs.setInt(1, objObjeto.getId_cliente());
        cs.setInt(2, objObjeto.getId_empleado());
        cs.setDouble(3, objObjeto.getStot_fact());
        cs.setDouble(4, objObjeto.getIgv_fact());
        cs.setDouble(5, objObjeto.getTota_fact());
        cs.execute();
    }

    @Override
    public void update(FacturaTO objObjeto) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(FacturaTO objObjeto) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ResultSet search(Object objObject) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
