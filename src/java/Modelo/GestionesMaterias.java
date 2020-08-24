/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Clases.Materias;
import Clases.MateriasEstudiante;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author emanjarres
 */
public class GestionesMaterias extends Conexion {
     
    //metodo para crear las materias
    public boolean registarMaterias(String nombre, int id){
        PreparedStatement pst;
        
        try {
            String consulta ="insert into materia (Nombre_clase, Id_programa) values(?,?)";
            pst = (PreparedStatement) getConexion().prepareStatement(consulta);
            
            pst.setString(1, nombre);
            pst.setInt(2, id);
            
            if(pst.executeUpdate() == 1){
               
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
    
    //Metodo para borrar registros
    public boolean borrarMaterias(){
        PreparedStatement pst ;
        
        try {
            String consulta = "DELETE FROM materia WHERE Id_clase = ?";
            pst = (PreparedStatement) getConexion().prepareStatement(consulta);
            
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
       
    //Metodo para consulta de registros en materia
    public ArrayList<Materias> getMaterias(){
        
        ArrayList<Materias> materias = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs ;
        
        try {
            String consulta = "select Id_clase, Nombre_clase, Id_programa from materia";
            pst = (PreparedStatement) getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
            
            while (rs.next()) {
                materias.add(new Materias(
                        rs.getInt("Id_clase"),
                        rs.getString("Nombre_clase"),
                        rs.getInt("Id_programa")
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
        return materias;
    }
    
    public ArrayList<Materias> getMateria(int x){
        
        ArrayList<Materias> materias = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs ;
        
        try {
            String consulta = "SELECT * FROM materia WHERE Id_programa="+x;
            pst = (PreparedStatement) getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
            
            while (rs.next()) {
                materias.add(new Materias(
                        rs.getInt("Id_clase"),
                        rs.getString("Nombre_clase"),
                        rs.getInt("Id_programa")
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
        return materias;
    }
    
    //Metodo para consulta de registros de las materias con respecto a los estudiantes
    public ArrayList<MateriasEstudiante> getMateriasEstudiantes(int x){
        
        ArrayList<MateriasEstudiante> materiasEstudiantes = new ArrayList<>();
        PreparedStatement pst ;
        ResultSet rs ;
        
        try {
            String consulta = "SELECT materia.Id_clase, materia.Nombre_clase \n" +
"                    FROM materia, programa, estudiantes, tutorias \n" +
"                    WHERE materia.Id_programa=programa.Id_program AND estudiantes.Id_program=programa.Id_program AND estudiantes.Documento=tutorias.Id_estudiante AND tutorias.Id_tutorias="+x;
            pst = (PreparedStatement) getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
            
            while (rs.next()) {
                materiasEstudiantes.add(new MateriasEstudiante(
                        rs.getInt("Id_clase"),
                        rs.getString("Nombre_clase")
                                ));                
            }            
        } catch (SQLException e) {
                System.out.println("Error de cierre: " + e );
        }finally{
            try {
                
            } catch (Exception e2) {
                System.out.println("Error de cierre" + e2 );
            }
        }
        return materiasEstudiantes;
    
    }
    
//    public static void main(String[] args) {
//        GestionesMaterias gt = new GestionesMaterias();
//        System.out.print(gt.getMateriasEstudiantes(3));
//        
//    }
    
    
}
