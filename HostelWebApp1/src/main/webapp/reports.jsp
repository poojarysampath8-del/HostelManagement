<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Reports</title>
<style>
  * { margin: 0; padding: 0; box-sizing: border-box; }
  body { font-family: 'Segoe UI', sans-serif; background: #1a1a2e;
         min-height: 100vh; display: flex; flex-direction: column;
         align-items: center; justify-content: center; }
  .card { background: #16213e; border-radius: 16px; padding: 40px;
          box-shadow: 0 8px 32px rgba(0,0,0,0.4); width: 340px; }
  .title { text-align: center; margin-bottom: 28px; }
  .title h2 { color: #f39c12; font-size: 22px; }
  .title p  { color: #a8a8b3; font-size: 13px; margin-top: 6px; }
  .menu-item a {
      display: block; padding: 13px 18px; margin: 10px 0;
      background: #0f3460; color: #e0e0e0; border-radius: 10px;
      text-decoration: none; font-size: 15px;
      border-left: 4px solid #f39c12; transition: all 0.2s; }
  .menu-item a:hover { background: #f39c12; color: #1a1a2e; padding-left: 24px; }
  .back { display: block; text-align: center; margin-top: 20px;
          color: #a8a8b3; text-decoration: none; font-size: 13px; }
  .back:hover { color: #f39c12; }
</style>
</head>
<body>
<div class="card">
  <div class="title">
    <h2>&#128196; Reports</h2>
    <p>Generate hostel reports</p>
  </div>
  <div class="menu-item"><a href="ReportCriteriaServlet">&#128202; Generate Report</a></div>
  <div class="menu-item"><a href="DisplayStudentsServlet">&#128203; View All Students</a></div>
  <a href="index.jsp" class="back">&#8592; Back to Home</a>
</div>
</body>
