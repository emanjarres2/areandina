/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.sql.Date;

/**
 *
 * @author manjarres
 */
public class Monitorias {
    
    private int idMonitoria;
    private String documentoEstudiante;    
    private int  factor;
    private int tipoMonitoria;
    private int idMonitor;
    private int idSede;
    private int idFacultad;
    private int idPrograma;
    private int idMateria;
    private String observaciones;
    private int idRemision;
    private String tipoEvidencia;
    private String ruta;
    private Date fecha;

    public Monitorias() {
    }

    public Monitorias(int idMonitoria, String documentoEstudiante, int factor, int tipoMonitoria, int idMonitor, int idSede, int idFacultad, int idPrograma, int idMateria, String observaciones, int idRemision, String tipoEvidencia, String ruta, Date fecha) {
        this.idMonitoria = idMonitoria;
        this.documentoEstudiante = documentoEstudiante;        
        this.factor = factor;
        this.tipoMonitoria = tipoMonitoria;
        this.idMonitor = idMonitor;
        this.idSede = idSede;
        this.idFacultad = idFacultad;
        this.idPrograma = idPrograma;
        this.idMateria = idMateria;
        this.observaciones = observaciones;
        this.idRemision = idRemision;
        this.tipoEvidencia = tipoEvidencia;
        this.ruta = ruta;
        this.fecha = fecha;
    }

    

    /**
     * @return the idMonitoria
     */
    public int getIdMonitoria() {
        return idMonitoria;
    }

    /**
     * @param idMonitoria the idMonitoria to set
     */
    public void setIdMonitoria(int idMonitoria) {
        this.idMonitoria = idMonitoria;
    }

    /**
     * @return the documentoEstudiante
     */
    public String getDocumentoEstudiante() {
        return documentoEstudiante;
    }

    /**
     * @param documentoEstudiante the documentoEstudiante to set
     */
    public void setDocumentoEstudiante(String documentoEstudiante) {
        this.documentoEstudiante = documentoEstudiante;
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
     * @return the tipoMonitoria
     */
    public int getTipoMonitoria() {
        return tipoMonitoria;
    }

    /**
     * @param tipoMonitoria the tipoMonitoria to set
     */
    public void setTipoMonitoria(int tipoMonitoria) {
        this.tipoMonitoria = tipoMonitoria;
    }

    /**
     * @return the idMonitor
     */
    public int getIdMonitor() {
        return idMonitor;
    }

    /**
     * @param idMonitor the idMonitor to set
     */
    public void setIdMonitor(int idMonitor) {
        this.idMonitor = idMonitor;
    }

    /**
     * @return the idSede
     */
    public int getIdSede() {
        return idSede;
    }

    /**
     * @param idSede the idSede to set
     */
    public void setIdSede(int idSede) {
        this.idSede = idSede;
    }

    /**
     * @return the idFacultad
     */
    public int getIdFacultad() {
        return idFacultad;
    }

    /**
     * @param idFacultad the idFacultad to set
     */
    public void setIdFacultad(int idFacultad) {
        this.idFacultad = idFacultad;
    }

    /**
     * @return the idPrograma
     */
    public int getIdPrograma() {
        return idPrograma;
    }

    /**
     * @param idPrograma the idPrograma to set
     */
    public void setIdPrograma(int idPrograma) {
        this.idPrograma = idPrograma;
    }

    /**
     * @return the idMateria
     */
    public int getIdMateria() {
        return idMateria;
    }

    /**
     * @param idMateria the idMateria to set
     */
    public void setIdMateria(int idMateria) {
        this.idMateria = idMateria;
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
     * @return the idRemision
     */
    public int getIdRemision() {
        return idRemision;
    }

    /**
     * @param idRemision the idRemision to set
     */
    public void setIdRemision(int idRemision) {
        this.idRemision = idRemision;
    }

    /**
     * @return the tipoEvidencia
     */
    public String getTipoEvidencia() {
        return tipoEvidencia;
    }

    /**
     * @param tipoEvidencia the tipoEvidencia to set
     */
    public void setTipoEvidencia(String tipoEvidencia) {
        this.tipoEvidencia = tipoEvidencia;
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
    
    
    
}
