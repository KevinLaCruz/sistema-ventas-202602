/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import interfaz.SistemaInterface;
import java.sql.ResultSet;
import to.DetalleFacturaTO;
import java.sql.*;
import conexion.ConexionMySQL;

/**
 *
 * @author Kevin La Cruz
 */
public class DetalleFacturaDAO implements SistemaInterface<DetalleFacturaTO>{

    @Override
    public void insert(DetalleFacturaTO objObjeto) throws Exception {
        Connection cn=ConexionMySQL.getInstance().getCn();
        String sql="CALL sp_insert_detalle_factura(?,?,?,?,?);";
        CallableStatement cs=cn.prepareCall(sql);
        cs.setInt(1, objObjeto.getId_factura());
        cs.setInt(2, objObjeto.getId_producto());
        cs.setDouble(3, objObjeto.getPrec_prod());
        cs.setInt(4, objObjeto.getCantidad());
        cs.setDouble(5, objObjeto.getImporte());
        cs.execute();
    }

    @Override
    public void update(DetalleFacturaTO objObjeto) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(DetalleFacturaTO objObjeto) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ResultSet search(Object objObject) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
