
package Modelo;

import Clases.Campus;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Alvaro Rubiano
 */
public class GestionesCampus extends Conexion{
    
    //Metodo de registrar campus o sedes
    public boolean registrarCampus (String nombres, String direcciones, String tipos){
        PreparedStatement pst = null;
        boolean flag = false;
        
        try {
            String consultax = "insert into Campus (Name_campus, Direccion , Tipo) values(?,?,?)";
            pst =(PreparedStatement) getConexion().prepareStatement(consultax);
            
            pst.setString(1, nombres);
            pst.setString(2, direcciones);
            pst.setString(3, tipos);
            
            if(pst.executeUpdate() ==1){
                return true;
            }          
           
        } catch (SQLException e) {
            System.out.println("Error 3: " + e);
        }finally{
            try {
                if(getConexion() != null) getConexion().close();
                if(pst != null) pst.close();                
            } catch (SQLException e) {
                System.out.println("Error 4: " + e);
            }
        }
        return false;
    }
    
    //Metodo para mostrar la lista de campus registrados
    public ArrayList<Campus> getCampus(){
        ArrayList<Campus> campus =  new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            String consulta = "SELECT * FROM Campus";
            pst =(PreparedStatement) getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
            
            //Ahora con el while se recorre la consulta.
            while(rs.next()){
                campus.add(new Campus(
                                rs.getInt("Id_campus"), 
                                rs.getString("Name_campus"), 
                                rs.getString("Tipo"), 
                                rs.getString("Direccion")
                            )
                        );
            }
        } catch (SQLException e) {
        }finally{
            try {
                if(getConexion() != null) getConexion().close();
                if(pst != null) pst.close(); 
                if(rs != null) rs.close();
            } catch (SQLException e) {
                System.out.println("Error 4: " + e);
            }
        }
        return campus;
    }
    
    //Metodo para editar campus o sedes
    public boolean actualizarCampus (int id, String nombre, String tipo, String direccion){
        PreparedStatement pst = null;
        boolean flag = false;
        
        try {
            String consulta = "UPDATE Campus SET Name_campus='"+nombre+"', Tipo='"+tipo+"', Direccion='"+direccion+"' WHERE Id_campus="+id;
            pst =(PreparedStatement) getConexion().prepareStatement(consulta);
            pst.executeUpdate();
                        
            if(pst.executeUpdate()==1){
                return true;
            }           
           
        } catch (SQLException e) {
            System.out.println("Error 3: " + e);
        }finally{
            try {
                if(getConexion() != null) getConexion().close();
                if(pst != null) pst.close();                
            } catch (SQLException e) {
                System.out.println("Error 4: " + e);
            }
        }
        return false;
    } 
    
    //Metodo para eliminar campus o sedes
    public boolean eliminarCampus (int id){
        PreparedStatement pst = null;
        boolean flag = false;        
        try {
            String consulta = "DELETE FROM Campus WHERE Id_campus="+id;
            pst =(PreparedStatement) getConexion().prepareStatement(consulta);
            pst.executeUpdate();
                        
            if(pst.executeUpdate()==1){
                return true;
            }    
           
        } catch (SQLException e) {
            System.out.println("Error 3: " + e);
        }finally{
            try {
                if(getConexion() != null) getConexion().close();
                if(pst != null) pst.close();                
            } catch (SQLException e) {
                System.out.println("Error 4: " + e);
            }
        }
        return false;
    } 
    
    
    //Prueba de funcionamiento del Metodo para mostrar la lista de campus registrados.
    /* 
    public static void main(String[] args ){
        GestionesCampus mc = new GestionesCampus();
        for(Campus c : mc.getCampus()){
            System.out.println(c.getNombre_campus()+" "+ c.getIdentificador());
        }
    }
    */   
    
    // Metodo para probar el Metodo de registrar campus o sedes.  
    /* 
    public static void main(String[] args) {
        GestionesCampus rg = new GestionesCampus();
        System.out.println(rg.registrarCampus("Prueba24abril2020", "Dirección", "Sede"));
    }
    */
    
    // Metodo para probar el Metodo de actualizar campus o sedes.  
    /* 
    public static void main(String[] args) {
        GestionesCampus rg = new GestionesCampus();       
        
        System.out.println(rg.actualizarCampus(29, "Alvaro Rubiano v03", "Seccional", "Calle 24 N° 8-55"));
    }
    */
    
    // Metodo para probar el Metodo de eliminar campus o sedes.  
    /* 
    public static void main(String[] args) {
        GestionesCampus rg = new GestionesCampus();      
        System.out.println(rg.eliminarCampus(29));
    }
    */
    
}
