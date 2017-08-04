<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: editConnectionApply.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     -->
<#--- Anubha Saini    	    03 Aug 2017    -->

<#-- #####################################################################################################-->
<script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>
<form method="post" name="editConnectionApply" class="basic-form">

	<div class="row">
	
	  	<div class=""><span style="color: #2f87c6;font-size: 25px;padding: 5px 10px 5px 10px;">${uiLabelMap.editConnection}</span></div>
  			<div class="alert alert-info">
				<ul>
    				<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
	    		</ul>
  			</div>
	
	<div class="screenlet-body">
	<table class="basic-table" cellspacing="0">
		
			<td colspan="6"><h4 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td>
		
			   
                  <tr>
                      	<td class="label">${uiLabelMap.customerNo}</td>
                        <td><input name="consumerNo"  type="text" maxlength="10" value="1001" placeholder="${uiLabelMap.customerNo}"></td>
                        <td class="label">${uiLabelMap.customerId}</td>
                        <td><input name="consumerId"  type="text" maxlength="10" value="CID1001" placeholder="${uiLabelMap.customerId}"></td>
                  </tr>
                   
 					<tr>
 
 							<td class="label">${uiLabelMap.connectionCategory}</td>
                         <td>
                    		<select name="${uiLabelMap.connectionCategory}" style="width:90px;">
                   			<option value="">Select</option>
                   			<option value="mr">Household</option>
                   			<option value="ms">Non-household</option>
                   			<option value="miss">commercial</option>
                   			
                 		</select>
             			</td>
                        <td class="label">${uiLabelMap.applicationType}</td>
                         <td>
                    	<select name="applicationType" style="width:90px;">
                   			<option value="">Select</option>
                   			<option value="mr">Permanent</option>
                   			<option value="ms">Temporary</option>
                   			
                 		</select>
             		</td>
             		</tr>
             		<tr>
                        <td class="label">${uiLabelMap.typeOfBuilding}</td>
 						<td>
                    	<select name="typeOfBuilding" style="width:90px;">
                   			<option value="">Select</option>
                   			<option value="mr">Residential</option>
                   			<option value="ms">Industrial</option>
                   			
                 		</select>
             			</td>   
   						<td class="label">${uiLabelMap.applicationDate}</td>
   						<td>
						<#--<@htmlTemplate.renderDateTimeField name="dateOfBirth" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="fromDate_2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
						--><input name=""  type="date" maxlength="10" value="" placeholder="02/08/2017"></td>

   					</tr>
            
                    <tr>
	                         <td class="label">${uiLabelMap.assentialDocument}</td>
							<td>
		     				<input type="file" name="fileLoc"  onchange="javascript:validateFile(this,document.getElementById('fileLocFileName'),document.getElementById('fileLocFileType'));"/>
		    				<input type="button" onclick="javascript:resetVal(document.connectionApply.fileLoc);" value="Reset"/> 
		    				<input type="hidden" name="fileLocFileName" id="fileLocFileName" value=""/>
		    				<input type="hidden" name="fileLocFileType" id="fileLocFileType" value=""/>
		 					</td>
	                        <td class="label">${uiLabelMap.feeForConnection}</td>
	                        <td><input name="feeForConnection"  type="text" maxlength="7" value="500" placeholder="${uiLabelMap.feeForConnection}"></td>
                        	
                    </tr>
                   	<tr>
                   			<td class="label">${uiLabelMap.feeStatus}</td>
	                        <td><input name="feeStatus"  type="text" maxlength="15" value="paid" placeholder="${uiLabelMap.feeStatus}"></td>
	                   		<td class="label">${uiLabelMap.connectionNo}</td>
	                        <td>
	                        <input name="connectionId"  type="label" maxlength="10" value="" placeholder="${uiLabelMap.connectionNo}">
	                        </td>
                    </tr>		
				<td colspan="6">
					<center><div id="submit" align="center">
						<input type="button" name="update" value="${uiLabelMap.update}" onclick=""/>
					   <input type="button" name="Cancel" value="Cancel" onclick="javascript:validateConfirmBack();" >
					</div>
					</center>
				</td>
			</tr>
		</table>
		</div>
	</div>
	
	</form>
		

