/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Clases.Tutorias;
import Modelo.GestionesTutorias;

/**
 *
 * @author emanjarres
 */
public class MuestraInforme {
      public String getListaCasos(){        
        String htmlcode = "";        
        GestionesTutorias gt = new GestionesTutorias();      
        for (Tutorias t : gt.getTutorias()) {                       
            htmlcode += "<option value='"+t.getId()+"'>"+t.getEstudiante()+"</option> ";            
        }return htmlcode;        
    }
}
