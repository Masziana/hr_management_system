/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.*;
import db.DBConnection;
import model.Attendance;

public class AttendanceDAO {

    public static List<Attendance> getAll() throws Exception {
        List<Attendance> list = new ArrayList<>();
        Connection con = DBConnection.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM Attendance");

        while (rs.next()) {
            Attendance a = new Attendance();
            a.setAttendanceID(rs.getInt("attendanceID"));
            a.setEmployeeID(rs.getString("employeeID"));
            a.setAttendanceDate(rs.getString("attendanceDate"));
            a.setStatus(rs.getString("status"));
            list.add(a);
        }

        con.close();
        return list;
    }

    public static Attendance getById(int id) throws Exception {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM Attendance WHERE attendanceID=?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        Attendance a = new Attendance();

        if (rs.next()) {
            a.setAttendanceID(rs.getInt("attendanceID"));
            a.setEmployeeID(rs.getString("employeeID"));
            a.setAttendanceDate(rs.getString("attendanceDate"));
            a.setStatus(rs.getString("status"));
        }

        con.close();
        return a;
    }

    public static void insert(Attendance a) throws Exception {
        Connection con = DBConnection.getConnection();
        // Return generated keys (attendanceID)
        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO Attendance (employeeID, attendanceDate, status) VALUES (?, ?, ?)",
            Statement.RETURN_GENERATED_KEYS
        );
        ps.setString(1, a.getEmployeeID());
        ps.setString(2, a.getAttendanceDate());
        ps.setString(3, a.getStatus());

        ps.executeUpdate();

        // Set the generated ID back to the model
        ResultSet rs = ps.getGeneratedKeys();
        if (rs.next()) {
            a.setAttendanceID(rs.getInt(1));
        }

        con.close();
    }

    public static void update(Attendance a) throws Exception {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(
            "UPDATE Attendance SET employeeID=?, attendanceDate=?, status=? WHERE attendanceID=?"
        );
        ps.setString(1, a.getEmployeeID());
        ps.setString(2, a.getAttendanceDate());
        ps.setString(3, a.getStatus());
        ps.setInt(4, a.getAttendanceID());

        ps.executeUpdate();
        con.close();
    }

    public static void delete(int id) throws Exception {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("DELETE FROM Attendance WHERE attendanceID=?");
        ps.setInt(1, id);
        ps.executeUpdate();
        con.close();
    }
    
public List<Attendance> getAttendanceByEmployeeID(String employeeID) throws Exception {
    List<Attendance> list = new ArrayList<>();
    Connection con = DBConnection.getConnection();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM Attendance WHERE employeeID = ?");
    ps.setString(1, employeeID);
    ResultSet rs = ps.executeQuery();

    while (rs.next()) {
        Attendance a = new Attendance();
        a.setAttendanceID(rs.getInt("attendanceID"));
        a.setEmployeeID(rs.getString("employeeID"));
        a.setAttendanceDate(rs.getString("attendanceDate"));
        a.setStatus(rs.getString("status"));
        list.add(a);
    }

    con.close();
    return list;
}

}

