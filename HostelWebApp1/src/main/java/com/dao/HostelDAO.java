package com.dao;

import com.model.Student;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HostelDAO {

    private static final String URL = "jdbc:mysql://localhost:3306/hostel_db";
    private static final String USER = "root";
    private static final String PASSWORD = "sampath@123";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("MySQL Driver not found", e);
        }
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // 🔁 Convert ResultSet → Student object
    private Student mapRow(ResultSet rs) throws SQLException {
        Student s = new Student();
        s.setStudentID(rs.getInt("StudentID"));
        s.setStudentName(rs.getString("StudentName"));
        s.setRoomNumber(rs.getString("RoomNumber"));
        s.setAdmissionDate(rs.getDate("AdmissionDate"));
        s.setFeesPaid(rs.getBigDecimal("FeesPaid"));
        s.setPendingFees(rs.getBigDecimal("PendingFees"));
        return s;
    }

    // ✅ CORRECT METHOD (FIXED)
    public int getNextStudentID() {
        String sql = "SELECT MAX(StudentID) FROM HostelStudents";

        try (Connection con = getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            if (rs.next()) {
                int maxId = rs.getInt(1);
                return maxId + 1;  // ✅ Correct next ID
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 1; // if table empty
    }

    // ➕ Add Student (AUTO_INCREMENT handles ID)
    public boolean addStudent(Student s) {
        String sql = "INSERT INTO HostelStudents (StudentName, RoomNumber, AdmissionDate, FeesPaid, PendingFees) VALUES (?,?,?,?,?)";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, s.getStudentName());
            ps.setString(2, s.getRoomNumber());
            ps.setDate(3, s.getAdmissionDate());
            ps.setBigDecimal(4, s.getFeesPaid());
            ps.setBigDecimal(5, s.getPendingFees());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 📋 Get All Students
    public List<Student> getAllStudents() {
        List<Student> list = new ArrayList<>();

        try (Connection con = getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery("SELECT * FROM HostelStudents ORDER BY StudentID")) {

            while (rs.next()) {
                list.add(mapRow(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // 🔍 Get Student by ID
    public Student getStudentById(int id) {
        String sql = "SELECT * FROM HostelStudents WHERE StudentID=?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return mapRow(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    // ✏️ Update Student
    public boolean updateStudent(Student s) {
        String sql = "UPDATE HostelStudents SET StudentName=?, RoomNumber=?, AdmissionDate=?, FeesPaid=?, PendingFees=? WHERE StudentID=?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, s.getStudentName());
            ps.setString(2, s.getRoomNumber());
            ps.setDate(3, s.getAdmissionDate());
            ps.setBigDecimal(4, s.getFeesPaid());
            ps.setBigDecimal(5, s.getPendingFees());
            ps.setInt(6, s.getStudentID());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // ❌ Delete Student
    public boolean deleteStudent(int id) {
        String sql = "DELETE FROM HostelStudents WHERE StudentID=?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 📊 Report 1: Pending Fees
    public List<Student> getStudentsWithPendingFees() {
        List<Student> list = new ArrayList<>();

        try (Connection con = getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery("SELECT * FROM HostelStudents WHERE PendingFees > 0")) {

            while (rs.next()) {
                list.add(mapRow(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // 📊 Report 2: By Room
    public List<Student> getStudentsByRoom(String room) {
        List<Student> list = new ArrayList<>();

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM HostelStudents WHERE RoomNumber=?")) {

            ps.setString(1, room);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapRow(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // 📊 Report 3: By Date Range
    public List<Student> getStudentsByDateRange(Date from, Date to) {
        List<Student> list = new ArrayList<>();

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(
                     "SELECT * FROM HostelStudents WHERE AdmissionDate BETWEEN ? AND ?")) {

            ps.setDate(1, from);
            ps.setDate(2, to);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapRow(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
