<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.model.Student, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<title>View Students</title>
<style>
  * { margin: 0; padding: 0; box-sizing: border-box; }
  body { font-family: 'Segoe UI', sans-serif; background: #f0f4ff; min-height: 100vh; }
  .topbar { background: linear-gradient(135deg, #8e44ad, #6c3483);
            padding: 18px 30px; color: white; }
  .topbar h2 { font-size: 20px; font-weight: 600; }
  .topbar p  { font-size: 13px; opacity: 0.85; margin-top: 2px; }
  .container { margin: 30px; }
  .back { color: #8e44ad; text-decoration: none; font-size: 13px;
          display: inline-block; margin-bottom: 16px; }
  .back:hover { text-decoration: underline; }
  .table-wrap { background: white; border-radius: 14px;
                box-shadow: 0 4px 20px rgba(0,0,0,0.08); overflow: hidden; }
  table { width: 100%; border-collapse: collapse; }
  thead { background: linear-gradient(135deg, #8e44ad, #6c3483); color: white; }
  th { padding: 14px 16px; text-align: left; font-size: 13px;
       font-weight: 600; letter-spacing: 0.5px; }
  td { padding: 12px 16px; font-size: 14px; color: #444;
       border-bottom: 1px solid #f0f0f0; }
  tr:last-child td { border-bottom: none; }
  tbody tr:hover { background: #faf5ff; }
  .badge { background: #f8d7da; color: #c0392b; padding: 3px 10px;
           border-radius: 20px; font-size: 12px; font-weight: 600; }
  .badge-ok { background: #d4edda; color: #155724; }
  .none { text-align: center; padding: 40px; color: #aaa; font-size: 15px; }
  .count-box {
    background: #4CAF50;
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
  <h2>&#128203; All Students</h2>
  <p>Current hostel occupancy list</p>
</div>
<div class="container">
<a href="index.jsp" class="back">&#8592; Back to Home</a>

<%
  List<Student> students = (List<Student>) request.getAttribute("students");
  if (students != null && !students.isEmpty()) {
%>
<div class="table-wrap">
<%
Integer count = (Integer) request.getAttribute("count");
if (count != null) {
%>
  <div class="count-box">
      Total Students: <%= count %>
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
  <% for (Student s : students) { %>
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
  <div class="none">No students found.</div>
<% } %>
</div>
</body>
</html>