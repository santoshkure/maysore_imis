<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: viewEmployee.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     -->
<#--- Prabhu    	17August2017    -->

<#-- #####################################################################################################-->
<#assign checkLocale = "${locale?if_exists}">
<#setting locale="en">
<#assign flag ='${parameters.flag?if_exists}'>
<form method="post" name="viewEmployee" class="basic-form">
<div class="row">
  <div class="alert alert-info">
    <ul>
    <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
      <#if '${flag?if_exists}' == "y" >
      <li class="h3">Approve Employee Registration</li>
      <#else>
      <li class="h3">View Employee Registration</li>
      </#if>
    </ul>
    
  </div>
	
	<div class="screenlet-body">
	<#if viewEmployeeList?has_content >
	<#list viewEmployeeList as viewEmployeeList>
	
		<table class="basic-table" cellspacing="0">
		
		
	<tr><td colspan="6"><h4 align="left"><i><b><font color="Blue">Personal Details</font></b></i></a></td></tr>

		
		
		<tr>
			 <td class="label">${uiLabelMap.employeeId}</font></td>
			 <td>${viewEmployeeList.employeeCode?if_exists}</td>    	
			 
			  <td class="label">${uiLabelMap.Name}</font> </td>
			 
			  <td>${viewEmployeeList.title?if_exists}&nbsp;${viewEmployeeList.firstName?if_exists}&nbsp;${viewEmployeeList.middleName?if_exists}&nbsp;${viewEmployeeList.lastName?if_exists}</td>  
			  <td> </td>
			  <td> </td>
        	</tr>
        	
        
        
        <tr>
         <td class="label" >${uiLabelMap.dob}</td>
		         <td>${viewEmployeeList.dateOfBirth?if_exists}</td>
			<td class="label">${uiLabelMap.gender}</font></td>
			 <td>${viewEmployeeList.gender?if_exists}</td>
			    	
			
             <td class="label">${uiLabelMap.meritalStatus}</font> </td>
			  <td> 
				
				 <#assign meritalStatus  = "${viewEmployeeList.meritalStatus?if_exists}">
                         <#if maritalStatusList?has_content>
                            <#list maritalStatusList as maritalStatusList>
                             <#if "${maritalStatusList.maritalStatusId?if_exists}" == "${meritalStatus?if_exists}">
                               ${maritalStatusList.maritalStatus?if_exists}
                            <#else>
                                
                              </#if>
                            </#list>
                        </#if> 
			</td> 
			
		</tr>
		
		<tr>
			 <td class="label">${uiLabelMap.fatherName}</font></td>
			 <td>${viewEmployeeList.fatherName?if_exists}</td>    	
			 
             <td class="label">${uiLabelMap.motherName}</font></td>
			 <td>${viewEmployeeList.motherName?if_exists}</td>    	
			
			<td class="label">${uiLabelMap.adharCardNo}</font></td>
			 <td>${viewEmployeeList.aadharCardNumber?if_exists}</td>    	
			
        </tr>	 

        <tr>
			 <td class="label">${uiLabelMap.community}</font></td>
			 <td>
			 <#assign community  = "${viewEmployeeList.community?if_exists}">					
			   <#if communityList?exists>
	    	      <#if communityList?has_content>
	    	        <#list communityList as communityList>
	    	          <#if "${communityList.communityId?if_exists}" == "${community?if_exists}">
	    	           ${communityList.communityname?if_exists}
	    	         <#else>
 	    	           
 	    	         </#if>
 	    	       </#list>
	    	     </#if>
	    	   </#if></td>    	
			 
			<td class="label">${uiLabelMap.village}</font></td>
			 <td>${viewEmployeeList.village?if_exists}</td>
			
			<td class="label">${uiLabelMap.nationality}</font></td>
			 <td>${viewEmployeeList.nationality?if_exists}</td>    	
			
        </tr>
          <tr>
			 <td class="label">${uiLabelMap.state}</font></td>
			 <td>${viewEmployeeList.state?if_exists}</td>    	
			 
           
			<td class="label">${uiLabelMap.city}</font></td>
			 <td>${viewEmployeeList.city?if_exists}</td>    	
			
			<td class="label">${uiLabelMap.pin}</font></td>
			 <td>${viewEmployeeList.pincode?if_exists}</td>    	
			
        </tr>
       


       <tr>
			 <td class="label">${uiLabelMap.mobileNo}</font></td>
			 <td style="width:225px;">${viewEmployeeList.mobileNo?if_exists}</td>    	
			 
             <td class="label">${uiLabelMap.resContactNo}</font></td>
			 <td style="width:225px;">${viewEmployeeList.contactNumber?if_exists}</td>    	
			
			<td class="label">${uiLabelMap.emailAddress}</font></td>
			 <td style="width:225px;">${viewEmployeeList.emailAddress?if_exists}</td>    	
			
        </tr>
	 
        
         <tr>
			 <td class="label">${uiLabelMap.permanentAddress}</font></td>
			 <td>${viewEmployeeList.permanentAddress?if_exists}</td>    	
			 
			 <td class="label">${uiLabelMap.currentAddress}</font></td>
			 <td>${viewEmployeeList.currentAddress?if_exists}</td>    	
            		
        </tr>
        
   
        	<tr><td colspan="6"><h4 align="left"><i><b><font color="Blue">Employement Details</font></b></i></a></td></tr>
			
        <tr><td class="label">Present Office </td>
        <td>
          <#assign officeId  = "${viewEmployeeList.officeId?if_exists}">	
		        <#if officeList?exists>
	    	      <#if officeList?has_content>
	    	       <#list officeList as officeList>
	    	       <#if "${officeList.partyId?if_exists}" == "${officeId?if_exists}">
	    	           ${officeList.officeSiteName?if_exists}
	    	         <#else>
 	    	         
 	    	         </#if>
 	    	       </#list>
	    	     </#if>
	    	   </#if></td>
		        		
		        		<td class="label">Designation </td>
        <td>
         <#assign designation  = "${viewEmployeeList.designation?if_exists}">
        <#if designationMasterList?exists>
	    	      <#if designationMasterList?has_content>
	    	       <#list designationMasterList as designationMasterList>
	    	       <#if "${designationMasterList.designationId?if_exists}" == "${designation?if_exists}">
	    	           ${designationMasterList.designationName?if_exists}
	    	         <#else>
 	    	        
 	    	         </#if> 	    	         
 	    	       </#list>
	    	     </#if>
	    	   </#if></td>
		  	
		        		<td class="label">${uiLabelMap.DateOfJoining}</td>
         <td> ${viewEmployeeList.dateOfJoining?if_exists}
          </td>
      	
        </tr>
         <tr>
       <td class="label" >Type of Appointment</td>
		         <td>${viewEmployeeList.appointmentType?if_exists}	</td>
         	<td class="label" style="width:225px;">Payscale</td>
			   				<td>${viewEmployeeList.payScaleId?if_exists}</td>
			   				<td class="label" style="width:225px;">Basic Pay</td>
			   				<td>${viewEmployeeList.basicPay?if_exists}</td>
			
        </tr>
        
        <tr><#--<td class="label">${uiLabelMap.essentialDocument}</font></td>
			 <td></td>--> 	
			<td class="label" style="width:225px;">${uiLabelMap.Remark}</td>
			  
			  <#if '${flag?if_exists}' == "y" >
			  <td colspan="4"><textarea style="width:240px" name="remarks"  onchange="javascript:trimFunction(this)" autocomplete="off" id="remarks" maxlength ="210">${viewEmployeeList.remarks?if_exists}</textarea>
			   				</td>
			  <#else>
			  
			  <td>${viewEmployeeList.remarks?if_exists}</td>
            </#if>
            
             <#if '${flag?if_exists}' == "y" >
            
            <tr>
				<td colspan="6">
					<center><div id="submit" align="center">
						<input type="button" submit="" value="Approve" onclick="javascript:validateParameters('viewEmployee');"/>
				        <input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/>
				
 					</div>
					</center>
				</td>
			</tr>
			</#if>
        </table>
         <td><input type="hidden" style="width:140px"  name="registrationId"  maxlength ="30" value="${viewEmployeeList.registrationId?if_exists}" /></td>    	
					<td><input type="hidden" style="width:140px"  name="actionFlag"  maxlength ="30" value="Y" /></td>   
        </#list>
        </#if>
		</div>
	</div>
	
	</form>
        
        <script>
	function validateParameters(formName)
      {
		   var form=document[formName];
		   
 				  form.action = "<@ofbizUrl>approveEmployee</@ofbizUrl>";
			      form.submit();
			      disSubmit('saveBtn');
		         
        }
	
	</script>
        
        
        
        
        
     
			
			


