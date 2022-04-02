/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.user;

import daos.EventAccountDAO;
import daos.EventsDAO;
import dtos.EventAccountDTO;
import dtos.EventDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
public class LoadEventDetailController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            String txtEventID = (String) request.getParameter("txtID");
            int eventID = Integer.parseInt(txtEventID);
            EventsDAO dao = new EventsDAO();
            EventDTO dto = dao.getEventByID(eventID);
            HttpSession session = request.getSession();
            if (dto != null) {
                request.setAttribute("DTO_DETAIL", dto);
                // Check Event còn thời hạn không
                SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Date endDate = fmt.parse(dto.getEndDate());

                Date tmp = new Date();
                String tmpStr = fmt.format(tmp.getTime());
                Date now = fmt.parse(tmpStr);

                if (now.before(endDate)) {
                    request.setAttribute("CHECKTIME", "OK");
                } else {
                    request.setAttribute("CHECKTIME", "TIMEOVER");
                }

            }

            // Sự kiện gần đây
            List<EventDTO> listEvent = dao.getList4NewEventNoType();
            if (listEvent != null) {
                request.setAttribute("LIST4EVENTRECENT", listEvent);
            }

            // check UserID đã từng đăng ký EventID nào
            EventAccountDAO eaDAO = new EventAccountDAO();
            int userID = (Integer) session.getAttribute("USER_ID");

            if (userID > 0 && eventID > 0) {
                List<EventAccountDTO> filter = new ArrayList<>();
                List<EventAccountDTO> ListEA = eaDAO.getListEventHasAccountByUserID(userID);
                for (EventAccountDTO ea : ListEA) {
                    if (ea.getEventId() == eventID) {
                        filter.add(ea);
                    }
                }
                try { // Nếu đã apply Event trước đó
                    if (filter.get(0).isStatus()) {
                        request.setAttribute("CHECKEVENT", "found"); // đã đăng ký
                    } else if (!filter.get(0).isStatus()) {
                        request.setAttribute("CHECKEVENT", "notFound");  // đằng ký ngay
                    }
                } catch (Exception e) { // Chưa apply Event này bao giờ
                    request.setAttribute("CHECKEVENT", "notFound");  // đằng ký ngay

                }

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher("user/eventDetail.jsp").forward(request, response);
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
