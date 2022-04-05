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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class UpdateNewsController extends HttpServlet {
private static final String SUCCESS = "LoadNewsPageController";
private static final String ERROR = "admin/updateNews.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            int id = Integer.parseInt(request.getParameter("txtID"));
            String thumbnail = request.getParameter("thumbnail");
            String txtImg = request.getParameter("txtImg");
            if (thumbnail.equals("") || thumbnail.isEmpty()) {
                thumbnail = txtImg;
            }
            String txtTitle = request.getParameter("txtTitle");
            String content = request.getParameter("content");
            int cate = Integer.parseInt(request.getParameter("category"));
            int statusInt = Integer.parseInt(request.getParameter("status"));
            boolean status = false;
            if(statusInt == 1){
                status = true;
            }
            HttpSession session = request.getSession();
            String userName = (String) session.getAttribute("USER_NAME");

            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            java.util.Date createDateTmp = new java.util.Date();
            String createDate = format.format(createDateTmp);
            
            NewsDAO newsDAO = new NewsDAO();
            NewsDTO dtoDetail = newsDAO.getNewsByID_NotCount(id);
            if(dtoDetail != null){
                NewsDTO newsDTO = new NewsDTO(id, txtTitle, status, createDate, content, userName, dtoDetail.getView());
                boolean check1 = newsDAO.updateNews(newsDTO); // Update tbl News
                if(check1){
                    NewsImageDAO imgDAO = new NewsImageDAO();
                    NewsImageDTO imgDTODetail = imgDAO.getNewsImageByID(id);
                    if(imgDTODetail != null){
                        NewsImageDTO imgDTO = new NewsImageDTO(imgDTODetail.getId(), thumbnail, id);
                        boolean check2 = imgDAO.updateNewsImage(imgDTO); // Update tbl News Image
                        if(check2){
                            NewsNewsTagDAO tagDAO = new NewsNewsTagDAO();
                            NewsNewsTagDTO tagDTODetail = tagDAO.getTagByNewsID(id);
                            if(tagDTODetail != null){
                                NewsNewsTagDTO tagDTO = new NewsNewsTagDTO(tagDTODetail.getId(), cate, id);
                                boolean check3 = tagDAO.updateNewsNewsTag(tagDTO);
                                if(check3){
                                    request.setAttribute("MSG", "UPDATE_NEWS_SUCCESS");
                                    request.setAttribute("INFO", newsDTO);
                                    url = SUCCESS;
                                }
                            }
                        }
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
