/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package conexion;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Kevin La Cruz
 */
public class ConexionMySQL {

    private static ConexionMySQL instance = null;

    public static ConexionMySQL getInstance() throws Exception {
        if (instance == null) {
            instance = new ConexionMySQL();
        }
        return instance;
    }
    private Connection cn = null;

    public ConexionMySQL() throws Exception {
        String url = "jdbc:mysql://localhost:3307/ventas_202602";
        cn = DriverManager.getConnection(url, "root", "");
    }

    public Connection getCn() {
        return cn;
    }

    @Override
    protected void finalize() throws Throwable {
        cn.close();
        cn = null;
        super.finalize();
    }

}
