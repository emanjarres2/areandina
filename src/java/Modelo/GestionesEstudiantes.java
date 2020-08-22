/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;
import Clases.Estudiante;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author emanjarres
 */
public class GestionesEstudiantes extends Conexion{
    
    //Metodo para mostrar la lista de campus registrados
    public ArrayList<Estudiante> getEstudiantes(){        
        ArrayList<Estudiante> estudiante = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;                        
        try {            
            String consulta = "Select * from estudiantes";
            pst =(PreparedStatement) getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();                        
            
            while(rs.next()){
                estudiante.add(new Estudiante(
                        rs.getInt("Id_estudiante"),
                        rs.getString("Name_estudiantes"),
                        rs.getString("Mail_users"),
                        rs.getString("Phone_users"),
                        rs.getString("Estado_usuario"),
                        rs.getInt("Id_campus"), 
                        rs.getInt("Id_faculty"),
                        rs.getInt("Id_program"),
                        rs.getString("Semestre"),
                        rs.getString("Modalidad"),
                        rs.getInt("Documento"),
                        rs.getString("codigo_estudiante")
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
        return estudiante;
     }

    public String getListaEstudiantes(){
        
        String htmlcode = "";       
        GestionesEstudiantes le = new GestionesEstudiantes();        
        for (Estudiante e : le.getEstudiantes()) {
            htmlcode += "<option value='"+e.getCodigo()+"'>"+e.getNombres()+"</option> ";        
        }return htmlcode;
    }



}
