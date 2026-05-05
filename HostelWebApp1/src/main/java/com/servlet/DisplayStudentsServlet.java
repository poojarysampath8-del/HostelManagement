package com.servlet;

import com.dao.HostelDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

 
public class DisplayStudentsServlet extends HttpServlet {

    private HostelDAO dao = new HostelDAO();

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            String id = req.getParameter("id");

            if (id != null && !id.isEmpty()) {

                req.setAttribute("student", dao.getStudentById(Integer.parseInt(id)));

            } else {

                java.util.List<com.model.Student> list = dao.getAllStudents();

                req.setAttribute("students", list);

                // ✅ ADD THIS
                req.setAttribute("count", list.size());
            }

        } catch (Exception e) {
            req.setAttribute("error", "Error: " + e.getMessage());
        }

        req.getRequestDispatcher("studentdisplay.jsp").forward(req, res);
    }

}