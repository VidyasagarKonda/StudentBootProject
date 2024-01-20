
<!DOCTYPE html>
<html lang="en">
<head>
<title>Student input Form</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=-10">
<meta name="viewport" content="width=device-width, initial-scale=-20.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



</head>
<body>

	<div class="container-fluid ">
		<div class="container-fluid p-3 my-3 mr-3 bg-dark text-white">
			<h4>Student Project
				<span>
					<button type='button' id="logout"
					class="btn btn-danger float-right ">Logout</button>
				</span>
				<button type='button' class="float-right mg-3 btn-success btn-lg">
					<i class="fa fa-user-circle float-right"></i>
				</button>
				</h4> 
		</div>

		<div class="row">

			<div class="col-sm-2">

				<label class="text-center container p-1 my-1 bg-dark text-white"><strong>Menu</strong></label><br>
				<button id="newstudents" type="button" class="btn btn-default">New
					Students</button>
				<br>
				<button id="allstudents" type="button" class="btn btn-default">All
					Students</button>
				<br>
				<button id="report" type="button" class="btn btn-default">Reports</button>

			</div>
			<div class="col-lg-10">
			<form id = "formreset">
				<div class="form-group " id="myform">
					<h3>Student Input Form</h3>
					<hr>
					<div class="row">

						<div class="col-lg-6">
							<label><strong>Name</strong></label> <input type="text"
								class="form-control" id="name" placeholder="Enter name"
								name="name" required="">
						</div>
						<div class="col-lg-6">
							<label for="discipline"><strong>Discipline</strong></label> <select
								class="form-control" id="disciplineID" name="disciplinename">
								<option>CSE</option>
								<option>ECE</option>
								<option>MECHANICAL</option>
								<option>CIVIL</option>
								<option>Other</option>
							</select>


						</div>
					</div>
					<div class="row">

						<div class="col-lg-6">
							<label><strong>Gender</strong></label>
							<div id="radioclone" name="edit_gender">
								<div class="form-check">
									<label class="form-check-label"> <input type="radio"
										class="form-check-input" id="gender1" name="gender"
										value="Male">Male
									</label>
								</div>
								<div class="form-check">
									<label class="form-check-label" for="female"> <input
										type="radio" class="form-check-input" id="gender2"
										name="gender" value="Female">Female
									</label>
								</div>
								<div class="form-check">
									<label class="form-check-label" for="other"> <input
										type="radio" class="form-check-input" id="gender3"
										name="gender" value="Other">Other
									</label>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<label><strong>Course</strong></label>
							<div id="courseID" name = "coursename">

								<label class="form-check-label" for="check1"> <input
									type="checkbox" class="checks" id="Mathematics" name="coursena"
									value="Mathematics">Mathematics
								</label><br> <label class="form-check-label" for="check2">
									<input type="checkbox" class="checks" id="Science"
									name="coursena" value="Science">Science
								</label><br> <label class="form-check-label"> <input
									type="checkbox" class="checks" id="English" name="coursena"
									value="English">English
								</label>

							</div>
						</div>
					</div>
					<br>
					
					<button type="submit" id="saving" class="btn btn-warning btn-save">Add
						Student</button>
						<p id="successstatus" class="text-success"></p>

				</div>
				</form>
				
				<div id="tablerecord">
					
					<table class="table table-lg table-bordered data-table " id="status_table">
						<thead>
						<tr>
							<th >S.NO</th>
							<th >Name</th>
							<th >Gender</th>
							<th >Discipline</th>
							<th >Course</th>
							<th >Actions</th>
						</tr>
						</thead>
						<tbody>
						</tbody>
						</table>
			</div>
		</div>
		</div>
		</div>
		

</body>
<script type="text/javascript">
 	
	var LINKURL = "http://localhost:8080/";
	//var LINKURL = "https://vidyasagar-app-form.herokuapp.com/";
 $(document).ready(function(){
	
	 $('#tablerecord').hide();
	  $("#saving").click(function(e) {
	       e.preventDefault();
	 	
	 		let name=$("#name").val();
	 		let stddiscipline=$("#disciplineID").val();
	 		var gend=$("input[name='gender']:checked").val();
	 	
	 	
	 		//getting value from check box
	 		/*var coursearray =[];
	 		$(".checks:checked").each(function(){
	 			coursearray.push($(this).val());
	 		});
	 		var iterator = coursearray.values();
	 		for (let elements of iterator){
	 		var stdCourse = elements ;
	 		}*/
	 		
	 		let checks = $(".checks");
	 		let stdCourse='';
	 		for (i=0;i<3;i++){
	 		if(checks[i].checked==true){
	 			stdCourse += checks[i].value+" ";
	 		}};
	 	
	 		
	 		var jsonData = {
	 							Name : name,
	 							Gender : gend,
	 							Discipline : stddiscipline,
	 							Course : stdCourse
	 						}
	 		
	 		$.ajax({url : LINKURL+'Student/',   
	 			     data : jsonData,
	 			     ConetentType : 'application/json',
	 			     dataType : 'json',
	 				type : 'POST',
	 				success: function (data, status, xhr) {   
	 						// $(".data-table tbody").append("<tr data-course='"+stdCourse+"' data-discipline='"+stddiscipline+"' data-gender='"+gend+"' data-name='"+name+"'><td>"+ID+"</td><td>"+name+"</td><td>"+gend+"</td><td>"+stddiscipline+"</td><td>"+stdCourse+"</td><td><button class='btn btn-danger  btn-delete mr-3' type='button'><i class='fa fa-trash-o' ></i></button><button class='btn btn-info  btn-edit mr-3' type='button'><i class='fa fa-edit'></i></button></td></tr>");
	 					$("#formreset")[0].reset();
	 					$("#successstatus").text( "Data added successfully!");
	 					}
	 		
	 				});
	 		
	     });
	   $("#allstudents").click(function (){
		   let ID=1;
		   $(".form-group").hide();
		   $('#tablerecord').show();
		   $("tbody").empty();
		  var myarray='';
		   $.ajax({url : LINKURL+'Student',
				   
			  			 type : 'GET',
			   			success:function(data){
			   				myarray =JSON.parse(data);
			 				console.log(JSON.parse(data));
			 				var row='';
			 				$.each(myarray,function(key,value){
			 					row += '<tr data-course="'+value.Course+'" data-discipline="'+value.Discipline+'" data-gender="'+value.Gender+'" data-name="'+value.Name+'"data-id="'+value.ID+'">';
			 					row += '<td>'+ID+'</td>';
			 					row += '<td>'+value.Name+'</td>';
			 					row += '<td>'+value.Gender+'</td>';
			 					row += '<td>'+value.Discipline+'</td>';
			 					row += '<td>'+value.Course+'</td>';
			 					row += '<td><button class="btn btn-danger btn-sm btn-delete mr" type="button"><i class="fa fa-trash-o" ></i></button><button class="btn btn-info btn-sm btn-edit mr" type="button"><i class="fa fa-edit"></i></button></td></tr></td>';
			 					row += '</tr>';
			 					ID++;
			 				});
			 				$('#status_table').append(row);
			   				}
		   			});
  		});
 
	 			
	     $('body').on('click','.btn-delete',function() {
	 		let id = $(this).parents('tr').attr('data-id');
	 		let name=$(this).parents('tr').attr('data-name');
	 		let gend=$(this).parents('tr').attr('data-gender');
	 		let discipli=$(this).parents('tr').attr('data-discipline');
	 		let course=$(this).parents('tr').attr('data-course');
	  			 if (confirm("Do you want to delete this row \n ID : "+id+"\n Name : "+name+"\n Gender : "+gend+"\n Discipline : "+discipli+"\n Course : "+course) == true) {
	    				 $(this).parents('tr').remove();
	    				 $.ajax({url : LINKURL+'Student?id='+id,
	    					 type : 'DELETE',
	    					 success : function (data, status, xhr ){
	    						 $("#status_table tr").each(function(){
	    				 				$( this ).find( "td" ).first().html( $(this).index() + 1 );
	    				 				});
	    				 				ID--;
	    					 
	    				 }
	    				 });
	    			 }
	    		
	 				 
	       });
	     
	  
	     $('body').on('click','.btn-edit',function() {
	 		//name field edit
	 			var name=$(this).parents('tr').attr('data-name');
	 			$(this).parents('tr').find('td:eq(1)').html("<input name='edit_text' value='"+name+"'>");
	 	  //gender field edit
	 			var gensave = $(this).parents('tr').attr('data-gender');
	 			$(this).parents('tr').find('td:eq(2)').text("");
	 			$("#radioclone").clone(true).appendTo($(this).parents('tr').find('td:eq(2)'));
	 			$(this).parents('tr').find("input[name=gender][value="+gensave+"]").prop('checked', true);
	 		//discipline field edit
	 			var discedit =$(this).parents('tr').attr('data-discipline');
	 			$(this).parents('tr').find('td:eq(3)').text("");
	 			$("#disciplineID").clone(true).appendTo($(this).parents('tr').find('td:eq(3)'));
	 			$(this).parents('tr').find('#disciplineID').val(discedit);

	 		// course field edit 
	 			var courseedit =$(this).parents('tr').attr('data-course');
	 			$(this).parents('tr').find('td:eq(4)').text("");
	 			$("#courseID").clone(true).appendTo($(this).parents('tr').find('td:eq(4)'));
	 			var checkboxes = $(this).parents('tr').find("input[name='coursena']");
	 			for (var checkbox of checkboxes) {
	 			checkbox.checked = false;
	 			}
	 			
	 			let coursearray = courseedit.trim().split(" ");
	 			if(coursearray.length>0){$(this).parents('tr').find("input[name=coursena][value="+coursearray[0]+"]").prop('checked', true)}
	 			if(coursearray.length>1){$(this).parents('tr').find("input[name=coursena][value="+coursearray[1]+"]").prop('checked', true)}
	 			if(coursearray.length>2){$(this).parents('tr').find("input[name=coursena][value="+coursearray[2]+"]").prop('checked', true)}
	 		
	 		// hiding edit&delete buttons and declarining tick close buttons
	 			$(this).parents('tr').find('td:eq(5)').prepend("<button type='button' class='btn btn-success   btn-update mr-3'> <i class='fa fa-check'></i></button>");
	 			$(this).parents('tr').find('td:eq(5)').prepend("<button type='button' class='btn btn-danger    btn-close  mr-3'> <i class='fa fa-close'></i></button>");
	 			$(this).hide()
	 			$(this).parents('tr').find('.btn-delete').hide();
	 		// 
	 		
	     });

	     $('body').on('click','.btn-update',function() {
	 		$(this).parents('tr').find('.btn-close').hide();
	 		let id = $(this).parents('tr').attr('data-id');
	 		//name field update
	      	 var name=$(this).parents('tr').find("input[name='edit_text']").val(); 
	       	$(this).parents('tr').find('td:eq(1)').text(name);
	      	 $(this).parents('tr').attr('data-name',name);
	 		 
	 			//gender field update
	 		 var genderedit=$(this).parents('tr').find("input[name='gender']:checked").val();
	 			$(this).parents('tr').find('td:eq(2)').text(genderedit);
	 			$(this).parents('tr').attr('data-gender',genderedit);
	 		 	$(this).parents('tr').find('#radioclone').hide();
	 			//discipline field update 
	 			
	 			var discupdate =$(this).parents('tr').find("#disciplineID").val(); 
	 			$(this).parents('tr').find('td:eq(3)').text(discupdate);
	 			$(this).parents('tr').attr('data-discipline',discupdate);
	 		 	
	 			// course update field
	 				var courseupdate ="";
	 				$(this).parents('tr').find(".checks:checked").each(function(){
	 				courseupdate+=$(this).val()+" ";
	 					});
	 			$(this).parents('tr').find('td:eq(4)').text(courseupdate);
	 			$(this).parents('tr').attr('data-course',courseupdate);
	 			
	 		$(this).parents('tr').find('.btn-delete').show();
	      	$(this).parents('tr').find('.btn-edit').show();
	       	$(this).parents('tr').find('.btn-update').remove();
	       	
	        $.ajax({url : LINKURL+'Student?id='+id+'&name='+name+'&gender='+genderedit+'&discipline='+discupdate+'&course='+courseupdate,
	        		type : 'PUT',
				 success : function (data, status, xhr ){
					
					 
					 
					 
				 }
			 });
	       	
	       	
	     });

	 	$('body').on('click','.btn-close',function() {
	 		$(this).parents('tr').find('.btn-close').hide();
	 	
	 	//name field close
	 		var name=$(this).parents('tr').attr('data-name');
	 		$(this).parents('tr').find('td:eq(1)').text(name);
	 		$(this).parents('tr').attr('data-name',name);
	 	//gender field close
	 		var genderclose=$(this).parents('tr').attr('data-gender');
	 		$(this).parents('tr').find('td:eq(2)').text(genderclose);
	 		$(this).parents('tr').attr('data-gender',genderclose);
	 	  // discipline close field
	 	  var discclose=$(this).parents('tr').attr('data-discipline');
	 		$(this).parents('tr').find('td:eq(3)').text(discclose);
	 		$(this).parents('tr').attr('data-discipline',discclose);
	 	  //course close field
	 		var courseclose=$(this).parents('tr').attr('data-course');
	 		$(this).parents('tr').find('td:eq(4)').text(courseclose);
	 		$(this).parents('tr').attr('data-course',courseclose);
	 	  
	 		$(this).parents('tr').find('.btn-delete').show();
	 		$(this).parents('tr').find('.btn-edit').show();
	 		$(this).parents('tr').find('.btn-update').remove();
	 	});
	 	

	 	$("#newstudents").click(function(){
	 		$(".form-group").show();
	 		 $('#tablerecord').hide();
	 		
	 	});
	 });
 
 
 </script>
</html>