/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.admin;

import daos.EventsDAO;
import dtos.EventDTO;
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
public class UpdateEventController extends HttpServlet {
    private static final String SUCCESS = "LoadEventPageController";
    private static final String ERROR = "admin/updateEvent.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String txtID = request.getParameter("txtID");
            int id = Integer.parseInt(txtID);
            String startDate = request.getParameter("date1");
            String endDate = request.getParameter("date2");
            String thumbnail = request.getParameter("thumbnail");
            String txtImg = request.getParameter("txtImg");
            if(thumbnail.isEmpty() || thumbnail.equals("")){
                thumbnail = txtImg;
            }
            String txtTitle = request.getParameter("txtTitle");
            String content = request.getParameter("content");
            String category = request.getParameter("category");
            String method = request.getParameter("method");
            String statusStr = request.getParameter("status");
            boolean status = false;
            if(statusStr.equals("1")){
                status = true;
            }else{
                status = false;
            }
            SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date now = new Date();
            String createDate = fmt.format(now);
            HttpSession session = request.getSession();
            String userName = (String) session.getAttribute("USER_NAME");
            EventDTO dto = new EventDTO(id, txtTitle, startDate, endDate, status, content, userName, method, createDate);
            
            EventsDAO dao = new EventsDAO();
            boolean check = dao.updateEvent(dto);
            if(check){
                url = SUCCESS;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
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
