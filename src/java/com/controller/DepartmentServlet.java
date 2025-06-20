package com.controller;

import dao.DepartmentDAO;
import model.Department;
import com.util.DBConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.List;

@WebServlet(name = "DepartmentServlet", urlPatterns = {"/DepartmentServlet"})
public class DepartmentServlet extends HttpServlet {
    private Connection conn;

    @Override
    public void init() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/hr_db", "root", "");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String action = req.getParameter("action");
        if (action == null) action = "list";

        DepartmentDAO dao = new DepartmentDAO(conn);

        try {
            switch (action.toLowerCase()) {
                case "edit":
                    String editId = req.getParameter("id");
                    if (editId != null && !editId.isEmpty()) {
                        int id = Integer.parseInt(editId);
                        Department dep = dao.getDepartmentById(id);
                        req.setAttribute("department", dep);
                        req.getRequestDispatcher("/Edit_Department.jsp").forward(req, res);
                    } else {
                        res.sendRedirect(req.getContextPath() + "/DepartmentServlet");
                    }
                    break;

                case "delete":
                    String delId = req.getParameter("id");
                    if (delId != null && !delId.isEmpty()) {
                        int id = Integer.parseInt(delId);
                        dao.deleteDepartment(id);
                    }
                    res.sendRedirect(req.getContextPath() + "/DepartmentServlet");
                    break;

                case "list":
                default:
                    List<Department> list = dao.getAllDepartments();
                    req.setAttribute("depList", list);
                    req.getRequestDispatcher("/View_Department.jsp").forward(req, res);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException("Error processing request", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        try {
            DepartmentDAO dao = new DepartmentDAO(conn);

            String action = req.getParameter("action");
            String idStr = req.getParameter("departmentID");
            String depName = req.getParameter("depName");
            String description = req.getParameter("description");

            int id = Integer.parseInt(idStr);
            Department d = new Department(id, depName, description);

            if ("update".equalsIgnoreCase(action)) {
                dao.updateDepartment(d);
            } else {
                dao.addDepartment(d);
            }

            res.sendRedirect(req.getContextPath() + "/DepartmentServlet");

        } catch (Exception e) {
            throw new ServletException("Error saving department", e);
        }
    }

    @Override
    public void destroy() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
