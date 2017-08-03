<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: createNewMeterDetail.ftl----->
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Shubham Malviya   01/08/2017		
<#-- #####################################################################################################-->
<#--This ftl is used to Create Meter Detail -->

<#setting locale="en">

    <form method="post" name="createNewMeterDetail" action="" class="basic-form">
    <div class="row">
    <div class="alert alert-info">
  <ul>
  <div class="h3" align="center"><b>Create Meter Detail</b></div> 
</ul>
</div>
            <table cellspacing="0" class="basic-table table-responsive">
                <tbody>
                	<tr>
                		<td colspan="3"><font color="blue"></font></td>
	                	<td colspan="6"><font color="blue"><u><i>${uiLabelMap.noteMandatoryAsterisk}</i></u></font color></td>
                	</tr>
                	<tr>
                		<td class='label'>${uiLabelMap.meterNo}</td>
                    	<td><input name="firstName"  type="text" maxlength="60" value="" readonly></td>
                    
                    	<td class='label'>${uiLabelMap.meterConstant}</td>
                    	<td><input name="firstName"  type="text" maxlength="60" value="" readonly></td>
                     </tr>
                     
                     <tr>
                     	<td class='label'>${uiLabelMap.meterConstant}</td>
                    	<td><input name="firstName"  type="text" maxlength="60" value="" readonly></td>
                    
                     	<td class='label'>${uiLabelMap.meterExisting}</td>
                    	<td><input name="firstName"  type="text" maxlength="60" value="" readonly></td>
                     </tr>
                     
                     <tr>
                     	<td class='label'>${uiLabelMap.meterCost}</td>
                    	<td><input name="firstName"  type="text" maxlength="60" value="" readonly></td>
                    
                     	<td class='label'>${uiLabelMap.meterStatus}</td>
                    	<td><input name="firstName"  type="text" maxlength="60" value="" readonly></td>
                     </tr>
                     
                     <tr>
                     	<td class='label'>${uiLabelMap.CommonRemark}</td>
                    	<td><input name="firstName"  type="text" maxlength="60" value="" readonly></td>
                    
                     	<td class='label'>${uiLabelMap.dateofpurchase}</td>
                    	<td>
                      	<@htmlTemplate.renderDateTimeField name="purchaseDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="purchaseDate" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                    	</td>
                    
                     </tr>
                     
                     <tr>
                     	<td colspan="1" class='label'>${uiLabelMap.officeName}</td>
                    	<td colspan="3"><input name="firstName"  type="text" maxlength="60" value="" readonly></td>
                     </tr>
                     
                     <tr>
                    	<td colspan="4">
                    	<center>
                    	<input name="save"   type="submit" value="${uiLabelMap.CommonSave}"/>
                    	<input type="submit" name="cancel" value="${uiLabelMap.CommonCancel}"/> 
                     	</center>
                     	</td>
                     </tr>
                    
                </tbody>
             </table>
        </div>
     </div>
</form>