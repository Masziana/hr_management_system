<%-- 
    Document   : logout
    Created on : 14 Jun 2025, 4:07:08 am
    Author     : Masziana
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Hapuskan semua data dalam session
    session.invalidate();

    // Redirect ke laman login
    response.sendRedirect("login.jsp");
%>

