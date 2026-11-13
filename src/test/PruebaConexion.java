/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import java.sql.Connection;
import conexion.ConexionMySQL;

/**
 *
 * @author Kevin La Cruz
 */
public class PruebaConexion {

    public static void main(String[] args) {
        try {
            Connection cn = ConexionMySQL.getInstance().getCn();
            System.out.println("Conexion establecida.");
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }
}
