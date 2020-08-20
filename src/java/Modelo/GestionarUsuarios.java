/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Clases.Usuarios;

/**
 *
 * @author emanjarres
 */
public class GestionarUsuarios extends Conexion
{
    
    //Metodo de autenticación para el administrador
    public boolean autenticacion (String usuario, String contrasena){
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            String consulta = "select * from usuarios WHERE Mail_users = ? and Pass_users = ?";
            pst = (PreparedStatement) getConexion().prepareStatement(consulta);
            pst.setString(1, usuario);
            pst.setString(2, contrasena);
            
            rs = pst.executeQuery();
            
            if(rs.absolute(1)){
                return true;
            }
            
        } catch (SQLException e) {
            System.out.println("Error 1: " + e);
        }finally{
            try {
                if(getConexion() != null) getConexion().close();
                if(pst != null) pst.close();
                if(rs != null) rs.close();
            } catch (SQLException e) {
                System.out.println("Error 2: " + e);
            }
        }        
        return false;
    }
    
    //Metodo para mostrar la lista de campus registrados
    public ArrayList<Usuarios> getUsuarios(int x){
        
        ArrayList<Usuarios> usuarios = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
               
        try {
            String consulta = "SELECT * FROM usuarios WHERE Type_users="+x;
            pst =(PreparedStatement) getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
            
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
        } catch (SQLException e) {
        }finally{
            try {
                
            } catch (Exception e2) {
                System.out.println("Error de cierre" + e2 );
            }
        }
        
        return usuarios;
    }
    //md5
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
