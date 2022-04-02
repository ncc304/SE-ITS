/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.user;

import daos.EventAccountDAO;
import dtos.EventAccountDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class ApplyEventController extends HttpServlet {

    // Đã login và thêm tiếp sự kiện
    private static final String backEventDetail = "MainController?action=goEventDetails&txtID=";
    private static final String ERROR = "error.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            String txtEventID = request.getParameter("txtID");
            int eventID = Integer.parseInt(txtEventID);
            int userID = (Integer) session.getAttribute("USER_ID");

            EventAccountDAO eaDAO = new EventAccountDAO();
            EventAccountDTO eaDTO = new EventAccountDTO(0, eventID, userID, true);

            // check event_id đã có trong db table event has acount chưa
            if (userID > 0 && eventID > 0) {
                boolean checkEventID = eaDAO.checkEventID(userID, eventID);
                if (checkEventID) {     // update status 0              
                    EventAccountDTO eaDTO2 = new EventAccountDTO(0, eventID, userID, true);
                    boolean check = eaDAO.updateEventAccount(eaDTO2);
                    if (check) {
                        url = backEventDetail + eventID;
                    }
                } else { // insert tbl  
                    boolean check = eaDAO.createtEventAccount(eaDTO);
                    if (check) {
                        url = backEventDetail + eventID;
                    }
                }

            }

        } catch (Exception e) {
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
