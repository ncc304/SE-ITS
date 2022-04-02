/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.admin;

import daos.EventCategoryDAO;
import daos.EventEventCategoryDAO;
import daos.EventsDAO;
import dtos.EventCategoryDTO;
import dtos.EventDTO;
import dtos.EventEventCategoryDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class LoadEventByIDController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String txtID = request.getParameter("txtEventID");
            int id = Integer.parseInt(txtID);
            String txtImg = request.getParameter("txtImg");
//            String txtName = request.getParameter("txtEventName");
//            String txtStart = request.getParameter("txtStart");
//            String txtEnd = request.getParameter("txtEnd");
//            String txtStatus = request.getParameter("txtStatus");
//            String txtDes = request.getParameter("txtDes");
//            String txtType = request.getParameter("txtType");

//
//            String[] tmp1 = txtStart.split(" ");
//            String startDate = tmp1[0] + "T" + tmp1[1];
//            
//            String[] tmp2 = txtEnd.split(" ");
//            String endDate = tmp2[0] + "T" + tmp2[1];
//            
////            2018-06-12T19:30
//            EventDTO dto
//                    = new EventDTO(Integer.parseInt(txtID), txtName, startDate, endDate, Boolean.parseBoolean(txtStatus), txtDes, "", txtType, "");
//
//            EventsDAO dao = new EventsDAO();
//
//            if (dto != null) {
//                request.setAttribute("EVENT", dto);
//                request.setAttribute("IMG", txtImg);
//            }
            EventsDAO dao = new EventsDAO();
            EventDTO dto = dao.getEventByID_Admin(id);
            if (dto != null) {

                String[] tmp1 = dto.getStartDate().split(" ");
                String startDate = tmp1[0] + "T" + tmp1[1];

                String[] tmp2 = dto.getEndDate().split(" ");
                String endDate = tmp2[0] + "T" + tmp2[1];
                dto.setStartDate(startDate);
                dto.setEndDate(endDate);
                request.setAttribute("EVENT", dto);
                request.setAttribute("IMG", txtImg);
            }
            
            EventEventCategoryDAO cateDAO = new EventEventCategoryDAO();
            List<EventEventCategoryDTO> listCate = cateDAO.getListEventEventCategory();
            if(listCate.size() > 0){
                request.setAttribute("CATE", listCate);
            
            }
            
            EventCategoryDAO cateDAO1 = new EventCategoryDAO();
            List<EventCategoryDTO> listCate1 = cateDAO1.getListEventCategory();
            if(listCate1.size() > 0){
                request.setAttribute("CATE1", listCate1);
            
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher("admin/updateEvent.jsp").forward(request, response);
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
