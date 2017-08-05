<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: OfficeCreate.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     -->
<#--- PRABHU         	31 July 2017    -->

<#-- #####################################################################################################-->



<form method="post" name="createOffice" action="" class="basic-form">
<div class="row">
<div class="alert alert-info">
<ul>


<li class = "h3"> Create Office</li>
</ul>
</div>


<div class="screenlet-body">


		
		<table class="basic-table"><tr>
			<td class="label" width="25%">${uiLabelMap.HrmsOfficeName} &nbsp;*</td> 
			<td  width="25%"><input type="text" name="officeName" value="" maxlength="140" style="width:302px;"/></td>
			<td class="label">${uiLabelMap.HrmsOfficeType}&nbsp;&nbsp;*</td> 
			<td width="25%"><select name="officeType" style="width:132px;margin:5px 0 5px 0;" onchange="javascript:getParentOffice(this);">
             <option value=''>${uiLabelMap.CommonSelect}</option>
              	    	       	    	        <option value='KUWSDB'>Karnataka urban Water Supply and Drinage Board</option>

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
		<td class="label">${uiLabelMap.HrmsParentOfficeName}&nbsp;&nbsp;*</td> 
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
                    </td>		<td class="label" width="25%">Office Code &nbsp;*</td>  
		<td  width="25%"><input type="text" name="officeCode" value="" maxlength="40" style="width:302px;"/></td>
		</tr>
		
		<tr>
		<td class="label">${uiLabelMap.Address}&nbsp;&nbsp;*</td>
		<td> <textarea name= "address" class="form-control"style="width:302px;margin:5px 0 5px 0;" id="address"></textarea></td>
		<td class="label">${uiLabelMap.HrmsPinCode}&nbsp;&nbsp;*</td> 
		<td  width="25%"><input type="text" name="pinCode" value="" maxlength="15" style="width:302px;"></td>
		</tr>
		
		
		<tr>
		<td class="label">${uiLabelMap.City}&nbsp;&nbsp;*</td>
		<td  width="25%"><input type="text" name="city" value="" maxlength="100" style="width:302px;"/></td>
		<td class="label">${uiLabelMap.District}&nbsp;&nbsp;*</td> 
		<td width="25%"><select name="district">
						<option value="">Select District</option>                            

                            <option value="MYSORE">Mysore</option>                            
                        </select>
                    </td>	
		</tr>
		
		<tr>
		<td class="label">${uiLabelMap.Fax}&nbsp;&nbsp;</td>
		<td  width="25%"><input type="text" name="faxNo" value="" maxlength="40" style="width:302px;"/></td>
		<td class="label">${uiLabelMap.contactNumber}&nbsp;&nbsp;</td> 
		<td  width="25%"><input type="text" name="contactNumber" value="" maxlength="15" style="width:302px;"/></td>
		</tr>
		
		<tr>
		<td class="label">Longitude&nbsp<b>(in Deg : Min : Sec)&nbsp;</td>  
            <td ><input type="text" name="longitude" autocomplete="off" value="" maxlength="12" style="width:302px;"> 
            </td>
            <td class="label">Latitude&nbsp<b>(in Deg : Min : Sec)&nbsp;</td>  
            <td><input type="text" name="latitude" autocomplete="off" value="" maxlength="12" style="width:302px;">
            </td>
		</tr>
		</table></div>
		
		<div class="button-bar" align="center">
                  <td align="right"><input type="submit" value="${uiLabelMap.CommonSave}" onclick="return validateFields1('createOffice');"/>
                  <td align="right"><input type="submit" name="cancel" value="${uiLabelMap.CommonCancel}"/>
        </div>

                


</div>

</from>

<Script>
 function validateFields1(formname)
 {
 var form=document[formname];
form.action = "<@ofbizUrl>saveoffice</@ofbizUrl>";
                   form.submit();
}

</Script>