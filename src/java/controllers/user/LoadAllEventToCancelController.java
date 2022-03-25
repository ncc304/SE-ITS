/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.user;

import daos.EventAccountDAO;
import daos.EventImageDAO;
import daos.EventsDAO;
import dtos.EventAccountDTO;
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
public class LoadAllEventToCancelController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            // Lất tất cả Events mà user đã tham gia

            EventsDAO eventDAO = new EventsDAO();
            HttpSession session = request.getSession();
            int userID = (Integer) session.getAttribute("USER_ID");
            List<EventDTO> listEvent = eventDAO.getListEventByAccountID(userID);
            if (listEvent != null && listEvent.size() > 0) {
                request.setAttribute("LIST_EVENT", listEvent);

                
                
                EventAccountDAO eaDAO = new EventAccountDAO();
                List<EventAccountDTO> listEA = eaDAO.getListEventAccount(userID);
                List<EventAccountDTO> filter = new ArrayList<>();
                for (EventDTO e : listEvent) {
                    for (EventAccountDTO ea : listEA) {
                        if (e.getId() == ea.getEventId()) {
                            filter.add(ea);
                        }
                    }
                }
                if (filter != null && filter.size() > 0) {
                    request.setAttribute("LIST_EA", filter);
                    String msg = (String) request.getAttribute("MSG");
                    String eventName = (String) request.getAttribute("EVENT_NAME");
                    request.setAttribute("MSG", msg);
                    request.setAttribute("EVENT_NAME", eventName);
                }
            }
            
            EventImageDAO imgDAO = new EventImageDAO();
            List<EventsImageDTO> listImg = imgDAO.getListEventsImageDesc();

            List<EventsImageDTO> filterImage = new ArrayList<>();
            for (EventDTO e : listEvent) {
                for (EventsImageDTO image : listImg) {
                    if (e.getId() == image.getEventId()) {
                        filterImage.add(image);
                    }
                }
            }

            if(filterImage != null && filterImage.size() > 0){
                request.setAttribute("LIST_EVENT_IMG", filterImage);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher("user/event_cancel.jsp").forward(request, response);
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
