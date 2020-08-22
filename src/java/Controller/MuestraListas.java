/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;


import Modelo.GestionesListas;
import Modelo.GestionesProgramas;

/**
 *
 * @author emanjarres
 */
public class MuestraListas {
    
    public String getListaFactores(){        
        String htmlcode = "";        
        GestionesListas gl = new GestionesListas();        
        htmlcode = gl.getFactor().stream().map(f -> "<option value='"+f.getCodigo()+"'>"+f.getNombre()+"</option> ").reduce(htmlcode, String::concat);
        return htmlcode;        
    }
   
    public String getListaSemestres(){        
        String htmlcode = "";        
        GestionesListas gl = new GestionesListas();        
        htmlcode = gl.getSemestre().stream().map(f -> "<option value='"+f.getId()+"'>"+f.getNombre()+"</option> ").reduce(htmlcode, String::concat);
        return htmlcode;        
    }
    
    public String getListaRemisiones(){        
        String htmlcode = "";        
        GestionesListas gl = new GestionesListas();        
        htmlcode = gl.getRemision().stream().map(f -> "<option value='"+f.getCodigo()+"'>"+f.getNombre()+"</option> ").reduce(htmlcode, String::concat);
        return htmlcode;        
    }
    
    public String getListaTipoMonitor(){        
        String htmlcode = "";        
        GestionesListas gl = new GestionesListas();        
        htmlcode = gl.getMonitor().stream().map(f -> "<option value='"+f.getId()+"'>"+f.getNombre()+"</option> ").reduce(htmlcode, String::concat);
        return htmlcode;        
    }
    
    public String getListaTipoUsuario(){        
        String htmlcode = "";        
        GestionesListas gl = new GestionesListas();        
        htmlcode = gl.getUsuario().stream().map(f -> "<option value='"+f.getId()+"'>"+f.getNombre()+"</option> ").reduce(htmlcode, String::concat);
        return htmlcode;        
    }

    public String getListaProgramas(){        
        String htmlcode = "";        
        GestionesProgramas gl = new GestionesProgramas();        
        htmlcode = gl.getListaProgramas().stream().map(f -> "<option value='"+f.getId_programa()+"'>"+f.getNombre_Programa()+"</option> ").reduce(htmlcode, String::concat);
        return htmlcode;        
    }
}
