package com.dao;

import java.sql.*;
import java.util.*;
import com.model.Student;

public class HostelDAO {

    Connection con;

    // 🔹 Constructor (DB Connection)
    public HostelDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/hostel_db?useSSL=false&serverTimezone=UTC",
                "root",
                "sampath@123"
            );

            System.out.println("✅ Connected!");

        } catch (Exception e) {
            System.out.println("❌ Connection Failed:");
            e.printStackTrace();
        }
    }

    // 🔹 ADD
    public void addStudent(Student s) throws Exception {
        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO HostelStudents VALUES (?, ?, ?, ?, ?, ?)");

        ps.setInt(1, s.getStudentID());
        ps.setString(2, s.getStudentName());
        ps.setString(3, s.getRoomNumber());
        ps.setDate(4, new java.sql.Date(s.getAdmissionDate().getTime()));
        ps.setDouble(5, s.getFeesPaid());
        ps.setDouble(6, s.getPendingFees());

        ps.executeUpdate();
    }

    // 🔹 UPDATE
    public void updateStudent(Student s) throws Exception {
        PreparedStatement ps = con.prepareStatement(
            "UPDATE HostelStudents SET StudentName=?, RoomNumber=?, FeesPaid=?, PendingFees=? WHERE StudentID=?");

        ps.setString(1, s.getStudentName());
        ps.setString(2, s.getRoomNumber());
        ps.setDouble(3, s.getFeesPaid());
        ps.setDouble(4, s.getPendingFees());
        ps.setInt(5, s.getStudentID());

        ps.executeUpdate();
    }

    // 🔹 DELETE
 // 🔹 CHECK IF STUDENT EXISTS
    public boolean studentExists(int id) throws Exception {

        PreparedStatement ps = con.prepareStatement(
            "SELECT * FROM HostelStudents WHERE StudentID=?");

        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();

        return rs.next(); // true if exists
    }


    // 🔹 DELETE
    public boolean deleteStudent(int id) throws Exception {

        PreparedStatement ps = con.prepareStatement(
            "DELETE FROM HostelStudents WHERE StudentID=?");

        ps.setInt(1, id);

        int rows = ps.executeUpdate();

        return rows > 0; // true if deleted
    }


    // 🔹 DISPLAY ALL
    public List<Student> getAllStudents() throws Exception {
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM HostelStudents");
        return extract(rs);
    }

    // 🔍 SEARCH BY NAME (NEW FEATURE)
    public List<Student> searchStudent(String name) throws Exception {

        List<Student> list = new ArrayList<>();

        PreparedStatement ps = con.prepareStatement(
            "SELECT * FROM HostelStudents WHERE StudentName LIKE ?");

        ps.setString(1, "%" + name + "%");

        ResultSet rs = ps.executeQuery();

        return extract(rs);
    }

    // 🔹 REPORT: Pending Fees
    public List<Student> getPendingFees() throws Exception {
        return getByQuery("SELECT * FROM HostelStudents WHERE PendingFees > 0");
    }

    // 🔹 REPORT: By Room
    public List<Student> getByRoom(String room) throws Exception {
        PreparedStatement ps = con.prepareStatement(
            "SELECT * FROM HostelStudents WHERE RoomNumber=?");

        ps.setString(1, room);
        return extract(ps.executeQuery());
    }

    // 🔹 REPORT: By Date
    public List<Student> getByDate(String from, String to) throws Exception {
        PreparedStatement ps = con.prepareStatement(
            "SELECT * FROM HostelStudents WHERE AdmissionDate BETWEEN ? AND ?");

        ps.setString(1, from);
        ps.setString(2, to);

        return extract(ps.executeQuery());
    }

    // 🔹 COMMON QUERY METHOD
    private List<Student> getByQuery(String query) throws Exception {
        Statement st = con.createStatement();
        return extract(st.executeQuery(query));
    }

    // 🔹 RESULTSET → LIST CONVERSION (REUSABLE)
    private List<Student> extract(ResultSet rs) throws Exception {

        List<Student> list = new ArrayList<>();

        while (rs.next()) {
            Student s = new Student();

            s.setStudentID(rs.getInt(1));
            s.setStudentName(rs.getString(2));
            s.setRoomNumber(rs.getString(3));
            s.setAdmissionDate(rs.getDate(4));
            s.setFeesPaid(rs.getDouble(5));
            s.setPendingFees(rs.getDouble(6));

            list.add(s);
        }

        return list;
    }
}
