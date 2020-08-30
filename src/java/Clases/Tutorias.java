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
public class Tutorias {
    
    private int id;
    private Date fecha;
    private String estudiante;
    private int programa;
    private int semestre;
    private int factor;
    private int tutor;
    private String observaciones;
    private String estado;

    public Tutorias() {
    }

    public Tutorias(int id, Date fecha, String estudiante, int programa, int semestre, int factor, int tutor, String observaciones, String estado) {
        this.id = id;
        this.fecha = fecha;
        this.estudiante = estudiante;
        this.programa = programa;
        this.semestre = semestre;
        this.factor = factor;
        this.tutor = tutor;
        this.observaciones = observaciones;
        this.estado = estado;
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
     * @return the estudiante
     */
    public String getEstudiante() {
        return estudiante;
    }

    /**
     * @param estudiante the estudiante to set
     */
    public void setEstudiante(String estudiante) {
        this.estudiante = estudiante;
    }

    /**
     * @return the programa
     */
    public int getPrograma() {
        return programa;
    }

    /**
     * @param programa the programa to set
     */
    public void setPrograma(int programa) {
        this.programa = programa;
    }

    /**
     * @return the semestre
     */
    public int getSemestre() {
        return semestre;
    }

    /**
     * @param semestre the semestre to set
     */
    public void setSemestre(int semestre) {
        this.semestre = semestre;
    }

    /**
     * @return the factor
     */
    public int getFactor() {
        return factor;
    }

    /**
     * @param factor the factor to set
     */
    public void setFactor(int factor) {
        this.factor = factor;
    }

    /**
     * @return the tutor
     */
    public int getTutor() {
        return tutor;
    }

    /**
     * @param tutor the tutor to set
     */
    public void setTutor(int tutor) {
        this.tutor = tutor;
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
     * @return the estado
     */
    public String getEstado() {
        return estado;
    }

    /**
     * @param estado the estado to set
     */
    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
        

    
    
    
    
}
