<%@ page import="model.Schedule"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.5.0.min.js"></script>
<script src="Components/main.js"></script>
<title>Schedule</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-10">
				<h1>Doctor Schedules</h1>
				<br>
				<div id="divItemsGrid" class="table table-striped">
				<%
						Schedule appObj = new Schedule();
						out.print(appObj. viewAllSchedule());
				%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>