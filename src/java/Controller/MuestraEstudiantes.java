/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Clases.Estudiante;
import Modelo.GestionesEstudiantes;

/**
 *
 * @author emanjarres
 */
public class MuestraEstudiantes {
     public String getListaEstudiantes(){
        
        String htmlcode = "";
        
        GestionesEstudiantes le = new GestionesEstudiantes();      
        for (Estudiante e : le.getEstudiantes()) {
            htmlcode += "<option value='"+e.getDocumento()+"'>"+e.getNombres()+"</option>";        
        }
        return htmlcode;
       
    }
     
     
     
}
