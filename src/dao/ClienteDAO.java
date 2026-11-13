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
import to.ClienteTO;

/**
 *
 * @author Kevin La Cruz
 */
public class ClienteDAO implements SistemaInterface<ClienteTO> {

    @Override
    public void insert(ClienteTO objObjeto) throws Exception {
        Connection cn = ConexionMySQL.getInstance().getCn();
        String sql = "CALL sp_insert_cliente(?,?,?,?,?,?,?);";
        CallableStatement cs = cn.prepareCall(sql);
        cs.setString(1, objObjeto.getRuc_clie());
        cs.setString(2, objObjeto.getNomb_clie());
        cs.setString(3, objObjeto.getDire_clie());
        cs.setInt(4, objObjeto.getId_distrito());
        cs.setString(5, objObjeto.getTelf_clie());
        cs.setString(6, objObjeto.getCelu_clie());
        cs.setString(7, objObjeto.getObsv_clie());
        cs.execute();
    }

    @Override
    public void update(ClienteTO objObjeto) throws Exception {
        Connection cn = ConexionMySQL.getInstance().getCn();
        String sql = "CALL sp_update_cliente(?,?,?,?,?,?,?,?);";
        CallableStatement cs = cn.prepareCall(sql);
        cs.setInt(1, objObjeto.getId_cliente());
        cs.setString(2, objObjeto.getRuc_clie());
        cs.setString(3, objObjeto.getNomb_clie());
        cs.setString(4, objObjeto.getDire_clie());
        cs.setInt(5, objObjeto.getId_distrito());
        cs.setString(6, objObjeto.getTelf_clie());
        cs.setString(7, objObjeto.getCelu_clie());
        cs.setString(8, objObjeto.getObsv_clie());
        cs.execute();
    }

    @Override
    public void delete(ClienteTO objObjeto) throws Exception {
        Connection cn = ConexionMySQL.getInstance().getCn();
        String sql = "CALL sp_delete_cliente(?);";
        CallableStatement cs = cn.prepareCall(sql);
        cs.setInt(1, objObjeto.getId_cliente());
        cs.execute();
    }

    @Override
    public ResultSet search(Object objObject) throws Exception {
        Connection cn = ConexionMySQL.getInstance().getCn();
        String nomb_clie = "%" + objObject + "%";
        String sql = "SELECT * FROM v_cliente WHERE nomb_clie LIKE ?;";
        PreparedStatement ps = cn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ps.setString(1, nomb_clie);
        ResultSet rs = ps.executeQuery();
        return rs;
    }

}
