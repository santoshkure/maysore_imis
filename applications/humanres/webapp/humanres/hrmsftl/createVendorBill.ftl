<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: createWardMaster.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     -->
<#--- Anubha Saini    	31 July 2017    -->

<#-- #####################################################################################################-->

<script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>

 <form method="post" name="createVendorBill" class="basic-form">

	<div class="row">
  <div class="alert alert-info">
    
    <ul>
    <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
      <li class="h3">${uiLabelMap.createVendorBill}</li>
      
    </ul>
    
  </div>
	<br/>
	<div class="screenlet-body">
	
		<table class="basic-table" cellspacing="0">
		<td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td>
			
			
			<tr>
			  <td class="label">${uiLabelMap.RegistrationType} <font color="red" >*</font></td>
			  <td> 
				<select name="registrationType" style="width:150px;" >
					    <option value=''>Select</option>
				 	 <option value="VENDOR">Vendor</option>
				 	<option value="BILLREADER">Bill Reader</option>
				 	<option value="PLUMBER">Plumber</option>
				</select>
			</td>   
			<td class="label">${uiLabelMap.RegistarionId} <font color="red" >*</font></td>
			<td><input type="text" style="width:140px"  onchange="javascript:trimFunction(this)" name="registarionId" placeholder="${uiLabelMap.EnterRegistarionId}" autocomplete="off" id="registarionId" maxlength ="30" value="" /></td> 
         	</tr>
         	
         	
         	<tr>
         	 <td class="label">${uiLabelMap.RegistrationName} <font color="red" >*</font></td>
			 <td><input type="text" style="width:140px"  onchange="javascript:trimFunction(this)" name="tenderName" placeholder="${uiLabelMap.EnterRegistrationName}" autocomplete="off" id="tenderName" maxlength ="30" value="" /></td> 
           	 <td class="label">${uiLabelMap.DateofRegister}<font color="red" ></font></td>
			 <td> <@htmlTemplate.renderDateTimeField name="dateRegistration" event="" action="" className="" alert="" title="Format: MM-DD-YYYY" 
		          value="" size="12" maxlength="30" id="dateRegistration" dateType="date" shortDateInput=true timeDropdownParamName="" defaultDateTimeString=""
		           localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" 
		           amSelected="" pmSelected="" compositeType="" formName=""/>
			</td> 
         	</tr>
         	
         	 <tr>
         	 <td class="label">${uiLabelMap.ProjectName}<font color="red" ></font></td>
			 <td><input type="text" style="width:140px"  onchange="javascript:trimFunction(this)" name="name" placeholder="${uiLabelMap.EnterProjectName}" autocomplete="off" id="name" maxlength ="30" value="" /></td> 
           	 <td class="label">${uiLabelMap.officeName}<font color="red" ></font></td>
			 <td width="25%"><select name="officeName" style="width:132px;margin:5px 0 5px 0;" >
             <option value=''>${uiLabelMap.CommonSelect}</option>
	    	     <#if officeList?exists>
	    	      <#if officeList?has_content>
	    	       <#list officeList as officeList>
 	    	         <option value="${officeList.partyId?if_exists}">${officeList.officeSiteName?if_exists}</option>
 	    	       </#list>
	    	     </#if>
	    	   </#if>
	    	   </select></td>     
         	 </tr>
         	
         	  <tr>
         	  <td class="label">${uiLabelMap.DateofProject}<font color="red" ></font></td>
              <td> <@htmlTemplate.renderDateTimeField name="dateofTender" event="" action="" className="" alert="" title="Format: MM-DD-YYYY" 
		          value="" size="12" maxlength="30" id="dateofTender" dateType="date" shortDateInput=true timeDropdownParamName="" defaultDateTimeString=""
		           localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" 
		           amSelected="" pmSelected="" compositeType="" formName=""/>
			  </td>         	 
         	  <td class="label">${uiLabelMap.Address}<font color="red" ></font></td>
			   <td><textarea style="width:240px" name="presentAddress"  onchange="javascript:trimFunction(this)" placeholder="${uiLabelMap.EnterAddress}" autocomplete="off"  maxlength ="210"></textarea></td> 
			 </tr>
			  
           	
			<tr>
         	 <td class="label">${uiLabelMap.Email} <font color="red" >*</font></td>
			 <td><input type="text" style="width:140px"  onchange="javascript:trimFunction(this)" name="email" placeholder="${uiLabelMap.EnterEmail}" autocomplete="off" id="email" maxlength ="30" value="" /></td> 
           	 <td class="label">${uiLabelMap.State}<font color="red" ></font></td>
			 <td><input type="text" style="width:140px"  onchange="javascript:trimFunction(this)" name="state" placeholder="${uiLabelMap.EnterState}"  autocomplete="off" id="state" maxlength ="30" value="" /></td> 
         	</tr>
         	
			<tr>
         	 <td class="label">${uiLabelMap.Pincode}<font color="red" ></font></td>
			 <td><input type="text" style="width:140px"  onchange="javascript:trimFunction(this)" name="pinCode" placeholder="${uiLabelMap.EnterPincode}" autocomplete="off" id="pinCode" maxlength ="6" value="" /></td> 
           	 <td class="label">${uiLabelMap.PhoneNumber} <font color="red" >*</font></td>
			 <td><input type="text" style="width:140px"  onchange="javascript:trimFunction(this)" name="phoneNumber" placeholder="${uiLabelMap.EnterPhoneNumber}" autocomplete="off" id="phoneNumber" maxlength ="10" value="" /></td>
           	</tr>
           	
        
        	 <tr>
				<td colspan="4">
					<center><div id="submit" align="center">
						<input type="button" submit="" value="Submit" onclick="javascript:validateParameters('createVendorBill');"/>
 					    <input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:ConfirmBack();"/>
					</div>
					</center>
				</td>
			</tr>
		</table>
		</div>
	</div>
</form>

 <#-----------------------Java Script for Vendor Tab------------->	
 
 

<script type="text/javascript" language="javascript">
function ConfirmBack() {
    var sure = confirm("Are you sure you want to Cancel?, data will be lost!");
       if( sure == true )  {
      
             document.createWardMaster.action="<@ofbizUrl>Wardmaster</@ofbizUrl>";
             document.createWardMaster.submit();
       }
      }
	  function validateParameters(formName)
      {
		   var form=document[formName];
		   var registrationType = form.registrationType.value;
   		   var registarionId = form.registarionId.value;
   		   var tenderName = form.tenderName.value;
   		   var email = form.email.value;
   		   var phoneNumber = form.phoneNumber.value;
   		   var pinCode = form.pinCode.value;
   		   
   		   
   		if(notEmptyField(registrationType,"Registration Type should not be empty")) 
	         {
	         if(notEmptyField(registarionId,"Registarion Id should not be empty.")) 
		        {
	          if(notEmptyField(tenderName,"Registarion Name should not be empty"))
                  {
                if(notEmptyField(email,"Email Id should not be empty")){
                    if(ValidateEmail(email)){
                   
                       if(notEmptyField(phoneNumber,"Phone Number should not be empty"))
                         {
                        if(enterNumeric(phoneNumber,"Phone Number should be Numeric .")){ 
                         if(enterNumeric(pinCode,"Pincode should be Numeric .")){
               
 	             
		            var r=confirm("Are you sure, you want to Save the Form ?")
                    if (r==true)
                       {
 				  form.action = "<@ofbizUrl>saveVendor</@ofbizUrl>";
			      form.submit();
			      disSubmit('saveBtn');
		         }
		         }
		     }}}}}}}}
 </script>
