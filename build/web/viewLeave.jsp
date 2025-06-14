<%@ page import="java.util.List" %>
<%@ page import="model.Leave" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="sidebar.jsp" %>

<%
    List<Leave> leaves = (List<Leave>) request.getAttribute("leaves");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Leave Applications</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

        <div class="content">
            <div class="content-header">
                <h2>Leave List</h2>
                <a href="applyLeave.jsp">
                    </a>
            </div>

            <table>
                <thead>
                    <tr>
                        <th>Leave ID</th>
                        <th>Employee ID</th>
                        <th>Leave Type</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Reason</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>
                <c:forEach var="leave" items="${leaves}">
                    <tr>
                        <td>${leave.leaveID}</td>
                        <td>${leave.employeeID}</td>
                        <td>${leave.leaveType}</td>
                        <td>${leave.startDate}</td>
                        <td>${leave.endDate}</td>
                        <td>${leave.reason}</td>
                        <td>${leave.status}</td>
                        <td class="action-buttons">
                            <!-- Redirect to editLeave.jsp for updating -->
                            <form action="LeaveServlet" method="get" style="display:inline;">
                                <input type="hidden" name="action" value="edit">
                                <input type="hidden" name="leaveId" value="${leave.leaveID}">
                                <button type="submit" class="btn-update">Update</button>
                            </form>

                            <!-- Form for delete action with confirmation -->
                            <form action="LeaveServlet" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this leave?');">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="leaveId" value="${leave.leaveID}">
                                <button type="submit" class="btn-delete">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>

            </table>
        </div>

    </body>
</html>
