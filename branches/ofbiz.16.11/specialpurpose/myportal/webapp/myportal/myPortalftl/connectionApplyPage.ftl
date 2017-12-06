<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: connectionApplyPage.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Anubha Saini   03/08/2017 
<#-- 1.1			Pankaj Trivedi						05/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to Register New Customer -->


   		 <form method="post" name="connectionApply" action="" class="basic-form">
   		<#--<div class="col-md-9">-->
   		 
   		<#--  <div class=""><span style="color: #2f87c6;font-size: 25px;padding: 5px 10px 5px 10px;">${uiLabelMap.connectionApply}</span></div> -->
   		 
    			<div class="row" >
    			<div class="alert alert-info">
				<ul>
    				<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    				<div class="h3" align="center"><b>${uiLabelMap.connectionApply}</b></div>
	    		</ul>
  				</div>
  				
  				<table cellspacing="0" class="basic-table table-responsive">
  				
  							<input type="hidden" name="connectionId" value="True/False" <li><a title="This is your connection Id "/>
         					<input type="hidden" name="connectionStauts" value="CId1001" <li><a title="This is your Connection stauts"/>
        		
        			<tr>
	              		<td colspan="4"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td>
                	</tr>
        			<tr>
                      	<td class="label">${uiLabelMap.customerNo}</td>
                        <td><input name="costomerNo"  type="text" maxlength="10" value="${userLogin.userLoginId}" readonly></td>
                       
                 </tr>
                    
                     <tr>
                    <td class="label">${uiLabelMap.connectionCategory} <font color="red">*</td></td>
                         <td>
                    	<select name="connectionCategory" >
                   			<option value="">Select</option>
                   			<option value="Household">Household</option>
                   			<option value="household">Non-household</option>
                   			<option value="Commercial">Commercial</option>
                   			
                 		</select>
             		</td>
                        <td class="label">${uiLabelMap.applicationType} <font color="red">*</td></td>
                         <td>
                    	<select name="applicationType" >
                   			<option value="">Select</option>
                   			<option value="Permanent">Permanent</option>
                   			<option value="Temporary">Temporary</option>
                   			
                 		</select>
             		</td>
             		<tr>
                   <td class="label">${uiLabelMap.typeOfBuilding} <font color="red">*</td></td>
 						<td>
                    	<select name="typeOfBuilding" >
                   			<option value="">Select</option>
                   			<option value="Residential">Residential</option>
                   			<option value="Industrial">Industrial</option>
                   			
                 		</select>
             			</td>   
   						<td class="label">${uiLabelMap.applicationDate}</td>
   						<td>
						<#--<@htmlTemplate.renderDateTimeField name="dateOfBirth" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="fromDate_2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
						--><input name="applicationDate"  type="date" maxlength="10" readonly value="${nowTimestamp?string("dd/MM/yyyy hh:mm:ss a")}"></td>
   						
   					</tr>
   					 <tr>
	                         
	                        <td class="label">${uiLabelMap.feeForConnection}</td>
	                        <td><input name="feeForConnection"  type="text" maxlength="7" readonly value="500" ></td>

                    <td class="label">${uiLabelMap.essentialDocument}</td>
							<td colspan="3">
		     				<input type="file" name="fileLoc"  onchange="javascript:validateFile(this,document.getElementById('fileLocFileName'),document.getElementById('fileLocFileType'));"/>
		    				<input type="button" onclick="javascript:resetVal(fileLoc);" value="Reset"/> 
		    				<input type="hidden" name="fileLocFileName" id="fileLocFileName" value=""/>
		    				<input type="hidden" name="fileLocFileType" id="fileLocFileType" value=""/>
		 					</td>
                    <tr>
	                     
                    <tr>
                    	<td colspan="4">
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
		      var form=document['connectionApply'];
		      var connectionCategory = form.connectionCategory.value;
		      var applicationType = form.applicationType.value;
		      var typeOfBuilding = form.typeOfBuilding.value;
		      
		      if(notEmptyField(connectionCategory,"${uiLabelMap.CommonSelect} ${uiLabelMap.connectionCategory}"))
     				{
     			if(notEmptyField(applicationType,"${uiLabelMap.CommonSelect} ${uiLabelMap.applicationType}"))
     				{
     			if(notEmptyField(typeOfBuilding,"${uiLabelMap.CommonSelect} ${uiLabelMap.typeOfBuilding}"))
     				{		
		       var sure = confirm("Are you sure, you want to Save the Form ?");
                              if( sure == true )
                             {
                        form.action = "<@ofbizUrl>applyConnection</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		                } 
		             } 
		             }
		             }  
    }
    </script>