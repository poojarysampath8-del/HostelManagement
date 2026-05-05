<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Hostel Management System</title>
<style>
  * { margin: 0; padding: 0; box-sizing: border-box; }
  body { font-family: 'Segoe UI', sans-serif; background: #1a1a2e; min-height: 100vh;
         display: flex; flex-direction: column; align-items: center; justify-content: center; }
  .card { background: #16213e; border-radius: 16px; padding: 40px;
          box-shadow: 0 8px 32px rgba(0,0,0,0.4); width: 340px; }
  .title { text-align: center; margin-bottom: 30px; }
  .title h1 { color: #e94560; font-size: 22px; letter-spacing: 1px; }
  .title p  { color: #a8a8b3; font-size: 13px; margin-top: 6px; }
  .menu-item a {
      display: block; padding: 13px 18px; margin: 10px 0;
      background: #0f3460; color: #e0e0e0; border-radius: 10px;
      text-decoration: none; font-size: 15px;
      border-left: 4px solid #e94560; transition: all 0.2s; }
  .menu-item a:hover { background: #e94560; color: #fff; padding-left: 24px; }
  .icon { margin-right: 10px; }
</style>
</head>
<body>
<div class="card">
  <div class="title">
    <h1>&#127968; Hostel Management</h1>
    <p>Student Administration Portal</p>
  </div>
  <div class="menu-item"><a href="AddStudentServlet"><span class="icon">&#128100;</span> Add Student</a></div>
  <div class="menu-item"><a href="studentupdate.jsp"><span class="icon">&#9998;</span> Update Student</a></div>
  <div class="menu-item"><a href="studentdelete.jsp"><span class="icon">&#128465;</span> Delete Student</a></div>
  <div class="menu-item"><a href="DisplayStudentsServlet"><span class="icon">&#128203;</span> View All Students</a></div>
  <div class="menu-item"><a href="reports.jsp"><span class="icon">&#128196;</span> Reports</a></div>
</div>
</body>
</html>