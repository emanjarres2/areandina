/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Clases.Facultad;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author emanjarres
 */
public class GestionesFacultades extends Conexion {
     public boolean registraFacultades (String nombre, int id){
        PreparedStatement pst = null;
        
        try {
            String consulta = "INSERT INTO facultad (Name_faculty, Id_campus) values(?,?)";
            pst = (PreparedStatement) getConexion().prepareStatement(consulta);
            
            pst.setString(1, nombre);
            pst.setInt(2, id);
            
            if(pst.executeUpdate() ==1){
                return true;
            }
            
        } catch (SQLException e) {
            System.out.println("Error 1" + e);
        }finally{
            try {
                
            } catch (Exception e2) {
                System.out.println("Error de cierre" + e2 );
            }
        }         
        return false;
    }
    
    //Metodo para mostrar la lista de campus registrados
    public ArrayList<Facultad> getFacultad(int x){
        
        ArrayList<Facultad> facultades = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
                        
        try {            
            String consulta = "SELECT * FROM facultad WHERE facultad.Id_campus="+x;
            pst =(PreparedStatement) getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
                        
            //Ahora con el while se recorre la consulta.
            while(rs.next()){
                facultades.add(new Facultad(
                        rs.getInt("Id_faculty"),
                        rs.getString("Name_faculty"),
                        rs.getInt("Id_campus") 
                    )
                );
            } 
            
        } catch (SQLException e) {
        }finally{
            try {
                if(getConexion() != null) getConexion().close();
                if(pst != null) pst.close(); 
                if(rs != null) rs.close();
            } catch (SQLException e) {
                System.out.println("Error 4: " + e);
            }
        }
        
        
        return facultades;
    }
}
