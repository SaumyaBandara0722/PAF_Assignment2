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
	// Clear status msgesx
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
	//$("#formAppointment").submit();
	var type = ($("#hidAppointmentIDSave").val() == "") ? "POST" : "PUT";
	
	$.ajax(
			{
			 url : "AppointmentAPI",
			 type : type,
			 data : $("#formAppointment").serialize(),
			 dataType : "text",
			 complete : function(response, status)
			 {
				 onItemSaveComplete(response.responseText, status);
			 }
			});
});

function onItemSaveComplete(response, status)
{
	if (status == "success")
	{
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error")
		{
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error")
	{
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else
	{
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}
	$("#hidAppointmentIDSave").val("");
	$("#formAppointment")[0].reset(); 
}

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

	return true;
}

//update button
$(document).on("click", ".btnUpdate", function(event)
{
	$("#hidAppointmentIDSave").val($(this).closest("tr").find('#hidAppointmentIDUpdate').val());
	$("#appointmentId").val($(this).closest("tr").find('td:eq(0)').text());
	$("#patientId").val($(this).closest("tr").find('td:eq(1)').text());
	$("#dueDate").val($(this).closest("tr").find('td:eq(2)').text());
	$("#scheduleId").val($(this).closest("tr").find('td:eq(3)').text());
});

//DELETE
$(document).on("click", ".btnRemove", function(event) {  
	
	$.ajax(  {   
		
		url : "AppointmentAPI",   
		type : "DELETE",   
		data : "AppointmentID=" + $(this).data("itemid"),   
		dataType : "text",   
		complete : function(response, status)   {    
			onItemDeleteComplete(response.responseText, status);   
			
		}  
	}); 
	
}); 

function onItemDeleteComplete(response, status) {  
	
	if (status == "success")  {   
		
		var resultSet = JSON.parse(response); 

			if (resultSet.status.trim() == "success")   {    
				
				$("#alertSuccess").text("Successfully deleted.");    
				$("#alertSuccess").show(); 
				$("#divItemsGrid").html(resultSet.data);   
				
			} else if (resultSet.status.trim() == "error")   {    
				
				$("#alertError").text(resultSet.data);    
				$("#alertError").show();   
				
			} 

	} else if (status == "error")  {   
		
		$("#alertError").text("Error while deleting.");   
		$("#alertError").show();  
		
	} else  {   
		
		$("#alertError").text("Unknown error while deleting..");   
		$("#alertError").show();  
		
	} 
	
}
