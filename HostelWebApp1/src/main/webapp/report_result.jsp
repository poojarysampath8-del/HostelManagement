<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.model.Student, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<title>Report Result</title>
<style>
  * { margin: 0; padding: 0; box-sizing: border-box; }
  body { font-family: 'Segoe UI', sans-serif; background: #f0f4ff; min-height: 100vh; }
  .topbar { background: linear-gradient(135deg, #f39c12, #e67e22);
            padding: 18px 30px; color: white; }
  .topbar h2 { font-size: 20px; font-weight: 600; }
  .topbar p  { font-size: 13px; opacity: 0.85; margin-top: 2px; }
  .container { margin: 30px; }
  .back { color: #f39c12; text-decoration: none; font-size: 13px;
          display: inline-block; margin-bottom: 16px; }
  .back:hover { text-decoration: underline; }
  .table-wrap { background: white; border-radius: 14px;
                box-shadow: 0 4px 20px rgba(0,0,0,0.08); overflow: hidden; }
  table { width: 100%; border-collapse: collapse; }
  thead { background: linear-gradient(135deg, #f39c12, #e67e22); color: white; }
  th { padding: 14px 16px; text-align: left; font-size: 13px;
       font-weight: 600; letter-spacing: 0.5px; }
  td { padding: 12px 16px; font-size: 14px; color: #444;
       border-bottom: 1px solid #f0f0f0; }
  tr:last-child td { border-bottom: none; }
  tbody tr:hover { background: #fffbf0; }
  .badge { background: #f8d7da; color: #c0392b; padding: 3px 10px;
           border-radius: 20px; font-size: 12px; font-weight: 600; }
  .badge-ok { background: #d4edda; color: #155724; }
  .none  { text-align: center; padding: 40px; color: #aaa; font-size: 15px; }
  .error { background: #f8d7da; color: #721c24; padding: 12px 16px;
           border-radius: 8px; font-size: 14px; }
           .count-box {
    background: #607D8B;
    color: white;
    padding: 10px 18px;
    border-radius: 6px;
    display: inline-block;
    font-weight: bold;
    margin-bottom: 15px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.2);
}
           
</style>
</head>
<body>
<div class="topbar">
  <h2>&#128202; <%= request.getAttribute("reportTitle") %></h2>
  <p>Report results</p>
</div>
<div class="container">
<a href="ReportCriteriaServlet" class="back">&#8592; Back to Reports</a>

<% if (request.getAttribute("error") != null) { %>
  <div class="error"><%= request.getAttribute("error") %></div>
<% } else {
     List<Student> results = (List<Student>) request.getAttribute("results");
     if (results != null && !results.isEmpty()) { %>
<div class="table-wrap">
<%
Integer total = (Integer) request.getAttribute("totalCount");
if (total != null) {
%>
  <div class="count-box">
      Total Students: <%= total %>
  </div>
<%
}
%>

<table>
  <thead>
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Room</th>
      <th>Admission Date</th>
      <th>Fees Paid (&#8377;)</th>
      <th>Pending Fees (&#8377;)</th>
    </tr>
  </thead>
  <tbody>
  <% for (Student s : results) { %>
  <tr>
    <td><%= s.getStudentID() %></td>
    <td><%= s.getStudentName() %></td>
    <td><%= s.getRoomNumber() %></td>
    <td><%= s.getAdmissionDate() %></td>
    <td><%= s.getFeesPaid() %></td>
    <td>
      <% if (s.getPendingFees().doubleValue() > 0) { %>
        <span class="badge"><%= s.getPendingFees() %></span>
      <% } else { %>
        <span class="badge badge-ok">Cleared</span>
      <% } %>
    </td>
  </tr>
  <% } %>
  </tbody>
</table>
</div>
<% } else { %>
  <div class="none">&#128203; No records found for this report.</div>
<% } } %>
</div>
</body>
</html>