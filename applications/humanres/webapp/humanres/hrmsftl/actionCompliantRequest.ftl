<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: actionMeterChange.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to action Meter Change -->

<#setting locale="en">
    
    <form method="post" name="actionComplaintDetail" action="" class="basic-form">
    <div class="row">
    	<div class="alert alert-info">
  			<ul>
  				<li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
  				<div class="h3" align="center"><b>Action Compliant Request Detail</b></div> 
			</ul>
		</div>
        <table cellspacing="0" class="basic-table table-responsive">
             <tbody>
              
                <tr>
                    <td class="label">${uiLabelMap.complaintNo}</td>
                    <td>CID10001</td>
                    
                     <td class="label">${uiLabelMap.customerNo}</td>
                    <td>10001</td>
                  </tr>
                  
                  <tr>
                   <td class="label">${uiLabelMap.complaintType}</td>
                    <td>Complaint</td>
                    
                  <td class="label">${uiLabelMap.complaintDescription}</td>
                    <td>Complaint Description</td>
                    
                     </tr>
                     
                     <tr>
                     
                     	<td class='label'>${uiLabelMap.compliantApplyDate}</td></td>
                    	<td>02/08/2017</td>
                    	
                     	<td class='label'>${uiLabelMap.assentialDoccument}</td>
                    	<td>example.doc</td>
                    
                     </tr>
                     
                     <tr>
                     
                     	<td class='label'>${uiLabelMap.actionDate}</td>
                    	<td><@htmlTemplate.renderDateTimeField name="actionDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="actionDate" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/></td>
                    	
                     	<td class='label'>${uiLabelMap.actionByOfficer}</td>
                    	<td><input name="dmaNo"  type="text" maxlength="60" value=""></td>
                    
                     </tr>
                  
                  <tr>
                     
                     	<td class='label'>Action Status *</td>
                    	<td><select name="status" style="width:90px;">
                   				<option value="">Select</option>
                   				<option value="Approve">Approve</option>
                   				<option value="Reject">Reject</option>
                   			</select>
                   		</td>
                    	
                     	<td class='label'>Remark</td>
                    	<td><input name="dmaNo"  type="text" maxlength="60" value=""></td>
                    
                     </tr>
                     
                  		<tr>
                    	<td colspan="4">
                    	<center>
                    	<input name="action"   type="button" value="${uiLabelMap.action}" onClick="javascript:actionComplaint(actionComplaintDetail);"/>
                    	   	<input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/>
                     	</center>
                     	</tr>
                     	
         			</tbody>
       			</table>	
    	</div>
</form>

<script type="text/javascript" language="javascript">

function actionComplaint(actionComplaintDetail)
   {
		      var form=document['actionComplaintDetail'];
		      var status = form.status.value;
		      
		      if(notEmptyField(status,"Select Status")) 
     {
		      var sure = confirm("Are you sure, you want to "+status+" the Form ?");
                              if( sure == true )
                             {
                        form.action = "<@ofbizUrl>main</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		                } 
		                }
    }
    
    </script>