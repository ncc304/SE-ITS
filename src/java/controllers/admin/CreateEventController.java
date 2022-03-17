/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.admin;

import daos.EventEventCategoryDAO;
import daos.EventImageDAO;
import daos.EventsDAO;
import dtos.EventDTO;
import dtos.EventEventCategoryDTO;
import dtos.EventsImageDTO;
import java.io.IOException;
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
public class CreateEventController extends HttpServlet {
    private static final String ERROR = "admin/createEvent.jsp";
    private static final String SUCCESS = "LoadEventPageController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String url = ERROR;
        try {
            String date1 = request.getParameter("date1");
            String date2 = request.getParameter("date2");
            String thumbnail = request.getParameter("thumbnail");
            String title = request.getParameter("txtTitle");
            String content = request.getParameter("content");
            String category = request.getParameter("category");
            String method = request.getParameter("method");
            
            HttpSession session = request.getSession();
//            String email = (String) session.getAttribute("email");
//            int userID = (Integer) session.getAttribute("USER_ID");
            String userName = (String) session.getAttribute("USER_NAME");
//            int userID = Integer.parseInt(userIDStr);

            
            EventsDAO dao = new EventsDAO();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            java.util.Date createDate = new java.util.Date();
            String createDateStr = format.format(createDate);
            
            EventDTO dto = new EventDTO(0, title, date1, date2, true, content, userName, method, createDateStr);
            boolean check = dao.createtEvent(dto); // INSERT tbl EVENT

            if(check){
                request.setAttribute("CONTENT", dto.getDescription());
                EventImageDAO imgDAO = new EventImageDAO();
                
                EventDTO lastestID = dao.getListEvent().get(dao.getListEvent().size()-1);//get latest EventID
                EventsImageDTO imgDTO = new EventsImageDTO(thumbnail, lastestID.getId());
               
                boolean checkImg = imgDAO.createtEventsImage(imgDTO); // INSERT tbl EVENT_IMAGE
                if(checkImg == true ){ 
                    EventEventCategoryDAO cateDAO = new EventEventCategoryDAO();
                    EventEventCategoryDTO cateDTO = 
                            new EventEventCategoryDTO(0, lastestID.getId(), Integer.parseInt(category));
                    boolean checkCate = cateDAO.createtEventEventCategory(cateDTO);//INSERT tbl Event_Category_has_Events
                    if(checkCate){
                        url = SUCCESS;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            response.sendRedirect(url);
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
