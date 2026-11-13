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
import to.EmpleadoTO;

/**
 *
 * @author Kevin La Cruz
 */
public class EmpleadoDAO implements SistemaInterface<EmpleadoTO> {

    @Override
    public void insert(EmpleadoTO objObjeto) throws Exception {
        Connection cn = ConexionMySQL.getInstance().getCn();
        String sql = "CALL sp_insert_empleado(?,?,?,?,?,?,?,?,?,?,?,?);";
        CallableStatement cs = cn.prepareCall(sql);
        cs.setString(1, objObjeto.getDni_empl());
        cs.setString(2, objObjeto.getNomb_empl());
        cs.setString(3, objObjeto.getApat_empl());
        cs.setString(4, objObjeto.getAmat_empl());
        cs.setString(5, objObjeto.getSexo_empl());
        cs.setString(6, objObjeto.getDire_empl());
        cs.setInt(7, objObjeto.getId_distrito());
        cs.setString(8, objObjeto.getTelf_empl());
        cs.setString(9, objObjeto.getCelu_empl());
        cs.setString(10, objObjeto.getEmai_empl());
        cs.setString(11, objObjeto.getObsv_empl());
        cs.setString(12, objObjeto.getFoto_empl());
        cs.execute();
    }

    @Override
    public void update(EmpleadoTO objObjeto) throws Exception {
        Connection cn = ConexionMySQL.getInstance().getCn();
        String sql = "CALL sp_update_empleado(?,?,?,?,?,?,?,?,?,?,?,?,?);";
        CallableStatement cs = cn.prepareCall(sql);
        cs.setInt(1, objObjeto.getId_empleado());
        cs.setString(2, objObjeto.getDni_empl());
        cs.setString(3, objObjeto.getNomb_empl());
        cs.setString(4, objObjeto.getApat_empl());
        cs.setString(5, objObjeto.getAmat_empl());
        cs.setString(6, objObjeto.getSexo_empl());
        cs.setString(7, objObjeto.getDire_empl());
        cs.setInt(8, objObjeto.getId_distrito());
        cs.setString(9, objObjeto.getTelf_empl());
        cs.setString(10, objObjeto.getCelu_empl());
        cs.setString(11, objObjeto.getEmai_empl());
        cs.setString(12, objObjeto.getObsv_empl());
        cs.setString(13, objObjeto.getFoto_empl());
        cs.execute();
    }

    @Override
    public void delete(EmpleadoTO objObjeto) throws Exception {
        Connection cn = ConexionMySQL.getInstance().getCn();
        String sql = "CALL sp_delete_empleado(?);";
        CallableStatement cs = cn.prepareCall(sql);
        cs.setInt(1, objObjeto.getId_empleado());
        cs.execute();
    }

    @Override
    public ResultSet search(Object objObject) throws Exception {
        Connection cn = ConexionMySQL.getInstance().getCn();
        String nomb_empl = "%" + objObject + "%";
        String sql = "SELECT * FROM v_empleado WHERE nomb_empl LIKE ?;";
        PreparedStatement ps = cn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ps.setString(1, nomb_empl);
        ResultSet rs = ps.executeQuery();
        return rs;
    }

}
