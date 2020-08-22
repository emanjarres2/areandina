/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Clases.ReporteResultado;
import Clases.Resultado;
import Clases.Tutorias;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author emanjarres
 */
public class GestionesTutorias extends Conexion {
    //Metodo para mostrar la lista de campus registrados
    public ArrayList<Tutorias> getTutorias(){
        
        ArrayList<Tutorias> tutorias = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
               
        try {
            String consulta = "SELECT tutorias.Id_tutorias, tutorias.fecha, estudiantes.Name_estudiantes, tutorias.Id_programa, tutorias.semestre, tutorias.Id_factor, tutorias.Id_tutor, tutorias.observaciones, tutorias.estado \n" +
                               "FROM tutorias, estudiantes \n" +
                               "WHERE tutorias.Id_estudiante=estudiantes.Documento AND tutorias.estado='abierto' ";
            pst =(PreparedStatement) getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
            
            while(rs.next()){
                tutorias.add(new Tutorias(
                        rs.getInt("Id_tutorias"),
                        rs.getDate("fecha"),                        
                        rs.getString("Name_estudiantes"),
                        rs.getInt("Id_programa"),
                        rs.getInt("semestre"),
                        rs.getInt("Id_factor"),
                        rs.getInt("Id_tutor"),   
                        rs.getString("observaciones"), 
                        rs.getString("estado") 
                ));
            }
        } catch (SQLException e) {
        }finally{
            try {
                
            } catch (Exception e2) {
                System.out.println("Error de cierre" + e2 );
            }
        }
        
        return tutorias;
    }
    
    //Metodo para actualizar tutorias asignadas
    public int actualizarTutorias(Resultado r){
        PreparedStatement pst = null;
        ResultSet rs = null;
        int resultado = 0;
        
            try {
                String consulta = "INSERT INTO resultado (fecha, asignatura, observaciones, nombre, ruta) VALUES(?,?,?,?,?,?)";
                pst = (PreparedStatement) getConexion().prepareStatement(consulta);
                                
                pst.setInt(1, r.getId());
                pst.setDate(2, r.getFecha());
                pst.setInt(3, r.getAsignatura());
                pst.setString(4, r.getObservaciones());
                pst.setString(5, r.getNombre());
                pst.setString(6, r.getRuta());
                
                pst.executeUpdate();                

            } catch (SQLException e) {
                System.out.print("Error: " + e);                
            } finally {
                try {
                    if (pst != null) {
                        pst.close();
                        
                    }
                    if (rs != null) {
                        rs.close();
                    }
                } catch (SQLException e) {
                    
                }
            }        
        return resultado;
    }
    
    //Metodo para guardar desde el formario de reporte de tutorias
    public int repotarTutorias(Resultado r){
        PreparedStatement pst = null;
        ResultSet rs = null;
        int resultado = 0;
        
            try {
                String consulta = "INSERT INTO resultado (Id_tutoria, remision, fecha, asignatura, observa, nombre, ruta, Id_alumno) VALUES(?,?,?,?,?,?,?,?)";
                pst = (PreparedStatement) getConexion().prepareStatement(consulta);
        
                pst.setInt(1, r.getIdTutoria());
                pst.setInt(2, r.getRemision());
                pst.setDate(3, r.getFecha());
                pst.setInt(4, r.getAsignatura());
                pst.setString(5, r.getObservaciones());
                pst.setString(6, r.getNombre());
                pst.setString(7, r.getRuta());
                pst.setString(8, r.getIdEstudiante());
                
                pst.executeUpdate();                

            } catch (SQLException e) {
                System.out.print("Error: " + e);                
            } finally {
                try {
                    if (pst != null) {
                        pst.close();
                        
                    }
                    if (rs != null) {
                        rs.close();
                    }
                } catch (SQLException e) {
                    
                }
            }        
        return resultado;
    }
    
    //Metodo para mostrar la lista de campus registrados
    public ArrayList<ReporteResultado> getResultadoTutorias(){
        
        ArrayList<ReporteResultado> tutorias = new ArrayList<>();
        PreparedStatement pst ;
        ResultSet rs;
               
        try {
            String consulta = "SELECT tutorias.Id_tutorias, estudiantes.Name_estudiantes, factor_asociado.Name_factor, usuarios.Name_users, tutorias.observaciones, resultado.observaciones, resultado.nombre, resultado.ruta FROM tutorias, estudiantes, factor_asociado, usuarios, resultado WHERE tutorias.Id_estudiante=estudiantes.Documento AND tutorias.Id_factor=factor_asociado.Id_factor AND tutorias.Id_tutor=usuarios.Id_usuarios AND resultado.Id_resultado=tutorias.Id_tutorias;";
            pst =(PreparedStatement) getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
            
            while(rs.next()){
                tutorias.add(new ReporteResultado(
                        rs.getInt("Id_tutorias"),
                        rs.getString("Name_estudiantes"),                        
                        rs.getString("Name_factor"),
                        rs.getString("Name_users"),
                        rs.getString("obervaciones"),
                        rs.getString("observaciones"),
                        rs.getString("nombre"),   
                        rs.getString("ruta")                        
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
        return tutorias;
    }
    
    
     
}
