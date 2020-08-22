/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Clases.FacultadCampus;
import Modelo.GestionesProgramas;

/**
 *
 * @author emanjarres
 */
public class MuestraFacultades {
    //Metodo para enviar el nombre y el id de los campus para la vista de crear las facultades
    public String getNombreCampus(int x){
        
        String htmlcode1 = "";        
        GestionesProgramas glf = new GestionesProgramas();        
        htmlcode1 = glf.getFacultadCampus(x).stream().map(fc -> "<option value='"+fc.getId_facultad()+"'>"+fc.getNombre_facultad()+"</option> ").reduce(htmlcode1, String::concat);
        return htmlcode1;
    }      
    
    public String getListaFacultades(int campus){        
        String htmlcode2 = "";        
        GestionesProgramas glf = new GestionesProgramas();        
        htmlcode2 = glf.getFacultadCampus(campus).stream().filter(f -> (f.getId_campus() == campus )).map(f -> "<option value='"+f.getId_facultad()+"'>"+f.getNombre_facultad()+"</option> ").reduce(htmlcode2, String::concat);
        return htmlcode2;        
    }
}
