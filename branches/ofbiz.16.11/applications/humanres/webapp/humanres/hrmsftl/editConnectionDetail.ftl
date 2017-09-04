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
  				<li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
  				<div class="h3" align="center"><b>Edit Connection Detail</b></div> 
			</ul>
		</div>
        <table cellspacing="0" class="basic-table table-responsive">
             <tbody>
              
                <tr>
                    <td class="label">${uiLabelMap.connectionNo}</td>
                    <td colspan="1">CNMCC10001</td>
                    
                     <td class="label">${uiLabelMap.customerNo}</td>
                    <td colspan="1">10001</td>
                  </tr>
                  
                <tr>
	               <td colspan="4"><font color="blue">${uiLabelMap.personalDetail}</font></td>
                </tr>
               
                <tr>
                    <td class="label">${uiLabelMap.CommonTitle}</td>
                    <td>Mr.</td>
                    <td class="label">${uiLabelMap.firstName}</td>
                    <td> Ravi</td>
                  </tr>
                  
                  <tr>
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
                        
   					</tr>
            
                    <tr>
                    	<td class="label">${uiLabelMap.maritalStatus}</td>
   						<td>Single</td>
                        <td class="label">${uiLabelMap.fatherName}</td>
                        <td>RajKumar Rai</td>
                      
                    </tr>
            
                    <tr>  
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
                    </tr>
                    
                    <tr>
                    <td class="label">${uiLabelMap.nationality}</td>
                        <td>Indian</td>
                        <td class="label">${uiLabelMap.mobileNo}</td>
                        <td>8978789885</td>
                      
                     </tr>
                    
                    <tr>   
                        <td class="label">${uiLabelMap.resContactNo}</td>
                        <td>7878978789</td>
                        <td class="label">${uiLabelMap.CommonEmail}</td>
                        <td>example@gmail.com</td>
                    </tr>
                    
                    <tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.currentAddress}</font></td></tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.Address}</td>
                        <td> Sector 3, Lane No. 1 Sahu Colony Pune</td>
                        <td class="label">${uiLabelMap.houseNo}</td>
                        <td> 45/ 12</td>
                    </tr>
                    
                    <tr>
                    	<td class="label">${uiLabelMap.wardNo}</td>
                        <td> 15 </td>
                        <td class="label">${uiLabelMap.mohalla}</td>
                        <td> Aajad Ward</td>
                     </tr>
                    
                     <tr>   
                        
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
                    </tr>
                    
                     <tr>
                    	<td class="label">${uiLabelMap.CommonCountry}</td>
                        <td>India</td>
                   	</tr>
                   <tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.connectionDetail}</font></td></tr>
                   
                   <tr>
                        <td class="label">${uiLabelMap.connectionType}</td>
                        <td>Domestic</td>
                        <td class="label">${uiLabelMap.applicationType}</td>
                        <td>Permanent</td>
                    </tr>
                    
                    <tr>
                    	<td class="label">${uiLabelMap.typeOfBuilding}</td>
                        <td>Residential buildings etc.</td>
                        <td class="label">${uiLabelMap.applicationDate}</td>
                        <td>02/08/2017</td>
                    </tr>
                    
                    <tr>
                    
                        <td class="label">${uiLabelMap.assentialDoccument}</td>
                        <td>Example.Doc</td>
                        <td class="label">${uiLabelMap.feeForConnection}</td>
                        <td>500</td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.feeStatus}</td>
                        <td colspan="3">Paid</td>
                    </tr>
                    
           			<tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.connectionActionDetail}</font></td></tr>
                    
                    <tr>
		   					<td class="label">${uiLabelMap.connectionStatus}</td>
					       	<td colspan="3">Approved</td>
					       	
		   			</tr>
		   
						<tr>
							<td class="label">${uiLabelMap.dMANo}</td>  
							<td><input name="dmaNo"  type="text" maxlength="60" value=""></td>
							<td class="label"> ${uiLabelMap.connectionDate}</td>  
							<td><@htmlTemplate.renderDateTimeField name="connectionDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="connectionDate" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/></td>
						</tr>  
						
						<tr>
							<td class="label">${uiLabelMap.MeterNo}</td>  
							<td><input name="meterNo"  type="text" maxlength="60" value=""></td>
							<td class="label">${uiLabelMap.refFileNo}</td>  
							<td><input name="refFileNo"  type="text" maxlength="60" value=""></td>
						</tr>  
						
						<tr>	
							<td class="label">${uiLabelMap.bookNo}</td>  
							<td><input name="bookNo"  type="text" maxlength="60" value=""></td>
							<td class="label">${uiLabelMap.leafNo}</td>  
							<td><input name="leafNo"  type="text" maxlength="60" value=""></td>
						</tr> 
						
						<tr>
							<td class="label">${uiLabelMap.pipeSize}</td>  
							<td><input name="pipeSize"  type="text" maxlength="60" value=""></td>
							<td class="label">${uiLabelMap.drinkingWater}</td>  
							<td><input name="dmaNo"  type="text" maxlength="60" value=""></td>
						</tr> 
						
						<tr>
							<td class="label">${uiLabelMap.constituency}</td>  
							<td><input name="constituency"  type="text" maxlength="60" value=""></td>
							<td class="label"> ${uiLabelMap.zone}</td>  
							<td><input name="zone"  type="text" maxlength="60" value=""></td>
						</tr> 
						
						<tr>	
							<td class="label"> ${uiLabelMap.mccZone}</td>  
							<td><input name="mccZone"  type="text" maxlength="60" value=""></td>
							<td class="label">${uiLabelMap.division}</td>  
							<td><input name="division"  type="text" maxlength="60" value=""></td>
						</tr> 
						
						<tr>
							<td class="label">${uiLabelMap.surveyNumber}</td>  
							<td><input name="surveyNumber"  type="text" maxlength="60" value=""></td>
							<td class="label">${uiLabelMap.eeName}</td>  
							<td><input name="eeName"  type="text" maxlength="60" value=""></td>
						</tr> 
						
						<tr>
							<td class="label">${uiLabelMap.oldWard}</td>  
							<td><input name="oldWard"  type="text" maxlength="60" value=""></td>
							<td class="label">${uiLabelMap.refConsumerNo}</td>  
							<td><input name="refConsumerNo"  type="text" maxlength="60" value=""></td>
						</tr> 
						
						<tr>	
							<#--  <td class="label">Remark</td>  
							<td><input name="remark"  type="text" maxlength="60" value=""></td>-->
							<td class="label">${uiLabelMap.mrName}</td>  
							<td><input name="mrName"  type="text" maxlength="60" value=""></td>
							<td class="label">${uiLabelMap.areaCoordinator}</td>  
							<td><input name="areaCoordinator"  type="text" maxlength="60" value=""></td>
						</tr> 
						
						<tr>
							<td class="label">${uiLabelMap.lattitude}</td>  
							<td><input name="lattitude"  type="text" maxlength="60" value=""></td>
							<td class="label">${uiLabelMap.logitude}</td>  
							<td><input name="logitude"  type="text" maxlength="60" value=""></td>
						</tr> 
						
						<tr>
							<td class="label">${uiLabelMap.commonOfficerName}</td>
                    		<td><input name="actionOfficerName"  type="text" maxlength="40" value=""></td>
							<td class="label">${uiLabelMap.connectionStatus}</td>  
							<td><input name="connectionStatus"  type="text" maxlength="60" value=""></td>
						</tr>
						
                		<tr>
                    		<td class="label">${uiLabelMap.actionDate}</td>
                    		<td><@htmlTemplate.renderDateTimeField name="actionDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="actionDate" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/></td>
                  			<td class="label">${uiLabelMap.designation}</td>
                    		<td><input name="designation"  type="text" maxlength="40" value=""></td>
                    	</tr>
                  		
                  		<tr>	
                    		
                    		<td class="label">${uiLabelMap.Remark}</td>
                    		<td><textarea name="remark" maxlength ="500"></textarea></td>
                  		</tr>
                  		
                  		<tr>
                    	<td colspan="4">
                    	<center>
                    	<input name="Update"   type="button" value="${uiLabelMap.CommonUpdate}" onClick="javascript:editConnectionDetailFunc(editConnectionDetail);"/>
                    	<input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/>  
                     	</center>
                     	</td>
                    </tr>
                     	
         			</tbody>
       			</table>	
    	</div>
</form>

    <script>
			function editConnectionDetailFunc(editConnectionDetail)
   			{
		      var form=document['editConnectionDetail'];
		      
		      var sure = confirm("Are you sure, you want to Update the Form ?");
                              if( sure == true )
                             {
                        		form.action = "<@ofbizUrl>connectionDetails</@ofbizUrl>";
			            		form.submit();
		                		disSubmit('disBttn');    
		                	 } 
    		}
    
    </script>