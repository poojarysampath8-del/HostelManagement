package com.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import com.dao.HostelDAO;
import com.model.Student;

public class ReportCriteriaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            String type = req.getParameter("type");
            HostelDAO dao = new HostelDAO();
            List<Student> list = null;

            if (type.equals("room")) {
                list = dao.getByRoom(req.getParameter("room"));
            } else if (type.equals("date")) {
                list = dao.getByDate(req.getParameter("from"), req.getParameter("to"));
            }

            req.setAttribute("list", list);
            RequestDispatcher rd = req.getRequestDispatcher("report_result.jsp");
            rd.forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
