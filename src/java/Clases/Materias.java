/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author Alvaro Rubiano
 */
public class Materias {

    private int id_materia;
    private String nombre_materia;
    private int id_programa;
    
    public Materias() {
    }
        
    public Materias(int id_materia, String nombre_materia, int id_programa) {
        this.id_materia = id_materia;
        this.nombre_materia = nombre_materia;
        this.id_programa = id_programa;
    }
        
    
    /**
     * @return the nombre_materia
     */
    public String getNombre_materia() {
        return nombre_materia;
    }

    /**
     * @param nombre_materia the nombre_materia to set
     */
    public void setNombre_materia(String nombre_materia) {
        this.nombre_materia = nombre_materia;
    }

    /**
     * @return the id_programa
     */
    public int getId_programa() {
        return id_programa;
    }

    /**
     * @param id_programa the id_programa to set
     */
    public void setId_programa(int id_programa) {
        this.id_programa = id_programa;
    }

    /**
     * @return the id_materia
     */
    public int getId_materia() {
        return id_materia;
    }

    /**
     * @param id_materia the id_materia to set
     */
    public void setId_materia(int id_materia) {
        this.id_materia = id_materia;
    }

    
    
    
        
    
}
