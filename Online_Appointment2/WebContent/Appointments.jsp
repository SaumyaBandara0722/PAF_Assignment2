<%@ page import="util.DBConnection"%> 
<%@ page import="model.Appointment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	if (request.getParameter("appointmentId") != null) {	  
		Appointment appObj = new Appointment();
		String stsMsg = appObj.insertDetails(request.getParameter("patientId"),     
				request.getParameter("dueDate"),     
				request.getParameter("scheduleId"));
		
		 session.setAttribute("statusMsg", stsMsg); 
	}
	//Delete item----------------------------------
	if (request.getParameter("appointmentId") != null)
	{
		Appointment appObj = new Appointment();
		String stsMsg = appObj.deleteDetails(request.getParameter("appointmentId"));
		session.setAttribute("statusMsg", stsMsg);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="Views/bootstrap.min.css">
<title>Appointments Management</title>
</head>
<body>
<div class="container">
 	<div class="row">
		 <div class="col">
			<h1>Appointment Management</h1>
			<form method="post" action="Appointments.jsp">
			Appointment ID: <input name="appointmentId" type="text" class="form-control"><br>
			Patient ID: <input name="patientId" type="text" class="form-control"><br>
			Due Date: <input name="dueDate" type="text" class="form-control"><br>
			Schedule ID: <input name="scheduleId" type="text" class="form-control"><br> 
			<input name="btnSubmit" type="submit" value="Save" class="btn btn-primary">
			</form>
			<br>
		<div class="alert alert-success">
			<% out.print(session.getAttribute("statusMsg")); %>
		</div> 
			<br>
			<%
				Appointment appObj = new Appointment();
				out.print(appObj.readDetails()); 
			%>
		</div>
	</div>
</div>	
</body>
</html>