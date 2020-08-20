/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;
import java.sql.*;
/**
 *
 * @author emanjarres
 */
public class Conexion 
{
    private Connection conn;
    public  Connection getConexion()
    {
        String url="jdbc:sqlserver://misc.database.windows.net:1433;database=misc;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";
        try
        {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            
        }catch(ClassNotFoundException e)
        {
            System.out.print("No se pudo establecer la conexion"+e.getMessage());
        }
        try{
            conn=DriverManager.getConnection(url,"administrador","Ispc2020");
        }catch (SQLException e){
            System.out.print("No se pudo establecer la conexion"+e.getMessage());
        }
        
       
        return conn;
    }

    
    
    
}
