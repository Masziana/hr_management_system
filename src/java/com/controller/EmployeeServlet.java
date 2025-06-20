package com.controller;

import dao.EmployeeDAO;
import dao.DepartmentDAO;
import model.Employee;
import model.Department;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

@WebServlet(name = "EmployeeServlet", urlPatterns = {"/EmployeeServlet"})
public class EmployeeServlet extends HttpServlet {

    private EmployeeDAO dao;
    private DepartmentDAO departmentDAO;

    @Override
    public void init() throws ServletException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            java.sql.Connection conn = java.sql.DriverManager.getConnection(
                "jdbc:mysql://localhost/hr_db", "root", "");

            dao = new EmployeeDAO(); // Assumes EmployeeDAO handles its own connection
            departmentDAO = new DepartmentDAO(conn);
        } catch (Exception e) {
            throw new ServletException("Initialization failed", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String action = req.getParameter("action");
        if (action == null) action = "list";

        switch (action.toLowerCase()) {
            case "add":
                try {
                    List<Department> departments = departmentDAO.getAllDepartments();
                    req.setAttribute("departments", departments);
                    forward(req, res, "/Add_Employee.jsp");
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;

            case "edit":
                showEditForm(req, res);
                break;

            case "delete":
                deleteEmployee(req, res);
                break;

            case "profile":
                viewOwnProfile(req, res);
                break;

            case "list":
            default:
                listEmployees(req, res);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) action = "add";

        Employee emp = buildEmployeeFromRequest(req);

        try {
            if ("edit".equalsIgnoreCase(action)) {
                emp.setEmployeeID(req.getParameter("employeeID"));
                dao.updateEmployee(emp);
            } else {
                dao.addEmployee(emp);
            }
        } catch (Exception ex) {
            throw new ServletException("Database error", ex);
        }

        res.sendRedirect(req.getContextPath() + "/EmployeeServlet?action=list");
    }

    private void listEmployees(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        List<Employee> list = dao.getAllEmployees();
        req.setAttribute("employees", list);
        forward(req, res, "/View_Employees.jsp");
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String id = req.getParameter("employeeID");
        if (id == null) {
            res.sendRedirect(req.getContextPath() + "/EmployeeServlet?action=list");
            return;
        }

        Employee emp = dao.getEmployeeById(id);
        if (emp != null) {
            try {
                req.setAttribute("employee", emp);
                req.setAttribute("departments", departmentDAO.getAllDepartments());
                forward(req, res, "/Edit_Employee.jsp");
            } catch (SQLException e) {
                throw new ServletException("Failed to load departments for edit form", e);
            }
        } else {
            res.sendRedirect(req.getContextPath() + "/EmployeeServlet?action=list");
        }
    }

    private void deleteEmployee(HttpServletRequest req, HttpServletResponse res)
            throws IOException {
        String id = req.getParameter("employeeID");
        if (id != null) {
            dao.deleteEmployee(id);
        }
        res.sendRedirect(req.getContextPath() + "/EmployeeServlet?action=list");
    }

    private Employee buildEmployeeFromRequest(HttpServletRequest req) {
        Employee e = new Employee();

        e.setEmployeeID(req.getParameter("employeeID"));
        e.setName(req.getParameter("name"));
        e.setEmail(req.getParameter("email"));
        e.setPhoneNo(req.getParameter("phoneNo"));
        e.setJobTitle(req.getParameter("jobTitle"));

        String dateStr = req.getParameter("joinDate");
        if (dateStr != null && !dateStr.isEmpty()) {
            try {
                java.util.Date utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);
                e.setJoinDate(new Date(utilDate.getTime()));
            } catch (ParseException ignored) { }
        }

        String deptIdStr = req.getParameter("departmentID");
        if (deptIdStr != null && !deptIdStr.isEmpty()) {
            try {
                int deptId = Integer.parseInt(deptIdStr);
                Department dept = new Department();
                dept.setDepartmentID(deptId);
                e.setDepartment(dept);
            } catch (NumberFormatException ignored) { }
        }

        return e;
    }

    private void forward(HttpServletRequest req, HttpServletResponse res, String page)
            throws ServletException, IOException {
        req.getRequestDispatcher(page).forward(req, res);
    }

    // ✅ Tambahan untuk fungsi paparan My Profile
    private void viewOwnProfile(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("employeeID") == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        String employeeId = (String) session.getAttribute("employeeID");
        Employee emp = dao.getEmployeeById(employeeId); // gunakan getEmployeeById sebab table utama
        if (emp != null) {
            req.setAttribute("employee", emp);
            forward(req, res, "/MyProfileStaff.jsp"); // pastikan fail ini wujud
        } else {
            res.setContentType("text/html");
            res.getWriter().println("<h3>Profil tidak dijumpai untuk ID: " + employeeId + "</h3>");
        }
    }
}
