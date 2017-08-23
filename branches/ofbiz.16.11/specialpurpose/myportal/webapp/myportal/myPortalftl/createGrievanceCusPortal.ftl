<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: createGrievanceCusPortal.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#-- 1.0			Anubha Saini	  19/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to Register New Customer -->


   		 <form method="post" name="createGrievanceCustomer" action="" class="basic-form">
   		<#--<div class="col-md-9">-->
   		 
   		<#--  <div class=""><span style="color: #2f87c6;font-size: 25px;padding: 5px 10px 5px 10px;">${uiLabelMap.createIllegalToLegal}</span></div> -->
   		 
    			<div class="row" >
    			<div class="alert alert-info">
				<ul>
    				<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    				<div class="h3" align="center"><b>${uiLabelMap.createGrievance}</b></div>
	    		</ul>
  				</div>
  				
  				<table cellspacing="0" class="basic-table table-responsive">
  				
  							
        			<tr>
        			<td colspan="4" align="left"><font color="blue"><b>${uiLabelMap.grievanceReceipt}</b></font></td>
	              		<td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td>
                	</tr>
                	
        			<tr>
                      	<td class="label">${uiLabelMap.receiptNo}</td>
                        <td colspan="12"><input name="receiptNo"  type="text" maxlength="10" value="RECP1001" readonly></td>
                       
                 </tr>
                 <tr><td colspan="12" align="left"><font color="blue"><b>${uiLabelMap.grievanceDetail}</b></font></td></tr>
                 <tr>
                 		<td class="label">${uiLabelMap.grievanceDate}</td>
   						<td colspan="12">
						<@htmlTemplate.renderDateTimeField name="grievanceDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="grievanceDate" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
						<#--<input name=""  type="date" maxlength="10" readonly value="${nowTimestamp?string("dd/MM/yyyy")}"></td>-->
				</tr>
					<tr>	
						<td class="label" >${uiLabelMap.grievancePetitionDate}</td>
   						<td>
						<@htmlTemplate.renderDateTimeField name="grievancePetitionDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="grievancePetitionDate" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
						<#--<input name=""  type="date" maxlength="10" readonly value="${nowTimestamp?string("dd/MM/yyyy")}"></td>-->
                  
                    	<td class="label" >${uiLabelMap.typeOfGrievance}</td>
 						<td colspan="4">
                    	<select name="typeOfGrievance" >
                   			<option value="">Select</option>
                   			<option value="">Internal</option>
                   			<option value="">External</option>
                   			
                 		</select>
             			</td> 
                  	</tr>  
                  
                 
                  
                  	<tr>
                    		<td class="label">${uiLabelMap.name}</td>
                         	<td ><input name="receiptNo"  type="text" maxlength="10" value="" readonly></td>
                       		<td class="label">${uiLabelMap.OrderAddress}<font color="red" >*</font></td>
                        	<td colspan="4"><textarea name="reasonForDisconnection" value="" maxlength="300" style="width:400px"></textarea></td> 
                  	</tr>
                    <tr>
                    		<td class="label">${uiLabelMap.mobileNo}</td>
                        	<td>
                        	<input name="mobileNo" type="text" maxlength="25" value="" placeholder="${uiLabelMap.yourMobile}">
                        	</td>
                        	<td class="label">${uiLabelMap.CommonEmail}</td>
                        	<td colspan="4">
                        	<input name="eMail" type="text" maxlength="40" value="" placeholder="${uiLabelMap.yourEMail}">
                        	</td>
                    </tr>
                    <tr>
                    		<td class="label">${uiLabelMap.grievanceDetail}</td>
                       	 	<td colspan="1"><textarea name="grievanceDetail" value="" maxlength="500" ></textarea></td>
                    		<td class="label">${uiLabelMap.assentialDocument}</td>
				        	<td colspan="4"><input type="file" name="fileLoc"  onchange="javascript:validateFile(this,document.getElementById('fileLocFileName'),document.getElementById('fileLocFileType'));"/>
                        	<input type="button" onclick="javascript:resetVal(document..fileLoc);" value="Reset"/>
                        	<input type="hidden" name="fileLocFileName" id="fileLocFileName" value=""/>
                        	<input type="hidden" name="fileLocFileType" id="fileLocFileType" value=""/>
                        	</td>
                    </tr>
                    
                    <tr>
                    	<td colspan="12">
                    	<center>
                    	<input name="save"   type="button" value="${uiLabelMap.CommonSave}" onClick="javascript:saveRegistrationDetail();"/>
                    	 <input type="button" name="Cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();" >
                     	</center>
                     	</td>
                    </tr>
        		</table>
 
	</div>
   <#--	</div>-->

   
</form>

    <script type="text/javascript" language="javascript">
 
function saveRegistrationDetail()
   {
		      var form=document['createGrievanceCustomer'];
		       var sure = confirm("Are you sure, you want to Save the Form ?");
                              if( sure == true )
                             {
                        form.action = "<@ofbizUrl>searchGrievanceCusPortal</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		                } 
    }
    
    
    </script>