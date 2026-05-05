<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Add Student</title>
<style>
  * { margin: 0; padding: 0; box-sizing: border-box; }
  body { font-family: 'Segoe UI', sans-serif; background: #f0f4ff; min-height: 100vh; }
  .topbar { background: linear-gradient(135deg, #2ecc71, #27ae60);
            padding: 18px 30px; color: white; }
  .topbar h2 { font-size: 20px; font-weight: 600; }
  .topbar p  { font-size: 13px; opacity: 0.85; margin-top: 2px; }
  .container { max-width: 520px; margin: 35px auto; }
  .card { background: white; border-radius: 14px; padding: 30px;
          box-shadow: 0 4px 20px rgba(0,0,0,0.08); }
  .form-group { margin-bottom: 18px; }
  label { display: block; font-size: 13px; font-weight: 600;
          color: #555; margin-bottom: 6px; }
  input[type=text], input[type=number], input[type=date] {
      width: 100%; padding: 10px 14px; border: 1.5px solid #dce1ec;
      border-radius: 8px; font-size: 14px; color: #333;
      transition: border 0.2s; outline: none; }
  input:focus { border-color: #2ecc71; }
  input[readonly] { background: #f5f5f5; color: #888; cursor: not-allowed; }
  .btn { width: 100%; padding: 12px; background: linear-gradient(135deg, #2ecc71, #27ae60);
         color: white; border: none; border-radius: 8px; font-size: 15px;
         font-weight: 600; cursor: pointer; margin-top: 6px; }
  .btn:hover { opacity: 0.9; }
  .back { display: block; text-align: center; margin-top: 14px;
          color: #27ae60; text-decoration: none; font-size: 13px; }
  .success { background: #d4edda; color: #155724; padding: 10px 14px;
             border-radius: 8px; margin-bottom: 16px; font-size: 14px; }
  .error   { background: #f8d7da; color: #721c24; padding: 10px 14px;
             border-radius: 8px; margin-bottom: 16px; font-size: 14px; }
</style>
</head>
<body>
<div class="topbar">
  <h2>&#128100; Add New Student</h2>
  <p>Register a new student into the hostel</p>
</div>
<div class="container">

<% String msg = (String) request.getAttribute("message");
   String type = (String) request.getAttribute("msgType");
   if (msg != null) { %>
  <div class="<%= type %>"><%= msg %></div>
<% } %>

<div class="card">
<form action="AddStudentServlet" method="post">
  <div class="form-group">
    <label>Student ID (Auto Generated)</label>
    <input type="text" name="studentID" value="<%= request.getAttribute("nextID") %>" readonly />
  </div>
  <div class="form-group">
    <label>Student Name</label>
    <input type="text" name="studentName" placeholder="Enter full name" required />
  </div>
  <div class="form-group">
    <label>Room Number</label>
    <input type="text" name="roomNumber" placeholder="e.g. A101" required />
  </div>
  <div class="form-group">
    <label>Admission Date</label>
    <%
    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
    String today = sdf.format(new java.util.Date());
%>

<input type="date" name="admissionDate" value="<%= today %>" readonly />

  </div>
  <div class="form-group">
    <label>Fees Paid (&#8377;)</label>
    <input type="number" step="0.01" name="feesPaid" min="0" placeholder="0.00" required />
  </div>
  <div class="form-group">
    <label>Pending Fees (&#8377;)</label>
    <input type="number" step="0.01" name="pendingFees" min="0" placeholder="0.00" required />
  </div>
  <button type="submit" class="btn">&#10003; Add Student</button>
</form>
<a href="index.jsp" class="back">&#8592; Back to Home</a>
</div>
</div>
</body>
</html>