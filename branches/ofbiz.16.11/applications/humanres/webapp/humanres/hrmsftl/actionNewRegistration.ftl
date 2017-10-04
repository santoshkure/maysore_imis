<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: actionNewRegistration.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to Register New Customer -->

<#setting locale="en">
    
    <form method="post" name="actionNewRegistration" action="" class="basic-form">
    <div class="row">
    	<div class="alert alert-info">
  			<ul>
  				<li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
  				<div class="h3" align="center"><b>${uiLabelMap.actionRegistrationDetail}</b></div> 
			</ul>
		</div>
        <table cellspacing="0" class="basic-table table-responsive">
             <tbody>
                <tr>
	               <td colspan="4"><font color="blue">${uiLabelMap.personalDetail}</font></td>
                </tr>
                
                <#if actionDetailList?exists>
             	<#list actionDetailList as actionDetailList>
                <tr>
                    <td class="label">${uiLabelMap.CommonTitle}</td>
                    <td>${actionDetailList.title?if_exists}</td>
                  </tr>
                  
                  <tr>
                      	<td class="label">${uiLabelMap.firstName}</td>
                        <td>${actionDetailList.firstName?if_exists}</td>
                        <td class="label">${uiLabelMap.middleName}</td>
                        <td>${actionDetailList.middleName?if_exists}</td>
                   </tr>
                   
                   <tr>
                   		<td class="label">${uiLabelMap.lastName}</td>
                        <td>${actionDetailList.lastName?if_exists}</td>
                        <td class="label">${uiLabelMap.dateOfBirth}</td>
                        <td>${actionDetailList.dateOfBirth?if_exists}</td>
                   </tr>   
 
                   <tr>
                        <td class="label">${uiLabelMap.gender}</td>
                       <td>
                        <#if genderMasterList?exists>
                        <#list genderMasterList as genderMasterList>
                       	<#if '${genderMasterList.genderId?if_exists}' == '${actionDetailList.genderId?if_exists}'>${genderMasterList.genderName?if_exists}
                        </#if>
                        </#list>
                        </#if>
                        </td>
                        
   						<td class="label">${uiLabelMap.maritalStatusOption}</td>
   						<td>
   						<#if maritalMasterList?exists>
                        <#list maritalMasterList as maritalMasterList>
                       	<#if '${maritalMasterList.maritalStatusId?if_exists}' == '${actionDetailList.maritalStatusId?if_exists}'>${maritalMasterList.maritalStatus?if_exists}
                        </#if>
                        </#list>
                        </#if>
                        </td>
   					</tr>
            
                    <tr>
                        <td class="label">${uiLabelMap.fatherName}</td>
                        <td>${actionDetailList.fatherName?if_exists}</td>
                        
                        <td class="label">${uiLabelMap.motherName}</td>
                        <td>${actionDetailList.motherName?if_exists}</td>
                    </tr>
                    
                    <tr>
                    	<td class="label">${uiLabelMap.aadharCardNo}</td>
                        <td>${actionDetailList.aadharCardNo?if_exists}</td>
                       <td class="label">${uiLabelMap.cummunity}</td>
                        <td>
                        <#if communityMasterList?exists>
                        <#list communityMasterList as communityMasterList>
                       	<#if '${communityMasterList.communityId?if_exists}' == '${actionDetailList.cummunityNameId?if_exists}'>${communityMasterList.communityname?if_exists}
                        </#if>
                        </#list>
                        </#if>
                        </td>
                     </tr>   
                     
                     <tr>   
                        <td class="label">${uiLabelMap.caste}</td>
                        <td>
                         <#if casteMasterList?exists>
                        <#list casteMasterList as casteMasterList>
                       	<#if '${casteMasterList.casteId?if_exists}' == '${actionDetailList.consumerCastId?if_exists}'>${casteMasterList.castename?if_exists}
                        </#if>
                        </#list>
                        </#if>
                        </td>
                        <td class="label">${uiLabelMap.nationality}</td>
                        <td>${actionDetailList.nationality?if_exists}</td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.mobileNo}</td>
                        <td>${actionDetailList.mobileNumber?if_exists}</td>
                        <td class="label">${uiLabelMap.resContactNo}</td>
                        <td>${actionDetailList.resContactNo?if_exists}</td>
                      </tr>
                   
                   	  <tr>
                    	<td class="label">${uiLabelMap.CommonEmail}</td>
                        <td>${actionDetailList.eMail?if_exists}</td>
                      </tr>
                     
                    <tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.currentAddress}</font></td></tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.Address}</td>
                        <td>${actionDetailList.address?if_exists}</td>
                        <td class="label">${uiLabelMap.houseNo}</td>
                        <td>${actionDetailList.houseNo?if_exists}</td>
                    </tr>
                    
                    <tr>
                    	<td class="label">${uiLabelMap.wardNo}</td>
                        <td>${actionDetailList.wardNo?if_exists}</td>
                        <td class="label">${uiLabelMap.mohalla}</td>
                        <td>${actionDetailList.mohalla?if_exists}</td>
                   </tr>
                   
                   <tr>     
                        <td class="label">${uiLabelMap.landMark}</td>
                        <td>${actionDetailList.landMark?if_exists}</td>
                        <td class="label">${uiLabelMap.village}</td>
                        <td>${actionDetailList.village?if_exists}</td>
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
                     
                    <input name="sequenceId"  type="hidden" value="${actionDetailList.sequenceId?if_exists}">
                    <input name="mobileNumber"  type="hidden" value="${actionDetailList.mobileNumber?if_exists}">
                    <input name="eMail"  type="hidden" value="${actionDetailList.eMail?if_exists}">
                    <input name="firstName"  type="hidden" value="${actionDetailList.firstName}">
    				<input name="lastName"  type="hidden" value="${actionDetailList.lastName}">
                    
                   				</#list>
                        </#if>
                        
                        <tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.actionDetail}</font></td></tr>
                    
                    <tr>
		
		   					<td class="label">Action Status <font color="red">*</td>
					       	<td> 
					       		<input type="radio" name="actionStatus" id="registrationStatus_A"  value="Approve" onchange="javascript:getActionDetails(this)"/> Approve
								<input type="radio" name="actionStatus" id="registrationStatus_R" value="Reject"  onchange="javascript:getActionDetails(this)"/> Reject
							</td>
		   			</tr>
		   			
		   			 </tbody>
        </table>
        
        <div id="registrationStatus_Approve" style="display:none">
					<table cellspacing="0" class="basic-table table-responsive">
					<tbody>
					<tr>
							<td class="label">${uiLabelMap.CommonRemark}</td>
							<td><textarea name="approveRemark"></textarea></td>
						</tr>  
						</tbody>
					</table>
				</div>	
				
				<div id="registrationStatus_Reject" style="display:none">
					<table cellspacing="0" class="basic-table table-responsive">
					<tbody>
				
						<tr>
							<td class="label">Resone For Reject <font color="red">*</td>  
							<td><textarea name="resoneForReject"></textarea></td>
						</tr>  
						</tbody>
					</table>
				</div>		
				
				<table cellspacing="0" class="basic-table table-responsive">
					<tbody>
						<tr>
                    	<td colspan="4">
                    	<center>
                    	<input name="action"   type="button" value="${uiLabelMap.action}" onClick="javascript:actionRegistration();"/>
                    	<input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/> 
                     	</center>
                     	</td>
                    </tr>
						</tbody>
					</table>
					
    </div>
    <input name="actionByOfficerName"  type="hidden" value="${person.firstName} ${person.lastName}">
    <input name="createdByLoginId" type="hidden" value="${userLogin.partyId}">
</form>

<script type="text/javascript" language="javascript">

function actionRegistration()
   {
		      var form=document['actionNewRegistration'];
		      var actionStatus = form.actionStatus.value;
		      var approveRemark = form.approveRemark.value;
		      var resoneForReject = form.resoneForReject.value;
		      
		      		if(notEmptyField(actionStatus,"${uiLabelMap.CommonSelect} Action Status"))
		     		{
		     			if(actionStatus == "Reject")
		     			{
		      				if(notEmptyField(resoneForReject,"Resone For Reject ${uiLabelMap.notEmpty}"))
		      					{
		      						var sure = confirm("Are you sure, you want to "+actionStatus+" the Form ?");
                              		if( sure == true )
                             		{
                        				form.action = "<@ofbizUrl>actionRegistration</@ofbizUrl>";
			            				form.submit();
		                				disSubmit('disBttn');    
		                		 	} 
		                		}
		                }
		                else
		                {
		                			var sure = confirm("Are you sure, you want to "+actionStatus+" the Form ?");
                              		if( sure == true )
                             		{
                        				form.action = "<@ofbizUrl>actionRegistration</@ofbizUrl>";
			            				form.submit();
		                				disSubmit('disBttn');    
		                		 	} 
		                }
		              }
    }
    
    function getActionDetails(field)
    {  
  
	    var test=field.value;
	 
		if(test != "")
		{
		   if(test == 'Approve')
		     {
				document.getElementById('registrationStatus_Approve').style.display="block";
				document.getElementById('registrationStatus_Reject').style.display="none";
			 }
			else 
		     {
		     	document.getElementById('registrationStatus_Reject').style.display="block";
		     	document.getElementById('registrationStatus_Approve').style.display="none";
		     }
		}
		
}	
    </script>