/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Clases.FacultadCampus;
import Clases.ProgramaEstudiantes;
import Clases.Programas;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author emanjarres
 */
public class GestionesProgramas extends Conexion 
{
     //Metodo para crear los programas
    public boolean registraProgramas (String nombre, String modalidad, int idFacultad){
        PreparedStatement pst;
        
        try {
            String consulta = "insert into programa (Name_program, Modalidad, Id_faculty) values(?,?,?)";
            pst = (PreparedStatement) getConexion().prepareStatement(consulta);
            
            pst.setString(1, nombre);
            pst.setString(2, modalidad);
            pst.setInt(3, idFacultad);
                        
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
    public ArrayList<FacultadCampus> getFacultadCampus(int x){
        
        ArrayList<FacultadCampus> facultadescampus = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        
        try {
            String consulta = "SELECT * FROM facultad WHERE facultad.Id_campus="+x;
            pst =(PreparedStatement) getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
            
            while(rs.next()){
                facultadescampus.add(new FacultadCampus(
                        rs.getInt("facultad.Id_faculty"),
                        rs.getString("facultad.Name_faculty"),
                        rs.getInt("facultad.Id_campus")
                )                        
                        );
                        }
            
        } catch (SQLException e) {
        }finally{
            try {
                
            } catch (Exception e2) {
                System.out.println("Error de cierre" + e2 );
            }
        }
        
        return facultadescampus;
    }    
    
    //Metodo para mostrar la lista de programas registrados
    public ArrayList<Programas> getProgramas(int x){
        
        ArrayList<Programas> programas = new ArrayList<>();
        PreparedStatement pst ;
        ResultSet rs ;               
        try {
            String consulta = "SELECT * FROM programa WHERE programa.Id_faculty="+x;
            pst =(PreparedStatement) getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
            
            while(rs.next()){
                programas.add(new Programas(
                        rs.getInt("Id_program"),
                        rs.getString("Name_program"),
                        rs.getString("Modalidad"),
                        rs.getInt("Id_faculty")
                ));
            }            
        } catch (SQLException e) {
        }finally{
            try {
                
            } catch (Exception e2) {
                System.out.println("Error de cierre" + e2 );
            }
        }        
        return programas;
    }
    
    //Metodo para mostrar la lista de programas asociados a los estudiantes
    public ArrayList<ProgramaEstudiantes> getProgramasEstudiantes(int x){
        
        ArrayList<ProgramaEstudiantes> programas = new ArrayList<>();
        PreparedStatement pst ;
        ResultSet rs ;               
        try {
            String consulta = "SELECT programa.Id_program, programa.Name_program FROM programa, estudiantes WHERE estudiantes.Id_program=programa.Id_program AND estudiantes.Documento="+x;
            pst =(PreparedStatement) getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
            
            while(rs.next()){
                programas.add(new ProgramaEstudiantes(
                        rs.getInt("programa.Id_program"),
                        rs.getString("programa.Name_program")
                ));
            }            
        } catch (SQLException e) {
        }finally{
            try {
                
            } catch (Exception e2) {
                System.out.println("Error de cierre" + e2 );
            }
        }        
        return programas;
    }    
    
    //Metodo para mostrar la lista de programas registrados
    public ArrayList<Programas> getListaProgramas(){
        
        ArrayList<Programas> programas = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs ;
               
        try {
            String consulta = "SELECT * FROM programa";
            pst =(PreparedStatement) getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
            
            while(rs.next()){
                programas.add(new Programas(
                        rs.getInt("Id_program"),
                        rs.getString("Name_program"),
                        rs.getString("Modalidad"),
                        rs.getInt("Id_faculty")
                ));
            }
            
        } catch (SQLException e) {
        }finally{
            try {
                
            } catch (Exception e2) {
                System.out.println("Error de cierre" + e2 );
            }
        }        
        return programas;        
        
        
}
    
    
    
    
    
    
    
    }
