<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Student</title>

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
        width: 320px;
        margin: 40px auto;
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

    .btn-delete {
        padding: 10px 20px;
        background: #e74c3c;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .btn-delete:hover {
        background: #c0392b;
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

<h2>❌ Delete Student</h2>

<div class="form-box">

<form action="DeleteStudentServlet" method="get">

    <input type="number" name="id" placeholder="Enter Student ID" required>

    <br><br>
    <button type="submit" class="btn-delete">Delete</button>

</form>

</div>

<a href="index.jsp" class="back">🏠 Back to Home</a>

</body>
</html>
