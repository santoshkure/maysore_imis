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
		    field.value = str.trim();
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