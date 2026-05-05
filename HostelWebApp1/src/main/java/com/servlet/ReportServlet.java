package com.servlet;

import com.dao.HostelDAO;
import com.model.Student;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

 public class ReportServlet extends HttpServlet {

    private HostelDAO dao = new HostelDAO();

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String type = req.getParameter("reportType");
        List<Student> results = null;
        String title = "";

        try {
            if ("pending".equals(type)) {
                results = dao.getStudentsWithPendingFees();
                title = "Students with Pending Fees";

            }else if ("room".equals(type)) {

                String room = req.getParameter("roomNumber");

                // ✅ VALIDATION
                if (room == null || room.trim().isEmpty()) {
                    req.setAttribute("error", "Please enter Room Number!");
                    req.getRequestDispatcher("report_form.jsp").forward(req, res);
                    return;
                }

                results = dao.getStudentsByRoom(room);
                title = "Students in Room: " + room;
            }
            else if ("date".equals(type)) {

                String fromStr = req.getParameter("fromDate");
                String toStr   = req.getParameter("toDate");

                // ✅ VALIDATION
                if (fromStr == null || fromStr.isEmpty() ||
                    toStr == null || toStr.isEmpty()) {

                    req.setAttribute("dateError", "Please select both From and To dates!");
                    req.getRequestDispatcher("report_form.jsp").forward(req, res);
                    return;
                }

                Date from = Date.valueOf(fromStr);
                Date to   = Date.valueOf(toStr);

                results = dao.getStudentsByDateRange(from, to);
                title = "Students Admitted: " + from + " to " + to;
            }

        } catch (Exception e) {
            req.setAttribute("error", "Error: " + e.getMessage());
        }

        req.setAttribute("results", results);
        req.setAttribute("reportTitle", title);
        req.setAttribute("totalCount", results != null ? results.size() : 0);

        req.getRequestDispatcher("report_result.jsp").forward(req, res);
    }
}