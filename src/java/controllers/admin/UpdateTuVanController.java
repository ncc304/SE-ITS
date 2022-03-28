/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.admin;

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
public class UpdateTuVanController extends HttpServlet {
    //Hoàn tác: Update status chưa gọi -> đã gọi
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String txtUserID = request.getParameter("txtUserID");
            int userID = Integer.parseInt(txtUserID);
            StudentApplicationDAO dao = new StudentApplicationDAO();
            
            boolean check = dao.updateStatusStudentApplication(userID, 0); // 6 trong DB là delete
            if (check) {
                request.setAttribute("MSG", "UNDO_USER_SUCCESS");
                // Get UserName
                StudentApplicationDTO dto = dao.getStudentApplicationByID(userID);
                request.setAttribute("USER_NAME", dto.getName());
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher("LoadTuVanPageController").forward(request, response);
//            response.sendRedirect("MainController?action=deleteUser&MSG='abc'");
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
