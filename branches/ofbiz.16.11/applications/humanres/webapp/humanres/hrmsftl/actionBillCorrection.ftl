<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: actionBillCorrection.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   02/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to action Bill Correction Detail -->

<#setting locale="en">
    
    <form method="post" name="actionBillCorrection" action="" class="basic-form">
    <div class="row">
    	<div class="alert alert-info">
  			<ul>
  				<div class="h3" align="center"><b>${uiLabelMap.actionBillCorrectionDetail}</b></div> 
			</ul>
		</div>
        <table cellspacing="0" class="basic-table table-responsive">
             <tbody>
             
                	<tr>
                     	<td class="label">${uiLabelMap.billCorrectionId}</td>
                     	<td>10001</td>
                     	<td class="label">${uiLabelMap.billCorrectionNo}</td>
                     	<td>M1000101</td>
                   	</tr>
                  
                  <tr>
                     	<td class='label'>${uiLabelMap.customerNo}</td>
                    	<td>10001</td>
                     	<td class='label'>${uiLabelMap.connectionNo}</td>
                    	<td>AB10001</td>
                     </tr>
                     
                     <tr>
                     	<td class='label'>${uiLabelMap.billNo}</td>
                    	<td>MCCM100010</td>
                     	<td class='label'>${uiLabelMap.issueDetail}</td>
                    	<td>Issue Details</td>
                     </tr>
                     
                     <tr>
                     	<td class='label'>${uiLabelMap.applyDate}</td>
                    	<td>02/08/2017</td>
                     	<td class='label'>${uiLabelMap.assentialDoccument}</td>
                    	<td>Doccument</td>
                     </tr>
                  
                  	<tr>
                     
                     	<td class='label'>${uiLabelMap.actionDate}</td>
                    	<td><@htmlTemplate.renderDateTimeField name="actionDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="actionDate" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/></td>
                    	
                     	<td class='label'>${uiLabelMap.actionByOfficer}</td>
                    	<td><input name="dmaNo"  type="text" maxlength="60" value=""></td>
                    
                     </tr>
                  
                  	<tr>
                     
                     	<td class='label'>${uiLabelMap.CommonStatus}</td>
                    	<td><select name="status" style="width:90px;">
                   				<option value="">Select</option>
                   				<option value="approve">Approve</option>
                   				<option value="reject">Reject</option>
                   			</select>
                   		 </td>
                    	
                     	<td class='label'>${uiLabelMap.CommonRemark}</td></td>
                    	<td><textarea name="remark" style="width:240px" maxlength ="500"></textarea></td>
                    
                     </tr>
                     
                  		<tr>
                    	<td colspan="6">
                    	<center>
                    	<input name="Action"   type="submit" value="${uiLabelMap.action}"/>
                    	<input type="submit" name="cancel" value="${uiLabelMap.CommonCancel}"/> 
                     	</center>
                     </tr>
                     	
        	</tbody>
       	</table>	
    </div>
</form>