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
  				<div class="h3" align="center"><b>Action Complaint Request Detail</b></div> 
			</ul>
		</div>
		<#if complRegDetailsList?exists>     
    	   	<#if complRegDetailsList?has_content>
            	<#list complRegDetailsList as complRegDetailsList> 
					<div class="screenlet-body" id="printId1">
            			<table cellspacing="0" class="basic-table table-responsive">
                			<tbody>
              				<input type="hidden" name="sequenceId" value="${complRegDetailsList.sequenceId?if_exists}">  
                        	<input type="hidden" name="complaintId" value="${complRegDetailsList.complaintId?if_exists}">
                    			<tr>
                         			<td class="label">${uiLabelMap.customerNo}</td>
                         			<td>${complRegDetailsList.custNo?if_exists}</td>
                         			<td class="label">${uiLabelMap.connectionNo}</td>
                         			<td>${complRegDetailsList.conNo?if_exists}</td>
                     			</tr>
                     			<tr>
                         			<td class="label" >${uiLabelMap.complaintDate}</td>
                         			<td>${complRegDetailsList.complDate?if_exists?string('dd/MM/yyyy')}</td>
                         			<td class="label">${uiLabelMap.essentialDocument}</td>
                         			<td>${complRegDetailsList.fileLoc?if_exists}</td>
					  			</tr>
					  			<tr>
					     			<td class="label">${uiLabelMap.complaintDescription}</td>
                         			<td>${complRegDetailsList.complDescription?if_exists}</td>
                         			<td class="label">${uiLabelMap.complaintType}</td>
                         			<#if complRegDetailsList.complaintType?if_exists = 'meter'>
                         				<td>Meter</td>
                         			<#elseif complRegDetailsList.complaintType?if_exists = 'bill'>
                         				<td>Bill</td>
                         			<#elseif complRegDetailsList.complaintType?if_exists = 'pipedamage'>
                         				<td>Pipe Damage</td>
                         			<#else>
                         				<td>Other</td>
                         			</#if>
					  			</tr>
					  			<tr>
									<td class="label">${uiLabelMap.serviceAddress}</td>
    	                   	 		<td>${complRegDetailsList.serviceAdd?if_exists}</td>
                      			
                     				<td class='label'>${uiLabelMap.remark}</td>
                     				<td><textarea name="remark" maxlength ="3500"></textarea></td>
                     			</tr>
                     			<tr>
                    				<td colspan="4">
                    				<center>
                    					<input name="approve"   type="button" value="${uiLabelMap.CommonApprove}" onClick="javascript:actionComplaintDetails(this);"/>
                    	   				<input name="reject"   type="button" value="${uiLabelMap.reject}" onClick="javascript:actionComplaintDetails(this);"/>
										<input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/>
                     				</center>
                     			</tr>
		                    	<input type="hidden" name="actionStatus">
               				</tbody>
          				</table>
          			</div>
               	</#list>
         	</#if>
      	</#if>
   	</div>
</form>

<script>	
	function actionComplaintDetails(Msg)
   	{
		var form=document['actionComplaintDetail'];
		var tempMsgCheck = Msg.value;
		form.actionStatus.value = tempMsgCheck;
		var sure = confirm("Are you sure, you want to "+tempMsgCheck+" the Form ?");
		if( sure == true )
        {
        	form.action = "<@ofbizUrl>actionComplaint</@ofbizUrl>";
			form.submit();
		    disSubmit('disBttn');    
		} 
    }

</script>