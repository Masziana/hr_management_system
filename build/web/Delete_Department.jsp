<%-- 
    Document   : Delete_Department
    Created on : 8 Jun 2025, 3:39:35?pm
    Author     : User
--%>

<%@ page import="java.sql.*" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    response.sendRedirect("departmentList.jsp");
%>
