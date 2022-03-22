/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.user;

import daos.RecruitmentDAO;
import dtos.CompanyDTO;
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
public class LoadAllRecruitmentController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            RecruitmentDAO dao = new RecruitmentDAO();
            String txtCate = request.getParameter("txtCateID");
            HttpSession session = request.getSession();
            List<CompanyDTO> listCom = (List<CompanyDTO>) session.getAttribute("LISTCOM");

            if (txtCate.equals("4") || txtCate.equals("5") || txtCate.equals("6") || txtCate.equals("7")) { 
                List<RecruitmentDTO> listRE = dao.getAllNewRecruitmentByCateID(txtCate);
                List<CompanyDTO> filter = new ArrayList<>();
                if (listRE != null) {
                    request.setAttribute("LIST_REC", listRE);
                    for (RecruitmentDTO r : listRE) {
                        for (CompanyDTO c : listCom) {
                            if (c.getId() == r.getCompanyId()) {
                                filter.add(c);
                            }
                        }
                    }
                    if (filter != null) {
                        request.setAttribute("COM", filter);
                        request.setAttribute("txtCateID", txtCate);
                    }
                }
            }

        } catch (Exception e) {
        } finally {
            request.getRequestDispatcher("user/recruitmentReadMore.jsp").forward(request, response);
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
