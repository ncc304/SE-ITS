/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.admin;

import daos.CompanyDAO;
import daos.RecruitmentCategoryDAO;
import daos.RecruitmentDAO;
import daos.RecruitmentRecruitmentCategoryDAO;
import dtos.CompanyDTO;
import dtos.RecruitmentCategoryDTO;
import dtos.RecruitmentDTO;
import dtos.RecruitmentRecruitmentCategoryDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class LoadRecruitmentByIDController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String txtID = request.getParameter("txtID");
            int id = Integer.parseInt(txtID);
            RecruitmentDAO dao = new RecruitmentDAO();
            RecruitmentDTO dtoReDetail = dao.getListRecruitmentByID(id);
//            SimpleDateFormat fmt1 = new SimpleDateFormat("yyyy-MM-dd");
//            SimpleDateFormat fmt2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            if (dtoReDetail != null) {
//                java.util.Date d1 = fmt1.parse(dtoReDetail.getStartDate());
//                String startDate = fmt2.format(d1.getTime());
//                String[] tmp1 = startDate.split(" ");
//                startDate = tmp1[0] + "T" + tmp1[1];

//                java.util.Date d2 = fmt1.parse(dtoReDetail.getEndDate());
//                String endDate = fmt2.format(d2.getTime());
//                String[] tmp2 = endDate.split(" ");
//                endDate = tmp2[0] + "T" + tmp2[1];
//                dtoReDetail.setStartDate(startDate);
//                dtoReDetail.setEndDate(endDate);
                request.setAttribute("RE", dtoReDetail);
            }

            CompanyDAO comDAO = new CompanyDAO();
            List<CompanyDTO> listImg = comDAO.getListCompanyAdmin();
            List<CompanyDTO> filter = new ArrayList<>();
            if (listImg.size() > 0) {
                request.setAttribute("LIST_IMG", listImg);
                for (CompanyDTO img : listImg) {
                    if (img.getId() == dtoReDetail.getCompanyId()) {
                        filter.add(img);
                    }
                }
                if (filter.size() > 0) {
                    request.setAttribute("IMG", filter);
                }
            }

            RecruitmentCategoryDAO CateDAO = new RecruitmentCategoryDAO();
            List<RecruitmentCategoryDTO> listCate = CateDAO.getListRecruitmentCategory();
            List<RecruitmentCategoryDTO> filter2 = new ArrayList<>();

            RecruitmentRecruitmentCategoryDAO subCateDAO = new RecruitmentRecruitmentCategoryDAO();
            RecruitmentRecruitmentCategoryDTO subCateDTO = subCateDAO.getCateByReID(txtID);

            if (listCate.size() > 0) {
                request.setAttribute("listCate", listCate);
                for (RecruitmentCategoryDTO r : listCate) {
                    if (r.getId() == subCateDTO.getRecruitmentCategoryId()) {
                        filter2.add(r);
                    }
                }
                if (filter2.size() > 0) {
                    request.setAttribute("ACate", filter2);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher("admin/updateRecruitment.jsp").forward(request, response);
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
