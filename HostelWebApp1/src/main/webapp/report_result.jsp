<%@ page import="java.util.*, com.model.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Report Result</title>

<style>
    body {
        font-family: Arial;
        text-align: center;
        background: #f4f6f9;
    }

    table {
        margin: auto;
        width: 80%;
        border-collapse: collapse;
        background: white;
        box-shadow: 0px 0px 10px #ccc;
    }

    th {
        background: #4CAF50;
        color: white;
        padding: 10px;
    }

    td {
        padding: 10px;
        border-bottom: 1px solid #ddd;
    }
</style>

</head>
<body>

<h2>📊 Report Result</h2>

<%
    List<Student> list = (List<Student>) request.getAttribute("list");
%>

<table>
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Room</th>
    <th>Date</th>
    <th>Paid</th>
    <th>Pending</th>
</tr>

<%
    if(list != null && !list.isEmpty()){
        for(Student s : list){
%>
<tr>
    <td><%= s.getStudentID() %></td>
    <td><%= s.getStudentName() %></td>
    <td><%= s.getRoomNumber() %></td>
    <td><%= s.getAdmissionDate() %></td>
    <td>₹ <%= s.getFeesPaid() %></td>
    <td style="color:red;">₹ <%= s.getPendingFees() %></td>
</tr>
<%
        }
    } else {
%>
<tr>
    <td colspan="6">No Data Found</td>
</tr>
<%
    }
%>

</table>

<br><br>
<a href="reports.jsp">🔙 Back</a>

</body>
</html>
