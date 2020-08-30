/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Modelo.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modelo.UsuariosDao;


/**
 *
 * @author emanjarres
 */

public class CrearUsuarios extends HttpServlet {

   
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   // protected void processRequest(HttpServletRequest request, HttpServletResponse response)
           // throws ServletException, IOException {
        //response.setContentType("text/html;charset=UTF-8");
        //PrintWriter out = response.getWriter();
            /* TODO output your page here. You may use following sample code. */
       
        //}
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
        //processRequest(request, response);
        response.getWriter().append("Served at:").append(request.getContextPath());
        
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
        
        PrintWriter out = response.getWriter();
        //processRequest(request, response);
        Connection con =null;
        Conexion cn = new Conexion();
        PreparedStatement st = null;
        ResultSet rs = null;
        int identificacion = Integer.parseInt(request.getParameter("identificacion"));        
        String nombres = request.getParameter("nombresApellidos");
        String mail = request.getParameter("mail");
        String telefono = request.getParameter("telefono");
        String tipo = request.getParameter("tipo");
        //String modalidad = request.getParameter("nombreModalidad");
        String semestre = request.getParameter("semestre");
        String id_campus = request.getParameter("idcampus");
        String id_facultad = request.getParameter("idfacultad");
        String id_programa = request.getParameter("idprograma");
        //String pass_usuario=request.getParameter("pass");
        
        UsuariosDao gu = new UsuariosDao();        
        //String pass = gu.getEncriptacion(pass_usuario);
        
//        out.print(pass);
        
        String btn1 = request.getParameter("btnformularioCrearOPE");
        String btn2 = request.getParameter("btnformularioCrear");
        String uno = "2";
        String dos = "1";
        
        if(uno.equals(btn1)){
            try {
                String consultax = "insert into usuarios (Id_usuarios, Name_users, Mail_users, Phone_users, Type_users, Id_campus, Id_faculty, Id_program, Semestre) values(?,?,?,?,?,?,?,?,?)";
                con=cn.getConexion();
                st=(PreparedStatement) con.prepareStatement(consultax);
                st.setInt(1, identificacion);
                st.setString(2, nombres);
                st.setString(3, mail);
                st.setString(4, telefono);
                st.setString(5, tipo);
                st.setString(6, id_campus);
                st.setString(7, id_facultad);
                st.setString(8, id_programa);
                st.setString(9, semestre);                
                
                if (st.executeUpdate() == 1) {                       
                        response.sendRedirect("OficinaOPE/NuevoMonitor.jsp");
                } else {
                    response.sendRedirect("ups.jsp");
                }
            } catch (IOException | SQLException e) {
                out.print("Error 3: " + e);
            } finally {
                try {
                    if (st != null) {
                        st.close();
                    }
                } catch (SQLException e) {
                    out.print("Error 4: " + e);
                }
            }
        }
        if(dos.equals(btn2)){
            try {
                String consultax = "insert into usuarios (Id_usuarios, Name_users, Mail_users, Phone_users, Type_users, Id_campus, Id_faculty, Id_program, Semestre) values(?,?,?,?,?,?,?,?,?)";
                 con=cn.getConexion();
                st=(PreparedStatement) con.prepareStatement(consultax);               
                st.setInt(1, identificacion);
                st.setString(2, nombres);
                st.setString(3, mail);
                st.setString(4, telefono);
                st.setString(5, tipo);
                st.setString(6, id_campus);
                st.setString(7, id_facultad);
                st.setString(8, id_programa);
                st.setString(9, semestre);                
                            
                if (st.executeUpdate() == 1) {
                        response.sendRedirect("administrador/CrearUsuarios.jsp");
                } else {
                   
                    response.sendRedirect("ups.jsp");
                }

            } catch (IOException | SQLException e) {
                out.print("Error 3: " + e);
            } finally {
                try {
                    if (st != null) {
                        st.close();
                    }
                } catch (SQLException e) {
                    out.print("Error 4: " + e);
                }
            }
        
    }
    }

   
}
