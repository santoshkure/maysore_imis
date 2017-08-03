<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: meterChangeReplacement.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to Search Connection Detail -->

<#setting locale="en">
<form method="post" name="meterChangeReplacement" action="" class="basic-form">
<div class="row">
    <div class="alert alert-info">
  		<ul>
  		<div class="h3" align="center"><b>${uiLabelMap.searchMeterChangeReplacementRequest}</b></div> 
		</ul>
	</div>
	<div class="screenlet-body">
        <table class="basic-table" cellspacing="0">
        
        	 <tr>
              	<td class="label">${uiLabelMap.meterNo}</td>
             	<td><input type="text" name="nameOfCustomer" value="" style="width:240px;" maxlength="50"></td>
             	
             	<td class="label">${uiLabelMap.customerId}</td>
             	<td><input type="text" name="customerId" value="" style="width:240px;" maxlength="50"></td>
			 </tr>
			 
			 <tr>
              	<td class="label">${uiLabelMap.requestForMeter}</td>
             	<td><select name="requestMeter" style="width:90px;">
                   <option value="">Select</option>
                   <option value="Change">Meter Change</option>
                   <option value="Replacement">Replacement</option>
                   </select>
                   </td>
             	<td class="label">${uiLabelMap.dateOfApply}</td>
                <td>
                      <@htmlTemplate.renderDateTimeField name="ApplyDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="ApplyDate" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                </td>
                </tr>
                
                <tr>
              	<td class="label">${uiLabelMap.fromDate}</td>
             	<td>
                      <@htmlTemplate.renderDateTimeField name="fromDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="fromDate" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                </td>
             	<td class="label">${uiLabelMap.toDate}</td>
                <td>
                      <@htmlTemplate.renderDateTimeField name="toDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="toDate" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                </td>
                </tr>
                
        </table>
        <center><input type="submit" value="${uiLabelMap.CommonSearch}"></center>
    </div>
</div>
</form>

