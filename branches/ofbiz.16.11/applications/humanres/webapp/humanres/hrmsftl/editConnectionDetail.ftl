<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: editConnectionDetail.ftl ----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to view Customer Regi Approve Detail -->

<#setting locale="en">
    
    <form method="post" name="editConnectionDetail" action="" class="basic-form">
    <div class="row">
    	<div class="alert alert-info">
  			<ul>
  				<div class="h3" align="center"><b>Edit Connection Detail</b></div> 
			</ul>
		</div>
        <table cellspacing="0" class="basic-table table-responsive">
             <tbody>
              
                <tr>
                    <td class="label">${uiLabelMap.ConnectionNo}</td>
                    <td colspan="2">CNMCC10001</td>
                    
                     <td class="label">${uiLabelMap.consumerId}</td>
                    <td colspan="2">10001</td>
                  </tr>
                  
                <tr>
	               <td colspan="6"><font color="blue">${uiLabelMap.personalDetail}</font></td>
                </tr>
               
                <tr>
                    <td class="label">${uiLabelMap.tital}</td>
                    <td>Mr.</td>
                  </tr>
                  
                  <tr>
                      	<td class="label">${uiLabelMap.firstName}</td>
                        <td> Ravi</td>
                        <td class="label">${uiLabelMap.middleName}</td>
                        <td>  Kumar</td>
                        <td class="label">${uiLabelMap.lastName}</td>
                        <td> Rai</td>
                   </tr>
                   
                   <tr>
                        <td class="label">${uiLabelMap.dateOfBirth}</td>
                        <td> 29/04/1994</td>
                        
                        <td class="label">${uiLabelMap.gender}</td>
                        <td> Male</td>
                        
   						<td class="label">${uiLabelMap.maritalStatus}</td>
   						<td>Single</td>
   					</tr>
            
                    <tr>
                        <td class="label">${uiLabelMap.fatherName}</td>
                        <td>RajKumar Rai</td>
                        
                        <td class="label">${uiLabelMap.motherName}</td>
                        <td>Ramkali Rai</td>
                        
                        <td class="label">${uiLabelMap.aadharCardNo}</td>
                        <td>1234 4567 7891 4567</td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.cummunity}</td>
                        <td> OBC </td>
                        <td class="label">${uiLabelMap.cast}</td>
                        <td> Kalar</td>
                        <td class="label">${uiLabelMap.nationality}</td>
                        <td>Indian</td>
                    </tr>
                    
                    <tr><td colspan="6" align="left"><font color="blue">${uiLabelMap.currentAddress}</font></td></tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.Address}</td>
                        <td> Sector 3, Lane No. 1 Sahu Colony Pune</td>
                        <td class="label">${uiLabelMap.houseNo}</td>
                        <td> 45/ 12</td>
                        <td class="label">${uiLabelMap.wardNo}</td>
                        <td> 15 </td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.mohalla}</td>
                        <td> Aajad Ward</td>
                        <td class="label">${uiLabelMap.landMark}</td>
                        <td>Ekshubhit Bungalow</td>
                        <td class="label">${uiLabelMap.village}</td>
                        <td>Bhainsdehi</td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.CommonCity}</td>
                        <td>Mysore</td>
                        <td class="label">${uiLabelMap.CommonState}</td>
                        <td>Karnataka</td>
                        <td class="label">${uiLabelMap.CommonCountry}</td>
                        <td>India</td>
                    </tr>
                    
                        <tr>
                        <td class="label">${uiLabelMap.mobileNo}</td>
                        <td>8978789885</td>
                        <td class="label">${uiLabelMap.resContactNo}</td>
                        <td>7878978789</td>
                        <td class="label">${uiLabelMap.CommonEmail}</td>
                        <td>example@gmail.com</td>
                    </tr>
                   
                   <tr><td colspan="6" align="left"><font color="blue">${uiLabelMap.connectionDetail}</font></td></tr>
                   
                   <tr>
                        <td class="label">${uiLabelMap.connectionType}</td>
                        <td>Domestic</td>
                        <td class="label">${uiLabelMap.applicationType}</td>
                        <td>Permanent</td>
                        <td class="label">${uiLabelMap.typeOfBuilding}</td>
                        <td>Residential buildings etc.</td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.applicationDate}</td>
                        <td>02/08/2017</td>
                        <td class="label">${uiLabelMap.assentialDoccument}</td>
                        <td>Example.Doc</td>
                        <td class="label">${uiLabelMap.feeForConnection}</td>
                        <td>500</td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.feeStatus}</td>
                        <td colspan="5">Paid</td>
                    </tr>
                    
           			<tr><td colspan="6" align="left"><font color="blue">${uiLabelMap.connectionActionDetail}</font></td></tr>
                    
                    <tr>
		   					<td class="label">Connection Status</td>
					       	<td colspan="5">Approved</td>
					       	
		   			</tr>
		   
						<tr>
							<td class="label">DMA No.</td>  
							<td><input name="dmaNo"  type="text" maxlength="60" value=""></td>
							<td class="label">Connection Date</td>  
							<td><@htmlTemplate.renderDateTimeField name="connectionDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="connectionDate" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/></td>
							<td class="label">Meter No.</td>  
							<td><input name="meterNo"  type="text" maxlength="60" value=""></td>
						</tr>  
						
						<tr>
							<td class="label">Ref file No.</td>  
							<td><input name="refFileNo"  type="text" maxlength="60" value=""></td>
							<td class="label">Book No.</td>  
							<td><input name="bookNo"  type="text" maxlength="60" value=""></td>
							<td class="label">Leaf No.</td>  
							<td><input name="leafNo"  type="text" maxlength="60" value=""></td>
						</tr> 
						
						<tr>
							<td class="label">Pipe Size</td>  
							<td><input name="pipeSize"  type="text" maxlength="60" value=""></td>
							<td class="label">Drinking Water</td>  
							<td><input name="dmaNo"  type="text" maxlength="60" value=""></td>
							<td class="label">Constituency</td>  
							<td><input name="constituency"  type="text" maxlength="60" value=""></td>
						</tr> 
						
						<tr>
							<td class="label">Zone</td>  
							<td><input name="zone"  type="text" maxlength="60" value=""></td>
							<td class="label">Mcc Zone</td>  
							<td><input name="mccZone"  type="text" maxlength="60" value=""></td>
							<td class="label">Division</td>  
							<td><input name="division"  type="text" maxlength="60" value=""></td>
						</tr> 
						
						<tr>
							<td class="label">Survey number</td>  
							<td><input name="surveyNumber"  type="text" maxlength="60" value=""></td>
							<td class="label">EE Name</td>  
							<td><input name="eeName"  type="text" maxlength="60" value=""></td>
							<td class="label">Old Ward</td>  
							<td><input name="oldWard"  type="text" maxlength="60" value=""></td>
						</tr> 
						
						<tr>
							<td class="label">Ref Consumer No.</td>  
							<td><input name="refConsumerNo"  type="text" maxlength="60" value=""></td>
							<td class="label">Remark</td>  
							<td><input name="remark"  type="text" maxlength="60" value=""></td>
							<td class="label">MR Name</td>  
							<td><input name="mrName"  type="text" maxlength="60" value=""></td>
						</tr> 
						
						<tr>
							<td class="label">Area Co-ordinator</td>  
							<td><input name="areaCoordinator"  type="text" maxlength="60" value=""></td>
							<td class="label">logitude</td>  
							<td><input name="logitude"  type="text" maxlength="60" value=""></td>
							<td class="label">lattitude</td>  
							<td><input name="lattitude"  type="text" maxlength="60" value=""></td>
						</tr> 
						
						<tr>
							<td class="label">Connection stauts</td>  
							<td><input name="connectionStatus"  type="text" maxlength="60" value=""></td>
						</tr>
						
                		<tr>
                    		<td class="label">${uiLabelMap.officerName}</td>
                    		<td><input name="actionOfficerName"  type="text" maxlength="40" value=""></td>
                    
                     		<td class="label">${uiLabelMap.designation}</td>
                    		<td><input name="designation"  type="text" maxlength="40" value=""></td>
                    		
                    		<td class="label">${uiLabelMap.actionDate}</td>
                    		<td><@htmlTemplate.renderDateTimeField name="actionDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="actionDate" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/></td>
                  		</tr>
                  		
                  		<tr>
                    		<td class="label">${uiLabelMap.Remark}</td>
                    		<td><textarea name="remark" maxlength ="500"></textarea></td>
                  		</tr>
                  		
                  		<tr>
                    	<td colspan="6">
                    	<center>
                    	<input name="update"   type="submit" value="Update"/>
                    	<input type="submit" name="cancel" value="${uiLabelMap.CommonCancel}"/> 
                     	</center>
                     	</tr>
                     	
         			</tbody>
       			</table>	
    	</div>
</form>