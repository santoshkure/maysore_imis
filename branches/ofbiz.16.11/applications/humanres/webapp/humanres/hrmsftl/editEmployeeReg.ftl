<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: editEmployee.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     -->
<#--- Prabhu    	17August2017    -->

<#-- #####################################################################################################-->
<#assign checkLocale = "${locale?if_exists}">
<#setting locale="en">

<script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>

<form method="post" name="editEmployee" class="basic-form">
<div class="row">
  <div class="alert alert-info">
    <ul>
    <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
      <li class="h3">Edit Employee Registration</li>
    </ul>
    
  </div>
	<div class="screenlet-body">
	<#if approveEmployeeList?has_content >
	<#list approveEmployeeList as approveEmployeeList>
		<table class="basic-table" cellspacing="0" >
		<tr><td colspan="6"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td></tr>
		
		
	<tr><td colspan="6"><h4 align="left"><i><b><font color="Blue">Personal Details</font></b></i></a></td></tr>

		
		
		<tr>
			 <td class="label">${uiLabelMap.employeeId}&nbsp;<font color="red" >*</font></td>
			 <td><input type="text" style="width:140px"  name="employeeCode"  onchange="javascript:trimFunction(this)" autocomplete="off"  maxlength ="30" value="${approveEmployeeList.employeeCode?if_exists}" /></td>    	
			 
			  <td class="label">${uiLabelMap.title}&nbsp;<font color="red" >*</font> </td>
			  <td> 
				<select name="title" style="width:80px;">
				    <option value="${approveEmployeeList.title?if_exists}" selected="true">${approveEmployeeList.title?if_exists}</option>					
					<option value="Mr">Mr</option>
	   				<option value="Dr">Dr</option>
	   				<option value="Mrs">Mrs</option>
	   				<option value="Ms">Ms</option>
				</select>
			</td>  
			  <td> </td>
			  <td> </td>
        	</tr>
        	
        <tr>
			 <td class="label">${uiLabelMap.firstName}&nbsp;<font color="red" >*</font></td>
			 <td><input type="text" style="width:140px"  name="firstName"  onchange="javascript:trimFunction(this)" autocomplete="off"  maxlength ="30" value="${approveEmployeeList.firstName?if_exists}" /></td>    	
			 
             <td class="label">${uiLabelMap.middleName}</font></td>
			 <td><input type="text" style="width:140px"  name="middleName"  onchange="javascript:trimFunction(this)" autocomplete="off"  maxlength ="30" value="${approveEmployeeList.middleName?if_exists}" /></td>    	
			
			<td class="label">${uiLabelMap.lastName}&nbsp;<font color="red" >*</font></td>
			 <td><input type="text" style="width:140px"  name="lastName"  onchange="javascript:trimFunction(this)" autocomplete="off" " maxlength ="30" value="${approveEmployeeList.lastName?if_exists}" /></td>    	
			
        </tr>
        
        <tr>
         <td class="label" >${uiLabelMap.dob}&nbsp;<font color="red" >*</font></td>
		         <td>
		         <#assign date = "${approveEmployeeList.dateOfBirth?if_exists?string('yyyy-MM-dd')}">
		          <@htmlTemplate.renderDateTimeField name="dateOfBirth" event="" action="" className="" alert="" title="Format: MM-DD-YYYY" value="${date}" size="11" maxlength="30" id="dateOfBirth" dateType="date" 
		          shortDateInput=true timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" 
		          hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName="editEmployee"/>
				</td>
              
       

			<td class="label">${uiLabelMap.gender}&nbsp;<font color="red" >*</font></td>
			 <td><select name="gender" style="width:80px;">
			 	<#--<option value="M">Male</option>
					<option value="F">Female</option>-->
			 	<#assign gender  = "${approveEmployeeList.gender?if_exists}">					
				<#if genderMasterList?exists>
	    	      <#if genderMasterList?has_content>
	    	       <#list genderMasterList as genderMasterList>
	    	       <#if "${genderMasterList.genderId?if_exists}" == "${gender?if_exists}">
                               <option value="${genderMasterList.genderId?if_exists}" selected>${genderMasterList.genderName?if_exists}</option>
                    		 <#else>
	        					<option value="${genderMasterList.genderId?if_exists}">${genderMasterList.genderName?if_exists}</option>
                             </#if>
			       </#list>
	    	     </#if>
	    	   </#if>
				</select>
			
             <td class="label">${uiLabelMap.meritalStatus}</font> </td>
			  <td> 
				<select name="meritalStatus" style="width:150px;">
					<option value="">${uiLabelMap.CommonSelect}</option>
				 <#assign meritalStatus  = "${approveEmployeeList.meritalStatus?if_exists}">
                         <#if maritalStatusList?has_content>
                            <#list maritalStatusList as maritalStatusList>
                             <#if "${maritalStatusList.maritalStatusId?if_exists}" == "${meritalStatus?if_exists}">
                               <option value="${maritalStatusList.maritalStatusId?if_exists}" selected>${maritalStatusList.maritalStatus?if_exists}</option>
                            <#else>
                                <option value="${maritalStatusList.maritalStatusId?if_exists}">${maritalStatusList.maritalStatus?if_exists}</option>
                              </#if>
                            </#list>
                        </#if> 
				</select>
			</td> 
			
		</tr>
		
		<tr>
			 <td class="label">${uiLabelMap.fatherName}&nbsp;<font color="red" >*</font></td>
			 <td><input type="text" style="width:140px"  name="fatherName"  onchange="javascript:trimFunction(this)" autocomplete="off" id="fatherName" maxlength ="30" value="${approveEmployeeList.fatherName?if_exists}" /></td>    	
			 
             <td class="label">${uiLabelMap.motherName}</font></td>
			 <td><input type="text" style="width:140px"  name="motherName"  onchange="javascript:trimFunction(this)" autocomplete="off" id="motherName" maxlength ="30" value="${approveEmployeeList.motherName?if_exists}" /></td>    	
			
			<td class="label">${uiLabelMap.adharCardNo}</font></td>
			 <td><input type="text" style="width:140px"  name="aadharCardNumber"  onchange="javascript:trimFunction(this)" autocomplete="off" id="aadharCardNumber" maxlength ="30" value="${approveEmployeeList.aadharCardNumber?if_exists}" /></td>    	
			
        </tr>	 

        <tr>
			 <td class="label">${uiLabelMap.community}</font></td>
			 <td><select name="community" style="width:150px;">
					<option value="">${uiLabelMap.CommonSelect}</option>
			<#assign community  = "${approveEmployeeList.community?if_exists}">					
			   <#if communityList?exists>
	    	      <#if communityList?has_content>
	    	        <#list communityList as communityList>
	    	          <#if "${communityList.communityId?if_exists}" == "${community?if_exists}">
	    	           <option value="${communityList.communityId?if_exists?if_exists}" selected>${communityList.communityname?if_exists}</option>
	    	         <#else>
 	    	           <option value="${communityList.communityId?if_exists}">${communityList.communityname?if_exists}</option>
 	    	         </#if>
 	    	       </#list>
	    	     </#if>
	    	   </#if>
				 
				</select></td>    	
			 
			<td class="label">${uiLabelMap.village}</font></td>
			 <td><input type="text" style="width:140px"  name="village"  onchange="javascript:trimFunction(this)" autocomplete="off" id="village" maxlength ="30" value="${approveEmployeeList.village?if_exists}" /></td>
			
			<td class="label">${uiLabelMap.nationality}</font></td>
			 <td><input type="text" style="width:140px"  name="nationality"  onchange="javascript:trimFunction(this)" autocomplete="off" id="nationality" maxlength ="30" value="${approveEmployeeList.nationality?if_exists}" /></td>    	
			
        </tr>
          <tr>
			 <td class="label">${uiLabelMap.state}</font></td>
			 <td><input type="text" style="width:140px"  name="state"  onchange="javascript:trimFunction(this)" autocomplete="off" id="state" maxlength ="30" value="${approveEmployeeList.state?if_exists}" /></td>    	
			 
  	
			<td class="label">${uiLabelMap.city}</font></td>
			 <td><input type="text" style="width:140px"  name="city"  onchange="javascript:trimFunction(this)" autocomplete="off" id="city" maxlength ="30" value="${approveEmployeeList.city?if_exists}" /></td>    	
			
			<td class="label">${uiLabelMap.pin}</font></td>
			 <td><input type="text" style="width:140px"  name="pincode"  onchange="javascript:trimFunction(this)" autocomplete="off" id="pincode" maxlength ="30" value="${approveEmployeeList.pincode?if_exists}" /></td>    	
			
        </tr>
         <tr>
			 <td class="label">${uiLabelMap.mobileNo}&nbsp;<font color="red" >*</font></td>
			 <td><input type="text" style="width:140px"  name="mobileNo"  onchange="javascript:trimFunction(this)" autocomplete="off" id="mobileNo" maxlength ="30" value="${approveEmployeeList.mobileNo?if_exists}" /></td>    	
			 
             <td class="label">${uiLabelMap.resContactNo}</font></td>
			 <td><input type="text" style="width:140px"  name="contactNumber"  onchange="javascript:trimFunction(this)" autocomplete="off" id="contactNumber" maxlength ="30" value="${approveEmployeeList.contactNumber?if_exists}" /></td>    	
			
			<td class="label">${uiLabelMap.emailAddress}&nbsp;<font color="red" >*</font></td>
			 <td><input type="text" style="width:140px"  name="emailAddress"  onchange="javascript:trimFunction(this)" autocomplete="off" id="emailAddress" maxlength ="30" value="${approveEmployeeList.emailAddress?if_exists}" /></td>    	
			
        </tr>
	 
        
         <tr>
			 <td class="label">${uiLabelMap.permanentAddress}&nbsp;<font color="red" >*</font></td>
			 <td><textarea style="width:240px" name="permanentAddress"  onchange="javascript:trimFunction(this)" autocomplete="off" id="permanentAddress" maxlength ="310">${approveEmployeeList.permanentAddress?if_exists}</textarea>
			</td>    	
			 
			 <td class="label">${uiLabelMap.currentAddress}</font></td>
			 <td><textarea style="width:240px" name="currentAddress"  onchange="javascript:trimFunction(this)" autocomplete="off" id="currentAddress" maxlength ="310">${approveEmployeeList.currentAddress?if_exists}</textarea>
			 </td> 	
        </tr>
        
   
        	<tr><td colspan="6"><h4 align="left"><i><b><font color="Blue">Employment Details</font></b></i></a></td></tr>
			<tr>
			</tr>
        <tr><td class="label">Present Office &nbsp;<font color="red" >*</font></td>
        <td><select name="officeId" style="width:160px">
		     <option value="">${uiLabelMap.CommonSelect}</option>
		     <#assign officeId  = "${approveEmployeeList.officeId?if_exists}">	
		        <#if officeList?exists>
	    	      <#if officeList?has_content>
	    	       <#list officeList as officeList>
	    	       <#if "${officeList.partyId?if_exists}" == "${officeId?if_exists}">
	    	           <option value="${officeList.partyId?if_exists}" selected>${officeList.officeSiteName?if_exists}</option>
	    	         <#else>
 	    	         <option value="${officeList.partyId?if_exists}">${officeList.officeSiteName?if_exists}</option>
 	    	         </#if>
 	    	       </#list>
	    	     </#if>
	    	   </#if></select></td>
		        		
		        		<td class="label">Designation &nbsp;<font color="red" >*</font></td>
        <td><select name="designation" style="width:160px">
        <#assign designation  = "${approveEmployeeList.designation?if_exists}">	
		        	<#if designationMasterList?exists>
	    	      <#if designationMasterList?has_content>
	    	       <#list designationMasterList as designationMasterList>
	    	       <#if "${designationMasterList.designationId?if_exists}" == "${designation?if_exists}">
	    	           <option value="${designationMasterList.designationId?if_exists}" selected>${designationMasterList.designationName?if_exists}</option>
	    	         <#else>
 	    	         <option value="${designationMasterList.designationId?if_exists}">${designationMasterList.designationName?if_exists}</option>
 	    	         </#if>
 	    	         
 	    	       </#list>
	    	     </#if>
	    	   </#if>
		        		
		     </select></td>		  	
		        		<td class="label">${uiLabelMap.joiningDate}&nbsp;<font color="red" >*</font></td>
		        		
         <td> 
         <#if approveEmployeeList.dateOfJoining?has_content>
         
          <#assign dateOfJoining = "${approveEmployeeList.dateOfJoining?if_exists?string('yyyy-MM-dd')}">
		          <@htmlTemplate.renderDateTimeField name="dateOfJoining" event="" action="" className="" alert="" title="Format: MM-DD-YYYY" value="${dateOfJoining}" size="11" maxlength="30" id="dateOfJoining" dateType="date" 
		          shortDateInput=true timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" 
		          hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName="editEmployee"/>
		          
		          <#else>
		           <@htmlTemplate.renderDateTimeField name="dateOfJoining" event="" action="" className="" alert="" title="Format: MM-DD-YYYY" value="" size="11" maxlength="30" id="dateOfJoining" dateType="date" 
		          shortDateInput=true timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" 
		          hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
		          </#if>
		        				         </td>
      	
        </tr>
         <tr>
       <td class="label" >Type of Appointment&nbsp;<font color="red" >*</font></td>
		<td><select name="appointmentType" style="width:160px">
		    <option value="">${uiLabelMap.CommonSelect}</option>
		    <#if "${approveEmployeeList.appointmentType?if_exists}" == "REGULAR">
	             <option value="${approveEmployeeList.appointmentType?if_exists}" selected>Regular</option>
	    	     <#else>
	    	    <option value="REGULAR">Regular</option>
	    	      </#if>
		     </select>
		 </td></td>
         	<#--<td class="label" style="width:225px;">Payscale</td>
			<td><input type="text" name="payScaleId" style="width:160px;" value="${approveEmployeeList.payScaleId?if_exists}"/></td>-->
			<td class="label" style="width:225px;">Basic Pay</td>
			<td><input type="text" name="basicPay" style="width:160px;" value="${approveEmployeeList.basicPay?if_exists}"/></td>
			
        </tr>
        
        <#---<tr><td class="label">${uiLabelMap.essentialDocument}</font></td>
			 <td><input type="text" style="width:140px"  name="essentialDocument"  onchange="javascript:trimFunction(this)" autocomplete="off" id="remark" maxlength ="30" value="" /></td>    	
			<td class="label" style="width:225px;">${uiLabelMap.Remark}</td>
			<td><textarea style="width:240px" name="remarks" value="${approveEmployeeList.remarks?if_exists}" onchange="javascript:trimFunction(this)" autocomplete="off" id="remarks" maxlength ="210"></textarea>
			</td>
        </tr>--->
        	<tr>
				<td colspan="6">
					<center><div id="submit" align="center">
						<input type="button" submit="" value="${uiLabelMap.CommonUpdate}" onclick="javascript:validateParameters('editEmployee');"/>
					    <input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/>
					</div>
					</center>
				</td>
			</tr>
        			<input type="hidden" name="registrationId"  value="${approveEmployeeList.registrationId?if_exists}"/>
        			<input type="hidden" name="status"  value="${approveEmployeeList.status?if_exists}"/>
        
        </table>
        </#list>
        </#if>
		</div>
	</div>
	
	</form>
<script>
	
	  function validateParameters(formName)
      {
		   var form=document[formName];
		 	    
 		var employeeCode = form.employeeCode.value;
 		var title = form.title.value; 		
 		var firstName = form.firstName.value; 		
 		var lastName = form.lastName.value;
 		var dateOfBirth = form.dateOfBirth.value;
 		var gender = form.gender.value;
 		var fatherName = form.fatherName.value;
 		var mobileNo = form.mobileNo.value; 		
 		var contactNumber = form.contactNumber.value;  		
 		var permanentAddress = form.permanentAddress.value;
 		var officeId = form.officeId.value;
 		var appointmentType = form.appointmentType.value;
 		var designation = form.designation.value;
 		var dateOfJoining = form.dateOfJoining.value; 
 		var emailAddress = form.emailAddress.value; 	
 		var basicPay = form.basicPay.value;
 		//var payScaleId = form.payScaleId.value;		
 		
 		if(notEmptyField(employeeCode,"Employee Code should not be empty.")){
 		if(notEmptyField(title,"Title should not be empty.")){
 		if(notEmptyField(firstName,"First name should not be empty.")){
 		if(notEmptyField(lastName,"Last name should not be empty.")){
 		if(notEmptyField(dateOfBirth,"Date of Birth should not be empty.")){
 		if(notEmptyField(gender,"Gender should not be empty.")){
 		if(notEmptyField(fatherName,"Father name should not be empty.")){
 		if(notEmptyField(mobileNo,"Mobile Number should not be empty.")){
 		if(notEmptyField(emailAddress,"Email Address should not be empty.")){
 		if(enterNumeric(mobileNo,"Mobile Number should be Numeric .")){ 
 		if(enterNumeric(contactNumber,"Contact Number should be Numeric .")){ 			 		
 		if(notEmptyField(permanentAddress,"Permanent Address should not be empty.")){
 		if(notEmptyField(officeId,"Present Office should not be empty.")){
 		if(notEmptyField(designation,"Designation should not be empty.")){
 		if(notEmptyField(dateOfJoining,"Date of Joining should not be empty.")){
 		if(notEmptyField(appointmentType,"Appointment Type should not be empty.")){
 		if(ValidateEmail(emailAddress)){
 		if(numericfloat(basicPay, "Basic Pay should be numeric value only.")){
 		//if(enterNumeric(payScaleId,"PayScale should be Numeric .")){
 				 
 				  form.action = "<@ofbizUrl>updateEmployee</@ofbizUrl>";
			      form.submit();
			      disSubmit('saveBtn');
		}}}}}}}}}}}}}}}}}}//}	      
		         
        }
	
	
		
</script>





