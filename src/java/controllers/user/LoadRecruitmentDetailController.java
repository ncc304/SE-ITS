/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.user;

import daos.RecruitmentDAO;
import daos.RecruitmentRecruitmentCategoryDAO;
import dtos.CompanyDTO;
import dtos.RecruitmentDTO;
import dtos.RecruitmentRecruitmentCategoryDTO;
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
public class LoadRecruitmentDetailController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String txtID = request.getParameter("txtID");
            RecruitmentDAO dao = new RecruitmentDAO();
            RecruitmentDTO dto = dao.getRecruitmentByReID(txtID);
            HttpSession session = request.getSession();
            List<CompanyDTO> listCom = (List<CompanyDTO>) session.getAttribute("LISTCOM");

            if (dto != null) {
                request.setAttribute("DTO", dto);
                List<CompanyDTO> filter = new ArrayList<>();
                for (CompanyDTO c : listCom) {
                    if (c.getId() == dto.getCompanyId()) {
                        filter.add(c);
                    }
                }
                if(filter != null){
                    request.setAttribute("COM", filter);
                }
            }

            // Get Navigation
            RecruitmentRecruitmentCategoryDAO cateDAO = new RecruitmentRecruitmentCategoryDAO();
            RecruitmentRecruitmentCategoryDTO cateDTO =  cateDAO.getCateByReID(txtID);
            if(cateDTO != null){
                request.setAttribute("CATE", cateDTO);
            }
            
            // Get 4 Recent Recruitment
            List<RecruitmentDTO> list4Recent = dao.get4NewRecruitmentNoCateID();
            if(list4Recent != null){
                List<CompanyDTO> filter = new ArrayList<>();
                request.setAttribute("lIST4_RECENT", list4Recent);
                for(RecruitmentDTO r : list4Recent){
                    for(CompanyDTO c : listCom){
                        if (c.getId() == r.getCompanyId()) {
                            filter.add(c);
                        }
                    }
                }
                if(filter != null){
                    request.setAttribute("COM_RECENT", filter);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher("user/recruitmentDetail.jsp").forward(request, response);
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
