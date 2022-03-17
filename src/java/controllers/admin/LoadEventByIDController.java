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
            String txtName = request.getParameter("txtEventName");
            String txtStart = request.getParameter("txtStart");
            String txtEnd = request.getParameter("txtEnd");
            String txtStatus = request.getParameter("txtStatus");
            String txtDes = request.getParameter("txtDes");
            String txtType = request.getParameter("txtType");
            String txtImg = request.getParameter("txtImg");

//            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
//            java.util.Date d1 = new java.util.Date();
//            Timestamp t1 = new Timestamp(d1.getTime());
//            t1 = format.format(t1.);
//            String startReal = format.format(d1);
//            String dateTime = "2020-12-12 01:24:23";
//            Timestamp timestamp = Timestamp.valueOf(txtStart);
//            System.out.println("realll: " + timestamp.toString());
//            System.out.println("realll: " + txtStart);
            String[] tmp = txtStart.split(" ");
            String date1 = tmp[0] + "T" + tmp[1];

//            2018-06-12T19:30
            EventDTO dto
                    = new EventDTO(Integer.parseInt(txtID), txtName, date1, txtEnd, Boolean.parseBoolean(txtStatus), txtDes, "", txtType, "");

            EventsDAO dao = new EventsDAO();

            if (dto != null) {
                request.setAttribute("EVENT", dto);
                request.setAttribute("IMG", txtImg);
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
