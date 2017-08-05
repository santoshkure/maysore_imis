<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: OfficeEdit.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     -->
<#--- PRABHU         	31 July 2017    -->

<#-- #####################################################################################################-->



<form method="post" name="editOffice" action="" class="basic-form">
<div class="row">
<div class="alert alert-info">
<ul>
<li class = "h3">Edit Office</li>
</ul>
</div>

<div class="screenlet-body">


		<table class="basic-table">
		<#list officeList as officeList>
		    <tr>		
			<td class="label" width="25%">${uiLabelMap.HrmsOfficeName} &nbsp;*</td> 
			<td  width="25%"><input type="text" name="officeName" value="<#if officeList.officeSiteName?has_content>${officeList.officeSiteName}<#else> </#if>" maxlength="140" style="width:302px;"/></td>
			<td class="label">${uiLabelMap.HrmsOfficeType}&nbsp;&nbsp;*</td> 
			<td width="25%">
			<select name="officeType" onchange="javascript:getParentOffice(this);">
            		<option value=''>${uiLabelMap.CommonSelect}</option>
            		 	<#if officeList?has_content>
            		 		<#assign officeType = '${officeList.groupName?if_exists}'>
	                	</#if> 
			    	   <#if officeTypeList?exists>
			    	      <#if officeTypeList?has_content>
			    	       <#list officeTypeList as officeTypeList>
			    	       	 
				    	       	 <#if officeType == officeTypeList.ofcTypeId?if_exists>
				    	         	<option value="${officeTypeList.ofcTypeId?if_exists}" selected="true">${officeTypeList.ofcTypeName?if_exists}</option>
				    	         <#else>
				    	         	<option value="${officeTypeList.ofcTypeId?if_exists}">${officeTypeList.ofcTypeName?if_exists}</option>
				    	         </#if>
			    	        
			    	       </#list>
			    	     </#if>
			    	   </#if>
	                </select>			
            </td>
			</tr>
		
		<tr>
		<td class="label">${uiLabelMap.HrmsParentOfficeName}&nbsp;&nbsp;*</td> 
		<td width="25%"><select name="parentOffice" style="width:302px;margin:5px 0 5px 0;" > 
	    	   <option value="${officeList.parentOfficeId?if_exists}" selected="true">${officeList.parentOfficeName?if_exists}</option>
	    	</select>
       </td>
       <td class="label" width="25%">Office Code &nbsp;*</td>  
		<td  width="25%"><input type="text" name="officeCode" value="<#if officeList.partyCode?has_content>${officeList.partyCode}<#else> </#if>" maxlength="40" style="width:302px;"/></td>
		</tr>
		
		<tr>
		<td class="label">${uiLabelMap.Address}&nbsp;&nbsp;*</td>
		<td> <textarea name= "address" class="form-control"style="width:302px;margin:5px 0 5px 0;"  id="address">${officeList.address1?if_exists}</textarea></td>
		<td class="label">${uiLabelMap.HrmsPinCode}&nbsp;&nbsp;*</td> 
		<td  width="25%"><input type="text" name="pinCode" value="${officeList.postalCode?if_exists}" maxlength="15" style="width:302px;"></td>
		</tr>
		
		
		<tr>
		<td class="label">${uiLabelMap.City}&nbsp;&nbsp;*</td>
		<td  width="25%"><input type="text" name="city" value="${officeList.city?if_exists}" maxlength="100" style="width:302px;"/></td>
		<td class="label">${uiLabelMap.District}&nbsp;&nbsp;*</td> 
		<td width="25%"><select name="district">
						<option value="">Select District</option>                            

	    	         		<option value="${officeList.district?if_exists}" selected="true">${officeList.district?if_exists}</option>
                        </select>
                    </td>	
		</tr>
		
		<tr>
		<td class="label">${uiLabelMap.Fax}&nbsp;&nbsp;</td>
		<td  width="25%"><input type="text" name="faxNo" value="${officeList.faxNo?if_exists}" maxlength="40" style="width:302px;"/></td>
		<td class="label">${uiLabelMap.contactNumber}&nbsp;&nbsp;</td> 
		<td  width="25%"><input type="text" name="contactNumber" value="${officeList.contactNumber?if_exists}" maxlength="15" style="width:302px;"/></td>
		</tr>
		
		<tr>
		 	<#if officeList?has_content>
            		 		<#assign geoId = '${officeList.geoPointId?if_exists}'>
	                	</#if> 
			    	   <#if geoList?exists>
			    	      <#if geoList?has_content>
			    	       <#list geoList as geoList>
			    	       	 
				    	       	 <#if geoId == geoList.geoPointId?if_exists>
		<td class="label">Longitude&nbsp<b>(in Deg : Min : Sec)&nbsp;</td>  
            <td ><input type="text" name="longitude" autocomplete="off" value="${geoList.longitude?if_exists}" maxlength="12" style="width:160px;"> 
            </td>
            <td class="label">Latitude&nbsp<b>(in Deg : Min : Sec)&nbsp;</td>  
            <td><input type="text" name="latitude" autocomplete="off" value="${geoList.latitude?if_exists}" maxlength="12" style="width:160px;">
            </td>
            					</#if>
            				</#list>
            			   </#if>            
                       </#if>
		</tr>
	  
	  <input type="hidden" name="geoPointId" value="${officeList.geoPointId?if_exists}"/>
      <input type="hidden" name="contactMechId" value="${officeList.contactMechId?if_exists}"/>
      <input type="hidden" name="officeId" value="${officeList.partyId?if_exists}"/>

		</#list>
		
		</table></div>
		
		<div class="button-bar" align="center">
                  <td align="right"><input type="submit" value="${uiLabelMap.CommonEdit}" onclick="return validateFields1('editOffice');"/>
                  <td align="right"><input type="submit" name="cancel" value="${uiLabelMap.CommonCancel}"/>
        </div>
<tr><td colspan="3"><hr /></td></tr>
                
</div>

</div>

</from>

<Script>
 function validateFields1(formname)
 {
 var form=document[formname];
form.action = "<@ofbizUrl>updateoffice</@ofbizUrl>";
form.submit();
}

</Script>