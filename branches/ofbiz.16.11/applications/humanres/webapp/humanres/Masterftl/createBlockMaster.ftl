<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: wardMaster.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     -->
<#--- Anubha Saini    	31 July 2017    -->

<#-- #####################################################################################################-->




<form method="post" name="createBolckMaster" class="basic-form">

	<div class="row">
  <div class="alert alert-info">
    <ul>
    <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
      <li class="h3">${uiLabelMap.createBlockMaster}</li>
    </ul>
    
  </div>
	
	<div class="screenlet-body">
	
		<table class="basic-table" cellspacing="0">
		<tr><td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td></tr>
			<tr>
			 <td class="label">${uiLabelMap.blockName}<font color="red" >*</font></td>
			 <td><input type="text" style="width:140px"  name="description" autocomplete="off" id="remark" maxlength ="30" value="" /></td>    	
			 
			  <td class="label">${uiLabelMap.wardname}<font color="red" >*</font> </td>
			  <td> 
				<select name="nameOfService" style="width:150px;" onchange="return getDesignation(this);">
					<option value="">${uiLabelMap.wardname}</option>
				 	<option value="">Mysore Ward</option>
				</select>
			</td>  
			  
        	</tr>
        	
        	<tr>
			 <td class="label">${uiLabelMap.cityName} <font color="red" >*</font></td>
			  <td> 
				<select name="nameOfService" style="width:150px;" onchange="return getDesignation(this);">
					<option value="">${uiLabelMap.cityName}</option>
				 	<option value="">Mysore</option>
				</select>
			</td>  
			
			<td class="label">${uiLabelMap.remark}</td>
			 	
			  <td colspan="4"><textarea name="petiDetails" value="" maxlength="150" style="width:400px"></textarea></td>
		</tr>
        	<tr>
                    <td width='20%' align='right' class="label">${uiLabelMap.createdate}<font color="red" >*</font></td>
                    <td><input type="date" style="width:140px"  name="date" autocomplete="off" id="date" maxlength ="30" value="" />
                    <#--  <@htmlTemplate.renderDateTimeField name="eventDate" event="" action="" className="" alert="" title="Format: yyyy-MM-dd HH:mm:ss.SSS" value="${requestParameters.eventDate!nowTimestamp}" size="25" maxlength="30" id="fromDate_2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                    --></td>
                  </tr>
        	<tr>
				<td colspan="4">
					<center><div id="submit" align="center">
						<input type="button" submit="" value="Submit" onclick="javascript:validateTypeMaster();"/>
					    <input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:ConfirmBackMaster();"/>
					</div>
					</center>
				</td>
			</tr>
		</table>
		</div>
	</div>
	
	</form>

<script type="text/javascript" language="javascript">

	<#--function validateTypeMaster()
	{
		
		
		
					
					document.zoneMaster.action= "<@ofbizUrl>saveZoneMaster</@ofbizUrl>";
					document.zoneMaster.submit();
					disSubmit('saveBtn'); 
					//return true;
					//alert("submit");
					
				}
			
	-->
     
	
	
</script>