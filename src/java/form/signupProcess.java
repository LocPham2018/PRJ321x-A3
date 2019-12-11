/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package form;

import entity.UserMap;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author AMIN
 */
@WebServlet(name = "signupProcess", urlPatterns = {"/signupProcess"})
public class signupProcess extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            HttpSession session = request.getSession();
            UserMap map = UserMap.getInstance();
            
            if (map.getUserMap().keySet().contains(username)) {
                session.setAttribute("message", "Username already exist.");
                response.sendRedirect("/PRJ321x-A3/sign-up.jsp");
            } else {
                boolean checkUser = Pattern.compile("[!@#$%^&*(),.?\":{}|<>]").matcher(username).find();
                boolean checkPass = Pattern.compile("[!@#$%^&*(),.?\":{}|<>]").matcher(password).find()
                        && Pattern.compile("[A-Z]").matcher(password).find()
                        && Pattern.compile("[0-9]").matcher(password).find();
                if (username.length() > 6 && !checkUser && password.length() > 8 && checkPass) {
                    map.add(username, password);
                    map.save();
                    response.sendRedirect("/PRJ321x-A3/login.jsp");
                } else {
                    if (username.length() <= 6) session.setAttribute("username check", "Username must have more than 6 characters.");
                    else if (checkUser) session.setAttribute("username check", "Username must not contain any special characters.");
                    if (password.length() <= 8) session.setAttribute("password check", "Password must have more than 8 characters.");
                    else if (!checkPass) session.setAttribute("password check", "Password must contain capital letters, numbers and special characters.");
                    response.sendRedirect("/PRJ321x-A3/sign-up.jsp");
                }
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
