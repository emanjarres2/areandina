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
import java.sql.Date;
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
public class CrearTutorias extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connection con =null;
        Conexion cn = new Conexion();
        PreparedStatement st = null;
        ResultSet rs = null;
        Date fecha = Date.valueOf(request.getParameter("fecha"));
        int estudiante = Integer.parseInt(request.getParameter("estudiante"));
        int programa = Integer.parseInt(request.getParameter("programa"));        
        int semestre = Integer.parseInt(request.getParameter("semestre"));
        int factor = Integer.parseInt(request.getParameter("factor"));
        int monitor = Integer.parseInt(request.getParameter("monitor"));        
        String observaciones = request.getParameter("observaciones");
        
//        out.print(fecha);
        
        try {
                String consulta = "insert into tutorias (fecha, Id_estudiante, Id_programa, semestre, Id_factor, Id_tutor, obervaciones) values(?,?,?,?,?,?,?)";
                con=cn.getConexion();
                st = (PreparedStatement) con.prepareStatement(consulta);

                st.setDate(1, fecha);
                st.setInt(2, estudiante);
                st.setInt(3, programa);
                st.setInt(4, semestre);
                st.setInt(5, factor);
                st.setInt(6, monitor);
                st.setString(7, observaciones);
                
                if (st.executeUpdate() == 1) {
                    response.sendRedirect("OficinaOPE/CrearTutorias.jsp");
                } else {
                    response.sendRedirect("ups.jsp");
                }

            } catch (IOException | SQLException e) {
                    out.print("Error en la creación de tutorias 1: " + e);
            } finally {
                try {
                    if (st != null) {
                        st.close();
                    }
                } catch (SQLException e) {
                    out.print("Error en la creación de tutorias 2: " + e);
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
