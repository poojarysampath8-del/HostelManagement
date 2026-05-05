package com.servlet;

import com.dao.HostelDAO;
import com.model.Student;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;

 public class UpdateStudentServlet extends HttpServlet {

    private HostelDAO dao = new HostelDAO();

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            String id = req.getParameter("id");

            if (id != null && !id.isEmpty()) {

                Student s = dao.getStudentById(Integer.parseInt(id));

                if (s != null) {
                    // ✅ Student found
                    req.setAttribute("student", s);
                } else {
                    // ❌ Student not found
                    req.setAttribute("message", "Student ID not found!");
                    req.setAttribute("msgType", "error");
                }
            }

        } catch (Exception e) {
            req.setAttribute("message", "Error: " + e.getMessage());
            req.setAttribute("msgType", "error");
        }

        req.getRequestDispatcher("studentupdate.jsp").forward(req, res);
    }


    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            Student s = new Student();
            s.setStudentID(Integer.parseInt(req.getParameter("studentID")));
            s.setStudentName(req.getParameter("studentName"));
            s.setRoomNumber(req.getParameter("roomNumber"));
            s.setAdmissionDate(Date.valueOf(req.getParameter("admissionDate")));
            s.setFeesPaid(new BigDecimal(req.getParameter("feesPaid")));
            s.setPendingFees(new BigDecimal(req.getParameter("pendingFees")));

            boolean ok = dao.updateStudent(s);
            req.setAttribute("student", s);
            req.setAttribute("message", ok ? "Updated successfully!" : "Update failed.");
            req.setAttribute("msgType", ok ? "success" : "error");
        } catch (Exception e) {
            req.setAttribute("message", "Error: " + e.getMessage());
            req.setAttribute("msgType", "error");
        }
        req.getRequestDispatcher("studentupdate.jsp").forward(req, res);
    }
}