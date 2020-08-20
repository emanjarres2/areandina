/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Modelo.GestionesMaterias;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author emanjarres
 */
public class CrearMaterias extends HttpServlet {

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
            //int idcampus = Integer.parseInt(request.getParameter("idcampus"));
            //int idfacultad = Integer.parseInt(request.getParameter("idfacultad"));
            try {
            //int idcampus = Integer.parseInt(request.getParameter("idcampus"));
            //int idfacultad = Integer.parseInt(request.getParameter("idfacultad"));
            int idprograma = Integer.parseInt(request.getParameter("idprograma"));
            String materia= request.getParameter("nombreMateria");
            
            GestionesMaterias pasarprograma = new GestionesMaterias();
            
            if(pasarprograma.registarMaterias(materia, idprograma)){
                response.sendRedirect("administrador/CrearMaterias.jsp");
            }else{
                response.sendRedirect("administrador/index.jsp");
            }
            
            
            
            
        }finally{
            out.close();            
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
         out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@9'></script>");
                out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>");
                out.println("<script>");
                out.println("$(document).ready(function(){");
                out.println("Swal.fire('Agregado Registro','success!','success');");
                out.println("});");
                out.println("</script>");
       
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
