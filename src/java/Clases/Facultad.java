
package Clases;

/**
 *
 * @author Alvaro Rubiano
 */
public class Facultad {
  
    private int identificador;
    private String nombre_facultad;
    private int id_campus;
    
    public Facultad(){
        
    }    
    
    public Facultad(int identificador, String nombre_facultad, int id_campus) {
        this.identificador = identificador;
        this.nombre_facultad = nombre_facultad;
        this.id_campus = id_campus;
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
     * @return the id_campus
     */
    public int getId_campus() {
        return id_campus;
    }

    /**
     * @param id_campus the id_campus to set
     */
    public void setId_campus(int id_campus) {
        this.id_campus = id_campus;
    }
    
    
}
