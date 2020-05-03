// hide the divisions used to show the status messages on the page load
$(document).ready(function()
{
	$("#alertSuccess").hide();
	$("#alertError").hide();
}); 

//add an event handler for the Save button 
$(document).on("click", "#btnSubmit", function(event)
		{
		// Clear status msges-------------
		 $("#alertSuccess").text("");
		 $("#alertSuccess").hide();
		 $("#alertError").text("");
		 $("#alertError").hide();
		// Form validation----------------
		var status = validateItemForm();
		// If not valid-------------------
		if (status != true)
		 {
		 $("#alertError").text(status);
		 $("#alertError").show();
		 return;
		 }
		// If valid-----------------------
		var appointment = getAppCard($("#txtAppointmentId").val().trim(),
		 $("#txtPatientId").val().trim(),
		 $("#txtDueDate").val().trim(),
		 $("#ddlSchedule").val());
		 $("#colApp").append(student);

		 $("#alertSuccess").text("Saved successfully.");
		 $("#alertSuccess").show();

		 $("#formAppointment")[0].reset();
		});

function validateItemForm()
{
	//Validations
	if ($("#txtPatientId").val().trim() == "")
	 {
	 return "Insert Patient ID";
	 }
	
	if ($("txtDueDate").val().trim() == "")
	 {
	 return "Insert A Date";
	 }
	
	if ($("#ddlSchedule").val() == "0")
	 {
	 return "Select A Schedule ID";
	 } 
	return true;
}
