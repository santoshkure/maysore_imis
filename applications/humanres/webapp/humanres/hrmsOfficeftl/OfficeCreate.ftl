<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: OfficeCreate.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     -->
<#--- PRABHU         	31 July 2017    -->

<#-- #####################################################################################################-->


<script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>

<form method="post" name="createOffice" action="" class="basic-form">
<div class="row">
<div class="alert alert-info">
<ul>


<li class = "h3"> Create Office</li>
</ul>
</div>


<div class="screenlet-body">


		
		<table class="basic-table">
		<tr><td colspan="6"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td></tr>
		<tr>
			<td class="label" width="25%">${uiLabelMap.HrmsOfficeName} &nbsp;<font color="red" >*</font> </td> 
			<td  width="25%"><input type="text" name="officeName" value="" maxlength="140" style="width:302px;"/></td>
			<td class="label">${uiLabelMap.HrmsOfficeType}&nbsp;<font color="red" >*</font> </td> 
			<td width="25%"><select name="officeType" style="width:132px;margin:5px 0 5px 0;" >
             <option value=''>${uiLabelMap.CommonSelect}</option>             	    	       	    	        

	    	   <#if officeTypeList?exists>
	    	      <#if officeTypeList?has_content>
	    	       <#list officeTypeList as officeTypeList>
	    	       		
	    	         		<option value="${officeTypeList.ofcTypeId?if_exists}">${officeTypeList.ofcTypeName?if_exists}</option>
	    	         	
	    	       </#list>
	    	      
	    	     </#if>
	    	   </#if>
	    	</select>
                    </td>
			</tr>
		<tr>
		<td class="label">${uiLabelMap.HrmsParentOfficeName}&nbsp;<font color="red" >*</font> </td> 
		<td width="25%"><select name="parentOffice" style="width:302px;margin:5px 0 5px 0;" >
             <option value=''>${uiLabelMap.CommonSelect}</option>
	    	   <#if officeList?exists>
	    	      <#if officeList?has_content>
	    	       <#list officeList as officeList>
	    	       		
	    	         		<option value="${officeList.partyId?if_exists}">${officeList.officeSiteName?if_exists}</option>
	    	         	
	    	       </#list>
	    	       
	    	     </#if>
	    	   </#if>
	    	</select>
                    </td>		<td class="label" width="25%">Office Code &nbsp;<font color="red" >*</font> </td>  
		<td  width="25%"><input type="text" name="officeCode" value="" maxlength="40" style="width:302px;"/></td>
		</tr>
		
		<tr>
		<td class="label">${uiLabelMap.Address}&nbsp;<font color="red" >*</font> </td>
		<td> <textarea name= "address" class="form-control"style="width:302px;margin:5px 0 5px 0;" id="address"></textarea></td>
		<td class="label">${uiLabelMap.HrmsPinCode}&nbsp;<font color="red" >*</font> </td> 
		<td  width="25%"><input type="text" name="pinCode" value="" maxlength="15" style="width:302px;"></td>
		</tr>
		
		
		<tr>
		<td class="label">${uiLabelMap.City}&nbsp;<font color="red" >*</font> </td>
		<td  width="25%"><input type="text" name="city" value="" maxlength="100" style="width:302px;"/></td>
		<td class="label">${uiLabelMap.District}&nbsp;<font color="red" >*</font> </td> 
		<td width="25%"><select name="district">
						<option value="">Select District</option>                            

                            <option value="MYSORE">Mysore</option>                            
                        </select>
                    </td>	
		</tr>
		
		<tr>
		<td class="label">${uiLabelMap.Fax}&nbsp;&nbsp;</td>
		<td  width="25%"><input type="text" name="faxNo" value="" maxlength="15" style="width:302px;"/></td>
		<td class="label">${uiLabelMap.contactNumber}&nbsp;&nbsp;</td> 
		<td  width="25%"><input type="text" name="contactNumber" value="" maxlength="12" style="width:302px;"/></td>
		</tr>
		
		<tr>
		<td class="label">Longitude&nbsp<b>(in Deg : Min : Sec)&nbsp;</td>  
            <td ><input type="text" name="longitude" autocomplete="off" value="" maxlength="12" style="width:302px;"> 
            </td>
            <td class="label">Latitude&nbsp<b>(in Deg : Min : Sec)&nbsp;</td>  
            <td><input type="text" name="latitude" autocomplete="off" value="" maxlength="12" style="width:302px;">
            </td>
		</tr>
		 </tr>
        	<tr>
				<td colspan="6">
					<center><div id="submit" align="center">
						<input type="button" submit="" value="${uiLabelMap.CommonSave}" onclick="javascript:validateParameters('createOffice');"/>
					    <input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/>
					</div>
					</center>
				</td>
			</tr>
		</table></div>
		      <input type="text" name="hoo" value="" id= "hoo"/>
		
		<#----<div id="submit" align="center">
                  <td align="right"><input type="submit" submit="" value="${uiLabelMap.CommonSave}" onclick="javascript:validateParameters('createOffice');"/>
                  <td align="right"><input type="submit" name="cancel" value="${uiLabelMap.CommonCancel}"/>
        </div>--->

                


</div>

</from>

<script>
 function validateParameters(formname)
 {
	
	 var form=document[formname];
	 var officeName = form.officeName.value;
	 var officeType = form.officeType.value;
	 var parentOffice = form.parentOffice.value;
	 var officeCode = form.officeCode.value;
	 var address = form.address.value;
	 var pinCode = form.pinCode.value;
	 var city = form.city.value;
	 var district = form.district.value;
 	 var contactNumber = form.contactNumber.value;	 
 	 var longitude = form.longitude.value;
 	 var latitude = form.latitude.value; 	  	 
	 var IMIS = "IMIS";
	form.hoo.value = parentOffice;
	 if(notEmptyField(officeName,"Office Name should not be empty.")){
	 if(notEmptyField(officeType,"Office Type should not be empty.")){ 		 
 	 if(officeType != IMIS)
 	 {
 	 if(notEmptyField(parentOffice,"Head of Office should not be empty.")){
 	 if(notEmptyField(officeCode,"Office Code should not be empty.")){
	 if(notEmptyField(address,"Address should not be empty.")){
	 if(notEmptyField(pinCode,"Pin Code Name should not be empty.")){
	 if(notEmptyField(city,"City should not be empty.")){
	 if(notEmptyField(district,"District should not be empty.")){
 	 if(enterNumeric(contactNumber,"Contact Number should be Numeric .")){ 			 		
	 if(validateLongitudeforMP1(longitude,"Longitude should be in [ Deg : Min : Sec ] Formate.")){	
	 if(validateLatitudeforMP1(latitude,"Latitude should be in [ Deg : Min : Sec ] Formate.")){
					  form.action = "<@ofbizUrl>saveoffice</@ofbizUrl>";
	                  form.submit();
	                  disSubmit('saveBtn');
 	 }}}}}}}}}
 	 } 
	 else{		
	 if(notEmptyField(officeCode,"Office Code should not be empty.")){
	 if(notEmptyField(address,"Address should not be empty.")){
	 if(notEmptyField(pinCode,"Pin Code Name should not be empty.")){
	 if(notEmptyField(city,"City should not be empty.")){
	 if(notEmptyField(district,"District should not be empty.")){
 	 if(enterNumeric(contactNumber,"Contact Number should be Numeric .")){ 			 		
	 if(validateLongitudeforMP1(longitude,"Longitude should be in [ Deg : Min : Sec ] Formate.")){	
	 if(validateLatitudeforMP1(latitude,"Latitude should be in [ Deg : Min : Sec ] Formate.")){
					  form.action = "<@ofbizUrl>saveoffice</@ofbizUrl>";
	                  form.submit();
	                  disSubmit('saveBtn');
	}}}}}}}}}}}
	
	}

</script>