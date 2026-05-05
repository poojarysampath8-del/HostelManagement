package com.servlet;

import com.dao.HostelDAO;
import com.model.Student;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;


public class AddStudentServlet extends HttpServlet {

    private HostelDAO dao = new HostelDAO();

    // GET: load form with next auto ID shown (readonly)
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.setAttribute("nextID", dao.getNextStudentID());
        req.getRequestDispatcher("studentadd.jsp").forward(req, res);
    }

    // POST: save student
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            String name = req.getParameter("studentName");
            String room = req.getParameter("roomNumber");
            String dateStr = req.getParameter("admissionDate");

            BigDecimal feesPaid = new BigDecimal(req.getParameter("feesPaid"));
            BigDecimal pendingFees = new BigDecimal(req.getParameter("pendingFees"));

            // ✅ VALIDATION (IMPORTANT)
            if (feesPaid.compareTo(BigDecimal.ZERO) < 0 || 
                pendingFees.compareTo(BigDecimal.ZERO) < 0) {

                req.setAttribute("message", "Fees cannot be negative!");
                req.setAttribute("msgType", "error");

                req.setAttribute("nextID", dao.getNextStudentID());
                req.getRequestDispatcher("studentadd.jsp").forward(req, res);
                return; // ❗ STOP INSERT
            }

            Student s = new Student();
            s.setStudentName(name);
            s.setRoomNumber(room);
            s.setAdmissionDate(new java.sql.Date(System.currentTimeMillis()));
            s.setFeesPaid(feesPaid);
            s.setPendingFees(pendingFees);

            boolean ok = dao.addStudent(s);

            req.setAttribute("message", ok ? "Student added successfully!" : "Failed to add.");
            req.setAttribute("msgType", ok ? "success" : "error");

        } catch (Exception e) {
            req.setAttribute("message", "Error: " + e.getMessage());
            req.setAttribute("msgType", "error");
        }

        req.setAttribute("nextID", dao.getNextStudentID());
        req.getRequestDispatcher("studentadd.jsp").forward(req, res);
    }

}