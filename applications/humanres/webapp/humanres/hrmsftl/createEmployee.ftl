<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: createEmployee.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created      -->
<#--- Gaurav    	17August2017          -->

<#-- #####################################################################################################-->
<#assign checkLocale = "${locale?if_exists}">
<#setting locale="en">

<script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>
<form method="post" name="createEmployee" class="basic-form">
<div class="row">
  <div class="alert alert-info">
    <ul>
    <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
      <li class="h3">Employee Registration</li>
    </ul>
    
  </div>
	
	<div class="screenlet-body">
	
		<table class="basic-table" cellspacing="0">
		<tr><td colspan="6"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td></tr>
		
		
	<tr><td colspan="6"><h4 align="left"><i><b><font color="Blue">Personal Details</font></b></i></a></td></tr>

		
		
		<tr>
			 <td class="label">${uiLabelMap.employeeId}&nbsp;<font color="red" >*</font></td>
			 <td><input type="text" style="width:140px"  name="employeeCode"  onchange="javascript:trimFunction(this)" autocomplete="off"  maxlength ="30" value="" /></td>    	
			 
			  <td class="label">${uiLabelMap.title}&nbsp;<font color="red" >*</font> </td>
			  <td> 
				<select name="title" style="width:80px;">
					<option value="">${uiLabelMap.CommonSelect}</option>
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
			 <td><input type="text" style="width:140px"  name="firstName"  onchange="javascript:trimFunction(this)" autocomplete="off"  maxlength ="30" value="" /></td>    	
			 
             <td class="label">${uiLabelMap.middleName}</font></td>
			 <td><input type="text" style="width:140px"  name="middleName"  onchange="javascript:trimFunction(this)" autocomplete="off"  maxlength ="30" value="" /></td>    	
			
			<td class="label">${uiLabelMap.lastName}&nbsp;<font color="red" >*</font></td>
			 <td><input type="text" style="width:140px"  name="lastName"  onchange="javascript:trimFunction(this)" autocomplete="off"  maxlength ="30" value="" /></td>    	
			
        </tr>
        
        <tr>
         <td class="label" >${uiLabelMap.dob}&nbsp;<font color="red" >*</font></td>
		         <td>
		          <@htmlTemplate.renderDateTimeField name="dateOfBirth" event="" action="" className="" alert="" title="Format: MM-DD-YYYY" 
		          value="" size="12" maxlength="30" id="dateOfBirth" dateType="date" shortDateInput=true timeDropdownParamName="" defaultDateTimeString=""
		           localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" 
		           amSelected="" pmSelected="" compositeType="" formName=""/>
				</td>
               

			<td class="label">${uiLabelMap.gender}&nbsp;<font color="red" >*</font></font></td>
			 <td><select name="gender" style="width:80px;">
					<option value="">${uiLabelMap.CommonSelect}</option>
					<option value="M">Male</option>
					<option value="F">Female</option>
					 <#--<#if genderMasterList?exists>
	    	      <#if genderMasterList?has_content>
	    	       <#list genderMasterList as genderMasterList>
 	    	         <option value="${genderMasterList.genderId?if_exists}">${genderMasterList.genderName?if_exists}</option>
 	    	       </#list>
	    	     </#if>
	    	   </#if>-->
				</select>
			</td>    	
			
             <td class="label">${uiLabelMap.meritalStatus}</font> </td>
			  <td> 
				<select name="meritalStatus" style="width:150px;">
					<option value="">${uiLabelMap.CommonSelect}</option>
					 <#if maritalStatusList?exists>
	    	      <#if maritalStatusList?has_content>
	    	       <#list maritalStatusList as maritalStatusList>
 	    	         <option value="${maritalStatusList.maritalStatusId?if_exists}">${maritalStatusList.maritalStatus?if_exists}</option>
 	    	       </#list>
	    	     </#if>
	    	   </#if>
				 
				</select>
			</td> 
			
		</tr>
		
		<tr>
			 <td class="label">${uiLabelMap.fatherName}&nbsp;<font color="red" >*</font></font></td>
			 <td><input type="text" style="width:140px"  name="fatherName"  onchange="javascript:trimFunction(this)" autocomplete="off" id="fatherName" maxlength ="30" value="" /></td>    	
			 
             <td class="label">${uiLabelMap.motherName}</font></td>
			 <td><input type="text" style="width:140px"  name="motherName"  onchange="javascript:trimFunction(this)" autocomplete="off" id="motherName" maxlength ="30" value="" /></td>    	
			
			<td class="label">${uiLabelMap.adharCardNo}</font></td>
			 <td><input type="text" style="width:140px"  name="aadharCardNumber"  onchange="javascript:trimFunction(this)" autocomplete="off" id="aadharCardNumber" maxlength ="30" value="" /></td>    	
			
        </tr>	 

        <tr>
			 <td class="label">${uiLabelMap.community}</font></td>
			 <td>
			 <select name="community" style="width:150px;">
					<option value="">${uiLabelMap.CommonSelect}</option>
					 <#if communityList?exists>
	    	      <#if communityList?has_content>
	    	       <#list communityList as communityList>
 	    	         <option value="${communityList.communityId?if_exists}">${communityList.communityname?if_exists}</option>
 	    	       </#list>
	    	     </#if>
	    	   </#if>
				 
				</select></td>    	
			 
			<td class="label">${uiLabelMap.village}</font></td>
			 <td><input type="text" style="width:140px"  name="village"  onchange="javascript:trimFunction(this)" autocomplete="off" id="village" maxlength ="30" value="" /></td>
			
			<td class="label">${uiLabelMap.nationality}</font></td>
			 <td><input type="text" style="width:140px"  name="nationality"  onchange="javascript:trimFunction(this)" autocomplete="off" id="nationality" maxlength ="30" value="" /></td>    	
			
        </tr>
          <tr>
			 <td class="label">${uiLabelMap.state}</font></td>
			 <td><input type="text" style="width:140px"  name="state"  onchange="javascript:trimFunction(this)" autocomplete="off" id="state" maxlength ="30" value="" /></td>    	
			 
             	
			<td class="label">${uiLabelMap.city}</font></td>
			 <td><input type="text" style="width:140px"  name="city"  onchange="javascript:trimFunction(this)" autocomplete="off" id="remark" maxlength ="30" value="" /></td>    	
			
			<td class="label">${uiLabelMap.pin}</font></td>
			 <td><input type="text" style="width:140px"  name="pincode"  onchange="javascript:trimFunction(this)" autocomplete="off" id="remark" maxlength ="30" value="" /></td>    	
			
        </tr>   
        	  


       <tr>
			 <td class="label">${uiLabelMap.mobileNo}</font></td>
			 <td><input type="text" style="width:140px"  name="mobileNo"  onchange="javascript:trimFunction(this)" autocomplete="off" id="mobileNo" maxlength ="10" value="" /></td>    	
			 
             <td class="label">${uiLabelMap.resContactNo}</font></td>
			 <td><input type="text" style="width:140px"  name="contactNumber"  onchange="javascript:trimFunction(this)" autocomplete="off" id="contactNumber" maxlength ="15" value="" /></td>    	
			
			<td class="label">${uiLabelMap.emailAddress}</font></td>
			 <td><input type="text" style="width:140px"  name="emailAddress"  onchange="javascript:trimFunction(this)" autocomplete="off" id="emailAddress" maxlength ="30" value="" /></td>    	
			
        </tr>
	 
        
         <tr>
			 <td class="label">${uiLabelMap.permanentAddress}&nbsp;<font color="red" >*</font></font></td>
			 <td><textarea style="width:240px" name="permanentAddress"  onchange="javascript:trimFunction(this)" autocomplete="off" id="permanentAddress" maxlength ="310"></textarea>
			</td>    	
			 
			 <td class="label">${uiLabelMap.currentAddress}</font></td>
			 <td><textarea style="width:240px" name="currentAddress"  onchange="javascript:trimFunction(this)" autocomplete="off" id="currentAddress" maxlength ="310"></textarea>
			 </td>    	
            		
        </tr>
        
   
        	<tr><td colspan="6"><h4 align="left"><i><b><font color="Blue">Employment Details</font></b></i></a></td></tr>
			<tr>
			</tr>
        <tr><td class="label">Present Office &nbsp;<font color="red" >*</font></td>
        <td><select name="officeId" style="width:160px">
		        		<option value="">${uiLabelMap.CommonSelect}</option>
		        		<#if officeList?exists>
	    	      <#if officeList?has_content>
	    	       <#list officeList as officeList>
 	    	         <option value="${officeList.partyId?if_exists}">${officeList.officeSiteName?if_exists}</option>
 	    	       </#list>
	    	     </#if>
	    	   </#if></select>
		        		</td>
		        		
		        		<td class="label">Designation &nbsp;<font color="red" >*</font></td>
        <td><select name="designation" style="width:160px">
		        <option value="">${uiLabelMap.CommonSelect}</option>		        		   
		        		<#if designationMasterList?exists>
	    	      <#if designationMasterList?has_content>
	    	       <#list designationMasterList as designationMasterList>
 	    	         <option value="${designationMasterList.designationId?if_exists}">${designationMasterList.designationName?if_exists}</option>
 	    	       </#list>
	    	     </#if>
	    	   </#if></select></td>
		  	
		        		<td class="label">${uiLabelMap.joiningDate}&nbsp;<font color="red" >*</font></td>
         <td> <@htmlTemplate.renderDateTimeField name="dateOfJoining" event="" action="" className="" alert="" title="Format: MM-DD-YYYY" 
         value="" size="11" maxlength="30" id="dateOfJoining" dateType="date" shortDateInput=true timeDropdownParamName="" defaultDateTimeString="" 
         localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" 
         amSelected="" pmSelected="" compositeType="" formName=""/>
		        				         </td>
      	
        </tr>
         <tr>
       <td class="label" >Type of Appointment <font color="red" >*</font></td>
		         <td><select name="appointmentType" style="width:160px">
		        		<option value="">${uiLabelMap.CommonSelect}</option>
		        		<option value="REGULAR">Regular</option>
		        		</select></td></td>
         	<td class="label" style="width:225px;">Payscale</td>
			   				<td><input type="text" name="payScaleId" style="width:160px;"/></td>
			   				<td class="label" style="width:225px;">Basic Pay</td>
			   				<td><input type="text" name="basicPay" style="width:160px;"/></td>
			
        </tr>
        
        <#--<tr><td class="label">${uiLabelMap.essentialDocument}</font></td>
			 <td><input type="text" style="width:140px"  name="essentialDocument"  onchange="javascript:trimFunction(this)" autocomplete="off" id="remark" maxlength ="30" value="" /></td>    	
			<td class="label" style="width:225px;">${uiLabelMap.Remark}</td>
			   				<td><textarea style="width:240px" name="remarks"  onchange="javascript:trimFunction(this)" autocomplete="off" id="remarks" maxlength ="210"></textarea>
			   				</td>-->
        </tr>
        	<tr>
				<td colspan="6">
					<center><div id="submit" align="center">
						<input type="button" submit="" value="Save" onclick="javascript:validateParameters('createEmployee');"/>
					    <input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/>
					</div>
					</center>
				</td>
			</tr>
        
        </table>
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
 		var permanentAddress = form.permanentAddress.value;
 		var officeId = form.officeId.value;
 		var appointmentType = form.appointmentType.value;
 		var designation = form.designation.value;
 		var dateOfJoining = form.dateOfJoining.value; 		
 		var emailAddress = form.emailAddress.value; 	
 		var basicPay = form.basicPay.value;
 		
 		if(notEmptyField(employeeCode,"Employee Code should not be empty.")){
 		if(notEmptyField(title,"Title should not be empty.")){
 		if(notEmptyField(firstName,"First name should not be empty.")){
 		if(notEmptyField(lastName,"Last name should not be empty.")){
 		if(notEmptyField(dateOfBirth,"Date of Birth should not be empty.")){
 		if(notEmptyField(gender,"Gender should not be empty.")){
 		if(notEmptyField(fatherName,"Father name should not be empty.")){
 		if(notEmptyField(permanentAddress,"Permanent Address should not be empty.")){
 		if(notEmptyField(officeId,"Present Office should not be empty.")){
 		if(notEmptyField(designation,"Designation should not be empty.")){
 		if(notEmptyField(dateOfJoining,"Date of Joining should not be empty.")){
 		if(notEmptyField(appointmentType,"Appointment Type should not be empty.")){
 		if(ValidateEmail(emailAddress)){
 		if(numericfloat(basicPay, "Basic Pay should be numeric value only.")){
 		
 				  form.action = "<@ofbizUrl>createEmployee</@ofbizUrl>";
			      form.submit();
			      disSubmit('saveBtn');
		}}}}}}}}}}}}}}	      
		         
        }
		
		function numericfloat(value,field)
	   {
	        var alphaExp = /^[0-9\.]+$/;
	        if(value == "") {
	            return true;
	        } else {
	        var input = alphaExp.test(value);
	        if(input == true) {
	            return true;
	        } else {
	            alert(field);
	            return false;
	        }
	     }
	   }
		
		function ValidateEmail(uemail) {
            var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
           
            if(uemail == "") {
                return true;
            }
            else if(uemail.match(mailformat)) {
                return true;
            }
            else
            {
                alert("Enter Email Address in abcd@mail.com format.");
                uemail.focus();
                return false;
            }
        }
</script>





