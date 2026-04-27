package com.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import com.dao.HostelDAO;
import com.model.Student;

public class ReportServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            String type = req.getParameter("type");

            HostelDAO dao = new HostelDAO();
            List<Student> list = null;

            if(type.equals("pending")){
                list = dao.getPendingFees();
            }
            else if(type.equals("room")){
                String room = req.getParameter("room");
                list = dao.getByRoom(room);
            }
            else if(type.equals("date")){
                String from = req.getParameter("from");
                String to = req.getParameter("to");
                list = dao.getByDate(from, to);
            }

            req.setAttribute("list", list);

            RequestDispatcher rd = req.getRequestDispatcher("report_result.jsp");
            rd.forward(req, res);

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}
