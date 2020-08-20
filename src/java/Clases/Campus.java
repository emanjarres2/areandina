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
public class Campus {
    private int identificador;
    private String nombre_campus;
    private String direccion_campus;
    private String tipo_campus;

    public Campus() {
    }

    public Campus(int identificador, String nombre_campus, String direccion_campus, String tipo_campus) {
        this.identificador = identificador;
        this.nombre_campus = nombre_campus;
        this.direccion_campus = direccion_campus;
        this.tipo_campus = tipo_campus;
    }
    
    /**
     * @return the identificador
     */
    public int getIdentificador() {
        return identificador;
    }

    /**
     * @param identificador the identificador to set
     */
    public void setIdentificador(int identificador) {
        this.identificador = identificador;
    }
         
    /**
     * @return the nombre_campus
     */
    public String getNombre_campus() {
        return nombre_campus;
    }

    /**
     * @param nombre_campus the nombre_campus to set
     */
    public void setNombre_campus(String nombre_campus) {
        this.nombre_campus = nombre_campus;
    }

    /**
     * @return the direccion_campus
     */
    public String getDireccion_campus() {
        return direccion_campus;
    }

    /**
     * @param direccion_campus the direccion_campus to set
     */
    public void setDireccion_campus(String direccion_campus) {
        this.direccion_campus = direccion_campus;
    }

    /**
     * @return the tipo_campus
     */
    public String getTipo_campus() {
        return tipo_campus;
    }

    /**
     * @param tipo_campus the tipo_campus to set
     */
    public void setTipo_campus(String tipo_campus) {
        this.tipo_campus = tipo_campus;
    }
}
