<%@ page import="model.Appointment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.5.0.min.js"></script>
<script src="Components/main.js"></script>
<title>Appointments Management</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-10">
				<h1>Appointment Management</h1>
				<form id="formAppointment" name="formAppointment" method="post" action="Appointments.jsp">
 				Appointment ID:
				<input id="appointmentId" name="appointmentId" type="text" class="form-control form-control-sm" readonly>
	
				<br> Patient ID:
				<input id="patientId" name="patientId" type="text" class="form-control form-control-sm">
	
				<br> Due Date:
				<input id="dueDate" name="dueDate" type="text" class="form-control form-control-sm">
	
				<br> Schedule ID:
				<input id="scheduleId" name="scheduleId" type="text" class="form-control form-control-sm">
	
				<br>
				<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
				<input type="hidden" id="hidAppointmentIDSave" name="hidAppointmentIDSave" value="">
				</form>
	
				<br>
				<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>
	
				<br>
				<div id="divItemsGrid" class="table table-striped">
				<%
						Appointment appObj = new Appointment();
						out.print(appObj. readDetails());
				%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>