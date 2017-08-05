<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: actionKhataChange.ftl ----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to action Khata Change -->

<#setting locale="en">
    
<form method="post" name="actionKhataChangeDetail" action="" class="basic-form">
    <div class="row">
    	<div class="alert alert-info">
  			<ul>
  				<li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
  				<div class="h3" align="center"><b>${uiLabelMap.actionKhataChangeDetail}</b></div> 
			</ul>
		</div>
        <table cellspacing="0" class="basic-table table-responsive">
             <tbody>
              
                <tr>
                    	<td class="label">${uiLabelMap.khataChangeId}</td>
                    	<td>CID10001</td>
                     	<td class="label">${uiLabelMap.khataChangeNo}</td>
                    	<td>10001</td>
                </tr>
                  	
                 <tr>
                  		<td class="label">${uiLabelMap.customerId}</td>
                  		<td>100001</td>
                   		<td class="label">${uiLabelMap.connectionId}</td>
                    	<td>Complaint</td>
                 </tr>
                     
                 <tr>
                     	<td class="label">${uiLabelMap.applyDate}</td>
                    	<td>02/08/2017</td>
                    
                     	<td class='label'>${uiLabelMap.assentialDoccument}</td>
                    	<td>example.doc</td>
                 </tr>
                  
                  <tr>
                     	<td class="label">${uiLabelMap.actionDate}</td>
                    	<td><@htmlTemplate.renderDateTimeField name="actionDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="actionDate" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/></td>
                    
                     	<td class='label'>${uiLabelMap.actionByOfficer}</td>
                    	<td><input name="actionOfficerName"  type="text" maxlength="60" value=""></td>
                  </tr>
                     
                  <tr>
                     	<td class="label">${uiLabelMap.designation}</td>
                    	<td><input name="Designation"  type="text" maxlength="60" value=""></td>
                    
                     	<td class='label'>${uiLabelMap.CommonStatus} *</td>
                    	 <td><select name="status" style="width:90px;">
                   			<option value="">Select</option>
                   			<option value="Approve">${uiLabelMap.approve}</option>
                   			<option value="Reject">${uiLabelMap.reject}</option>
                   			</select>
                   </tr>
                     
                   <tr>
                     	<td class="label">${uiLabelMap.CommonRemark}</td>
                    	 <td><textarea name="remark" maxlength ="500"></textarea></td>
                    </tr>
                    	
                  	<tr>
                    	<td colspan="4">
                    	<center>
                    	<input name="action"   type="button" value="${uiLabelMap.action}" onClick="javascript:actionKhataChange(actionKhataChangeDetail);"/>
                    	<input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/>
                     	</center>
                     	</tr>
                     	
         			</tbody>
       			</table>	
    	</div>
</form>

<script type="text/javascript" language="javascript">

function actionKhataChange(actionKhataChangeDetail)
   {
		      var form=document['actionKhataChangeDetail'];
		      
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