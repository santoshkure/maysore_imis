<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: editConnectionApply.ftl----->
<#---Description: --->
<#---Version Number    1.0 --->
<#--- Author          	Date Created     -->
<#--- Anubha Saini    	    03 Aug 2017    -->

<#-- #####################################################################################################-->
<script language="javascript" src="/images/commonjs/commonValidation.js" type="text/javascript"></script>
<form method="post" name="editConnectionApply" class="basic-form">

<div class="row" >
    			<div class="alert alert-info">
				<ul>
    				<li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
    				<div class="h3" align="center"><b>${uiLabelMap.editConnection}</b></div>
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
                        <td><input name="consumerNo"  type="text" maxlength="10" value="CAN101" readonly></td>
                       
                 </tr>
                    
                     <tr>
                    <td class="label">${uiLabelMap.connectionCategory}</td>
                         <td>
                    	<select name="${uiLabelMap.connectionCategory}" >
                   			<option value="">Select</option>
                   			<option value="">Household</option>
                   			<option value="">Non-household</option>
                   			<option value="">Commercial</option>
                   			
                 		</select>
             		</td>
                        <td class="label">${uiLabelMap.applicationType}</td>
                         <td>
                    	<select name="applicationType" >
                   			<option value="">Select</option>
                   			<option value="">Permanent</option>
                   			<option value="">Temporary</option>
                   			
                 		</select>
             		</td>
             		<tr>
                   <td class="label">${uiLabelMap.typeOfBuilding}</td>
 						<td>
                    	<select name="typeOfBuilding" >
                   			<option value="">Select</option>
                   			<option value="">Residential</option>
                   			<option value="">Industrial</option>
                   			
                 		</select>
             			</td>   
   						<td class="label">${uiLabelMap.applicationDate}</td>
   						<td>
						<#--<@htmlTemplate.renderDateTimeField name="dateOfBirth" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="fromDate_2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
						--><input name=""  type="date" maxlength="10" readonly value="07/08/2017"></td>
   						
   					</tr>
   					 <tr>
	                         
	                        <td class="label">${uiLabelMap.feeForConnection}</td>
	                        <td><input name="feeForConnection"  type="text" maxlength="7" readonly value="500" ></td>
                        	<td class="label">${uiLabelMap.feeStatus}</td>
	                        <td><input name="feeStatus"  type="text" maxlength="15" readonly value="Unpaid"</td>
                    </tr>
                    <tr>
	                         
	                       <td class="label">${uiLabelMap.connectionNo}</td>
	                        <td>
	                        <input name="connectionNo"  type="text" maxlength="10" readonly value="CON101" >
	                        </td>
	                         
	                         <td class="label">${uiLabelMap.assentialDocument}</td>
							<td>
		     				<input type="file" name="fileLoc"  onchange="javascript:validateFile(this,document.getElementById('fileLocFileName'),document.getElementById('fileLocFileType'));"/>
		    				<input type="button" onclick="javascript:resetVal(document.connectionApply.fileLoc);" value="Reset"/> 
		    				<input type="hidden" name="fileLocFileName" id="fileLocFileName" value=""/>
		    				<input type="hidden" name="fileLocFileType" id="fileLocFileType" value=""/>
		 					</td>
                    </tr>
                    
                     <tr>
                    	<td colspan="4">
                    	<center>
                    	<input name="Update"   type="button" value="${uiLabelMap.CommonEdit}" onClick="javascript:editCollectionDetail(editConnectionApply);"/>
                    	<input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/> 
                     	</center>
                     	</td>
                    </tr>
        		</table>
 
	</div>
	
	</div>
	
	</form>
		
<script type="text/javascript" language="javascript">

function editCollectionDetail(editConnectionApply)
   {
		      var form=document['editConnectionApply'];
		      
		      var sure = confirm("Are you sure, you want to Edit the Form ?");
                              if( sure == true )
                             {
                        form.action = "<@ofbizUrl>searchConnectionApply</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		                } 
    }
    
    </script>