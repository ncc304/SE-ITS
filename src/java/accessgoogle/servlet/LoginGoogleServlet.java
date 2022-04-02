/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package accessgoogle.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import accessgoogle.common.GooglePojo;
import accessgoogle.common.GoogleUtils;
import daos.AccountDAO;
import daos.EventAccountDAO;
import dtos.AccountDTO;
import dtos.EventAccountDTO;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class LoginGoogleServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String adminPage = "LoadAdminPageController";
    private static final String error = "login.jsp";
//    private static final String backEventDetail = "MainController?action=goEventDetails&txtID=";
    private static final String home = "user/home.jsp";
    private static final String eventPage = "LoadEventUserPageController";

    public LoginGoogleServlet() {
        super();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = error;
        try {
            
            String code = request.getParameter("code");
            if (code != null || !code.isEmpty()) {
                HttpSession session = request.getSession();
                String accessToken = GoogleUtils.getToken(code);
                GooglePojo gPojo = GoogleUtils.getUserInfo(accessToken);
//                UserDAO dao = new UserDAO();

                AccountDAO dao = new AccountDAO();
                String email = gPojo.getEmail();
                String name = null;
                int userID = 0;
                int eventID = 0;

                String check = dao.checkLogin(email);
                if (check == "Login Fail") { // Lần đầu Login
                    String[] sliter = email.split("@");
                    name = sliter[0];
                    if (name != null) {
                        AccountDTO dto = new AccountDTO(0, email, 4, name, "", false);
                        // INSERT tblAccount
                        boolean check2 = dao.addAccountRegisEvent(dto);
                        if (check2) {
//                            try { // Apply Event: từ trang eventDetails -> đăng ký ngay
//                                userID = dao.getUserID(email);
//                                eventID = (Integer) session.getAttribute("BACK_TO_EVENTDETAIL");
//                                if (eventID > 0) {
//                                    // Get Account DTO
//                                    AccountDTO dto_hasData = dao.getAccountByEmail(email);
//                                    // INSERT tblEventHasAccount
//                                    EventAccountDAO eaDAO = new EventAccountDAO();
//                                    EventAccountDTO eaDTO = new EventAccountDTO(0, eventID, dto_hasData.getId(), true);
//                                    boolean check3 = eaDAO.createtEventAccount(eaDTO);
//                                    if (check3) {
//                                        url = backEventDetail + eventID;
//                                    }
//                                }
//                            } catch (Exception e) { // user chưa apply event
//                                url = home;
//                            }
                            url = eventPage;
                        }
                    }

                } else if (check == "Admin") {
                    userID = dao.getUserID(email);
                    url = adminPage;
                    session.setAttribute("XACTHUC", "ADMIN");
                } else { // User
                    userID = dao.getUserID(email);
                    url = eventPage;
                    session.setAttribute("XACTHUC", "USER");
                }

                String userName = dao.getUserName(email);

                session.setAttribute("email", email);
                session.setAttribute("USER_ID", userID);
                session.setAttribute("USER_NAME", userName);

            }
        } catch (Exception e) {
        } finally {
//            response.sendRedirect(url);
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
