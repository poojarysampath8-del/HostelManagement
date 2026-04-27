package com.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.dao.HostelDAO;
import com.model.Student;
import java.text.SimpleDateFormat;

public class AddStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            Student s = new Student();
            s.setStudentID(Integer.parseInt(req.getParameter("id")));
            s.setStudentName(req.getParameter("name"));
            s.setRoomNumber(req.getParameter("room"));

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            s.setAdmissionDate(sdf.parse(req.getParameter("date")));

            s.setFeesPaid(Double.parseDouble(req.getParameter("paid")));
            s.setPendingFees(Double.parseDouble(req.getParameter("pending")));

            new HostelDAO().addStudent(s);

            res.sendRedirect("studentdisplay.jsp?msg=added");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
