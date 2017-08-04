<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: editMeterDetail.ftl ----->
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Shubham Malviya   02/08/2017		
<#-- #####################################################################################################-->
<#--This ftl is used to edit Meter Detail -->

<#setting locale="en">

    <form method="post" name="editMeterDetail" action="" class="basic-form">
    <div class="row">
    <div class="alert alert-info">
  <ul>
  <li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
  <div class="h3" align="center"><b>${uiLabelMap.editMeterDetail}</b></div> 
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
                    	<td>100001</td>
                    	
                    	<td class='label'>${uiLabelMap.meterConstant}</td>
                    	<td>M1000101</td>
                    	
                     </tr>
                     
                     <tr>
                     <td class='label'>${uiLabelMap.meterConstant}</td>
                    	<td><input name="firstName"  type="text" maxlength="60" value="" readonly></td>
                    	
                     	<td class='label'>${uiLabelMap.meterCondition}</td>
                    	<td><input name="firstName"  type="text" maxlength="60" value="" readonly></td>
                    
                     </tr>
                     
                     <tr>
                     
                     	<td class='label'>${uiLabelMap.meterExisting}</td>
                    	<td><input name="firstName"  type="text" maxlength="60" value="" readonly></td>
                    	
                     	<td class='label'>${uiLabelMap.meterCost}</td>
                    	<td><input name="firstName"  type="text" maxlength="60" value="" readonly></td>
                    
                     </tr>
                     
                     <tr>
                     
                     	<td class='label'>${uiLabelMap.meterStatus}</td>
                    	<td><input name="firstName"  type="text" maxlength="60" value="" readonly></td>
                    	
                     	<td class='label'>${uiLabelMap.CommonRemark}</td>
                    	<td><input name="firstName"  type="text" maxlength="60" value="" readonly></td>
                    
                     </tr>
                     
                     <tr>
                     
                     	<td class='label'>${uiLabelMap.dateofpurchase}</td>
                    	<td>
                      	<@htmlTemplate.renderDateTimeField name="purchaseDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="purchaseDate" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                    	</td>
                    	
                     	<td class='label'>${uiLabelMap.commonOfficeName}</td>
                    	<td><input name="firstName"  type="text" maxlength="60" value="" readonly></td>
                     </tr>
                     
                     <tr>
                    	<td colspan="4">
                    	<center>
                    	<input name="edit"   type="button" value="${uiLabelMap.CommonEdit}" onClick="javascript:actionBillCorrection();"/>
                    	<input type="submit" name="cancel" value="${uiLabelMap.CommonCancel}"/> 
                     	</center>
                     	</tr>
                     	
         			</tbody>
       			</table>	
    	</div>
</form>

<script type="text/javascript" language="javascript">

function actionBillCorrection(editMeterDetail)
   {
		      var form=document['editMeterDetail'];
		      
		      var sure = confirm("Are you sure, you want to Update the Form ?");
                              if( sure == true )
                             {
                        form.action = "<@ofbizUrl>registerMeterDetails</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		                } 
    }
    
    </script>