<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.model.Student" %>
<!DOCTYPE html>
<html>
<head>
<title>Update Student</title>
<style>
  * { margin: 0; padding: 0; box-sizing: border-box; }
  body { font-family: 'Segoe UI', sans-serif; background: #f0f4ff; min-height: 100vh; }
  .topbar { background: linear-gradient(135deg, #3498db, #2980b9);
            padding: 18px 30px; color: white; }
  .topbar h2 { font-size: 20px; font-weight: 600; }
  .topbar p  { font-size: 13px; opacity: 0.85; margin-top: 2px; }
  .container { max-width: 520px; margin: 35px auto; }
  .card { background: white; border-radius: 14px; padding: 30px;
          box-shadow: 0 4px 20px rgba(0,0,0,0.08); margin-bottom: 20px; }
  .search-row { display: flex; gap: 10px; }
  .search-row input { flex: 1; padding: 10px 14px; border: 1.5px solid #dce1ec;
                      border-radius: 8px; font-size: 14px; outline: none; }
  .search-row input:focus { border-color: #3498db; }
  .search-btn { padding: 10px 20px; background: #3498db; color: white;
                border: none; border-radius: 8px; cursor: pointer; font-size: 14px; }
  .search-btn:hover { background: #2980b9; }
  .form-group { margin-bottom: 18px; }
  label { display: block; font-size: 13px; font-weight: 600;
          color: #555; margin-bottom: 6px; }
  input[type=text], input[type=number], input[type=date] {
      width: 100%; padding: 10px 14px; border: 1.5px solid #dce1ec;
      border-radius: 8px; font-size: 14px; color: #333; outline: none;
      transition: border 0.2s; }
  input:focus { border-color: #3498db; }
  input[readonly] { background: #f5f5f5; color: #888; cursor: not-allowed; }
  .btn { width: 100%; padding: 12px; background: linear-gradient(135deg, #3498db, #2980b9);
         color: white; border: none; border-radius: 8px; font-size: 15px;
         font-weight: 600; cursor: pointer; margin-top: 6px; }
  .btn:hover { opacity: 0.9; }
  .back { display: block; text-align: center; margin-top: 14px;
          color: #3498db; text-decoration: none; font-size: 13px; }
  .success { background: #d4edda; color: #155724; padding: 10px 14px;
             border-radius: 8px; margin-bottom: 16px; font-size: 14px; }
  .error   { background: #f8d7da; color: #721c24; padding: 10px 14px;
             border-radius: 8px; margin-bottom: 16px; font-size: 14px; }
</style>
</head>
<body>
<div class="topbar">
  <h2>&#9998; Update Student</h2>
  <p>Search and update student information</p>
</div>
<div class="container">

<div class="card">
  <form action="UpdateStudentServlet" method="get">
    <label style="margin-bottom:10px;">Search by Student ID</label>
    <div class="search-row">
      <input type="number" name="id" placeholder="Enter Student ID" required />
      <button type="submit" class="search-btn">&#128269; Search</button>
    </div>
  </form>
</div>

<% String msg = (String) request.getAttribute("message");
   String type = (String) request.getAttribute("msgType");
   if (msg != null) { %>
  <div class="<%= type %>"><%= msg %></div>
<% } %>

<%
  Student s = (Student) request.getAttribute("student");
  if (s != null) {
%>
<div class="card">
<form action="UpdateStudentServlet" method="post">
  <div class="form-group">
    <label>Student ID</label>
    <input type="text" name="studentID" value="<%= s.getStudentID() %>" readonly />
  </div>
  <div class="form-group">
    <label>Student Name</label>
    <input type="text" name="studentName" value="<%= s.getStudentName() %>" required />
  </div>
  <div class="form-group">
    <label>Room Number</label>
    <input type="text" name="roomNumber" value="<%= s.getRoomNumber() %>" required />
  </div>
  <div class="form-group">
    <label>Admission Date</label>
    <input type="date" name="admissionDate" value="<%= s.getAdmissionDate() %>" required />
  </div>
  <div class="form-group">
    <label>Fees Paid (&#8377;)</label>
    <input type="number" step="0.01" name="feesPaid" value="<%= s.getFeesPaid() %>" required />
  </div>
  <div class="form-group">
    <label>Pending Fees (&#8377;)</label>
    <input type="number" step="0.01" name="pendingFees" value="<%= s.getPendingFees() %>" required />
  </div>
  <button type="submit" class="btn">&#10003; Update Student</button>
</form>
<a href="index.jsp" class="back">&#8592; Back to Home</a>
</div>
<% } %>
</div>
 <a href="index.jsp" class="back">&#8592; Back to Home</a>
</body>
</html>