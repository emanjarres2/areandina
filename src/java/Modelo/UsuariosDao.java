/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Clases.Usuarios;

/**
 *
 * @author emanjarres
 */
public class UsuariosDao{
   Connection conn ;
   Conexion cn = new Conexion();
   PreparedStatement ps;
   ResultSet rs;
    
    //Metodo de autenticación para el administrador
    public boolean autenticacion (String usuario, String contrasena){
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            String consulta = "Select * FROM usuarios WHERE Mail_users = ? AND Pass_users= ?";
            conn=cn.getConexion();
            ps=(PreparedStatement)conn.prepareStatement(consulta);
            rs=ps.executeQuery(consulta);
                        
            ps.setString(1, usuario);
            ps.setString(2, contrasena);
            
            rs = pst.executeQuery();
            
            if(rs.absolute(1)){
                return true;
            }
            
        } catch (SQLException e) {
            System.out.println("Error 1: " + e);
        }finally{
            try {
                if(cn.getConexion() != null) cn.getConexion().close();
                if(pst != null) pst.close();
                if(rs != null) rs.close();
            } catch (SQLException e) {
                System.out.println("Error 2: " + e);
            }
        }        
        return false;
    }
    
    public ArrayList<Usuarios> getMonitores(){
       ArrayList<Usuarios> usuarios = new ArrayList<>(); 
       try{
             String consulta="SELECT * FROM usuarios WHERE Type_users=1";
             conn=cn.getConexion();
             ps=(PreparedStatement)conn.prepareStatement(consulta);
             rs=ps.executeQuery(consulta);
             while(rs.next()){
                 usuarios.add(new Usuarios(
                      rs.getInt("Id_usuarios"),
                      rs.getString("Name_users"),
                      rs.getString("Mail_users"),
                      rs.getString("Pass_users"),
                      rs.getString("Phone_users"),
                      rs.getInt("Type_users") 
                 )); 
             }
         }catch (SQLException e) {
        }finally{
            try {
                
            } catch (Exception e2) {
                System.out.println("Error de cierre" + e2 );
            }
        }        
        return usuarios; 
    }
    
    
     public ArrayList<Usuarios> getUsuarios(){
         ArrayList<Usuarios> usuarios = new ArrayList<>();
         try{
             String consulta="SELECT * FROM usuarios";
             conn=cn.getConexion();
             ps=(PreparedStatement)conn.prepareStatement(consulta);
             rs=ps.executeQuery(consulta);
             while(rs.next()){
                 usuarios.add(new Usuarios(
                      rs.getInt("Id_usuarios"),
                      rs.getString("Name_users"),
                      rs.getString("Mail_users"),
                      rs.getString("Pass_users"),
                      rs.getString("Phone_users"),
                      rs.getInt("Type_users")                      
                 ));
             }
         }catch (SQLException e) {
        }finally{
            try {
                
            } catch (Exception e2) {
                System.out.println("Error de cierre" + e2 );
            }
        }        
        return usuarios;
     }
    
     public String getEncriptacion(String input){
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] encBytes = md.digest(input.getBytes());
            BigInteger numero = new BigInteger(1, encBytes);
            String encString = numero.toString(16);
            while (encString.length()<32) {
                encString = "0" + encString;
            }
            return encString;
        } catch (NoSuchAlgorithmException e) {
            throw (new RuntimeException(e));
        }
    }
    
    
          
        
    
  
   
}

   

