<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reports</title>

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

    .box {
        width: 400px;
        margin: 30px auto;
        padding: 25px;
        background: white;
        box-shadow: 0px 0px 10px #ccc;
        border-radius: 10px;
    }

    select, input {
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

<script>
function showFields() {
    var type = document.getElementById("reportType").value;

    document.getElementById("roomField").style.display = "none";
    document.getElementById("dateField").style.display = "none";

    if (type === "room") {
        document.getElementById("roomField").style.display = "block";
    } else if (type === "date") {
        document.getElementById("dateField").style.display = "block";
    }
}
</script>

</head>
<body>

<h2>📊 Generate Reports</h2>

<div class="box">

<form action="ReportServlet" method="get">

    <select name="type" id="reportType" onchange="showFields()" required>
        <option value="">-- Select Report Type --</option>
        <option value="pending">Students with Pending Fees</option>
        <option value="room">Students by Room</option>
        <option value="date">Students by Date</option>
    </select>

    <!-- Room Input -->
    <div id="roomField" style="display:none;">
        <input type="text" name="room" placeholder="Enter Room Number">
    </div>

    <!-- Date Input -->
    <div id="dateField" style="display:none;">
        <input type="date" name="from">
        <input type="date" name="to">
    </div>

    <br>
    <button type="submit" class="btn">Generate Report</button>

</form>

</div>

<a href="index.jsp" class="back">🏠 Back to Home</a>

</body>
</html>
