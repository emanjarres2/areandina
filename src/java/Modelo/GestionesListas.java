/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Clases.Factor;
import Clases.Remision;
import Clases.Semestre;
import Clases.TipoMonitor;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author emanjarres
 */
public class GestionesListas extends Conexion
{
    //Metodo para mostrar la lista de factores
    public ArrayList<Factor> getFactor(){        
        ArrayList<Factor> factores = new ArrayList<>();
        PreparedStatement pst ;
        ResultSet rs ;        
        try {
            String consulta = "SELECT * FROM factor_asociado";
            pst = (PreparedStatement) getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();            
            while (rs.next()) {
                factores.add(new Factor(
                        rs.getInt("Id_factor"),
                        rs.getString("Name_factor"),
                        rs.getString("Observaciones")
                ));                
            }  
        } catch (SQLException e) {
                System.out.println("Error de cierre" + e );
        }finally{
            try {
                
            } catch (Exception e2) {
                System.out.println("Error de cierre" + e2 );
            }
        }
        return factores;
    }
    
    //Metodo para mostrar la lista de semestres
    public ArrayList<Semestre> getSemestre(){
        
        ArrayList<Semestre> semestre = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs ;
        
        try {
            String consulta = "SELECT * FROM semestre";
            pst = (PreparedStatement) getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
            
            while (rs.next()) {
                semestre.add(new Semestre(
                        rs.getInt("Id_semestre"),
                        rs.getString("nombre")                        
                ));                
            }  
        } catch (SQLException e) {
                System.out.println("Error de cierre" + e );
        }finally{
            try {
                
            } catch (Exception e2) {
                System.out.println("Error de cierre" + e2 );
            }
        }
        return semestre;
    }
    
    //Metodo para mostrar la lista de tipo de monitor
    public ArrayList<TipoMonitor> getMonitor(){
        
        ArrayList<TipoMonitor> monitor = new ArrayList<>();
        PreparedStatement pst ;
        ResultSet rs ;
        
        try {
            String consulta = "SELECT * FROM tipotutor WHERE Id_tipo=1 OR Id_tipo=2 OR Id_tipo=5";
            pst =(PreparedStatement) getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
            
            while (rs.next()) {
                monitor.add(new TipoMonitor(
                        rs.getInt("Id_tipo"),
                        rs.getString("nombre")                        
                ));                
            }  
        } catch (SQLException e) {
                System.out.println("Error de cierre" + e );
        }finally{
            try {
                
            } catch (Exception e2) {
                System.out.println("Error de cierre" + e2 );
            }
        }
        return monitor;
    } 
    
    //Metodo para mostrar la lista de tipo de remisiones
    public ArrayList<Remision> getRemision(){
        
        ArrayList<Remision> remision = new ArrayList<>();
        PreparedStatement pst ;
        ResultSet rs ;
        
        try {
            String consulta = "SELECT * FROM remision";
            pst =(PreparedStatement) getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
            
            while (rs.next()) {
                remision.add(new Remision(
                        rs.getInt("Id_remision"),
                        rs.getString("Nombre_remision")                        
                ));                
            }  
        } catch (SQLException e) {
                System.out.println("Error de cierre" + e );
        }finally{
            try {
                
            } catch (Exception e2) {
                System.out.println("Error de cierre" + e2 );
            }
        }
        return remision;
    } 
    
    //Metodo para mostrar la lista de usuario administrativo
    public ArrayList<TipoMonitor> getUsuario(){
        
        ArrayList<TipoMonitor> monitor = new ArrayList<>();
        PreparedStatement pst ;
        ResultSet rs ;
        
        try {
            String consulta = "SELECT * FROM tipotutor WHERE Id_tipo=3 OR Id_tipo=4";
            pst =(PreparedStatement) getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
            
            while (rs.next()) {
                monitor.add(new TipoMonitor(
                        rs.getInt("Id_tipo"),
                        rs.getString("nombre")                        
                ));                
            }  
        } catch (SQLException e) {
                System.out.println("Error de cierre" + e );
        }finally{
            try {
                
            } catch (Exception e2) {
                System.out.println("Error de cierre" + e2 );
            }
        }
        return monitor;
    }
    
    public String cantMonitorAula(){
       PreparedStatement pst = null;
       ResultSet rs = null; 
       
       String cantidad = null; 
        try {
            String consulta = "SELECT COUNT(*) FROM usuarios WHERE usuarios.Type_users=1;";
            pst =(PreparedStatement) getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();            
            while(rs.next()){
                cantidad = rs.getString(1);
            }           
        } catch (SQLException e) {
                System.out.println("Error 3: " + e);
        }finally{
            try {                
                if(pst != null) pst.close(); 
                if(rs != null) rs.close();
            } catch (SQLException e) {
                System.out.println("Error 4: " + e);
            }
        }        
      return cantidad;
    }
    
    public String cantMonitorAcademico(){
       PreparedStatement pst = null;
       ResultSet rs = null; 
       
       String cantidad = null; 
        try {
            String consulta = "SELECT COUNT(*) FROM usuarios WHERE usuarios.Type_users=2;";
            pst =(PreparedStatement) getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();            
            while(rs.next()){
                cantidad = rs.getString(1);
            }           
        } catch (SQLException e) {
                System.out.println("Error 3: " + e);
        }finally{
            try {                
                if(pst != null) pst.close(); 
                if(rs != null) rs.close();
            } catch (SQLException e) {
                System.out.println("Error 4: " + e);
            }
        }        
      return cantidad;
    }
    
    public String cantMonitorVirtual(){
       PreparedStatement pst = null;
       ResultSet rs = null; 
       
       String cantidad = null; 
        try {
            String consulta = "SELECT COUNT(*) FROM usuarios WHERE usuarios.Type_users=5;";
            pst =(PreparedStatement) getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();            
            while(rs.next()){
                cantidad = rs.getString(1);
            }           
        } catch (SQLException e) {
                System.out.println("Error 3: " + e);
        }finally{
            try {                
                if(pst != null) pst.close(); 
                if(rs != null) rs.close();
            } catch (SQLException e) {
                System.out.println("Error 4: " + e);
            }
        }        
      return cantidad;
    }
    
    public String cantTutorias(){
       PreparedStatement pst = null;
       ResultSet rs = null; 
       
       String cantidad = null; 
        try {
            String consulta = "SELECT COUNT(*) FROM tutorias;";
            pst =(PreparedStatement) getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();            
            while(rs.next()){
                cantidad = rs.getString(1);
            }           
        } catch (SQLException e) {
                System.out.println("Error 3: " + e);
        }finally{
            try {                
                if(pst != null) pst.close(); 
                if(rs != null) rs.close();
            } catch (SQLException e) {
                System.out.println("Error 4: " + e);
            }
        }        
      return cantidad;
    }
    
    public String cantTutoriasRealizadas(){
       PreparedStatement pst = null;
       ResultSet rs = null; 
       
       String cantidad = null; 
        try {
            String consulta = "SELECT COUNT(*) FROM tutorias WHERE estado='Cerrado'";
            pst =(PreparedStatement) getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();            
            while(rs.next()){
                cantidad = rs.getString(1);
            }           
        } catch (SQLException e) {
                System.out.println("Error 3: " + e);
        }finally{
            try {                
                if(pst != null) pst.close(); 
                if(rs != null) rs.close();
            } catch (SQLException e) {
                System.out.println("Error 4: " + e);
            }
        }        
      return cantidad;
    }
    
    public String cantTutoriasPendientes(){
       PreparedStatement pst = null;
       ResultSet rs = null; 
       
       String cantidad = null; 
        try {
            String consulta = "SELECT COUNT(*) FROM tutorias WHERE estado='abierto'";
            pst =(PreparedStatement) getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();            
            while(rs.next()){
                cantidad = rs.getString(1);
            }           
        } catch (SQLException e) {
                System.out.println("Error 3: " + e);
        }finally{
            try {                
                if(pst != null) pst.close(); 
                if(rs != null) rs.close();
            } catch (SQLException e) {
                System.out.println("Error 4: " + e);
            }
        }        
      return cantidad;
    }   
    
    public String cantEstudiantesRegistrados(){
       PreparedStatement pst = null;
       ResultSet rs = null; 
       
       String cantidad = null; 
        try {
            String consulta = "SELECT COUNT(*) FROM estudiantes;";
            pst =(PreparedStatement) getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();            
            while(rs.next()){
                cantidad = rs.getString(1);
            }           
        } catch (SQLException e) {
                System.out.println("Error 3: " + e);
        }finally{
            try {                
                if(pst != null) pst.close(); 
                if(rs != null) rs.close();
            } catch (SQLException e) {
                System.out.println("Error 4: " + e);
            }
        }        
      return cantidad;
      } 
}
