/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.sql.Date;

/**
 *
 * @author Alvaro Rubiano
 */
public class Resultado {
    private int id;     
    private int idTutoria;
    private int remision;
    private Date fecha;
    private int asignatura;
    private String observaciones;
    private String nombre;
    private String ruta;
    private String idEstudiante;
    

    public Resultado() {
    }

    public Resultado(int id, int idTutoria, int remision, Date fecha, int asignatura, String observaciones, String nombre, String ruta, String idEstudiante) {
        this.id = id;
        this.idTutoria = idTutoria;
        this.remision = remision;
        this.fecha = fecha;
        this.asignatura = asignatura;
        this.observaciones = observaciones;
        this.nombre = nombre;
        this.ruta = ruta;
        this.idEstudiante = idEstudiante;
        
    }
    
    
    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }
    
    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the ruta
     */
    public String getRuta() {
        return ruta;
    }

    /**
     * @param ruta the ruta to set
     */
    public void setRuta(String ruta) {
        this.ruta = ruta;
    }

    /**
     * @return the fecha
     */
    public Date getFecha() {
        return fecha;
    }

    /**
     * @param fecha the fecha to set
     */
    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    /**
     * @return the asignatura
     */
    public int getAsignatura() {
        return asignatura;
    }

    /**
     * @param asignatura the asignatura to set
     */
    public void setAsignatura(int asignatura) {
        this.asignatura = asignatura;
    }

    /**
     * @return the observaciones
     */
    public String getObservaciones() {
        return observaciones;
    }

    /**
     * @param observaciones the observaciones to set
     */
    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    /**
     * @return the idTutoria
     */
    public int getIdTutoria() {
        return idTutoria;
    }

    /**
     * @param idTutoria the idTutoria to set
     */
    public void setIdTutoria(int idTutoria) {
        this.idTutoria = idTutoria;
    }

    /**
     * @return the remision
     */
    public int getRemision() {
        return remision;
    }

    /**
     * @param remision the remision to set
     */
    public void setRemision(int remision) {
        this.remision = remision;
    }

    /**
     * @return the idEstudiante
     */
    public String getIdEstudiante() {
        return idEstudiante;
    }

    /**
     * @param idEstudiante the idEstudiante to set
     */
    public void setIdEstudiante(String idEstudiante) {
        this.idEstudiante = idEstudiante;
    }
    
    
}
