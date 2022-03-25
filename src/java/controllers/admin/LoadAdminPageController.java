/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.admin;

import daos.CompanyDAO;
import daos.EventImageDAO;
import daos.EventsDAO;
import daos.NewsDAO;
import daos.NewsImageDAO;
import daos.RecruitmentDAO;
import dtos.CompanyDTO;
import dtos.EventDTO;
import dtos.EventsImageDTO;
import dtos.NewsDTO;
import dtos.NewsImageDTO;
import dtos.RecruitmentDTO;
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
public class LoadAdminPageController extends HttpServlet {
    // Dashboard

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            EventsDAO eventDAO = new EventsDAO();

            // ------------------ Get 1 new Event -----------------------------
            EventDTO eventDTO = eventDAO.get1NewEvent();
            if (eventDTO != null) {
                request.setAttribute("EVENT", eventDTO);
            }
            // get list Event Image
            EventImageDAO imgDAO = new EventImageDAO();
            List<EventsImageDTO> listImg = imgDAO.getListEventsImageDesc();
            HttpSession session = request.getSession();

            if (listImg != null) {
                session.setAttribute("LIST_EVENT_IMG", listImg);
            }
            // ------------------ Get 1 new News -----------------------------
            NewsDAO newsDAO = new NewsDAO();
            NewsDTO newsDTO = newsDAO.get1NewNews();
            if (newsDTO != null) {
                request.setAttribute("NEWS", newsDTO);
            }
            NewsImageDAO newsImageDAO = new NewsImageDAO();
            List<NewsImageDTO> list_newsImage = newsImageDAO.getListNewsImage();

            if (list_newsImage != null) {
                session.setAttribute("LIST_NEWS_IMG", list_newsImage);
                List<NewsImageDTO> filter = new ArrayList<>();
                for (NewsImageDTO n : list_newsImage) {
                    if (newsDTO.getId() == n.getNewId()) {
                        filter.add(n);
                    }
                }
                if (filter != null) {
                    request.setAttribute("NEWS_IMG", filter);
                }
            }
            // ------------------ Get 1 new Recruitment -----------------------------  
            RecruitmentDAO reDAO = new RecruitmentDAO();
            RecruitmentDTO reDTO = reDAO.get1NewRecruitment();
            if (reDTO != null) {
                request.setAttribute("RE", reDTO);
            }
            CompanyDAO comDAO = new CompanyDAO();
            List<CompanyDTO> list_comImg = comDAO.getListCompany();

            if (list_comImg != null) {
                session.setAttribute("LIST_RE_IMG", list_comImg);
                List<CompanyDTO> filter = new ArrayList<>();
                for (CompanyDTO c : list_comImg) {
                    if (reDTO.getCompanyId() == c.getId()) {
                        filter.add(c);
                    }
                }
                if (filter != null) {
                    request.setAttribute("RE_IMG", filter);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher("admin/admin.jsp").forward(request, response);
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
