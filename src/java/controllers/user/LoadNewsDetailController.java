/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.user;

import daos.NewsDAO;
import daos.NewsNewsTagDAO;
import dtos.NewsDTO;
import dtos.NewsNewsTagDTO;
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
public class LoadNewsDetailController extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String newsID = request.getParameter("txtID");
            NewsDAO dao = new NewsDAO();
            
            // Lấy NewsDetail
            NewsDTO dto = dao.getNewsByID(newsID);
            if(dto != null){
                request.setAttribute("NEWS_DETAIL", dto);
            }
            
            // Lấy Navigation
            NewsNewsTagDAO tagDAO = new NewsNewsTagDAO();
            NewsNewsTagDTO tagDTO = tagDAO.getTagByNewsID(newsID);
            if(tagDTO != null){
                request.setAttribute("TAG_ID", tagDTO);
            }
            
            // Lấy 4 Tin tức gần đây
            List<NewsDTO> list4recent = dao.getList4NewNewsNoTag();
            if(list4recent != null){
                request.setAttribute("LIST4_RECENT", list4recent);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher("user/newsDetail.jsp").forward(request, response);
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
