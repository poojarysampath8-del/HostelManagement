package com.servlet;
import javax.servlet.annotation.WebServlet;




import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import com.dao.HostelDAO;
import com.model.Student;
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            String name = req.getParameter("name");

            HostelDAO dao = new HostelDAO();
            List<Student> list = dao.searchStudent(name);

            req.setAttribute("list", list);

            RequestDispatcher rd = req.getRequestDispatcher("studentdisplay.jsp");
            rd.forward(req, res);

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}
