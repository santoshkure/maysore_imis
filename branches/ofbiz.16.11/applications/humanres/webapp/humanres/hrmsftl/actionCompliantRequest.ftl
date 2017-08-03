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
  				<div class="h3" align="center"><b>Action Compliant Request Detail</b></div> 
			</ul>
		</div>
        <table cellspacing="0" class="basic-table table-responsive">
             <tbody>
              
                <tr>
                    <td class="label">Complaint Id</td>
                    <td>CID10001</td>
                    
                     <td class="label">Consumer Id</td>
                    <td>10001</td>
                  </tr>
                  
                  <tr>
                   <td class="label">Complaint type</td>
                    <td>Complaint</td>
                    
                  <td class="label">Complaint Description</td>
                    <td>Complaint Description</td>
                    
                     </tr>
                     
                     <tr>
                     
                     	<td class='label'>Complaint Apply Date</td>
                    	<td>02/08/2017</td>
                    	
                     	<td class='label'>Essential Doccument</td>
                    	<td>example.doc</td>
                    
                     </tr>
                     
                     <tr>
                     
                     	<td class='label'>Action Date</td>
                    	<td><@htmlTemplate.renderDateTimeField name="actionDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="actionDate" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/></td>
                    	
                     	<td class='label'>Action by Officer</td>
                    	<td><input name="dmaNo"  type="text" maxlength="60" value=""></td>
                    
                     </tr>
                  
                  <tr>
                     
                     	<td class='label'>Action detail</td>
                    	<td><select name="status" style="width:90px;">
                   				<option value="">Select</option>
                   				<option value="approve">Approve</option>
                   				<option value="reject">Reject</option>
                   			</select>
                   		</td>
                    	
                     	<td class='label'>Remark</td>
                    	<td><input name="dmaNo"  type="text" maxlength="60" value=""></td>
                    
                     </tr>
                     
                  		<tr>
                    	<td colspan="6">
                    	<center>
                    	<input name="Action"   type="submit" value="Action"/>
                    	<input type="submit" name="cancel" value="${uiLabelMap.CommonCancel}"/> 
                     	</center>
                     	</tr>
                     	
         			</tbody>
       			</table>	
    	</div>
</form>