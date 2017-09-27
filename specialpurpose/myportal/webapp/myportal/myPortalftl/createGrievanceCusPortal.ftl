<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: createGrievanceCusPortal.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Modified by  --->
<#-- 1.0			Anubha Saini	  19/08/2017         Siddhi
<#-- #####################################################################################################-->
<#--This ftl is used to Register New Customer -->


   		 <form method="post" name="createGrievanceCustomer" action="" class="basic-form">
   		
    			<div class="row" >
    			<div class="alert alert-info">
				<ul>
    				<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    				<div class="h3" align="center"><b>${uiLabelMap.createGrievance}</b></div>
	    		</ul>
  				</div>
  				
  				<table cellspacing="0" class="basic-table table-responsive">
  				
  							
        			<tr>
	              	<td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td>
                	</tr>
                	<tr>
                	<td colspan="4" align="left"><font color="blue"><b>${uiLabelMap.grievanceReceipt}</b></font></td>
                	</tr>
        			<tr>
                      	<td class="label">${uiLabelMap.receiptNo}</td>
                        <td colspan="12"><input name="receiptNo"  type="text" maxlength="10" value="RECP1002" readonly></td>
                       
                 </tr>
                 <tr><td colspan="12" align="left"><font color="blue"><b>${uiLabelMap.grievanceDetail}</b></font></td></tr>
                 <tr>
                 		<td class="label">${uiLabelMap.grievanceDate}</td>
   						<td colspan="12">
       				       <input type="text" name="grievanceDate" autocomplete="off" id="grievanceDate" style="width:140px;" maxlength="10" style="width:140px;" onchange=""/>
        			       <a href="javascript:call_cal(document.createGrievanceCustomer.grievanceDate);">
       				       <img src="/images/cal.gif" width="16" height="16" border="0" alt="View Calendar" title="View Calendar"/></a>
      			        </td>
				</tr>
					<tr>	
						<td class="label" >${uiLabelMap.grievancePetitionDate}</td>
   						<td>
						   <input type="text" name="grievancePetitionDate" autocomplete="off" id="grievancePetitionDate" style="width:140px;" maxlength="10" style="width:140px;" onchange=""/>
        			       <a href="javascript:call_cal(document.createGrievanceCustomer.grievancePetitionDate);">
       				       <img src="/images/cal.gif" width="16" height="16" border="0" alt="View Calendar" title="View Calendar"/></a>
      			        </td>
                  
                    	<td class="label" >${uiLabelMap.typeOfGrievance}</td>
 						<td colspan="4">
                    	<select name="typeOfGrievance">
                   			<option value="">Select</option>
                   			<option value="Internal">Internal</option>
                   			<option value="External">External</option>
                   			
                 		</select>
             			</td> 
                  	</tr>  
                  
                 
                  
                  	<tr>
                    		<td class="label">${uiLabelMap.name}</td>
                         	<td><input name="grevNameEn"  type="text" maxlength="50" value="">${uiLabelMap.InEnglish}
                         	<br><input name="grevNameKn"  type="text" maxlength="50" value="">${uiLabelMap.Inkannada}</br></td>
                       		<td class="label">${uiLabelMap.OrderAddress}</td>
                        	<td colspan="4"><textarea name="grevAddEn" value="" maxlength="300" style="width:400px"></textarea>${uiLabelMap.InEnglish}
                        	<br><textarea name="grevAddKn" value="" maxlength="300" style="width:400px"></textarea>${uiLabelMap.Inkannada}</br></td> 
                  	</tr>
                    <tr>
                    		<td class="label">${uiLabelMap.mobileNo}</td>
                        	<td>
                        	<input name="mobileNo" type="text" maxlength="25" value="" placeholder="${uiLabelMap.yourMobile}">
                        	</td>
                        	<td class="label">${uiLabelMap.CommonEmail}</td>
                        	<td colspan="4">
                        	<input name="eMail" type="text" maxlength="40" value="" placeholder="${uiLabelMap.yourEMail}">
                        	</td>
                    </tr>
                    <tr>
                    		<td class="label">${uiLabelMap.grievanceDetail}</td>
                       	 	<td colspan="1"><textarea name="grievanceDetailEn" value="" maxlength="500" ></textarea>${uiLabelMap.InEnglish}
                       	 	<br><textarea name="grievanceDetailKn" value="" maxlength="500" ></textarea>${uiLabelMap.Inkannada}</br></td>
                    		<td class="label">${uiLabelMap.assentialDocument}</td>
				        	<td colspan="4"><input type="file" name="fileLoc"  onchange="javascript:validateFile(this,document.getElementById('fileLocFileName'),document.getElementById('fileLocFileType'));"/>
                        	<input type="button" onclick="javascript:resetVal(document.createGrievanceCustomer.fileLoc);" value="Reset"/>
                        	<input type="hidden" name="fileLocFileName" id="fileLocFileName" value=""/>
                        	<input type="hidden" name="fileLocFileType" id="fileLocFileType" value=""/>
                        	</td>
                    </tr>
                    
                    <tr>
                    	<td colspan="12">
                    	<div id="saveBtn"><center>
                    	<input name="save" type="button" value="${uiLabelMap.CommonSave}" onClick="javascript:saveRegistrationDetail();"/>
                    	<input type="button" name="Cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();" >
                     	</div></center>
                     	</td>
                    </tr>
        		</table>
 
	</div>
  

   
</form>

    <script type="text/javascript" language="javascript">
 
 function saveRegistrationDetail()
   {
		       var form=document['createGrievanceCustomer'];
		       var sure = confirm("Are you sure, you want to Save the Form ?");
                       if( sure == true )
                       {
                        form.action = "<@ofbizUrl>Grievancedetails</@ofbizUrl>";
			            form.submit();
		                disSubmit('saveBtn');    
		                } 
    }
    
function resetVal(field)
  {
 	field.value = "";
  }
    
function validateFile(obj,fileNameTB,fileTypeTB)
{

var form=document['prepareAllCasesQW'];     
var extensions = new Array("doc");

// Alternative way to create the array
 
var extensions = new Array();
 
extensions[1] = "doc";
extensions[2] = "pdf";
extensions[3] = "xls";
extensions[4] = "docx";
extensions[5] = "xlsx";

var image_file = obj.value;
var files =  image_file.replace('&', 'and');
var image_length = obj.value.length;

fileNameTB.value=files;

 
var pos = image_file.lastIndexOf('.') + 1;
var ext = image_file.substring(pos, image_length);
var final_ext = ext.toLowerCase();
for (i = 0; i < extensions.length; i++)
{
    if(extensions[i] == final_ext){
        var fileType = "";
        
           if(final_ext == "doc"){
              fileType = "application/msword";
           }
           
           if(final_ext == "docx"){
              fileType = "application/msword";
           }
           
            if(final_ext == "pdf"){
              fileType = "application/pdf";
           }
           
           if(final_ext == "xls"){
              fileType = "application/vnd.ms-excel";
           }
           
           if(final_ext == "xlsx"){
              fileType = "application/vnd.ms-excel";
           }
           
           fileTypeTB.value = fileType;
           return true;
    }
}
 
alert("You must upload a file with one of the following extensions: "+ extensions.join(', ') +".");
return false;
}
    </script>