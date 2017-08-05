<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: createRTIapplication.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Nikhil Pathak   04/08/2017
<#-- 1.1			Pankaj Trivedi						05/08/2017    		
<#-- #####################################################################################################-->
<#--This ftl is used to show the application for create RTI application.-->

<#setting locale="en">
   
    <form method="post" name="createApplication" action="" class="basic-form">
   		 <div class="row">
	    		<div class="alert alert-info">
		    		<ul>
		        		<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
		    			<div class="h3" align="center"><b>${uiLabelMap.editRTIApplication}</b></div>
					</ul>
				</div>
				<div class="screenlet-body">
            		<table cellspacing="0" class="basic-table table-responsive">
               		 <tbody>
                		<tr>
	                	  <tr><td colspan="6"><h3 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td></tr>
                		</tr>
                    	<tr>
                        	<td class="label">${uiLabelMap.applicantName}</td>
                        	<td><input name="ApplicantName"  type="text" maxlength="70" value="Ravi Kumar Sharma" ></td>
                        	<td class="label">${uiLabelMap.applicantEmail}</td>
                        	<td><input name="Applicantemail"  type="text" maxlength="15" value="ravi.sharma777@gmail.com"></td>
                        </tr>
                    	<tr>
	                        <td class="label">${uiLabelMap.applicantContactNo}</td>
                        	<td><input name="Applicant contact No."  type="text" maxlength="60" value="9856235689" ></td>

                       		<td class="label" >${uiLabelMap.applicationDate}</td>
                        	<td><input type="text" name="ApplicationDate" value="${nowTimestamp?string("dd/MM/yyyy")}"  readonly /></td>
    					</tr>
    					<tr>
                         	<td class="label">${uiLabelMap.applicantAddress}</td>
                       	 	<td colspan="1"><textarea name="Applicantaddress" value="" maxlength="500" >karan plaza</textarea></td>
                        	<td class="label">${uiLabelMap.neededInformation}</td>
                        	<td colspan="1"><textarea name="NeededInformation" value="" maxlength="5000" ></textarea></td>
				   		</tr>
				  		 <tr>
				        	<td class="label">${uiLabelMap.supportingDocument}</td>
				        	<td><input type="file" name="fileLoc"  onchange="javascript:validateFile(this,document.getElementById('fileLocFileName'),document.getElementById('fileLocFileType'));"/>
                        	<input type="button" onclick="javascript:resetVal(document..fileLoc);" value="Reset"/>
                        	<input type="hidden" name="fileLocFileName" id="fileLocFileName" value=""/>
                        	<input type="hidden" name="fileLocFileType" id="fileLocFileType" value=""/>
                        	</td>
                        
                        
        <#------------------------------Radio Button For BPL Card Holder ---------------------->	     
                        	<td class="label">${uiLabelMap.BPLCardNo}</td>
					       	<td> 
					       		<input type="radio" name="BPL card No." id="BPL card No._Y"  value="approve" onchange="javascript:getActionDetails(this)"/> Yes
								<input type="radio" name="BPL card No." id="BPL card No._N" value="reject"  onchange="javascript:getActionDetails(this)"/> No
							</td>
				         </tr>
                    </tbody>
                </table>
          
          
          			<#--- Start For BPL card No. --->
                    <div id="connectionStatus_Approve" style="display:none">
						<table cellspacing="0" class="basic-table table-responsive">
						<tbody>
			   				<tr>
			        			<td class="label">${uiLabelMap.uploadCopyOfBPLCard}</td>
								<td><input type="file" name="fileLoc"  onchange="javascript:validateFile(this,document.getElementById('fileLocFileName'),document.getElementById('fileLocFileType'));"/>
                        		<input type="button" onclick="javascript:resetVal(document..fileLoc);" value="Reset"/>
                        		<input type="hidden" name="fileLocFileName" id="fileLocFileName" value=""/>
                        		<input type="hidden" name="fileLocFileType" id="fileLocFileType" value=""/></td>
	    					</tr> 
						</tbody>
						</table>
  					</div>	
  					
				    <div id="connectionStatus_Reject" style="display:none">
						<table cellspacing="0" class="basic-table table-responsive">
						<tbody>
				         	<tr>
		   						<td class="label">${uiLabelMap.modeOfPayment}</td>
					       		<td> 
					       		<input type="radio" name="connectionStatus" id="connectionStatus_O"  value="online" onchange="javascript:getPaymentMode(this)"/> Online
								<input type="radio" name="connectionStatus" id="connectionStatus_C" value="challan"  onchange="javascript:getPaymentMode(this)"/> Challan
								</td>
		   			   		</tr>
						</tbody>
						</table>
					</div>
					
					<#-- Start Code For Payment Type --->
									
					<div id="connectionStatus_Online" style="display:none">
						<table cellspacing="0" class="basic-table table-responsive">
						<tbody>
			   				
						</tbody>
						</table>
  					</div>	
  					
				    <div id="connectionStatus_challan" style="display:none">
						<table cellspacing="0" class="basic-table table-responsive">
						<tbody>
				         	<tr>
		   						<td class="label">${uiLabelMap.challanRefrenceNo}</td>
                        	    <td><input name="Application Challan Refrence no."  type="text" maxlength="20" value="" ></td>
                        	    
                        	    <td class="label">${uiLabelMap.challanAmount}</td>
                        	    <td><input name="Application Challan amount"  type="text" maxlength="10" value="" ></td>
		   			   		</tr>
		   			   		<tr>
              	                 <td class="label">${uiLabelMap.fromDate}</td>
                             	 <td><@htmlTemplate.renderDateTimeField name="fromDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="fromDate_2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                                 </td>
                                  <td class="label">${uiLabelMap.applicationPaymentBehalfOf}</td>
                        	      <td><input name="Application payment behalf of"  type="text" maxlength="50" value="" ></td>
                            </tr>
                            <tr>
                                  <td class="label">${uiLabelMap.applicationBank}</td>
                        	      <td><input name="Application Challan Refrence no."  type="text" maxlength="70" value="" ></td>
                                  <td class="label">${uiLabelMap.uploadChallan}</td>
								  <td><input type="file" name="fileLoc"  onchange="javascript:validateFile(this,document.getElementById('fileLocFileName'),document.getElementById('fileLocFileType'));"/>
                        		  <input type="button" onclick="javascript:resetVal(document..fileLoc);" value="Reset"/>
                        		  <input type="hidden" name="fileLocFileName" id="fileLocFileName" value=""/>
                        		  <input type="hidden" name="fileLocFileType" id="fileLocFileType" value=""/></td>
                            
                            </tr>
                            
						</tbody>
						</table>
					</div>
			         <tr>
                    	 <td colspan="4"><center>
                    	 <div id ="saveBtn">
                    	 <input name="save"   type="button" value="${uiLabelMap.CommonUpdate}" onClick="javascript:updateRTIDetail('createApplication');"/>
                    	 <input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/> 
                     	 </center>
                     	 </td>
                     </tr>
			   </tbody>
		     </table>
          </div>
	 </div>		
</form>

<script>

 function getActionDetails(field)
    {  
  
	    var test=field.value;
	 
		if(test != "")
		{
		   if(test == 'approve')
		     {
				document.getElementById('connectionStatus_Approve').style.display="block";
				document.getElementById('connectionStatus_Reject').style.display="none";
				document.getElementById('connectionStatus_Online').style.display="none"
				document.getElementById('connectionStatus_challan').style.display="none";
			 }
			else 
		     {
		     	document.getElementById('connectionStatus_Reject').style.display="block";
		     	document.getElementById('connectionStatus_Approve').style.display="none";
		     }
		}
		
}	

function getPaymentMode(field)
    {  
  
	    var test1=field.value;
		if(test1 != "")
		{
		   if(test1 == 'online')
		     {
				document.getElementById('connectionStatus_Online').style.display="block";
				document.getElementById('connectionStatus_challan').style.display="none";
			 }
			else 
		     {
		     	document.getElementById('connectionStatus_challan').style.display="block";
		     	document.getElementById('connectionStatus_Online').style.display="none";
		     }
		}
		
}	

function updateRTIDetail(createApplication)
{
		var form=document['createApplication'];
		var sure = confirm("Are you sure, you want to Update the Form ?");
                    if( sure == true )
                    {
                        form.action = "<@ofbizUrl>main</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		            } 
}

</script>