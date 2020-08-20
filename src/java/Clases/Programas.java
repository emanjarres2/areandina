/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author emanjarres
 */
public class Programas
{
  private int id_programa;
    private String nombre_Programa;
    private String modalidad;
    private int id_facultad;

    public Programas() {
    }  
    
    public Programas(int id_programa, String nombre_Programa, String modalidad, int id_facultad) {
        this.id_programa = id_programa;
        this.nombre_Programa = nombre_Programa;
        this.modalidad = modalidad;
        this.id_facultad = id_facultad;
    }
    
    /**
     * @return the id_programa
     */
    public int getId_programa() {
        return id_programa;
    }

    /**
     * @param id_programa the id_facultad to set
     */
    public void setId_programa(int id_programa) {
        this.id_programa = id_programa;
    }
    
    /**
     * @return the nombre_Programa
     */
    public String getNombre_Programa() {
        return nombre_Programa;
    }

    /**
     * @param nombre_Programa the nombre_Programa to set
     */
    public void setNombre_Programa(String nombre_Programa) {
        this.nombre_Programa = nombre_Programa;
    }

    /**
     * @return the modalidad
     */
    public String getModalidad() {
        return modalidad;
    }

    /**
     * @param modalidad the modalidad to set
     */
    public void setModalidad(String modalidad) {
        this.modalidad = modalidad;
    }

    /**
     * @return the id_facultad
     */
    public int getId_facultad() {
        return id_facultad;
    }

    /**
     * @param id_facultad the id_facultad to set
     */
    public void setId_facultad(int id_facultad) {
        this.id_facultad = id_facultad;
    }
    
    
    
       
}
