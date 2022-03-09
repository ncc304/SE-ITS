/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package accessgoogle.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import accessgoogle.common.GooglePojo;
import accessgoogle.common.GoogleUtils;
import daos.AccountDAO;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class LoginGoogleServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private static final String adminPage = "admin/admin.jsp" ;
    private static final String userPage = "login.jsp" ;

    public LoginGoogleServlet() {
        super();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = userPage;
        try {
//            String code = request.getParameter("code");
//            if (code != null || !code.isEmpty()) {
//                HttpSession session = request.getSession();
//                String accessToken = GoogleUtils.getToken(code);
//                GooglePojo gPojo = GoogleUtils.getUserInfo(accessToken);
////                String userID = gPojo.getId();
////                UserDAO dao = new UserDAO();
//                String email = gPojo.getEmail();
////                UserDTO user = dao.checkLoginGoogle(userID);
////                if (user == null) {
////                    user = new UserDTO(userID, email, "US");
////                    dao.createUserGoogle(user);
////                }
//                session.setAttribute("email", email);
//                url = "admin/admin.jsp";
//            }
            String code = request.getParameter("code");
            if (code != null || !code.isEmpty()) {
                HttpSession session = request.getSession();
                String accessToken = GoogleUtils.getToken(code);
                GooglePojo gPojo = GoogleUtils.getUserInfo(accessToken);
//                UserDAO dao = new UserDAO();
                AccountDAO dao = new AccountDAO();
                String email = gPojo.getEmail();
                
                
                String check = dao.checkLogin(email);
                if (check == "Login Fail") {
                    email = "You don't have permisstion";
                }else{
                    url = adminPage;
                }
                // Get UserID
                int userID = dao.getUserID(email);
                //Get UserName
                String userName = dao.getUserName(email);
                
                session.setAttribute("email", email);
                session.setAttribute("USER_ID", userID);
                session.setAttribute("USER_NAME", userName);
                
            }
        } catch (Exception e) {
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }
//    public static void main(String[] args) {
//        AccountDAO dao = new AccountDAO();
//        int userID = dao.getUserID("nguyenchicuong304@gmail.com");
//        System.out.println("ID: "+userID);
//    }
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
