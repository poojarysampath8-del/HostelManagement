<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Generate Report</title>
<style>
  * { margin: 0; padding: 0; box-sizing: border-box; }
  body { font-family: 'Segoe UI', sans-serif; background: #f0f4ff; min-height: 100vh; }
  .topbar { background: linear-gradient(135deg, #f39c12, #e67e22);
            padding: 18px 30px; color: white; }
  .topbar h2 { font-size: 20px; font-weight: 600; }
  .topbar p  { font-size: 13px; opacity: 0.85; margin-top: 2px; }
  .container { max-width: 500px; margin: 35px auto; }
  .card { background: white; border-radius: 14px; padding: 30px;
          box-shadow: 0 4px 20px rgba(0,0,0,0.08); }
  .option { border: 1.5px solid #eee; border-radius: 10px; padding: 16px 18px;
            margin-bottom: 14px; transition: border 0.2s; }
  .option:hover { border-color: #f39c12; }
  .option label { font-weight: 600; color: #333; font-size: 14px;
                  display: flex; align-items: center; gap: 10px; cursor: pointer; }
  .option input[type=radio] { accent-color: #f39c12; width: 16px; height: 16px; }
  .sub-input { margin-top: 10px; padding-left: 26px; }
  .sub-input input[type=text], .sub-input input[type=date] {
      padding: 8px 12px; border: 1.5px solid #dce1ec; border-radius: 8px;
      font-size: 13px; outline: none; margin-right: 8px; }
  .sub-input input:focus { border-color: #f39c12; }
  .btn { width: 100%; padding: 12px; background: linear-gradient(135deg, #f39c12, #e67e22);
         color: white; border: none; border-radius: 8px; font-size: 15px;
         font-weight: 600; cursor: pointer; margin-top: 10px; }
  .btn:hover { opacity: 0.9; }
  .back { display: block; text-align: center; margin-top: 14px;
          color: #f39c12; text-decoration: none; font-size: 13px; }
</style>
</head>


<body>
<div class="topbar">
  <h2>&#128202; Generate Report</h2>
  <p>Select report type and criteria</p>
</div>
<div class="container">
<div class="card">
<form action="ReportServlet" method="post">

  <div class="option">
    <label>
      <input type="radio" name="reportType" value="pending" required />
      &#128176; Students with Pending Fees
    </label>
  </div>

  <div class="option">
    <label>
      <input type="radio" name="reportType" value="room" />
      &#127968; Students by Room Number
    </label>
    <div class="sub-input">
      <input type="text" name="roomNumber" placeholder="e.g. A101" />
      <%
String error = (String) request.getAttribute("error");
if (error != null) {
%>
  <p style="color:red; font-weight:bold;"><%= error %></p>
<%
}
%>
    </div>
  </div>

  <div class="option">
    <label>
      <input type="radio" name="reportType" value="date" />
      &#128197; Students by Admission Date Range
    </label>
    <div class="sub-input">
      From: <input type="date" name="fromDate" />
      To: <input type="date" name="toDate" />
      <br/>
<%
String dateError = (String) request.getAttribute("dateError");
if (dateError != null) {
%>
  <span style="color:red; font-weight:bold;"><%= dateError %></span>
<%
}
%>
      
    </div>
  </div>

  <button type="submit" class="btn">&#128202; Generate Report</button>
</form>
<a href="index.jsp" class="back">&#8592; Back to Home</a>
</div>
</div>
</body>
</html>