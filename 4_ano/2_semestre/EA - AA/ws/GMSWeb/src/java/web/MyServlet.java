/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import beans.NewSessionBeanLocal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;  
import com.fasterxml.jackson.databind.ObjectMapper;
import javax.ejb.EJB;
import main.Util;
import main.Game;

/**
 *
 * @author jessica
 */
@WebServlet(name = "MyServlet", urlPatterns = {"/MyServlet/games"})
public class MyServlet extends HttpServlet {

    @EJB
    private NewSessionBeanLocal newSessionBean;

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
        
        String[] url = request.getRequestURI().toString().split("/");
        String target = url[url.length-1];
        String method = request.getMethod();
        ObjectMapper mapper = new ObjectMapper();
        
        request.setAttribute("target", target);
        request.setAttribute("method", method);
        try {
            List<Game> games = newSessionBean.listGames(Util.getSession(request));
            String data = "";
            if(method.equals("POST")) {
                StringBuilder sb = new StringBuilder();
                String line;
                while ((line = request.getReader().readLine()) != null) {
                    sb.append(line);
                }
                data = sb.toString();

                //Decode JSON string
                Map<String,Object> JSON = mapper.readValue(data, Map.class);
                String name = "";
                String sJSON;
                for (Object s : JSON.values()){
                    name = (String) s;
                }
                for (Game g : games) {
                    if (g.getName().equals(name)) {
                        sJSON = mapper.writeValueAsString(g);
                        request.setAttribute("games", sJSON);
                    }
                }
            } else {
                //Encode an object as a JSON string
                List<String> list = new ArrayList<>();
                for (Game g : games) {
                    list.add(g.getName());
                }
                String sJSON = mapper.writeValueAsString(list);
                request.setAttribute("games", sJSON);
            }
        } catch (Exception e) {
             e.printStackTrace();
        }
 
        request.getRequestDispatcher("/WEB-INF/myServlet.jsp").forward(request, response);
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
