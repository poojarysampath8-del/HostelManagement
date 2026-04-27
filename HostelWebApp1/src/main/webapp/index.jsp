<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hostel Management System</title>

    <style>
        body {
            font-family: Arial;
            background: #f4f6f9;
            text-align: center;
        }

        h1 {
            margin-top: 50px;
            color: #333;
        }

        .container {
            margin-top: 40px;
        }

        .btn {
            display: inline-block;
            margin: 10px;
            padding: 12px 25px;
            background: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-size: 16px;
        }

        .btn:hover {
            background: #45a049;
        }

        .card {
            width: 300px;
            margin: auto;
            padding: 30px;
            background: white;
            box-shadow: 0px 0px 10px #ccc;
            border-radius: 10px;
        }
        .btn {
    width: 200px;
    display: block;
    margin: 10px auto;
}
        
    </style>

</head>
<body>

<h1>🏨 Hostel Management System</h1>

<div class="card">

    <div class="container">
        <a href="studentadd.jsp" class="btn">➕ Add Student</a><br>
        <a href="studentdelete.jsp" class="btn">❌ Delete Student</a><br>
        <a href="studentdisplay.jsp" class="btn">📋 View Students</a><br>
        <a href="reports.jsp" class="btn">📊 Reports</a>
    </div>

</div>

</body>
</html>
