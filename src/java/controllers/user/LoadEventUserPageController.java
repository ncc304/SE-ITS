/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.user;

import daos.EventImageDAO;
import daos.EventsDAO;
import dtos.EventDTO;
import dtos.EventsImageDTO;
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
public class LoadEventUserPageController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            EventsDAO dao = new EventsDAO();
            EventDTO dto = new EventDTO();

            //Load 3 Big Event gồm Event Name + Image
            List<EventDTO> list_New_3_Events = dao.getList3NewEvent();
            // 1. Lấy Event name
            if (list_New_3_Events != null) {
                // New event 1, 2, 3        23 > 21 > 20
                EventDTO dto1 = dao.getList3NewEvent().get(dao.getList3NewEvent().size() - 3); // id=23
                EventDTO dto2 = dao.getList3NewEvent().get(dao.getList3NewEvent().size() - 2); // id=21
                EventDTO dto3 = dao.getList3NewEvent().get(dao.getList3NewEvent().size() - 1); // id=20

                request.setAttribute("BIG_EVENT_1", dto1); // 23
                request.setAttribute("BIG_EVENT_2", dto2); // 21
                request.setAttribute("BIG_EVENT_3", dto3); // 20
            }
            
            // 2. Lấy Event Image 
            // get list Event Image
            EventImageDAO imgDAO = new EventImageDAO();
            List<EventsImageDTO> listImg = imgDAO.getListEventsImageDesc();
            HttpSession session = request.getSession();
            List<EventsImageDTO> filterImage = new ArrayList<>();
            for (EventDTO e : list_New_3_Events) {
                for (EventsImageDTO image : listImg) {
                    if (e.getId() == image.getEventId()) {
                        filterImage.add(image);
                    }
                }
            }

            if (listImg != null) {
                session.setAttribute("LIST_3_IMG", filterImage);
                session.setAttribute("LIST_EVENT_IMG", listImg);
            }

            // ------------------ Get 4 Event offline & online -----------------------------
            // 1. Get name
            List<EventDTO> list4Onl = dao.getList4NewEvent("online");
            List<EventDTO> list4Off = dao.getList4NewEvent("offline");
            if (list4Onl != null) {
                request.setAttribute("ONLINE4", list4Onl);
            }
            if (list4Off != null) {
                request.setAttribute("OFFLINE4", list4Off);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher("user/event.jsp").forward(request, response);
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
