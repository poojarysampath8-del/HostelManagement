package com.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import com.dao.HostelDAO;
import com.model.Student;

public class UpdateStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            Student s = new Student();
            s.setStudentID(Integer.parseInt(req.getParameter("id")));
            s.setStudentName(req.getParameter("name"));
            s.setRoomNumber(req.getParameter("room"));
            s.setFeesPaid(Double.parseDouble(req.getParameter("paid")));
            s.setPendingFees(Double.parseDouble(req.getParameter("pending")));

            new HostelDAO().updateStudent(s);

            res.sendRedirect("studentdisplay.jsp?msg=updated");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
