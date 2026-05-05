package com.servlet;

import com.dao.HostelDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

 
public class DeleteStudentServlet extends HttpServlet {

    private HostelDAO dao = new HostelDAO();

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            String idStr = req.getParameter("studentID");

            // ✅ VALIDATION
            if (idStr == null || idStr.trim().isEmpty()) {
                req.setAttribute("message", "Please enter Student ID!");
                req.setAttribute("msgType", "error");
                req.getRequestDispatcher("studentdelete.jsp").forward(req, res);
                return;
            }

            int id = Integer.parseInt(idStr);

            boolean ok = dao.deleteStudent(id);

            req.setAttribute("message", ok ? "Student deleted successfully!" : "Student not found!");
            req.setAttribute("msgType", ok ? "success" : "error");

        } catch (Exception e) {
            req.setAttribute("message", "Error: " + e.getMessage());
            req.setAttribute("msgType", "error");
        }

        req.getRequestDispatcher("studentdelete.jsp").forward(req, res);
    }

}