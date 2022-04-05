/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.admin;

import daos.NewsDAO;
import daos.NewsImageDAO;
import daos.NewsNewsTagDAO;
import daos.NewsTagDAO;
import dtos.NewsDTO;
import dtos.NewsImageDTO;
import dtos.NewsNewsTagDTO;
import dtos.NewsTagDTO;
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
public class LoadNewsByIDController extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String txtID = request.getParameter("txtID");
            int id = Integer.parseInt(txtID);
           
            NewsDAO dao = new NewsDAO();
            NewsDTO dto = dao.getNewsByID_NotCount(id);
            if(dto != null){
                request.setAttribute("NEWS", dto);
            }
            
            NewsImageDAO imgDAO = new NewsImageDAO();
            NewsImageDTO imgDTO = imgDAO.getNewsImageByID(id);
            if(imgDTO != null){
                request.setAttribute("IMG", imgDTO);
            }
            
            NewsTagDAO tagDAO = new NewsTagDAO();
            List<NewsTagDTO> listTag = tagDAO.getListNewsTag();
            if(listTag.size() >0){
                request.setAttribute("LIST_TAG", listTag);
            }
            
            // sub Tag
            NewsNewsTagDAO subTagDAO = new NewsNewsTagDAO();
            NewsNewsTagDTO subTag = subTagDAO.getTagByNewsID(id);
            if(subTag != null){
                request.setAttribute("SUB_TAG", subTag);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            request.getRequestDispatcher("admin/updateNews.jsp").forward(request, response);
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
