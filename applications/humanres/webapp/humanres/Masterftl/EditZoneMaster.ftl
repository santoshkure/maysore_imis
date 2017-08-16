<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->

<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     -->
<#--- Siddhi    	    03 Aug 2017    -->

<#-- #####################################################################################################-->
<script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>
<form method="post" name="editZoneMaster" class="basic-form">

	<div class="row">
  <div class="alert alert-info">
    	<ul>
    	<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    		<li class="h3">${uiLabelMap.editZone}</li>
 		</ul>
    	
  </div>
	
	<div class="screenlet-body">
	<table class="basic-table" cellspacing="0">
		<#if ZoneMasterLists?has_content>
 				 <#list ZoneMasterLists as ZoneMasterLists>
			<td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td>
		<input type="hidden" name="zoneId" value="${ZoneMasterLists.zoneId?if_exists}" style="width:140px"  />
		
			<tr>
			
			 <td class="label">${uiLabelMap.zoneName} <font color="red" >*</font></td>
             <td><input type="text" name="zoneName" value="${ZoneMasterLists.zoneName?if_exists}" style="width:140px"  /></td>
			 
			  <td class="label">${uiLabelMap.cityName} <font color="red" >*</font></td>
			  <td> 
				<select name="cityName" style="width:150px;">
				    <option value=''>Select</option>
				 	<option value="Hyderabad" selected="true">Hyderabad</option>
				    <option value="Mysore" selected="true">Mysore</option>
				</select>
			</td>  
			  
        	</tr>
        	
        	<tr>
  			  <td class="label">${uiLabelMap.officeName}&nbsp;*</td>
             <td><select name="officeName" autocomplete="off" style="width:152px;margin:5px 0 5px 0;" onchange="javascript:getParentOffice(this);">
              <option value="">${uiLabelMap.CommonSelect}</option>
                <#assign zoneNamevar  = "${ZoneMasterLists.officeName?if_exists}">
                         <#if officeMasterLists?has_content>
                            <#list officeMasterLists as officeMasterLists>
                             <#if "${officeMasterLists.ofcTypeName?if_exists}" == "${zoneNamevar?if_exists}">
                               <option value="${officeMasterLists.ofcTypeName?if_exists}" selected>${officeMasterLists.ofcTypeName?if_exists}</option>
                            <#else>
                                <option value="${officeMasterLists.ofcTypeName?if_exists}">${officeMasterLists.ofcTypeName?if_exists}</option>
                              </#if>
                            </#list>
                        </#if>   
                 </select></td>   
			
 			  <td class="label">${uiLabelMap.remark}</td>
           <td><input type="text" textarea name="remark" value=${ZoneMasterLists.remark?if_exists} style="width:140px"  /></td>
			 	
         	</tr>
        	<tr>
                    <td width='20%' align='right' class="label">${uiLabelMap.createdate} <font color="red" >*</font></td>
                    <td>
                    <#--  <@htmlTemplate.renderDateTimeField name="eventDate" event="" action="" className="" alert="" title="Format: yyyy-MM-dd HH:mm:ss.SSS" value="${requestParameters.eventDate!nowTimestamp}" size="25" maxlength="30" id="fromDate_2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                    -->
					<input type="date" style="width:140px"  name="description" autocomplete="off" id="remark" maxlength ="10" value="31/07/2017" />
					</td>
                  </tr>
        	<tr>
				<td colspan="4">
					<center><div id="submit" align="center">
                       <input name="update" value="${uiLabelMap.CommonUpdate}" type="button" onClick="updateZoneDetails('editZoneMaster','edit')">
					   <input type="button" name="Cancel" value="Cancel" onclick="javascript:validateConfirmBack();" >
					</div>
					</center>
				</td>  
				<input type="hidden" name="activestatus" value="${ZoneMasterLists.status?if_exists}" style="width:140px"  />
				<input type="hidden" name="status" value="" style="width:140px"  />
			</tr>   
				</#list>
				</#if>
			
		</table>
		</div>
	</div>
	</form>
   <script language="JavaScript" type="text/javascript" />
   
	
	
	 function updateZoneDetails(formName,stat)
      {
		   var form=document[formName];
		   var zoneName = form.zoneName.value;
		   var cityName = form.cityName.value;
   		   var officeName = form.officeName.value;
 		   
		    if(notEmptyField(zoneName,"Zone Name should not be empty.")) 
		     {
		      if(alphabhetValidation1(zoneName,"Zone Name ${uiLabelMap.alphabetical}"))
               {
		       if(notEmptyField(cityName,"Select City Name.")) 
		         {
	             if(notEmptyField(officeName,"Select Office Name")) 
		          {
		           //alert(""+stat);
		            form.status.value = stat;
		              var r=confirm("Are you sure, you want to Update the Form ?")
                    if (r==true)
                       {
 				  form.action = "<@ofbizUrl>updateZoneDet</@ofbizUrl>";
			      form.submit();
			      disSubmit('saveBtn');
		          }
		         }
		     }}}
        }
	
 </script>	

