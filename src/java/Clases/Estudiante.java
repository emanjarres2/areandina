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
public class Estudiante {
    
    private int identificacion;   
    private String nombres;
    private String correo;
    private String telefono;
    private String tipo;
    private int id_campus;
    private int id_facultad;
    private int id_programa;
    private String semestre;
    private String modalidad;
    private int documento;
    private String codigo;

    public Estudiante() {
    }

    public Estudiante(int identificacion, String nombres, String correo, String telefono, String tipo, int id_campus, int id_facultad, int id_programa, String semestre, String modalidad,int documento, String codigo) {
        
        this.identificacion = identificacion;       
        this.nombres = nombres;
        this.correo = correo;
        this.telefono = telefono;
        this.tipo = tipo;
        this.id_campus = id_campus;
        this.id_facultad = id_facultad;
        this.id_programa = id_programa;
        this.semestre = semestre;
        this.modalidad = modalidad;
        this.documento = documento;
        this.codigo = codigo;
                
    }

    public int getIdentificacion() {
        return identificacion;
    }

    public void setIdentificacion(int identificacion) {
        this.identificacion = identificacion;
    }

    public int getDocumento() {
        return documento;
    }

    public void setDocumento(int documento) {
        this.documento = documento;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getId_campus() {
        return id_campus;
    }

    public void setId_campus(int id_campus) {
        this.id_campus = id_campus;
    }

    public int getId_facultad() {
        return id_facultad;
    }

    public void setId_facultad(int id_facultad) {
        this.id_facultad = id_facultad;
    }

    public int getId_programa() {
        return id_programa;
    }

    public void setId_programa(int id_programa) {
        this.id_programa = id_programa;
    }

    public String getSemestre() {
        return semestre;
    }

    public void setSemestre(String semestre) {
        this.semestre = semestre;
    }

    public String getModalidad() {
        return modalidad;
    }

    public void setModalidad(String modalidad) {
        this.modalidad = modalidad;
    }

    /**
     * @return the codigo
     */
    public String getCodigo() {
        return codigo;
    }

    /**
     * @param codigo the codigo to set
     */
    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

   
    
    
}
