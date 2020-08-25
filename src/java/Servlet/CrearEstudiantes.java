/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Modelo.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author emanjarres
 */
@WebServlet(name = "CrearEstudiantes", urlPatterns = {"/CrearEstudiantes"})
public class CrearEstudiantes extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
            /* TODO output your page here. You may use following sample code. */
           Conexion conexion = new Conexion();
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        String identificacion = request.getParameter("identificacion");
        String nombres = request.getParameter("nombresApellidos");
        String mail = request.getParameter("mail");
        String telefono = request.getParameter("telefono");
        String estado = request.getParameter("estado");
        String modalidad = request.getParameter("nombreModalidad");
        String semestre = request.getParameter("semestre");
        String id_campus = request.getParameter("idcampus");
        String id_facultad = request.getParameter("idfacultad");
        String id_programa = request.getParameter("idprograma");
        
        String btn1 = request.getParameter("btnformularioCrearOPE");
        String btn2 = request.getParameter("btnformularioCrear");
        String uno = "2";
        String dos = "1";
               
        if(uno.equals(btn1)){
            try {
            String consultax = "insert into estudiantes (Documento, Name_estudiantes, Mail_users, Phone_users, Estado_usuario, Id_campus, Id_faculty, Id_program, Semestre, Modalidad) values(?,?,?,?,?,?,?,?,?,?)";
            pst =(PreparedStatement) conexion.getConexion().prepareStatement(consultax);
            
            pst.setString(1, identificacion);
            pst.setString(2, nombres);
            pst.setString(3, mail);
            pst.setString(4, telefono);
            pst.setString(5, estado);
            pst.setString(6, id_campus);
            pst.setString(7, id_facultad);
            pst.setString(8, id_programa);
            pst.setString(9, semestre);
            pst.setString(10, modalidad);            
            
            if(pst.executeUpdate() ==1){
                response.sendRedirect("OficinaOPE/NuevoMonitor.jsp");
                                
            }else {
                response.sendRedirect("ups.jsp");
                }          
           
        } catch (IOException | SQLException e) {
            out.print("Error 3: " + e);
        }finally{
            try {                
                if(pst != null) pst.close();                
            } catch (SQLException e) {
            out.print("Error 4: " + e);
            }
        }
        }
        
        if(dos.equals(btn2)){
            try {
            String consultax = "INSERT INTO estudiantes (Documento, Name_users, Mail_users, Phone_users, Estado_usuario, Id_campus, Id_faculty, Id_program, Semestre, Modalidad) values(?,?,?,?,?,?,?,?,?,?)";
            pst =(PreparedStatement) conexion.getConexion().prepareStatement(consultax);
            
            pst.setString(1, identificacion);
            pst.setString(2, nombres);
            pst.setString(3, mail);
            pst.setString(4, telefono);
            pst.setString(5, estado);
            pst.setString(6, id_campus);
            pst.setString(7, id_facultad);
            pst.setString(8, id_programa);
            pst.setString(9, semestre);
            pst.setString(10, modalidad);            
            
            if(pst.executeUpdate() ==1){
                response.sendRedirect("administrador/index.jsp");
                                
            }else {
                response.sendRedirect("ups.jsp");
                }          
           
        } catch (IOException | SQLException e) {
            out.print("Error 3: " + e);
        }finally{
            try {                
                if(pst != null) pst.close();                
            } catch (SQLException e) {
            out.print("Error 4: " + e);
            }
        }
        } 
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
