/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Modelo.Conexion;
import Clases.Usuarios;
import Modelo.UsuariosDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author emanjarres
 */
public class Controlador extends HttpServlet {
    
    Usuarios user = new Usuarios();
    String r=null;
   
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
            response.setHeader("Cache-Control","no-cache");
            response.setHeader("Cache-Control","no-store");
            response.setDateHeader("Expires", 0);
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            //String accion=request.getParameter("accion");
            
              String accion=request.getParameter("accion");
            if(accion.equals("Ingresar"))
            {
            
            String mail =request.getParameter("email");            
            String pass = request.getParameter("password");           
            UsuariosDao dao = new UsuariosDao();
            String pass_encriptado =dao.getEncriptacion(pass);
//          out.print(mail); 
//          response.sendRedirect("Tutores/index.jsp");
            
            Conexion conexion = new Conexion();
            PreparedStatement pst = null;
            ResultSet rs = null;            
            int tipo = 0;
            
                try {
                    String consulta = "Select * FROM usuarios WHERE Mail_users = '"+mail+"' AND Pass_users='"+pass_encriptado+"'";
                    pst = (PreparedStatement) conexion.getConexion().prepareStatement(consulta);
                    rs = pst.executeQuery();

                    while (rs.next()) {
                        tipo = rs.getInt("Type_users");
                    }
//                  ut.print(tipo);                    
                        switch (tipo) {
                            case 1: {
                                //Monitor Aula
                                HttpSession objetoSesion = request.getSession();
                                objetoSesion.setAttribute("Usuario", mail);
                                response.sendRedirect("Monitores/index.jsp");
                                break;
                            }
                            case 2: {
                                //Monitor Academico
                                HttpSession objetoSesion = request.getSession();
                                objetoSesion.setAttribute("Usuario", mail);
                                response.sendRedirect("Monitores/index.jsp");
                                break;
                            }
                            case 3: {
                                //Funcionario
                                HttpSession objetoSesion = request.getSession();
                                objetoSesion.setAttribute("UsuarioAutenticado", mail);
                                response.sendRedirect("OficinaOPE/index.jsp");
                                break;
                            }
                            case 4: {
                                //Administrador
                                HttpSession objetoSesion = request.getSession();
                                objetoSesion.setAttribute("UsuarioLogeado", mail);
                                response.sendRedirect("administrador/index.jsp");
                                break;
                            }
                             case 5: {
                                //Monitor Virtual
                                HttpSession objetoSesion = request.getSession();
                                objetoSesion.setAttribute("Usuario", mail);
                                response.sendRedirect("Monitores/index.jsp");
                                break;
                            }
                            default:
                                 //HttpSession objetoSesion = request.getSession();
                                 //objetoSesion.setAttribute("UsuarioIncorrecto", mail);
                                 response.sendRedirect("index.jsp?error=usuarioyclaveincorrecta");
                                //out.print("Error en el switch");
                        }

                    

                } catch (SQLException e) {
                    out.println("Error 3: " + e);
                } finally {
                    try {
                        if (pst != null) {
                            pst.close();
                        }
                        if (rs != null) {
                            rs.close();
                        }
                    } catch (SQLException e) {
                        out.println("Error 4: " + e);
                    }
                }
//                fin try catch
            
//            if(r==1){
//                  HttpSession usua =request.getSession();
//                  HttpSession clave =request.getSession();
//                  usua.setAttribute("usuario",usuario);
//                  
//                  //usua.setMaxInactiveInterval(600);
//                   response.sendRedirect("administrador/index.jsp");
//                 //request.getSession().setAttribute("nom", nombrecompleto);
//                 //request.getSession().setAttribute("usuario",usuario);
//                
//                //request.getRequestDispatcher("administrador/index.jsp").forward(request, response);
//            }else{
//                 response.sendRedirect("index.jsp?accion=usuario&claveincorrecta");
//                 //out.println("<div class='text-danger text-center'>Usuario y/o Clave incorrecta!</div>");
//                //request.getRequestDispatcher("index.jsp").forward(request, response);
//            }
//            
//            }else{
//                response.sendRedirect("index.jsp");
//                 //request.getRequestDispatcher("index.jsp").forward(request, response);
//            }
            
           
          
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
