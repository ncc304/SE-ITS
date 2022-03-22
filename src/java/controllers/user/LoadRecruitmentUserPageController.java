/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.user;

import daos.CompanyDAO;
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
public class LoadRecruitmentUserPageController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            RecruitmentDAO dao = new RecruitmentDAO();
            List<RecruitmentDTO> list4Rec_1 = dao.get4NewRecruitmentByCateID("4"); // Frontend
            List<RecruitmentDTO> list4Rec_2 = dao.get4NewRecruitmentByCateID("5"); // Backend
            List<RecruitmentDTO> list4Rec_3 = dao.get4NewRecruitmentByCateID("6"); // Mobile
            List<RecruitmentDTO> list4Rec_4 = dao.get4NewRecruitmentByCateID("7"); // Full Stack

            if (list4Rec_1 != null) {
                request.setAttribute("LIST_REC1", list4Rec_1);
            }
            if (list4Rec_2 != null) {
                request.setAttribute("LIST_REC2", list4Rec_2);
            }
            if (list4Rec_3 != null) {
                request.setAttribute("LIST_REC3", list4Rec_3);
            }
            if (list4Rec_4 != null) {
                request.setAttribute("LIST_REC4", list4Rec_4);
            }

            CompanyDAO comDAO = new CompanyDAO();
            List<CompanyDTO> listAllCom = comDAO.getListCompany();

            if (listAllCom != null) {
                HttpSession session = request.getSession();
                session.setAttribute("LISTCOM", listAllCom);
                // Get Company
                List<CompanyDTO> filter1 = new ArrayList<>();
                for (RecruitmentDTO r1 : list4Rec_1) {
                    for (CompanyDTO c1 : listAllCom) {
                        if (c1.getId() == r1.getCompanyId()) {
                            filter1.add(c1);
                        }
                    }
                }
                List<CompanyDTO> filter2 = new ArrayList<>();
                for (RecruitmentDTO r2 : list4Rec_2) {
                    for (CompanyDTO c2 : listAllCom) {
                        if (c2.getId() == r2.getCompanyId()) {
                            filter2.add(c2);
                        }
                    }
                }
                List<CompanyDTO> filter3 = new ArrayList<>();
                for (RecruitmentDTO r3 : list4Rec_3) {
                    for (CompanyDTO c3 : listAllCom) {
                        if (c3.getId() == r3.getCompanyId()) {
                            filter3.add(c3);
                        }
                    }
                }
                List<CompanyDTO> filter4 = new ArrayList<>();
                for (RecruitmentDTO r4 : list4Rec_4) {
                    for (CompanyDTO c4 : listAllCom) {
                        if (c4.getId() == r4.getCompanyId()) {
                            filter4.add(c4);
                        }
                    }
                }

                if (filter1 != null) {
                    request.setAttribute("COM1", filter1);
                }
                if (filter2 != null) {
                    request.setAttribute("COM2", filter2);
                }
                if (filter3 != null) {
                    request.setAttribute("COM3", filter3);
                }
                if (filter4 != null) {
                    request.setAttribute("COM4", filter4);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher("user/recruitment.jsp").forward(request, response);
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
