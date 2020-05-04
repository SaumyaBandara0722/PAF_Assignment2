package model;

import java.sql.*;
import util.DBConnection;

public class Appointment {

	DBConnection dbObj = new DBConnection();

	// method to insert data
	public String insertDetails(String PatientID, String DueDate, String ScheduleId) {
		String output = "";
		try {
			Connection con = dbObj.connect();
			if (con == null) {
				return "Error while connecting to the database";
			}
			// create a prepared statement
			String query = " insert into appointment_doctor(`appointmentId`,`patientId`,`dueDate`,`scheduleId`)"
					+ " values (?, ?, ?, ?)";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setInt(1, 0);
			preparedStmt.setString(2, PatientID);
			preparedStmt.setString(3, DueDate);
			preparedStmt.setString(4, ScheduleId);

			// execute the statement
			preparedStmt.execute();
			con.close();
			
			String newItems = readDetails();
			output = "{\"status\":\"success\", \"data\": \"" + newItems + "\"}"; 

		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\":\"Error while inserting the item.Only registered user can make appointments\"}"; 
			System.err.println(e.getMessage());
		}
		return output;
	}

	// method to read database
	public String readDetails() {
		String output = "";
		
		try {
			Connection con = dbObj.connect();
			if (con == null) {
				return "Error while connecting to the database for reading.";
			}
			// Prepare the html table to be displayed			
			output ="<table border='1'><tr><th>Appointment ID</th>       "
			+ "<th>Patient ID</th><th>Date</th>"     
			+ "<th>Schedule Id</th>        "
			+ "<th>Update</th><th>Remove</th></tr>"; 
			
			String query = "select * from appointment_doctor";
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			// iterate through the rows in the result set
			while (rs.next()) {
				String AppointmentID = Integer.toString(rs.getInt("appointmentId"));
				String PatientID = rs.getString("patientId");
				String DueDate = rs.getString("dueDate");
				String ScheduleId = Integer.toString(rs.getInt("scheduleId"));

				// Add into the html table
				output += "<tr><td><input id='hidAppointmentIDUpdate' name='hidAppointmentIDUpdate' type='hidden' value='" + AppointmentID + "'>" + AppointmentID + "</td>"; 
				output += "<td>" + PatientID + "</td>";
				output += "<td>" + DueDate + "</td>";
				output += "<td>" + ScheduleId + "</td>";
				
				//buttons				 
				output += "<td><input name='btnUpdate' type='button' value='Update' class='btnUpdate btn btn-secondary'></td>"
						+ "<td><input name='btnRemove' type='button' value='Remove' class='btnRemove btn btn-danger' data-itemid='" 
						+ AppointmentID + "'>" + "</td></tr>"; 
			}
			con.close();
			// Complete the html table
			output += "</table>";
		} catch (Exception e) {
			output = "Error while reading the details.";
			System.err.println(e.getMessage());
		}
		return output;
	}

	// method to update details
	public String updateDetails(String AppointmentID, String PatientID, String DueDate, String ScheduleId) {
		String output = "";
		try {
			Connection con = dbObj.connect();
			if (con == null) {
				return "Error while connecting to the database for updating.";
			}
			// create a prepared statement
			String query = "UPDATE appointment_doctor SET patientId=?,dueDate=?,ScheduleId=?WHERE appointmentId=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setString(1, PatientID);
			preparedStmt.setString(2, DueDate);
			preparedStmt.setString(3, ScheduleId);
			preparedStmt.setInt(4, Integer.parseInt(AppointmentID));
			// execute the statement
			preparedStmt.execute();
			con.close();
			
			//output = "Updated successfully";
			String newItems = readDetails();
			output = "{\"status\":\"success\", \"data\": \"" + newItems + "\"}"; 
			 
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\":\"Error while updating the item.Can't update a child row\"}"; 
			System.err.println(e.getMessage());
		}
		return output;
	}

	// method to delete details
	public String deleteDetails(String AppointmentID) {
		String output = "";
		try {
			Connection con = dbObj.connect();
			if (con == null) {
				return "Error while connecting to the database for deleting.";
			}
			// create a prepared statement
			String query = "delete from appointment_doctor where AppointmentID=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setInt(1, Integer.parseInt(AppointmentID));
			// execute the statement
			preparedStmt.execute();
			con.close();
			
			String newItems = readDetails();
			output = "{\"status\":\"success\", \"data\": \"" + newItems + "\"}"; 
			
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\":\"Error while deleting the item.\"}"; 
			System.err.println(e.getMessage());
		}
		return output;
	}
}
