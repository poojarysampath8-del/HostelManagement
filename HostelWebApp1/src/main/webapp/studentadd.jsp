<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Student</title>

<style>
    body {
        font-family: Arial;
        background: #f4f6f9;
        text-align: center;
    }

    h2 {
        margin-top: 30px;
        color: #333;
    }

    .form-box {
        width: 350px;
        margin: 30px auto;
        padding: 25px;
        background: white;
        box-shadow: 0px 0px 10px #ccc;
        border-radius: 10px;
    }

    input {
        width: 90%;
        padding: 10px;
        margin: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .btn {
        padding: 10px 20px;
        background: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .btn:hover {
        background: #45a049;
    }

    .back {
        margin-top: 15px;
        display: inline-block;
        text-decoration: none;
        color: white;
        background: #4CAF50;
        padding: 8px 15px;
        border-radius: 5px;
    }

    .back:hover {
        background: #45a049;
    }
</style>

</head>
<body>

<h2>➕ Add New Student</h2>

<div class="form-box">

<form action="AddStudentServlet" method="post">

    
    <input type="number" name="id" placeholder="Student ID" required><br>

    <input type="text" name="name" placeholder="Student Name" required><br>

    <input type="number" name="room" placeholder="Room Number" required><br>
    
    <input type="date" name="date" required><br>

    <input type="number" name="paid" placeholder="Fees Paid" required><br>

    <input type="number" name="pending" placeholder="Pending Fees" required><br>

    <br>
    <button type="submit" class="btn">Add Student</button>

</form>

</div>

<a href="index.jsp" class="back">🏠 Back to Home</a>

</body>
</html>
