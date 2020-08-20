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
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author emanjarres
 */
public class ModificarUsuarios extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        Connection con =null;
        Conexion cn = new Conexion();
        PreparedStatement st = null;
        ResultSet rs = null;
            /* TODO output your page here. You may use following sample code. */
        String identificacion = request.getParameter("identificacion");
        String nombres = request.getParameter("nombresApellidos");
        String mail = request.getParameter("mail");
        String telefono = request.getParameter("telefono");
        String tipo = request.getParameter("tipo");
        String modalidad = request.getParameter("nombreModalidad");
        String semestre = request.getParameter("semestre");
        String id_campus = request.getParameter("idcampus");
        String id_facultad = request.getParameter("idfacultad");
        String id_programa = request.getParameter("idprograma");
        
        String editar = request.getParameter("btnModificarUsuario");
        String borrar = request.getParameter("btnEliminarUsuario");
        String uno="1";
        String dos="2";
        
        if(uno.equals(editar)){            
            try {
                String consultax = "UPDATE usuarios SET Name_users='" + nombres + "', Mail_users='" + mail + "', Phone_users='" + telefono + "', Type_users='" + tipo + "', Id_campus='" + id_campus + "', Id_faculty='" + id_facultad + "', Id_program='" + id_programa + "', Semestre='" + semestre + "', Modalidad='" + modalidad + "' WHERE Id_usuarios='" + identificacion + "'";
                con=cn.getConexion();
                st=(PreparedStatement) con.prepareStatement(consultax);
                st.executeUpdate();
                 response.sendRedirect("administrador/ModificarUsuarios.jsp");
                //RequestDispatcher rd = request.getRequestDispatcher("administrador/ModificarUsuarios.jsp");
                //rd.include(request, response);
                
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
        
        if(dos.equals(borrar)){
                
                try {
                    String consulta = "DELETE FROM usuarios WHERE Id_usuarios=" + identificacion;
                    con=cn.getConexion();
                    st=(PreparedStatement) con.prepareStatement(consulta);
                    st.executeUpdate();
                    
                    if (st.executeUpdate() == 0) {
                        
                        response.sendRedirect("administrador/ModificarUsuarios.jsp");
                       
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
