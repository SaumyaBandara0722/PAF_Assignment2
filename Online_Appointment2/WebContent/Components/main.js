// hide the divisions used to show the status messages on the page load
$(document).ready(function()
{
	if ($("#alertSuccess").text().trim() == "")
	{
		$("#alertSuccess").hide();
	}
	$("#alertError").hide(); 
}); 

//Save button 
$(document).on("click", "#btnSave", function(event)
{
	// Clear status msges
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
		 
	// Form validation
	var status = validateItemForm();
	if (status != true)
	{
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}
	
	// If valid
	$("#formAppointment").submit();
});

//update button
$(document).on("click", ".btnUpdate", function(event)
{
	$("#hidAppointmentIDSave").val($(this).closest("tr").find('#hidAppointmentIDUpdate').val());
	$("#appointmentId").val($(this).closest("tr").find('td:eq(0)').text());
	$("#patientId").val($(this).closest("tr").find('td:eq(1)').text());
	$("#dueDate").val($(this).closest("tr").find('td:eq(2)').text());
	$("#scheduleId").val($(this).closest("tr").find('td:eq(3)').text());
});

//CLIENTMODEL
function validateItemForm()
{
	if ($("#patientId").val().trim() == "")
	{
		return "Insert Patient Id";
	}

	if ($("#dueDate").val().trim() == "")
	{
		return "Insert Date";
	} 
	if ($("#scheduleId").val().trim() == "")
	{
		return "Insert Schedule Id";
	}
//	// is numerical value
//		var tmpPrice = $("#itemPrice").val().trim();
//		if (!$.isDate(tmpPrice))
//		{
//			return "Insert a numerical value for Item Price.";
//		}

	return true;
}

