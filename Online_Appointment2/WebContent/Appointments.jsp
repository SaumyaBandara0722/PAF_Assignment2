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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointments Management</title>
</head>
<body>

	<h1>Appointment Management</h1>
	<form method="post" action="Appointments.jsp">
		Appointment ID: <input name="appointmentId" type="text"><br>
		Patient ID: <input name="patientId" type="text"><br>
		Due Date: <input name="dueDate" type="text"><br>
		Schedule ID: <input name="scheduleId" type="text"><br> 
		<input name="btnSubmit" type="submit" value="Save">
	</form>
	<% out.print(session.getAttribute("statusMsg")); %> 
	<br>

	<%
		Appointment appObj = new Appointment();
		out.print(appObj.readDetails()); 
	%>
</body>
</html>