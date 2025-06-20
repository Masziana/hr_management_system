/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package model;

public class Leave {
    private int leaveID;
    private String employeeID;
    private String leaveType;
    private String startDate;
    private String endDate;
    private String reason;
    private String status;

    // Getters and Setters
    public int getLeaveID() { 
        return leaveID; 
    }
    
    public void setLeaveID(int leaveID) {
        this.leaveID = leaveID; 
    }

    public String getEmployeeID() {
        return employeeID; 
    }
    
    public void setEmployeeID(String employeeID) {
        this.employeeID = employeeID;
    }

    public String getLeaveType() {
        return leaveType; 
    }
    
    public void setLeaveType(String leaveType) {
        this.leaveType = leaveType; 
    }

    public String getStartDate() {
        return startDate; 
    }
    
    public void setStartDate(String startDate) {
        this.startDate = startDate; 
    }

    public String getEndDate() {
        return endDate; 
    }
    
    public void setEndDate(String endDate) {
        this.endDate = endDate; 
    }

    public String getReason() {
        return reason; 
    }
    
    public void setReason(String reason) {
        this.reason = reason; 
    }

    public String getStatus() {
        return status; 
    }
    
    public void setStatus(String status) {
        this.status = status; 
    }
}

