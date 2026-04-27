package com.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class DisplayStudentsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        RequestDispatcher rd = req.getRequestDispatcher("studentdisplay.jsp");
        rd.forward(req, res);
    }
}
