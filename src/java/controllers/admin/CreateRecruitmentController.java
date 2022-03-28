/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.admin;

import daos.RecruitmentDAO;
import daos.RecruitmentRecruitmentCategoryDAO;
import dtos.RecruitmentDTO;
import dtos.RecruitmentRecruitmentCategoryDTO;
import java.io.IOException;
import java.text.SimpleDateFormat;
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
public class CreateRecruitmentController extends HttpServlet {

    private static final String ERROR = "admin/createRecruitment.jsp";
    private static final String SUCCESS = "LoadRecruitmentPageController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String date1 = request.getParameter("date1");
            String date2 = request.getParameter("date2");
            String title = request.getParameter("txtTitle");
            String content = request.getParameter("content");
            String salary = request.getParameter("txtSalary");
            String company = request.getParameter("company");
            String category = request.getParameter("category");
            
            HttpSession session = request.getSession();
            String userName = (String) session.getAttribute("USER_NAME");
            
            RecruitmentDAO reDAO = new RecruitmentDAO();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            java.util.Date createDate = new java.util.Date();
            String createDateStr = format.format(createDate);
            
            RecruitmentDTO reDTO =
                    new RecruitmentDTO(0, date1, date2, Float.parseFloat(salary), content, Integer.parseInt(company), true, title, userName, createDateStr);
            boolean check1 = reDAO.createtRecruitment(reDTO); // Thêm tbl Recruitment
            if(check1){
                RecruitmentDTO lastestID = reDAO.getListRecruitment().get(reDAO.getListRecruitment().size() - 1);
                RecruitmentRecruitmentCategoryDAO cateDAO = new RecruitmentRecruitmentCategoryDAO();
                RecruitmentRecruitmentCategoryDTO cateDTO = new RecruitmentRecruitmentCategoryDTO(0, lastestID.getId(), Integer.parseInt(category));
                if(cateDTO != null){
                    boolean check2 = cateDAO.createtRecruitmentRecruitmentCategory(cateDTO); // Thêm tbl Recruitment sub Cate
                    if(check2){
                        url = SUCCESS;
                        request.setAttribute("MSG", "CREATE_RE_SUCCESS");
                        request.setAttribute("RENAME", lastestID.getName());
                        
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
