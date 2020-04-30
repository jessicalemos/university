/*
 * ListGames
 * ruicouto in 10/abr/2017
 */
package web;

import business.GMSFacade;
import business.Game;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ruicouto
 */
@WebServlet(name = "ListGames", urlPatterns = {"/ListGames"})
public class ListGames extends HttpServlet {
    private String user;
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
        
        if (user != null){
            System.out.print(user);
            request.setAttribute("username", user);
            request.setAttribute("login","success");
        } else {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            if(username!=null && password!=null) {
                Boolean check = GMSFacade.checkUser(username, password);
                if (check){
                    user = username;
                    request.setAttribute("username", user);
                    request.setAttribute("login","success");
                }
            }
        }
        String action = (String) request.getParameter("action");
        System.out.println(action);
        if (action != null && action.equals("mygames")) {
                List<Game> mylist = GMSFacade.myGames();
                System.out.println(mylist.toString());
                request.setAttribute("mygames",mylist);
                request.setAttribute("template","MyGames");
        } else {
            String game = (String) request.getParameter("mygame");
            if (game != null){
                Game g = GMSFacade.getGameInfo(game);
                request.setAttribute("game",g);
                request.setAttribute("template","Game");
            } else {
                List<Game> list = GMSFacade.listGames(Integer.parseInt(request.getParameter("page")));
                System.out.println(list.toString());
                request.setAttribute("games", list);
                request.setAttribute("template","ListGames");
            }
        }
        getServletConfig().getServletContext()
            .getRequestDispatcher("/WEB-INF/Template.jsp").forward(request,response);
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
