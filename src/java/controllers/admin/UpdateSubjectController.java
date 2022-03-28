/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.admin;

import daos.SubjectDAO;
import dtos.SubjectDTO;
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
public class UpdateSubjectController extends HttpServlet {

    private static final String SUCCESS = "LoadSubjectController";
    private static final String ERROR = "admin/updateSubject.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String txtSubID = request.getParameter("txtID");
            int subID = Integer.parseInt(txtSubID);
            String txtName = request.getParameter("txtName");
            String txtSource = request.getParameter("txtSource");
            String major = request.getParameter("major");
            int majorID = Integer.parseInt(major);
            String statusStr = request.getParameter("status");
            boolean status = false;
            if(statusStr.equals("1")){
                status = true;
            }
            
            SubjectDTO dto = new SubjectDTO(subID, txtSource, txtName, majorID, status);
            SubjectDAO dao = new SubjectDAO();
            boolean check = dao.updateSubject(dto);
            if(check){
                request.setAttribute("MSG", "UPDATE_SUB_SUCCESS");
                SubjectDTO dto1 = dao.getSubjectByID(subID);
                if(dto1 != null){
                    request.setAttribute("SUBNAME", dto1.getName());
                    url = SUCCESS;
                }
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
