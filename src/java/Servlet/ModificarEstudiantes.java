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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author emanjarres
 */
public class ModificarEstudiantes extends HttpServlet {

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
        response.setContentType("charset=UTF-8");
         request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
            /* TODO output your page here. You may use following sample code. */
        Connection con =null;
        Conexion cn = new Conexion();
        PreparedStatement st = null;
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
        
        String btneditar1 = request.getParameter("btnModificarEstudianteOPE");
        String btnborrar2 = request.getParameter("btnEliminarEstudianteOPE");        
        String btneditar3 = request.getParameter("btnModificarEstudiante");
        String btnborrar4 = request.getParameter("btnEliminarEstudiante");
        
        String action1 = "1"; 
        String action2 = "2";
        String action3 = "3";
        String action4 = "4";
        
        if(action1.equals(btneditar1)){
           try {
                String consultax = "UPDATE estudiantes SET Name_users='" + nombres + "', Mail_users='" + mail + "', Phone_users='" + telefono + "', Estado_usuario='" + estado + "', Id_campus='" + id_campus + "', Id_faculty='" + id_facultad + "', Id_program='" + id_programa + "', Semestre='" + semestre + "', Modalidad='" + modalidad + "' WHERE Documento='" + identificacion + "'";
                con=cn.getConexion();
                st = (PreparedStatement) con.prepareStatement(consultax);
                st.executeUpdate();

                response.sendRedirect("OficinaOPE/ModificarEstudiantes.jsp");

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
        if(action2.equals(btnborrar2)){
            try {
                String consulta = "DELETE FROM estudiantes WHERE Documento=" + identificacion;
                con=cn.getConexion();
                st = (PreparedStatement) con.prepareStatement(consulta);
                st.executeUpdate();

                if (st.executeUpdate() == 0) {
                    response.sendRedirect("OficinaOPE/ModificarEstudiantes.jsp");
                } else {
                    response.sendRedirect("ups.jsp");
                }

            } catch (SQLException e) {
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
        if(action3.equals(btneditar3)){            
            try {
                String consultax = "UPDATE estudiantes SET Name_users='" + nombres + "', Mail_users='" + mail + "', Phone_users='" + telefono + "', Estado_usuario='" + estado + "', Id_campus='" + id_campus + "', Id_faculty='" + id_facultad + "', Id_program='" + id_programa + "', Semestre='" + semestre + "', Modalidad='" + modalidad + "' WHERE Documento='" + identificacion + "'";
                 con=cn.getConexion();
                st = (PreparedStatement) con.prepareStatement(consultax);
                st.executeUpdate();

                response.sendRedirect("administrador/ModificarEstudiantes.jsp");

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
        if(action4.equals(btnborrar4)){            
            try {
                String consulta = "DELETE FROM estudiantes WHERE Documento=" + identificacion;
                 con=cn.getConexion();
                st = (PreparedStatement) con.prepareStatement(consulta);
                st.executeUpdate();

                if (st.executeUpdate() == 0) {
                    response.sendRedirect("administrador/ModificarEstudiantes.jsp");
                } else {
                    response.sendRedirect("ups.jsp");
                }

            } catch (SQLException e) {
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
