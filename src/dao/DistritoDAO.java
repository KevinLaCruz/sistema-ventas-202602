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
import to.DistritoTO;

/**
 *
 * @author Kevin La Cruz
 */
public class DistritoDAO implements SistemaInterface<DistritoTO> {

    @Override
    public void insert(DistritoTO objObjeto) throws Exception {
        Connection cn = ConexionMySQL.getInstance().getCn();
        String sql = "CALL sp_insert_distrito(?,?);";
        CallableStatement cs = cn.prepareCall(sql);
        cs.setString(1, objObjeto.getNomb_dist());
        cs.setString(2, objObjeto.getObsv_dist());
        cs.execute();
    }

    @Override
    public void update(DistritoTO objObjeto) throws Exception {
        Connection cn = ConexionMySQL.getInstance().getCn();
        String sql = "CALL sp_update_distrito(?,?,?);";
        CallableStatement cs = cn.prepareCall(sql);
        cs.setInt(1, objObjeto.getId_distrito());
        cs.setString(2, objObjeto.getNomb_dist());
        cs.setString(3, objObjeto.getObsv_dist());
        cs.execute();
    }

    @Override
    public void delete(DistritoTO objObjeto) throws Exception {
        Connection cn = ConexionMySQL.getInstance().getCn();
        String sql = "CALL sp_delete_distrito(?);";
        CallableStatement cs = cn.prepareCall(sql);
        cs.setInt(1, objObjeto.getId_distrito());
        cs.execute();
    }

    @Override
    public ResultSet search(Object objObject) throws Exception {
        Connection cn = ConexionMySQL.getInstance().getCn();
        String nomb_dist = "%" + objObject + "%";
        String sql = "SELECT * FROM v_distrito WHERE nomb_dist LIKE ?;";
        PreparedStatement ps = cn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ps.setString(1, nomb_dist);
        ResultSet rs = ps.executeQuery();
        return rs;
    }

}
