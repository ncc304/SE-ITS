/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.admin;

import daos.NewsDAO;
import daos.NewsImageDAO;
import daos.NewsNewsTagDAO;
import dtos.NewsDTO;
import dtos.NewsImageDTO;
import dtos.NewsNewsTagDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class CreateNewsController extends HttpServlet {

    private static final String ERROR = "admin/createNews.jsp";
    private static final String SUCCESS = "LoadNewsPageController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String thumbnail = request.getParameter("thumbnail");
            String title = request.getParameter("txtTitle");
            String content = request.getParameter("content");
            String category = request.getParameter("category");
            
            HttpSession session = request.getSession();
            String userName = (String) session.getAttribute("USER_NAME");
            
            NewsDAO newsDAO = new NewsDAO();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            java.util.Date createDateTmp = new java.util.Date();
            String createDate = format.format(createDateTmp);
            
            NewsDTO dto = new NewsDTO(0, title, true, createDate, content, userName, 0);
            boolean check = newsDAO.createtNews(dto); // Thêm tbl News
            if(check){
                NewsImageDAO imgDAO = new NewsImageDAO();
                NewsDTO lastestID = newsDAO.getListNews().get(newsDAO.getListNews().size() - 1);
                NewsImageDTO imgDTO = new NewsImageDTO(0, thumbnail, lastestID.getId());
                boolean check1 = imgDAO.createtNewsImage(imgDTO); // Thêm tbl News Image
                if(check1){
                    NewsNewsTagDAO tagDao = new NewsNewsTagDAO();
                    NewsNewsTagDTO tagDTO = new NewsNewsTagDTO(0, Integer.parseInt(category), lastestID.getId());
                    boolean check3 = tagDao.createtNewsNewsTag(tagDTO); // Thêm tbl News Tag
                    if(check3){
                            request.setAttribute("MSG", "CREATE_NEWS_SUCCESS");
                        request.setAttribute("NEWS_NAME", dto.getName());
                        url = SUCCESS;
                    }
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
