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
 * @author emanjarres
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
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        Connection con = null;
        Conexion cn = new Conexion();
        Statement st = null;
        ResultSet rs = null;
        String datos = "";
        
        try {
            String sql = "select t.Id_tutorias,e.Name_Estudiantes,e.Semestre,f.Name_factor,u.Name_users,t.observaciones,r.observa,t.estado,r.ruta from tutorias t inner join estudiantes e on t.Id_estudiante=e.Documento inner join factor_asociado f on t.Id_factor=f.Id_factor inner join usuarios u on t.Id_tutor=u.Id_usuarios inner join resultado r on r.Id_resultado=t.Id_tutorias inner join Semestre s on e.Semestre=s.Id_semestre";            
            con = cn.getConexion();
            st = con.createStatement();
            rs = st.executeQuery(sql);
            com.google.gson.JsonObject objetos = new JsonObject();
            JsonArray array = new JsonArray();
            while (rs.next()) {
                JsonObject item = new JsonObject();
                item.addProperty("Id_tutorias", rs.getInt("Id_tutorias"));                
                item.addProperty("estudiante", rs.getString("Name_Estudiantes"));
                item.addProperty("semestre", rs.getString("Semestre"));
                item.addProperty("factor", rs.getString("Name_factor"));
                item.addProperty("monitor", rs.getString("Name_users"));
                item.addProperty("obsOPE", rs.getString("observaciones"));
                item.addProperty("obsMON", rs.getString("observa"));
                item.addProperty("estado", rs.getString("estado"));
                item.addProperty("ruta", "<a href='../"+rs.getString("ruta")+"' class='btn-xs btn btn-success' target='_blank' style=' margin-left:30px; ' title='Evidencias' download><span class='fas fa-download' ></span></a>");

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
