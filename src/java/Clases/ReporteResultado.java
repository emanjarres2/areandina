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
public class ReporteResultado {
    
    private int caso;
    private String estudiante;
    private String factor;
    private String tutor;
    private String observacionesOO;
    private String observacionesM;
    private String tipo;
    private String ruta;      

    public ReporteResultado() {
    }

    public ReporteResultado(int caso, String estudiante, String factor, String tutor, String observacionesOO, String observacionesM, String tipo, String ruta) {
        this.caso = caso;
        this.estudiante = estudiante;
        this.factor = factor;
        this.tutor = tutor;
        this.observacionesOO = observacionesOO;
        this.observacionesM = observacionesM;
        this.tipo = tipo;
        this.ruta = ruta;
    }

    /**
     * @return the caso
     */
    public int getCaso() {
        return caso;
    }

    /**
     * @param caso the caso to set
     */
    public void setCaso(int caso) {
        this.caso = caso;
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
     * @return the factor
     */
    public String getFactor() {
        return factor;
    }

    /**
     * @param factor the factor to set
     */
    public void setFactor(String factor) {
        this.factor = factor;
    }

    /**
     * @return the tutor
     */
    public String getTutor() {
        return tutor;
    }

    /**
     * @param tutor the tutor to set
     */
    public void setTutor(String tutor) {
        this.tutor = tutor;
    }

    /**
     * @return the observacionesOO
     */
    public String getObservacionesOO() {
        return observacionesOO;
    }

    /**
     * @param observacionesOO the observacionesOO to set
     */
    public void setObservacionesOO(String observacionesOO) {
        this.observacionesOO = observacionesOO;
    }

    /**
     * @return the observacionesM
     */
    public String getObservacionesM() {
        return observacionesM;
    }

    /**
     * @param observacionesM the observacionesM to set
     */
    public void setObservacionesM(String observacionesM) {
        this.observacionesM = observacionesM;
    }

    /**
     * @return the tipo
     */
    public String getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(String tipo) {
        this.tipo = tipo;
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
    
    
}
