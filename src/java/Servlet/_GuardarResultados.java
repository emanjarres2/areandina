/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Clases.Resultado;
import Modelo.GestionesTutorias;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author manjarres
 */
public class _GuardarResultados extends HttpServlet {

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
        
//        String estudiante = request.getParameter("estudiante");
//        Date fecha = Date.valueOf(request.getParameter("fecha"));
//        int factor = Integer.parseInt(request.getParameter("factor"));
//        int monitoria = Integer.parseInt(request.getParameter("monitoria"));
//        int sede = Integer.parseInt(request.getParameter("sede"));
//        int facultad = Integer.parseInt(request.getParameter("facultad"));
//        int programa = Integer.parseInt(request.getParameter("programa"));
//        int materia = Integer.parseInt(request.getParameter("materia"));       
//        int remision = Integer.parseInt(request.getParameter("remision"));
//        String evidencia = request.getParameter("evidencias");       
//        String texto = request.getParameter("texto");                 
//        out.print("Codigo del estudiante: "+estudiante+"/ Fecha: "+fecha+"/ Factor: "+factor+"/ Monitoria: "+monitoria
//        +"/ Sede: "+sede+"/ Facultad: "+facultad+"/ Programa: "+programa+"/ Materia: "+materia+"/ Remision: "+remision
//        +"/ Evidencia: "+evidencia+"/ Observaciones: "+texto);
        
        String accion = request.getParameter("btnGuardar");
        SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
        String ruta = "C:\\Users\\manjarres\\Documents\\areandina\\web\\evidencias\\";
        Resultado r = new Resultado();
        GestionesTutorias gt = new GestionesTutorias();
        
        //out.print(accion);
        
        switch (accion){               
            case "guardar":
                ArrayList<String> lista = new ArrayList<>();
                try {
                    FileItemFactory file = new DiskFileItemFactory();
                    ServletFileUpload fileUpload = new ServletFileUpload(file);
                    
                    List items = fileUpload.parseRequest(request);
                    
                    for (int i = 0; i < items.size(); i++) {
                        FileItem fileitem = (FileItem)items.get(i);
                        if(!fileitem.isFormField()){
                            File f = new File(ruta+fileitem.getName());
                            fileitem.write(f);
                            r.setRuta(ruta+fileitem.getName());
                        }else{
                            lista.add(fileitem.getString());
                        }
                    }
                    
                    
                    r.setRemision(Integer.parseInt(lista.get(1)));                    
                    r.setFecha(Date.valueOf(lista.get(2)));                    
                    r.setAsignatura(Integer.parseInt(lista.get(3)));                    
                    r.setObservaciones(lista.get(4));
                    r.setNombre(lista.get(5)); 
                    r.setIdEstudiante(lista.get(6));
                    
                    gt.repotarTutorias(r);
                    
                } catch (Exception e) {
                    out.print("Error: "+ e);
                }   
                
                    response.sendRedirect("Monitores/index.jsp");
                    break;
            default:
                throw new AssertionError();
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
