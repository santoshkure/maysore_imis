<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: actionNewCustomerDetail.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to view Customer Regi Approve Detail -->

<#setting locale="en">
    
    <form method="post" name="actionNewConnectionDetail" action="" class="basic-form">
    <div class="row">
    	<div class="alert alert-info">
  			<ul>
  				<li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
  				<div class="h3" align="center"><b>Action Connection Detail</b></div> 
			</ul>
		</div>
        <table cellspacing="0" class="basic-table table-responsive">
             <tbody>
              
                 <#if registrationDetailList?exists>
             <#list registrationDetailList as registrationDetailList>
             
                <tr>
                    <td class="label">${uiLabelMap.customerNo}</td>
                    <td colspan="5">${registrationDetailList.customerId?if_exists}</td>
                  </tr>
                  
                <tr>
	               <td colspan="4"><font color="blue">${uiLabelMap.personalDetail}</font></td>
                </tr>
               
                <tr>
                    <td class="label">${uiLabelMap.CommonTitle}</td>
                    <td>${registrationDetailList.title?if_exists}</td>
                    <td class="label">${uiLabelMap.firstName}</td>
                        <td>${registrationDetailList.firstName?if_exists}</td>
                  </tr>
                  
                  <tr>
                         <td class="label">${uiLabelMap.middleName}</td>
                        <td>${registrationDetailList.middleName?if_exists}</td>
                        <td class="label">${uiLabelMap.lastName}</td>
                        <td>${registrationDetailList.lastName?if_exists}</td>
                   </tr>
                   
                   <tr>
                        <td class="label">${uiLabelMap.dateOfBirth}</td>
                        <td>${registrationDetailList.dateOfBirth?if_exists}</td>
                        
                        <td class="label">${uiLabelMap.gender}</td>
                        <td>${registrationDetailList.genderId?if_exists}</td>
                        
   					</tr>
            
                    <tr>
                    <td class="label">${uiLabelMap.maritalStatus}</td>
   						<td>${registrationDetailList.maritalStatusId?if_exists}</td>
                        <td class="label">${uiLabelMap.fatherName}</td>
                        <td>${registrationDetailList.fatherName?if_exists}</td>
                      
                        </tr>
            
                    <tr>  
                        <td class="label">${uiLabelMap.motherName}</td>
                       	<td>${registrationDetailList.motherName?if_exists}</td>
                        
                        <td class="label">${uiLabelMap.aadharCardNo}</td>
                        <td>${registrationDetailList.aadharCardNo?if_exists}</td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.cummunity}</td>
                        <td>${registrationDetailList.cummunityNameId?if_exists}</td>
                        <td class="label">${uiLabelMap.caste}</td>
                        <td>${registrationDetailList.consumerCastId?if_exists}</td>
                    </tr>
                    
                    <tr>
                    	<td class="label">${uiLabelMap.mobileNo}</td>
                        <td>${registrationDetailList.mobileNumber?if_exists}</td>
                        <td class="label">${uiLabelMap.CommonEmail}</td>
                        <td>${registrationDetailList.eMail?if_exists}</td>
                     </tr>
                        
                     <tr>
                        <td class="label">${uiLabelMap.resContactNo}</td>
                        <td>${registrationDetailList.resContactNo?if_exists}</td>
                         <td class="label">${uiLabelMap.nationality}</td>
                        <td>Indian</td>
                    </tr>
                        
                    <tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.currentAddress}</font></td></tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.Address}</td>
                         <td>${registrationDetailList.address?if_exists}</td>
                        <td class="label">${uiLabelMap.houseNo}</td>
                         <td>${registrationDetailList.houseNo?if_exists}</td>
                    </tr>
                    
                    <tr>
                     <td class="label">${uiLabelMap.wardNo}</td>
                        <td>${registrationDetailList.wardNo?if_exists}</td>
                        <td class="label">${uiLabelMap.mohalla}</td>
                         <td>${registrationDetailList.mohalla?if_exists}</td>
                        
                        </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.landMark}</td>
                         <td>${registrationDetailList.landMark?if_exists}</td>
                        <td class="label">${uiLabelMap.village}</td>
                         <td>${registrationDetailList.village?if_exists}</td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.CommonCity}</td>
                        <td>Mysore</td>
                        <td class="label">${uiLabelMap.CommonState}</td>
                        <td>Karnataka</td>
                    </tr>
                    
                        <tr>
                        
                        <td class="label">${uiLabelMap.CommonCountry}</td>
                        <td>India</td>
                        </tr>
                    
                   <tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.registrationDetail}</font></td></tr>
                    
                    <tr>
                     	<td class="label">${uiLabelMap.registrationDate}</td>
                    	<td>${registrationDetailList.submittedDate?if_exists}</td>
                    	<td class="label">${uiLabelMap.approveDate}</td>
                    	<td>${registrationDetailList.actionDate?if_exists}</td>
                    </tr>
                    
                     <tr>
                    <td class="label">${uiLabelMap.actionByOfficer}</td>
                    <td>${registrationDetailList.actionByOfficerName?if_exists}</td>
                     </tr>
                  </#list>
                    </#if>	 
                    	
                   <tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.connectionDetail}</font></td></tr>
                   
                   <#if viewConnectionDetail?exists>
              <#list viewConnectionDetail as viewConnectionDetail>
                   <tr>
                        <td class="label">${uiLabelMap.connectionType}</td>
                        <td>${viewConnectionDetail.connectionCategory?if_exists}</td>
                        <td class="label">${uiLabelMap.applicationType}</td>
                        <td>${viewConnectionDetail.applicationType?if_exists}</td>
                    </tr>
                    <input type="hidden" name="customerNo" value="${viewConnectionDetail.customerId?if_exists}">
                    <tr>
                    <td class="label">${uiLabelMap.typeOfBuilding}</td>
                        <td>${viewConnectionDetail.typeOfBuilding?if_exists}</td>
                        <td class="label">${uiLabelMap.applicationDate}</td>
                        <td>${viewConnectionDetail.applicationDate?if_exists}</td>
                        
                        </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.assentialDoccument}</td>
                        <td>Example.Doc</td>
                        <td class="label">${uiLabelMap.feeForConnection}</td>
                        <td>500</td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.feeStatus}</td>
                        <td colspan="5"></td>
                    </tr>
                    <input type="hidden" name="sequenceId" value="${viewConnectionDetail.sequenceId?if_exists}">
                    </#list>
                    </#if>	 
                    <input name="actionByOfficerName"  type="hidden" value="${person.firstName} ${person.lastName}">
                    
                    <tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.connectionActionDetail}</font></td></tr>
                    
                    <tr>
		
		   					<td class="label">Connection Status <font color="red">*</td>
					       	<td> 
					       		<input type="radio" name="connectionStatus" id="connectionStatus_A"  value="approve" onchange="javascript:getActionDetails(this)"/> Approve
								<input type="radio" name="connectionStatus" id="connectionStatus_R" value="reject"  onchange="javascript:getActionDetails(this)"/> Reject
							</td>
		   			</tr>
		   
         		</tbody>
       		</table>
       		
			<div id="connectionStatus_Approve" style="display:none">
					<table cellspacing="0" class="basic-table table-responsive">
					<tbody>
				
						<tr>
							<td class="label">DMA No.</td>  
							<td><input name="dmaNo"  type="text" maxlength="60" value=""></td>
							<td class="label">Connection Date</td>  
							<td><@htmlTemplate.renderDateTimeField name="connectionDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="connectionDate" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/></td>
						</tr>
						
						<tr>
							<td class="label">Meter No.</td>
							<td><input name="meterNo"  type="text" maxlength="60" value=""></td>
							<td class="label">Ref file No.</td>  
							<td><input name="refFileNo"  type="text" maxlength="60" value=""></td>
						</tr>  
						
						<tr>
							<td class="label">Book No.</td>  
							<td><input name="bookNo"  type="text" maxlength="60" value=""></td>
							<td class="label">Leaf No.</td>  
							<td><input name="leafNo"  type="text" maxlength="60" value=""></td>
						</tr> 
						
						<tr>
							<td class="label">Pipe Size</td>  
							<td><input name="pipeSize"  type="text" maxlength="60" value=""></td>
							<td class="label">Drinking Water</td>  
							<td><input name="drinkingWater"  type="text" maxlength="60" value=""></td>
						</tr> 
						
						<tr>
							<td class="label">Constituency</td>  
							<td><input name="constituency"  type="text" maxlength="60" value=""></td>
							<td class="label">Zone</td>  
							<td><input name="zone"  type="text" maxlength="60" value=""></td>
							
						</tr> 
						
						<tr>	
							<td class="label">Mcc Zone</td>  
							<td><input name="mccZone"  type="text" maxlength="60" value=""></td>
							<td class="label">Division</td>  
							<td><input name="division"  type="text" maxlength="60" value=""></td>
						</tr> 
						
						<tr>
							<td class="label">Survey number</td>  
							<td><input name="surveyNumber"  type="text" maxlength="60" value=""></td>
							<td class="label">EE Name</td>  
							<td><input name="eeName"  type="text" maxlength="60" value=""></td>
						</tr> 
						
						<tr>
							<td class="label">Old Ward</td>  
							<td><input name="oldWard"  type="text" maxlength="60" value=""></td>
							<td class="label">Ref Consumer No.</td>  
							<td><input name="refConsumerNo"  type="text" maxlength="60" value=""></td>
						</tr> 
						
						<tr>	
							<td class="label">Remark</td>  
							<td><input name="Remark"  type="text" maxlength="60" value=""></td>
							<td class="label">MR Name</td>  
							<td><input name="mrName"  type="text" maxlength="60" value=""></td>
						</tr> 
						
						<tr>
							<td class="label">Area Co-ordinator</td>  
							<td><input name="areaCoordinator"  type="text" maxlength="60" value=""></td>
							<td class="label">logitude</td>  
							<td><input name="logitude"  type="text" maxlength="60" value=""></td>
						</tr> 
						
						<tr>
							<td class="label">lattitude</td>  
							<td><input name="lattitude"  type="text" maxlength="60" value=""></td>
							<td class="label">Connection stauts</td>  
							<td><input name="conneStatus"  type="text" maxlength="60" value=""></td>
						</tr>
						
						</tbody>
					</table>
				</div>	
				
				<div id="connectionStatus_Reject" style="display:none">
					<table cellspacing="0" class="basic-table table-responsive">
					<tbody>
				
						<tr>
							<td class="label">Resone For Reject</td>  
							<td><textarea name="resoneForReject" maxlength ="500"></textarea></td>
						</tr>  
						</tbody>
					</table>
				</div>		
				
				<table cellspacing="0" class="basic-table table-responsive">
             		<tbody>
              
                		<tr>
                    		<td class="label">${uiLabelMap.commonOfficerName}</td>
                    		<td>${person.firstName} ${person.lastName}</td>
                    <input name="actionOfficerName"  type="hidden" value="${person.firstName} ${person.lastName}">
                    
                     		<td class="label">${uiLabelMap.designation}</td>
                    		<td></td>
                    		<input name="designation"  type="hidden" value="">
                    	</tr>
                  		
                  		<tr>	
                    		<td class="label">${uiLabelMap.actionDate}</td>
                    		<td>${nowTimestamp?string("dd/MM/yyyy")}</td>
                  		
                    		<td class="label">${uiLabelMap.CommonRemark}</td>
                    		<td><textarea name="remark" maxlength ="500"></textarea></td>
                  		</tr>
                  		
                  		<tr>
                    	<td colspan="4">
                    	<center>
                    	<input name="action"   type="button" value="${uiLabelMap.action}" onClick="javascript:actionConnectionDetail();"/>
                    	<input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/> 
                     	</center>
                     	</td>
                    </tr>
                     	
         			</tbody>
       			</table>	
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
			 }
			else 
		     {
		     	document.getElementById('connectionStatus_Reject').style.display="block";
		     	document.getElementById('connectionStatus_Approve').style.display="none";
		     }
		}
		
}	

function actionConnectionDetail()
   {
		      var form=document['actionNewConnectionDetail'];
		      var connectionStatus = form.connectionStatus.value;
		      
		      if(notEmptyField(connectionStatus,"${uiLabelMap.CommonSelect} Connection Status"))
     				{
		      var sure = confirm("Are you sure, you want to Save the Form ?");
                              if( sure == true )
                             {
                        form.action = "<@ofbizUrl>actionConnectionDetail</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		                	} 
		            }    
    }
    
</script>