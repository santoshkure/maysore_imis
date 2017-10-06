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
		  /**Added by Saurabh Gupta on 11 aug 2017 for Alphabhet Non Mandatory feilds*/
		    
		    function alphabhetValidation1(element,msg) {   
		          
		        if(element=="")
		         {
		            return true;
		         }
		            
		        else
		        {
		        
		        if(element!="") {
		       
		         var regex=/^[a-zA-Z\s\.]{1,100}$/;
		         var input = regex.test(element);
		      
		          if(input==false){
		            var alphaExp = /(\w+)\s(\w+)/;
		               
		            if(element.match(alphaExp)){
		              return true;
		             }
		                
		            else
		            {
		              alert(msg);
		              return false;
		            }
		          }
		          else if(element.length==0)
		             {
		               alert(msg);
		             }
		            else if(input==true && element.length>0)
		             {
		               return true;
		             }
		            else{
		                alert("Please enter minimum one character");
		                  return false;
		            }
		         }    
		       }  
		     }
		    
		    function trimFunction(field)
		    {
		    var str = field.value;
		    var str1 = str.replace( /\s\s+/g, ' ' );
		    field.value = str1.trim();
		    }
		    
		    function commonPS(divId)
	         {
	               var html="<html>";
	                    html+= document.getElementById(divId).innerHTML;
	                html+="</html>";
	                
	                var printWin = window.open('','','left=0,top=0,width=10,height=5,toolbar=0,scrollbars=0,status=0');
	                printWin.document.write(html);
	                printWin.document.close();
	                printWin.focus();
	                printWin.print();
	                printWin.close();
	         } 
		    
		    // added by shubham malviya for Accept Only Numeric Value
		    function allnumeric(field,msg)  
		    {  
		       var numbers = /^[0-9]+$/;  
		       if(field.value.match(numbers))  
		       {  
		       return true;  
		       }  
		       else  
		       {  
		       alert(msg);
		       field.value="";
		       return false;  
		       }  
		    }  
		    
		    /**validate Numeric only */
			 function enterNumeric(value,field) 
			{
				 if (value == null || !value.toString().match(/^[-]?\d*\.?\d*$/)) 
					 {
					  alert(field);
			            setTimeout(function(){field.focus()}, 10);
					  
					  return false;
					 }	 
				 return true;
			}
			 
			 /** Validate Longitude*/
			 function validateLongitudeforMP1(element,msg2)
		     {
		    	 var regex=/^[-]?([0-9]{1,3})?(\.[0-9]{1,10})?:([0-9]{1,2})?:([0-9]{1,2})?$/;

		    	 var subvalue = element.split(":");

		    	 var deg = subvalue[0];
		    	 var min = subvalue[1];
		    	 var sec = subvalue[2];

		    	 var input = regex.test(element); 

		    	 if(input==true)
		    	 {
		    		 if( deg < 0) 
		    		 { 
		    			 latsign = -1; 
		    		 }

		    		 absdlat = Math.abs( Math.round(deg * 1000000.));

		    		 if(((absdlat > (73 * 1000000)) && (absdlat < (84 * 1000000))))
		    		 { 

		    			 min = Math.abs(Math.round(min * 1000000.)/1000000);  //integer
		    			 absmlat = Math.abs(Math.round(min * 1000000.));  //integer

		    			 //Error checks
		    			 if(absmlat >= (60 * 1000000))
		    			 { 
		    				 alert(' Minutes Longitude must be in the range of 0 to 59. ');
		    				 return false
		    			 }
		    			 else
		    			 {
		    				 sec = Math.abs(Math.round(sec * 1000000.)/1000000);
		    				 absslat = Math.abs(Math.round(sec * 1000000.)); 
		    				 //Error checks
		    				 if(absslat > (59.99999999 * 1000000))
		    				 {
		    					 alert('Seconds Longitude must be in the range of 0 to 59. ');
		    					 return false 
		    				 } 
		    				 else
		    				 {

		    					 return true;
		    				 }

		    			 }
		    		 }
		    		 else
		    		 {
		    			 alert(' Degrees Longitude must be in the range of 74 to 83. ');
		    			 return false;

		    		 }

		    	 }
		    	 
		    	 if(element.length>0)
		    	 {
		    		 if(input == false)
		    		 {
		    		 alert(msg2);
		    		 return false;
		    		 }
		    	 }
		    	 else
		    	 {
		    		 return true;
		    	 }
		     }

			 
			 /** Validate Latitude*/
			 function validateLatitudeforMP1(element,msg2)
		     {
		   	  		 	 var regex=/^[-]?([0-9]{1,2})?(\.[0-9]{1,10})?:([0-9]{1,2})?:([0-9]{1,2})?$/;
		   	  			 
		   	  			 var subvalue = element.split(":");
		   	  			 
		   	  			 var deg = subvalue[0];
		   	  			 var min = subvalue[1];
		   	  			 var sec = subvalue[2];
		   	  			 
		   	  			 var input = regex.test(element); 
		   	  	 		 
		   	  	       if(input==true)
		   	  				 {
		   	  				   
		   	  					if( deg < 0) 
		   	  						{ 
		   	  						latsign = -1; 
		   	  						}
		   	  					
		   	  						absdlat = Math.abs( Math.round(deg * 1000000.));
		   	  					// As per MP if(((absdlat > (20 * 1000000)) && (absdlat < (28 * 1000000))))	
		   	  						
		   	  					if(((absdlat > (7 * 1000000)) && (absdlat < (15 * 1000000))))
		   	  						{ 
		                    		min = Math.abs(Math.round(min * 1000000.)/1000000);  //integer
		  	  						    absmlat = Math.abs(Math.round(min * 1000000.));  //integer

		  	  						     //Error checks
		  	  						     if(absmlat >= (60 * 1000000))
		  	  						     { 
		  	  						     alert(' Minutes Latitude must be in the range of 0 to 59. ');
		  	  						     return false
		  	  						     }
		  	  						     else
		  	  						     {
		  	  						    	sec = Math.abs(Math.round(sec * 1000000.)/1000000);
		  	  							     absslat = Math.abs(Math.round(sec * 1000000.));         // Note: kept as big integer for now, even if submitted as decimal

		  	  							     //Error checks
		  	  							     if(absslat > (59.99999999 * 1000000))
		  	  							     {
		  	  							      alert(' Seconds Latitude must be in the range of 0 to 59.');
		  	  							     return false 
		  	  							     } 
		  	  							     else
		  	  							     {
		  	  							    	 
		  	  							    	 return true;
		  	  							     }
		  	  						    	 
		  	  						     }
		   	  						
		   	  						}
		   	  						else
		   	  						{
		   	  						alert(' Degrees Latitude must be in the range of 8 to 14. ');
			  							return false;
		   	  						}
		   	  					   
		   	  				 } 
		   	  	  if(element.length>0)
		     	 {
		     		 if(input == false)
		     		 {
		     		 alert(msg2);
		     		 return false;
		     		 }
		     	 }
		     	 else
		     	 {
		     		 return true;
		     	 }
		     }
