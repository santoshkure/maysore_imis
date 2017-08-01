/* added by Cancel button with confirmation and back on previous stage*/
		  function validateConfirmBack() {  
		   		var sure = confirm("Are you sure, you want to Cancel the Form ?");
		   		if( sure == true )  
		   		{
		   			history.go(-1);
		        }
		   }
 /*validation for mandatory field*/
		  function notEmptyField(element,msg) {
				
			    if(element=="")
				 {
			    	 alert(msg);
			  	   return false;
				 }
				    
			      else 
			    	return true;
			}