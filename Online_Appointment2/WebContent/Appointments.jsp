<%@ page import="util.DBConnection"%> 
<%@ page import="model.Appointment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	if (request.getParameter("appointmentId") != null) {
		//DBConnection itemObj = new DBConnection();  
		//itemObj.connect();//For testing the connect method 
	  
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

	<table border="1">
		<tr>
			<th>Appointment ID</th>
			<th>Patient ID</th>
			<th>Due Date</th>
			<th>Schedule ID</th>
			<th>Update</th>
			<th>Remove</th>
		</tr>
		<tr>
			<td><%out.print(session.getAttribute("appointmentId"));%></td>
			<td><%out.print(session.getAttribute("patientId"));%></td>
			<td><%out.print(session.getAttribute("dueDate"));%></td>
			<td><%out.print(session.getAttribute("scheduleId"));%></td>
			<td><input name="btnUpdate" type="button" value="Update"></td>
			<td><input name="btnRemove" type="button" value="Remove"></td>
		</tr>
	</table>
</body>
</html>