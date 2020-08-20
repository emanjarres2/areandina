/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Modelo.Conexion;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author manjarres
 */
public class ConsultaResultados extends HttpServlet {

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
        Connection con = null;
        Conexion cn = new Conexion();
        Statement st = null;
        ResultSet rs = null;
        String datos = "";
        
        try {
            String sql = "SELECT tutorias.Id_tutorias, estudiantes.Name_Estudiantes, semestre.nombre, factor_asociado.Name_factor, usuarios.Name_users, tutorias.observaciones, resultado.observa, resultado.ruta\n" +
                            "FROM tutorias, resultado, estudiantes, factor_asociado, semestre, usuarios\n" +
                            "WHERE tutorias.estado='abierto' AND tutorias.Id_estudiante=estudiantes.Documento AND tutorias.semestre=semestre.Id_semestre AND tutorias.Id_factor=factor_asociado.Id_factor AND tutorias.Id_tutorias=resultado.Id_resultado AND tutorias.Id_tutor=usuarios.Id_usuarios";
            con = cn.getConexion();
            st = con.createStatement();
            rs = st.executeQuery(sql);
            com.google.gson.JsonObject objetos = new JsonObject();
            JsonArray array = new JsonArray();
            while (rs.next()) {
                JsonObject item = new JsonObject();
                item.addProperty("Id_tutorias", rs.getInt("Id_tutorias"));                
                item.addProperty("estudiante", rs.getString("Name_Estudiantes"));
                item.addProperty("semestre", rs.getString("nombre"));
                item.addProperty("factor", rs.getString("Name_factor"));
                item.addProperty("monitor", rs.getString("Name_users"));
                item.addProperty("obsOPE", rs.getString("observaciones"));
                item.addProperty("obsMON", rs.getString("observa"));
                item.addProperty("ruta", rs.getString("ruta"));

                array.add(item);
                //datos +=rs.getInt(1)+" "+rs.getString(2);
            }
            objetos.add("datos", array);
            out.print(objetos.toString());
        } catch (SQLException e) {
        } finally {
            try {
                if (con != null) {
                    out.close();
                }
                if (st != null) {
                    st.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.out.println("Error 4: " + e);
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
