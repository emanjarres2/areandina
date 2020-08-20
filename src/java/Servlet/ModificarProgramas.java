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
public class ModificarProgramas extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        Connection con =null;
        Conexion cn = new Conexion();
        PreparedStatement st = null;
        ResultSet rs = null;
            /* TODO output your page here. You may use following sample code. */
            // out.println("<html>");
            //out.println("<head>");
            //out.println("<title>Servlet ModificarProgramas</title>");            
            //out.println("</head>");
            //out.println("<body>");
            //out.println("<h1>Servlet ModificarProgramas at " + request.getContextPath() + "</h1>");
            //out.println("</body>");
            //out.println("</html>");
         String id = request.getParameter("identificadorPrograma");
        String nombre = request.getParameter("nombrePrograma");
        String modalidad = request.getParameter("modalidad");        
        String id_facultad = request.getParameter("idfacultad");
        
        String editar = request.getParameter("btnModificarPrograma");
        String borrar = request.getParameter("btnEliminarPrograma");        
        String action1 = "1"; 
        String action2 = "2";
                
        //out.print(id+"--"+nombre+"--"+modalidad+"--"+id_campus+"--"+id_facultad+"--"+editar+"--"+borrar);
        if (action1.equals(editar)) {
            try {
                String consulta = "UPDATE programa SET Name_program='" + nombre + "', Modalidad='" + modalidad + "', Id_faculty='" + id_facultad + "' WHERE Id_program=" + id;
                con=cn.getConexion();
                st=(PreparedStatement) con.prepareStatement(consulta);
                st.executeUpdate();
                
                response.sendRedirect("administrador/ModificarProgramas.jsp");
                

            } catch (SQLException e) {
                out.print("Error: " + e);                
            } finally {
                try {
                    if (st != null) {
                        st.close();
                        
                    }
                    if (rs != null) {
                        rs.close();
                    }
                } catch (SQLException e) {
                    
                }
            }
        }//fin de actualizar 
        
        if (action2.equals(borrar)) {
            try {
                String consulta = "DELETE FROM programa WHERE Id_program=" + id;
                  con=cn.getConexion();
                st=(PreparedStatement) con.prepareStatement(consulta);
                st.executeUpdate();

                if (st.executeUpdate() == 0) {
                    response.sendRedirect("administrador/ModificarProgramas.jsp");
                } else {
                    response.sendRedirect("ups.jsp");
                }

            } catch (SQLException e) {
                out.print("Error: " + e); 
            } finally {
                try {
                    if (st != null) {
                        st.close();
                    }
                } catch (SQLException e) {
                    
                }
            }
        }//Fin de borrar 
        
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
