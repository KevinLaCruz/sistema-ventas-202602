/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import conexion.ConexionMySQL;
import interfaz.SistemaInterface;
import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import to.ProductoTO;

/**
 *
 * @author Kevin La Cruz
 */
public class ProductoDAO implements SistemaInterface<ProductoTO> {

    @Override
    public void insert(ProductoTO objObjeto) throws Exception {
        Connection cn = ConexionMySQL.getInstance().getCn();
        String sql = "CALL sp_insert_producto(?,?,?);";
        CallableStatement cs = cn.prepareCall(sql);
        cs.setString(1, objObjeto.getNomb_prod());
        cs.setDouble(2, objObjeto.getPrec_prod());
        cs.setString(3, objObjeto.getObsv_prod());
        cs.execute();
    }

    @Override
    public void update(ProductoTO objObjeto) throws Exception {
        Connection cn = ConexionMySQL.getInstance().getCn();
        String sql = "CALL sp_update_producto(?,?,?,?);";
        CallableStatement cs = cn.prepareCall(sql);
        cs.setInt(1, objObjeto.getId_producto());
        cs.setString(2, objObjeto.getNomb_prod());
        cs.setDouble(3, objObjeto.getPrec_prod());
        cs.setString(4, objObjeto.getObsv_prod());
        cs.execute();
    }

    @Override
    public void delete(ProductoTO objObjeto) throws Exception {
        Connection cn = ConexionMySQL.getInstance().getCn();
        String sql = "CALL sp_delete_producto(?);";
        CallableStatement cs = cn.prepareCall(sql);
        cs.setInt(1, objObjeto.getId_producto());
        cs.execute();
    }

    @Override
    public ResultSet search(Object objObject) throws Exception {
        Connection cn = ConexionMySQL.getInstance().getCn();
        String nomb_prod = "%" + objObject + "%";
        String sql = "SELECT * FROM v_producto WHERE nomb_prod LIKE ?;";
        PreparedStatement ps = cn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ps.setString(1, nomb_prod);
        ResultSet rs = ps.executeQuery();
        return rs;
    }

}
