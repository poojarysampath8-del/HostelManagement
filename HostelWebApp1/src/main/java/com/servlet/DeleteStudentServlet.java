package com.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import com.dao.HostelDAO;

public class DeleteStudentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(req.getParameter("id"));

            HostelDAO dao = new HostelDAO();

            // ✅ CHECK + DELETE
            if (dao.deleteStudent(id)) {

                res.sendRedirect("studentdisplay.jsp?msg=deleted");

            } else {

                res.sendRedirect("studentdisplay.jsp?msg=notfound");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        doGet(req, res);
    }
}
