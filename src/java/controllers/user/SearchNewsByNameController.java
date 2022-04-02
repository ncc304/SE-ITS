/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.user;

import daos.NewsDAO;
import dtos.NewsDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class SearchNewsByNameController extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String tag1 = "4";
        String tag2 = "5";
        String tag3 = "6";
        try {
            String txtTagID = request.getParameter("txtTagID");
            String searchName = request.getParameter("searchName");

            NewsDAO dao = new NewsDAO();
            // Tag 1
            if (txtTagID.equals("1")) {
                List<NewsDTO> listNewsTag1 = dao.searchAllNewsByTag(tag1, searchName);
                if (listNewsTag1 != null) {
                    request.setAttribute("TAG_READMORE", listNewsTag1);
                    request.setAttribute("txtTagID", txtTagID);
                }
            }

            // Tag 2
            if (txtTagID.equals("2")) {
                List<NewsDTO> listNewsTag2 = dao.searchAllNewsByTag(tag2, searchName);
                if (listNewsTag2 != null) {
                    request.setAttribute("TAG_READMORE", listNewsTag2);
                    request.setAttribute("txtTagID", txtTagID);
                }
            }

            // Tag 3
            if (txtTagID.equals("3")) {
                List<NewsDTO> listNewsTag3 = dao.searchAllNewsByTag(tag3, searchName);
                if (listNewsTag3 != null) {
                    request.setAttribute("TAG_READMORE", listNewsTag3);
                    request.setAttribute("txtTagID", txtTagID);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher("user/newsReadMore.jsp").forward(request, response);
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
