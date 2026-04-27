<%@ page import="java.util.*, com.dao.*, com.model.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student List</title>

<style>
    body {
        font-family: Arial;
        background: #f4f6f9;
        text-align: center;
    }

    h2 {
        color: #333;
        margin-top: 20px;
    }

    table {
        margin: auto;
        border-collapse: collapse;
        width: 90%;
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

    tr:hover {
        background: #f1f1f1;
    }

    .btn {
        padding: 6px 12px;
        background: #4CAF50;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        margin: 2px;
    }

    .btn:hover {
        background: #45a049;
    }

    .delete-btn {
        background: #e74c3c;
    }

    .delete-btn:hover {
        background: #c0392b;
    }

    .no-data {
        color: red;
        font-weight: bold;
    }

    .search-box {
        margin-bottom: 20px;
    }

    input[type="text"] {
        padding: 8px;
        width: 200px;
    }

    input[type="submit"] {
        padding: 8px 15px;
        background: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .msg {
        font-weight: bold;
        margin: 10px;
    }
</style>

</head>
<body>

<h2>🏨 Hostel Student List</h2>

<%
    List<Student> list = null;

    try {
        // 🔍 Use search result if available
        list = (List<Student>) request.getAttribute("list");

        if(list == null){
            HostelDAO dao = new HostelDAO();
            list = dao.getAllStudents();
        }

    } catch (Exception e) {
        out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
    }

    // 🔔 MESSAGE HANDLING
    String msg = request.getParameter("msg");

    if("added".equals(msg)){
%>
    <p class="msg" style="color:green;">✅ Student Added Successfully!</p>
<%
    } else if("deleted".equals(msg)){
%>
    <p class="msg" style="color:red;">❌ Student Deleted Successfully!</p>
<%
    } else if("updated".equals(msg)){
%>
    <p class="msg" style="color:blue;">✏️ Student Updated Successfully!</p>
<%
    } else if("notfound".equals(msg)){
%>
    <p class="msg" style="color:red;">⚠️ Student ID Not Found!</p>
<%
    }
%>

<!-- 🔍 SEARCH -->
<div class="search-box">
    <form action="SearchServlet" method="get">
        <input type="text" name="name" placeholder="Search by Name">
        <input type="submit" value="Search">
        <a href="studentdisplay.jsp" class="btn">Reset</a>
    </form>
</div>

<!-- 📊 TOTAL COUNT -->
<p><b>Total Students: <%= (list != null) ? list.size() : 0 %></b></p>

<table>

<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Room</th>
    <th>Admission Date</th>
    <th>Fees Paid</th>
    <th>Pending Fees</th>
    <th>Actions</th>
</tr>

<%
    if(list != null && !list.isEmpty()){
        for(Student s : list){
%>
<tr>
    <td><%= s.getStudentID() %></td>
    <td><%= s.getStudentName() %></td>
    <td><%= s.getRoomNumber() %></td>
    <td><%= new java.text.SimpleDateFormat("dd-MM-yyyy").format(s.getAdmissionDate()) %></td>
    <td>₹ <%= s.getFeesPaid() %></td>
    <td style="color:red;">₹ <%= s.getPendingFees() %></td>

    <td>
        <!-- ✏️ EDIT -->
        <a href="studentupdate.jsp?id=<%=s.getStudentID()%>" class="btn">Edit</a>

        <!-- ❌ DELETE -->
        <a href="DeleteStudentServlet?id=<%=s.getStudentID()%>"
           class="btn delete-btn"
           onclick="return confirm('Are you sure you want to delete this student?');">
           Delete
        </a>
    </td>
</tr>
<%
        }
    } else {
%>
<tr>
    <td colspan="7" class="no-data">No Students Found</td>
</tr>
<%
    }
%>

</table>

<br><br>

<a href="studentadd.jsp" class="btn">➕ Add Student</a>
&nbsp;&nbsp;
<a href="index.jsp" class="btn">🏠 Home</a>

</body>
</html>
