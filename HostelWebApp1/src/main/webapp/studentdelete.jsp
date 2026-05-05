<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Delete Student</title>

<style>
  * { margin: 0; padding: 0; box-sizing: border-box; }
  body { font-family: 'Segoe UI', sans-serif; background: #f0f4ff; min-height: 100vh; }

  .topbar {
    background: linear-gradient(135deg, #e74c3c, #c0392b);
    padding: 18px 30px; color: white;
  }
  .topbar h2 { font-size: 20px; font-weight: 600; }
  .topbar p  { font-size: 13px; opacity: 0.85; margin-top: 2px; }

  .container { max-width: 420px; margin: 35px auto; }

  .card {
    background: white; border-radius: 14px; padding: 30px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.08);
  }

  .warn-box {
    background: #fff3cd; border-left: 4px solid #ffc107;
    padding: 12px 16px; border-radius: 8px;
    margin-bottom: 22px; font-size: 13px; color: #856404;
  }

  .form-group { margin-bottom: 20px; }

  label {
    display: block; font-size: 13px; font-weight: 600;
    color: #555; margin-bottom: 6px;
  }

  input[type=number] {
    width: 100%; padding: 10px 14px;
    border: 1.5px solid #dce1ec; border-radius: 8px;
    font-size: 14px; outline: none;
  }

  input[type=number]:focus { border-color: #e74c3c; }

  .btn {
    width: 100%; padding: 12px;
    background: linear-gradient(135deg, #e74c3c, #c0392b);
    color: white; border: none; border-radius: 8px;
    font-size: 15px; font-weight: 600; cursor: pointer;
  }

  .btn:hover { opacity: 0.9; }

  .back {
    display: block; text-align: center;
    margin-top: 14px; color: #e74c3c;
    text-decoration: none; font-size: 13px;
  }

  .success {
    background: #d4edda; color: #155724;
    padding: 10px 14px; border-radius: 8px;
    margin-bottom: 16px; font-size: 14px;
  }

  .error {
    background: #f8d7da; color: #721c24;
    padding: 10px 14px; border-radius: 8px;
    margin-bottom: 16px; font-size: 14px;
  }
</style>

<!-- ✅ JAVASCRIPT VALIDATION -->
<script>
function validateDelete() {
    var id = document.getElementsByName("studentID")[0].value;

    // ❌ If empty → show error first
    if (id === null || id.trim() === "") {
        alert("Please enter Student ID!");
        return false;
    }

    // ✅ Then confirmation
    return confirm("Are you sure you want to delete this student?");
}
</script>

</head>

<body>

<div class="topbar">
  <h2>&#128465; Delete Student</h2>
  <p>Remove a student record permanently</p>
</div>

<div class="container">

<% String msg = (String) request.getAttribute("message");
   String type = (String) request.getAttribute("msgType");
   if (msg != null) { %>
  <div class="<%= type %>"><%= msg %></div>
<% } %>

<div class="card">

  <div class="warn-box">
    &#9888; This action cannot be undone. Please confirm before deleting.
  </div>

  <form action="DeleteStudentServlet" method="post" onsubmit="return validateDelete()">

    <div class="form-group">
      <label>Enter Student ID</label>
      <input type="number" name="studentID" placeholder="e.g. 101" />
    </div>

    <!-- ✅ FIXED BUTTON -->
    <button type="submit" class="btn">
      &#128465; Delete Student
    </button>

  </form>

  <a href="index.jsp" class="back">&#8592; Back to Home</a>

</div>
</div>

</body>
</html>
