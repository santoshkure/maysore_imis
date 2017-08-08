<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: createZoneMaster.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     -->
<#--- Anubha Saini    	01 August 2017    -->

<#-- #####################################################################################################-->

<form method="post" name="createZoneMaster" class="basic-form">

	<div class="row">
  <div class="alert alert-info">
    	<ul>
    	<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    		<li class="h3">${uiLabelMap.createZone}</li>
 		</ul>
    	
  </div>
	
	<div class="screenlet-body">
	<table class="basic-table" cellspacing="0">
		
			<td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td>
		
			<tr>
			
			 <td class="label">${uiLabelMap.zoneName} <font color="red" >*</font></td>
			 <td><input type="text" style="width:140px"  name="zoneName" autocomplete="off" id="zoneName" maxlength ="30" value="" /></td>    	
			 
			  <td class="label">${uiLabelMap.cityName} <font color="red" >*</font></td>
			  <td> 
				<select name="cityName" style="width:150px;" onchange="return getDesignation(this);">
					<option value="">${uiLabelMap.cityName}</option>
				 	<option value="Hyderabad">Hyderabad</option>
				</select>
			</td>  
			  
        	</tr>
        	
        	<tr>
			 <td class="label">${uiLabelMap.officeName}<font color="red" >*</font></td>
			  <td> 
				<select name="officeName" style="width:150px;" onchange="return getDesignation(this);">
					<option value="">${uiLabelMap.officeName}</option>
				 	<option value="">WRD</option>
					
				</select>
			</td>  
			
			  <td class="label">${uiLabelMap.remark}</td>
			 	
			  <td colspan="4"><textarea name="remark" value="" maxlength="150" style="width:400px"></textarea></td>
        	</tr>
        	<tr>
                    <td width='20%' align='right' class="label">${uiLabelMap.createdate} <font color="red" >*</font></td>
                    <td>
                    <#--  <@htmlTemplate.renderDateTimeField name="eventDate" event="" action="" className="" alert="" title="Format: yyyy-MM-dd HH:mm:ss.SSS" value="${requestParameters.eventDate!nowTimestamp}" size="25" maxlength="30" id="fromDate_2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                    -->
					<input type="date" style="width:140px"  name="createdate" autocomplete="off" id="createdate" maxlength ="10" value="" />
					</td>
                  </tr>
        	<tr>
				<td colspan="4">
					<center><div id="submit" align="center">
						<input type="button" submit="" value="Submit" onclick="javascript:validateTypeMaster('createZoneMaster');"/>
					    <input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:ConfirmBackMaster();"/>
					</div>
					</center>
				</td>
			</tr>
		</table>
		</div>
	</div>
	
	</form>
		


<script>

	function validateTypeMaster(formname)
	{
			         var form=document[formname];
					form.action= "<@ofbizUrl>saveZoneMaster</@ofbizUrl>";
				    form.submit();
					disSubmit('saveBtn'); 
					//return true;
					//alert("submit");
					
				}
			
	
    
	
	
</script>