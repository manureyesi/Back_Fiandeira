/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author manureyesi
 */
public class consultas {
    
    public ResultSet selectDB(String tabla, String condicion) throws SQLException, ClassNotFoundException{
        
        String sql = "SELECT * FROM "+tabla+" WHERE "+condicion;

        conexion con = new conexion();

        Statement st = con.getCn().createStatement();
        ResultSet rs = st.executeQuery(sql);

        return rs;
    
    }
    
}
