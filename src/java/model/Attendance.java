/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Attendance {
    private int attendanceID;
    private String employeeID;
    private String attendanceDate;
    private String status;

    // Getters and Setters
    public int getAttendanceID() { return attendanceID; }
    public void setAttendanceID(int id) { this.attendanceID = id; }

    public String getEmployeeID() { return employeeID; }
    public void setEmployeeID(String id) { this.employeeID = id; }

    public String getAttendanceDate() { return attendanceDate; }
    public void setAttendanceDate(String date) { this.attendanceDate = date; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
