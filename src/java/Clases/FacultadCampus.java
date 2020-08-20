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
public class FacultadCampus 
{
     private int Id_facultad;
    private String nombre_facultad;    
    private int Id_campus;
    
    
    public FacultadCampus() {
    }

    public FacultadCampus(int Id_facultad, String nombre_facultad, int Id_campus) {
        
        this.Id_facultad = Id_facultad;
        this.nombre_facultad = nombre_facultad;
        this.Id_facultad = Id_campus;
    }
    
    

    /**
     * @return the Id_facultad
     */
    public int getId_facultad() {
        return Id_facultad;
    }

    /**
     * @param Id_facultad the Id_facultad to set
     */
    public void setId_facultad(int Id_facultad) {
        this.Id_facultad = Id_facultad;
    }

    /**
     * @return the nombre_facultad
     */
    public String getNombre_facultad() {
        return nombre_facultad;
    }

    /**
     * @param nombre_facultad the nombre_facultad to set
     */
    public void setNombre_facultad(String nombre_facultad) {
        this.nombre_facultad = nombre_facultad;
    }

    /**
     * @return the Id_campus
     */
    public int getId_campus() {
        return Id_campus;
    }

    /**
     * @param Id_campus the Id_campus to set
     */
    public void setId_campus(int Id_campus) {
        this.Id_campus = Id_campus;
    }
    
}
