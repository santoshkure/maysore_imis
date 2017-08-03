<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: actionMeterChange.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to action Meter Change -->

<#setting locale="en">
    
    <form method="post" name="actionMeterChange" action="" class="basic-form">
    <div class="row">
    	<div class="alert alert-info">
  			<ul>
  				<div class="h3" align="center"><b>Action Meter Change Detail</b></div> 
			</ul>
		</div>
        <table cellspacing="0" class="basic-table table-responsive">
             <tbody>
              
                <tr>
                    <td class="label">${uiLabelMap.meterChangeApplicationNo}</td>
                    <td>MCAN10001</td>
                    
                     <td class="label">${uiLabelMap.currentMeterId}</td>
                    <td>M1000101</td>
                  </tr>
                  
                  <tr>
                   <td class="label">${uiLabelMap.connectionId}</td>
                    <td>10001</td>
                    
                  <td class="label">${uiLabelMap.customerId}</td>
                    <td>10001</td>
                    
                     </tr>
                     
                     <tr>
                     
                     	<td class='label'>${uiLabelMap.reason}</td>
                    	<td>Reason</td>
                    	
                     	<td class='label'>${uiLabelMap.feeAmount}</td>
                    	<td>1000</td>
                    
                     </tr>
                     
                     <tr>
                     
                     	<td class='label'>${uiLabelMap.feeStatus}</td>
                    	<td>Paid</td>
                    	
                     	<td class='label'>${uiLabelMap.feeRefrenceNo}</td>
                    	<td>Ref1101</td>
                    
                     </tr>
                     
                     <tr>
                     
                     	<td class='label'>${uiLabelMap.issueDetail}</td>
                    	<td>Issue Details</td>
                    	
                     	<td class='label'>${uiLabelMap.dateOfApply}</td>
                    	<td>02/08/2017</td>
                     </tr>
                  
                   <tr>
                     
                     	<td class='label'>${uiLabelMap.assentialDoccument}</td></td>
                    	<td colspan="3">Example.doc</td>
                     </tr>
                  
                  <tr><td colspan="6" align="left"><font color="blue">${uiLabelMap.actionDetail}</font></td></tr>
                  
                  <tr>
                    <td class="label">${uiLabelMap.actionByOfficer}</td>
                    <td><input name="ActionOfficerName"  type="text" maxlength="60" value=""></td>
                    
                     <td class="label">${uiLabelMap.designation}</td>
                    <td><input name="designationActionOfficer"  type="text" maxlength="60" value=""></td>
                  </tr>
                  
                  <tr>
                    <td class="label">${uiLabelMap.CommonStatus}</td>
                    <td><textarea name="status" style="width:240px" maxlength ="500"></textarea></td>
                    
                     <td class="label">${uiLabelMap.Remark}</td>
                    <td><textarea name="remark" style="width:240px" maxlength ="500"></textarea></td>
                  </tr>
                  
                  <tr>
                    <td class="label">${uiLabelMap.newMeterNumber}</td>
                    <td colspan="3"><input name="newMeterNumber"  type="text" maxlength="60" value=""></td>
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