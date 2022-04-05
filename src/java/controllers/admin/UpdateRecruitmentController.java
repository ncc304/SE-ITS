/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.admin;

import daos.CompanyDAO;
import daos.RecruitmentDAO;
import daos.RecruitmentRecruitmentCategoryDAO;
import dtos.RecruitmentDTO;
import dtos.RecruitmentRecruitmentCategoryDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class UpdateRecruitmentController extends HttpServlet {

    private static final String SUCCESS = "LoadRecruitmentPageController";
    private static final String ERROR = "admin/updateRecruitment.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String txtID = request.getParameter("txtID");
            int id = Integer.parseInt(txtID);
            String startDate = request.getParameter("date1");
            String endDate = request.getParameter("date2");
            
            String txtTitle = request.getParameter("txtTitle");
            String content = request.getParameter("content");
            String txtSalary = request.getParameter("txtSalary");
            float salary = Float.parseFloat(txtSalary);
            String company = request.getParameter("company");
            int companyID = Integer.parseInt(company);
            String category = request.getParameter("category");
            int cateID = Integer.parseInt(category);
            String statusStr = request.getParameter("status");
            boolean status = false;
            if (statusStr.equals("1")) {
                status = true;
            }
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date now = new java.util.Date();
            String createDate = format.format(now.getTime());
            RecruitmentDTO reDTO = new RecruitmentDTO(id, startDate, endDate, salary, content, companyID, status, txtTitle, "", createDate);
            RecruitmentDAO reDAO = new RecruitmentDAO();
            boolean check1 = reDAO.updateRecruitment(reDTO); // Update tbl Re
            if (check1) {
                RecruitmentRecruitmentCategoryDAO subCateDAO = new RecruitmentRecruitmentCategoryDAO();
                RecruitmentRecruitmentCategoryDTO cateDTOTmp = subCateDAO.getCateByReID(txtID);
                if (cateDTOTmp != null) {
                    RecruitmentRecruitmentCategoryDTO cateDTO = new RecruitmentRecruitmentCategoryDTO(cateDTOTmp.getId(), id, cateID);
                    boolean check2 = subCateDAO.updateRecruitmentRecruitmentCategory(cateDTO);
                    if(check2){
                        request.setAttribute("MSG", "UPDATE_RE_SUCCESS");
                        request.setAttribute("MainDTO", reDTO);
                        url = SUCCESS;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
