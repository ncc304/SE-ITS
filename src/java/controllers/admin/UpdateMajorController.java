/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.admin;

import daos.MajorDAO;
import dtos.MajorDTO;
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
public class UpdateMajorController extends HttpServlet {
     private static final String SUCCESS = "LoadMajorController";
     private static final String ERROR = "admin/updateMajor.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SUCCESS;
        try {
            String txtMajorID = request.getParameter("txtID");
            int majorID = Integer.parseInt(txtMajorID);
            String txtName = request.getParameter("txtName");
            String txtOverView = request.getParameter("overView");
            String txtSkill = request.getParameter("skill");
            String txtOp = request.getParameter("opportunity");
            
            MajorDAO dao = new MajorDAO();
            MajorDTO dto = new MajorDTO(majorID, txtName, txtOverView, txtSkill, "", txtOp);
            
            boolean check = dao.updateMajor(dto);
            if(check){
                request.setAttribute("MSG", "UPDATE_MAJOR_SUCCESS");
                request.setAttribute("MAJORNAME", dto.getName());
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
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
