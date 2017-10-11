<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->

<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     -->
<#--- Ganesh  	          30 Aug 2017    -->

<#-- #####################################################################################################-->
<script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>
<form method="post" name="editVendor" class="basic-form">

	<div class="row">
  <div class="alert alert-info">
    	<ul>
    	<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    		<li class="h3">${uiLabelMap.editVendorDetails}</li>
 		</ul>
    	
  </div>
  
	
	<div class="screenlet-body">
	<table class="basic-table" cellspacing="0">
	 <#if vendorList?has_content>
 	 <#list vendorList as vendorList>
		
			 <td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td>
		
	         <tr>
		         <td class="label">${uiLabelMap.RegistrationType} <font color="red">*</td>
                 <td>
                    	    <select name="registrationType" style="width:90px;">
                   			<option value="">Select</option>
                   			<#if "${vendorList.registrationType?if_exists}" == "VENDOR">
                   			<option value="VENDOR" selected>Vendor</option>
                   			<option value="BILLREADER">Bill Reader</option>
                   			<option value="PLUMBER">Plumber</option>
                   			
                   			<#elseif "${vendorList.registrationType?if_exists}" == "BILLREADER">
                   			<option value="VENDOR">Vendor</option>
                   			<option value="BILLREADER" selected>Bill Reader</option>
                   			<option value="PLUMBER">Plumber</option>
                   			<#elseif "${vendorList.registrationType?if_exists}" == "PLUMBER">
                   			<option value="VENDOR">Vendor</option>
                   			<option value="BILLREADER">Bill Reader</option>
                   			<option value="PLUMBER" selected>Plumber</option>
                   			</#if>
                   	    </select>
             	 </td>
    
             <td class="label">${uiLabelMap.RegistarionId}<font color="red" >*</font></td>
			 <td><input type="text" value="${vendorList.registarionId?if_exists}" style="width:140px"  onchange="javascript:trimFunction(this)" name="registarionId" autocomplete="off"  maxlength ="30" /></td> 
         	</tr>
         	
         	
         	<tr>
         	 <td class="label">${uiLabelMap.RegistrationName}<font color="red" >*</font></td>
			 <td><input type="text" style="width:140px"  onchange="javascript:trimFunction(this)" name="tenderName" value="${vendorList.tenderName?if_exists}" autocomplete="off"  maxlength ="30" value="" /></td> 
           	 <td class="label">${uiLabelMap.DateofRegister}<font color="red" ></font></td>
			 <td>
			 <#if vendorList.dateRegistration?has_content>
			 <#assign date = "${vendorList.dateRegistration?if_exists?string('yyyy-MM-dd')}">
		          <@htmlTemplate.renderDateTimeField name="dateRegistration" event="" action="" className="" alert="" title="Format: MM-DD-YYYY" value="${date}" size="11" maxlength="30" id="dateRegistration" dateType="date" 
		          shortDateInput=true timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" 
		          hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName="editVendor"/>
         	<#else>
         	<@htmlTemplate.renderDateTimeField name="dateRegistration" event="" action="" className="" alert="" title="Format: MM-DD-YYYY" value="" size="11" maxlength="30" id="dateRegistration" dateType="date" 
		          shortDateInput=true timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" 
		          hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
         	</#if>
         	</td> 
         	</tr>
         	<tr>
         	 <td class="label">${uiLabelMap.ProjectName}<font color="red" ></font></td>
			 <td><input type="text" style="width:140px"  onchange="javascript:trimFunction(this)" name="name" value="${vendorList.name?if_exists}" autocomplete="off"  maxlength ="30" value="" /></td> 
           	 <td class="label">${uiLabelMap.OfficeName }<font color="red" ></font></td>
			 <td><select name="officeName" style="width:132px;margin:5px 0 5px 0;" >
             <option value=''>${uiLabelMap.CommonSelect}</option>
	    	   <option value=''>${uiLabelMap.CommonSelect}</option>
                     <#assign officeId = '${vendorList.officeName?if_exists}'>
	                	<#if officeList?exists>
			    	      <#if officeList?has_content>
			    	       <#list officeList as officeList>			    	       	 
				    	       	 <#if officeId == officeList.partyId?if_exists>
				    	         	<option value="${officeList.partyId?if_exists}" selected="true">${officeList.officeSiteName?if_exists}</option>
				    	         <#else>
				    	         	<option value="${officeList.partyId?if_exists}">${officeList.officeSiteName?if_exists}</option>
				    	         </#if>			    	        
			    	       </#list>
			    	     </#if>
			    	   </#if>
	    	    </select> 
	    	   </td> 
         	 </tr>
         	 
         	 
         	
         	 <tr>
         	 <td class="label">${uiLabelMap.DateofProject}<font color="red" ></font></td>
		     <td><#if vendorList.dateofTender?has_content>
		     <#assign date1 = "${vendorList.dateofTender?if_exists?string('yyyy-MM-dd')}">
		          <@htmlTemplate.renderDateTimeField name="dateofTender" event="" action="" className="" alert="" title="Format: MM-DD-YYYY" value="${date1}" size="11" maxlength="30" id="dateofTender" dateType="date" 
		          shortDateInput=true timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" 
		          hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName="editVendor"/>
		          
		        <#else>
         	<@htmlTemplate.renderDateTimeField name="dateofTender" event="" action="" className="" alert="" title="Format: MM-DD-YYYY" value="" size="11" maxlength="30" id="dateofTender" dateType="date" 
		          shortDateInput=true timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" 
		          hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
         	</#if>  
		          </td> 
           	
         	 <td class="label">${uiLabelMap.Address}<font color="red" ></font></td>
         	 <td><textarea style="width:240px" name="presentAddress"  onchange="javascript:trimFunction(this)" autocomplete="off" value="${vendorList.presentAddress?if_exists}"  maxlength ="210"></textarea></td> 
         	 </tr>
         	
           	
			<tr>
         	 <td class="label">${uiLabelMap.Email}<font color="red" >*</font></td>
			 <td><input type="text" style="width:140px"  onchange="javascript:trimFunction(this)" name="email" value="${vendorList.email?if_exists}"  autocomplete="off"  maxlength ="30" value="" /></td> 
           	 <td class="label">${uiLabelMap.State}<font color="red" ></font></td>
			 <td><input type="text" style="width:140px"  onchange="javascript:trimFunction(this)" name="state" value="${vendorList.state?if_exists}" autocomplete="off"  maxlength ="30" value="" /></td> 
         	</tr>
           	
			 <tr>
         	 <td class="label">${uiLabelMap.Pincode}<font color="red" ></font></td>
			 <td><input type="text" style="width:140px"  onchange="javascript:trimFunction(this)" name="pinCode" value="${vendorList.pinCode?if_exists}" autocomplete="off"  maxlength ="6" value="" /></td> 
           	 <td class="label">${uiLabelMap.PhoneNumber}<font color="red" >*</font></td>
			 <td><input type="text" style="width:140px"  onchange="javascript:trimFunction(this)" name="phoneNumber" value="${vendorList.phoneNumber?if_exists}" autocomplete="off"  maxlength ="10" value="" /></td>
             </tr>
           	  
           
        	<tr>
				<td colspan="4">
					<center><div id="submit" align="center">
						<input type="button" name="update" value="${uiLabelMap.update}" onclick="editofVendor('editVendor','edit')"/>
					   <input type="button" name="Cancel" value="Cancel" onclick="javascript:validateConfirmBack();" >
					</div>
					</center>
				</td>
			</tr>
			
			 <input type="hidden" name="activestatus" value="${vendorList.status?if_exists}" style="width:140px"  />
						 <input type="hidden" name="regId" value="${vendorList.regId?if_exists}" style="width:140px"  />
			
			</#list>
		    </#if>
		       <input type="hidden" name="status" value="" style="width:140px"/>				
		</table>
		</div>
	</div>
	
	</form>
	
	   <#-----------------------Java Script for Vendor Tab------------->
	
	<script language="JavaScript" type="text/javascript" />


    
    function editofVendor(formname,stat)
	{
	var form =document[formname];
	var registrationType = form.registrationType.value;
    var registarionId = form.registarionId.value;
    var tenderName = form.tenderName.value;
    var email = form.email.value;
    var phoneNumber = form.phoneNumber.value;
    
    
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
                        if(enterNumeric(phoneNumber,"Mobile Number should be Numeric ."))
                            { 
	     var r=confirm("Are you sure, you want to Update the Form ?")
        if (r==true)
        { 	
	     //alert(""+stat);
	     form.status.value = stat;
        form.action="<@ofbizUrl>editVendors</@ofbizUrl>";
	    form.submit();
	    }
	
	}}}}}}}}
	
 </script>
