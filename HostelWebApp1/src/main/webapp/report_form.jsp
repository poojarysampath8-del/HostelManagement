<form action="ReportCriteriaServlet" method="post">
Room: <input name="room"><br>
<input type="hidden" name="type" value="room">
<input type="submit" value="By Room">
</form>

<form action="ReportCriteriaServlet" method="post">
From: <input type="date" name="from">
To: <input type="date" name="to">
<input type="hidden" name="type" value="date">
<input type="submit" value="By Date">
</form>
