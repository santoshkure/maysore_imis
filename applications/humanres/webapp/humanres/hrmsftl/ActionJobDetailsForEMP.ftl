<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
	
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Siddhi Rajput  22/08/2017	
  	
<#-- #####################################################################################################-->
<#--This ftl is used to View The Job Details-->

<#setting locale="en">
   
    <form method="post" name="actionJobDetails" action="" class="basic-form">
    <div class="row">
	    <div class="alert alert-info">
		    <ul>
		        <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
		    	<div class="h3" align="center"><b>${uiLabelMap.actionJobDetail}</b></div>
			</ul>
		</div>
		<div class="screenlet-body">
            <table cellspacing="0" class="basic-table table-responsive">
                <tbody>
                    <tr>
                        <td class="label">${uiLabelMap.customerNo}</td>
                        <td>1000</td>
                        <td class="label">${uiLabelMap.connectionNo}</td>
                        <td>0987</td>
                   </tr>
                    <tr>
                        <td class="label" >${uiLabelMap.applicationDate}</td>
                        <td>22/08/2017</td>
                        <td class="label">${uiLabelMap.essentialDocument}</td>
                        <td>jobDetails.doc </td>
				   </tr>
				   <tr>
				        <td class="label" >${uiLabelMap.serviceDate}</td>
                        <td>22/08/2017</td>
				        <td class="label" >${uiLabelMap.serviceTime}</td>
                        <td>4:00</td>
				   </tr>
				    <tr>
				        <td class="label" >${uiLabelMap.feeAmount}</td>
                        <td>7000</td>
                        <td class="label">${uiLabelMap.typeOfJob}</td>
                        <td>Tanker Request</td>
				     </tr>
					 <tr>
					    <td class="label">${uiLabelMap.detailOfJob}</td>
                        <td colspan="1">Details of Job</td>
                        <td class="label">${uiLabelMap.serviceAddress}</td>
                        <td colspan="1">Type-2 Lane 9 Mysore</td>
					 </tr>
                      <tr>
                     
                     	<td class='label'>${uiLabelMap.actionDate}</td>
                    	<td><@htmlTemplate.renderDateTimeField name="actionDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="actionDate" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/></td>
                    	
                     	<td class='label'>${uiLabelMap.actionByOfficer}</td>
                    	<td><input name="actionbyofficer"  type="text" maxlength="60" value=""></td>
                    
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
                    	<td><textarea name="remark" maxlength ="500"></textarea></td>
                    
                      </tr> 
                      <tr>
                    	<td colspan="4">
                    	<center>
                    	<input name="action" type="button" value="${uiLabelMap.action}" onClick="javascript:actionJobdetails(actionJobDetails);"/>
                    	   	<input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/>
                     	</center>
                     </tr>
               </tbody>
          </table>
     </div>
 </form>
<script type="text/javascript" language="javascript">

            function actionJobdetails(actionJobDetails)
              {
		      var form=document['actionJobDetails'];
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