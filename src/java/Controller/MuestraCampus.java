/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Clases.Campus;
import Modelo.GestionesCampus;

/**
 *
 * @author emanjarres
 */
public class MuestraCampus {
    //Metodo para realizar la consulta de los campus.
    public String getVistaCampus(int caso){
        String htmlcode = "";        
        GestionesCampus mc = new GestionesCampus();
        
        for (Campus c : mc.getCampus()) {            
            htmlcode += "<div class=\"container\">\n" +                    
"                           <div class=\"row\">\n" +
"                               <div class=\"col-sm\">\n" +
"                                   "+c.getNombre_campus()+
"                                </div>\n" +
"                               <div class=\"col-sm\">\n" +
"                                "+c.getTipo_campus()+
"                               </div>\n" +
"                               <div class=\"col-sm\">\n" +
"                                "+c.getDireccion_campus()+
"                               </div>\n" +                               
"                               </div>\n" +
"                           </div>    \n" +
"                       </div>";  
        }
        return htmlcode;
    }
    
       
    //Metodo para enviar el nombre y el id de los campus para la vista de crear las facultades
    public String getNombreCampus(){
        
        String htmlcode = "";
        
        GestionesCampus mnc = new GestionesCampus();
        
        for (Campus c : mnc.getCampus()) {
                       
            htmlcode += "<option value='"+c.getIdentificador()+"'>"+c.getNombre_campus()+"</option> ";
            
        }return htmlcode;
        
    }
}
