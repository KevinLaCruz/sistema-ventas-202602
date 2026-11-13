/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package interfaz;

import java.sql.*;

/**
 *
 * @author Kevin La Cruz
 */
public interface SistemaInterface<Objeto> {

    public void insert(Objeto objObjeto) throws Exception;

    public void update(Objeto objObjeto) throws Exception;

    public void delete(Objeto objObjeto) throws Exception;

    public ResultSet search(Object objObject) throws Exception;
}
