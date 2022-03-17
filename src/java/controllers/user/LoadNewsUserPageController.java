/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.user;

import daos.NewsDAO;
import daos.NewsImageDAO;
import dtos.NewsDTO;
import dtos.NewsImageDTO;
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
public class LoadNewsUserPageController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            NewsDAO dao = new NewsDAO();
            NewsImageDAO imgDAO = new NewsImageDAO();
            List<NewsDTO> listNews = dao.getList3NewNews();
            if (listNews != null) {
                NewsDTO dto1 = dao.getList3NewNews().get(dao.getList3NewNews().size() - 3);
                NewsDTO dto2 = dao.getList3NewNews().get(dao.getList3NewNews().size() - 2);
                NewsDTO dto3 = dao.getList3NewNews().get(dao.getList3NewNews().size() - 1);

                request.setAttribute("BIG_NEWS_1", dto1);
                request.setAttribute("BIG_NEWS_2", dto2);
                request.setAttribute("BIG_NEWS_3", dto3);
            }
            
            // ------------------ Get List Image News -----------------------------------
            List<NewsImageDTO> listImg = imgDAO.getListNewsImageDesc();
            HttpSession session = request.getSession();
            List<NewsImageDTO> filterImg = new ArrayList<>();
            if (listImg != null) {
                session.setAttribute("LIST_NEWS_IMG", listImg);
                for (NewsDTO n : listNews) {
                    for (NewsImageDTO imgs : listImg) {
                        if (n.getId() == imgs.getNewId()) {
                            filterImg.add(imgs);
                        }
                    }
                }
            }

            if (filterImg != null) {
                session.setAttribute("LIST_3_News_IMG", filterImg);
            }

            // ------------------ Get 4 News with 3 Tag -----------------------------
            List<NewsDTO> listNews4Tag_1 = dao.getList4NewNewsByTag("4"); // Đời sống sv
            List<NewsDTO> listNews4Tag_2 = dao.getList4NewNewsByTag("5"); // FPT High-tech
            List<NewsDTO> listNews4Tag_3 = dao.getList4NewNewsByTag("6"); // Hội nhập quốc tế
            if (listNews4Tag_1 != null) {
                request.setAttribute("LIST_TAG1", listNews4Tag_1);
            }
            if (listNews4Tag_2 != null) {
                request.setAttribute("LIST_TAG2", listNews4Tag_2);
            }
            if (listNews4Tag_3 != null) {
                request.setAttribute("LIST_TAG3", listNews4Tag_3);
            }
            
            
            

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher("user/news.jsp").forward(request, response);
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
