/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author 6001111
 */
public class conexion {
    
    public Connection cn;
    
    private String url = "jdbc:mysql://pruebas.fiandeira.es/";
    private String db = "Fiandeira";
    private String user = "fiandeira";
    private String pass = "QuOFHlYBMwpzTsp0";

    public conexion() throws SQLException, ClassNotFoundException {
        
        Class.forName("com.mysql.jdbc.Driver");
        
        cn = DriverManager.getConnection(this.url+this.db, this.user, this.pass);
        
    }

    public Connection getCn() {
        return cn;
    }
    
}
