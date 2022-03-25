/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.user;

import daos.StudentApplicationDAO;
import dtos.StudentApplicationDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class AddInfoTuVanController extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "";
        try {
            String txtName = request.getParameter("txtName");
            String txtPhone = request.getParameter("txtPhone");
            String txtType = request.getParameter("txtType");
            
            StudentApplicationDAO dao = new StudentApplicationDAO();
            StudentApplicationDTO dto = new StudentApplicationDTO(1, txtName, txtPhone, true);
            
            boolean check = dao.createtStudentApplication(dto);
            if (check) {
                request.setAttribute("MSG", "DKTUVAN_SUCCESS");
            }
            
            // Navigation
            if ("home".equals(txtType)) {
                url = "/user/home.jsp";
            } else if ("event".equals(txtType)) {
                url = "LoadEventUserPageController";
            } else if ("eventDetails".equals(txtType)) {
                url = "LoadEventUserPageController";
            } else if ("eventCancel".equals(txtType)) {
                url = "LoadEventUserPageController";
            } else if ("eventOff".equals(txtType)) {
                url = "LoadEventUserPageController";
            } else if ("EventOnl".equals(txtType)) {
                url = "LoadEventUserPageController";
            } else if ("its".equals(txtType)) {
                url = "/user/its.jsp";
            } else if ("major".equals(txtType)) {
                url = "/user/major.jsp";
            } else if ("se".equals(txtType)) {
                url = "/user/se.jsp";
            } else if ("news".equals(txtType)) {
                url = "LoadNewsUserPageController";
            } else if ("newsDetail".equals(txtType)) {
                url = "LoadNewsUserPageController";
            } else if ("newsReadMore".equals(txtType)) {
                url = "LoadNewsUserPageController";
            } else if ("re".equals(txtType)) {
                url = "LoadRecruitmentUserPageController";
            } else if ("reDetail".equals(txtType)) {
                url = "LoadRecruitmentUserPageController";
            } else if ("reReadMore".equals(txtType)) {
                url = "LoadRecruitmentUserPageController";
            }
            
        } catch (Exception e) {
            e.printStackTrace();
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
