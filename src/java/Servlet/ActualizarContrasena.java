/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Modelo.Conexion;
import Modelo.UsuariosDao;
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
public class ActualizarContrasena extends HttpServlet {

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
        
        Connection conn;
        Conexion cn = new Conexion();
        PreparedStatement pst = null;
        ResultSet rs = null; 
        String actualizar = request.getParameter("actualizar");
        String usuario = request.getParameter("id");
        String pass = request.getParameter("password");
        String newpass = request.getParameter("nuevoPassword");
        String confirmar = request.getParameter("confirmarPassword");        
        
        UsuariosDao gu = new UsuariosDao();
        String passencriptado = gu.getEncriptacion(pass);
        //out.print(actualizar+"usuario: "+usuario);
        switch(actualizar){
            case "monitor":
                if(newpass.equals(confirmar)){                      
                    try {                        
                        String consulta = "UPDATE usuarios SET Pass_users='"+gu.getEncriptacion(confirmar)+"' WHERE Pass_users='"+passencriptado+"' AND Id_usuarios='"+usuario+"';";
                        conn=cn.getConexion();
                        pst = (PreparedStatement) conn.prepareStatement(consulta);
                        pst.executeUpdate();
                        response.sendRedirect("Monitores/ActualizarPassword.jsp");
                    } catch (SQLException e) {
                        out.print("Error 3: " + e);
                    } finally {
                        try {
                            if (pst != null) {
                            pst.close();
                            }
                        } catch (SQLException e) {
                            out.print("Error 4: " + e);
                        }
                    }
                }else{
                     response.sendRedirect("Monitores/index.jsp");
                }
                break;
            
            case "administrativo":
                if(newpass.equals(confirmar)){                      
                    try {                        
                        String consulta = "UPDATE usuarios SET Pass_users='"+gu.getEncriptacion(confirmar)+"' WHERE Pass_users='"+passencriptado+"' AND Id_usuarios='"+usuario+"';";
                        conn=cn.getConexion();
                        pst = (PreparedStatement) conn.prepareStatement(consulta);
                        pst.executeUpdate();
                        response.sendRedirect("OficinaOPE/ActualizarPassword.jsp");
                    } catch (SQLException e) {
                        out.print("Error 3: " + e);
                    } finally {
                        try {
                            if (pst != null) {
                            pst.close();
                            }
                        } catch (SQLException e) {
                            out.print("Error 4: " + e);
                        }
                    }
                }else{
                     response.sendRedirect("OficinaOPE/index.jsp");
                }
                break;
                
            case "administrador":
                if(newpass.equals(confirmar)){                      
                    try {                        
                        String consulta = "UPDATE usuarios SET Pass_users='"+gu.getEncriptacion(confirmar)+"' WHERE Pass_users='"+passencriptado+"' AND Id_usuarios='"+usuario+"';";
                        conn=cn.getConexion();
                        pst = (PreparedStatement) conn.prepareStatement(consulta);
                        pst.executeUpdate();
                        response.sendRedirect("administrador/ActualizarPassword.jsp");
                    } catch (SQLException e) {
                        out.print("Error 3: " + e);
                    } finally {
                        try {
                            if (pst != null) {
                            pst.close();
                            }
                        } catch (SQLException e) {
                            out.print("Error 4: " + e);
                        }
                    }
                }else{
                     response.sendRedirect("administrador/index.jsp");
                }
                break;
            default:    
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
