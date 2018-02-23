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
                    
                     
                <#if registrationDetailList?exists>
              <#list registrationDetailList as registrationDetailList>
               
                <tr>
	               <td colspan="4"><font color="blue">${uiLabelMap.personalDetail}</font></td>
                </tr>
               
                <tr>
                    <td class="label">${uiLabelMap.CommonTitle}</td>
                    <td>
					<#if '${registrationDetailList.title?if_exists}' == "mr">
					Mr
					<#elseif '${registrationDetailList.title?if_exists}' == "ms">
					Mrs
					<#elseif '${registrationDetailList.title?if_exists}' == "miss">
					Miss
					<#else>
					Other
					</#if>
					 </td>
                    <td class="label">${uiLabelMap.firstName}</td>
                        <td>${registrationDetailList.firstName?if_exists}</td>
                  </tr>
                  
                  <tr>
                        <td class="label">${uiLabelMap.middleName}</td>
                       <td>${registrationDetailList.middleName?if_exists}</td>
                        <td class="label">${uiLabelMap.lastName}</td>
                        <td>${registrationDetailList.lastName?if_exists}</td>
                   </tr>
                   
                   <tr>
                        <td class="label">${uiLabelMap.dateOfBirth}</td>
                        <td>${registrationDetailList.dateOfBirth?if_exists}</td>
                        
                        <td class="label">${uiLabelMap.gender}</td>
                         <td><#if genderMasterList?has_content><#list genderMasterList as genderMasterList><#if '${genderMasterList.genderId?if_exists}' == '${registrationDetailList.genderId?if_exists}'>${genderMasterList.genderName?if_exists}</#if></#list></#if></td>
                        
   					</tr>
            
                    <tr>
                    <td class="label">${uiLabelMap.maritalStatus}</td>
   						 <td><#if maritalStatusMaster?has_content><#list maritalStatusMaster as maritalStatusMaster><#if '${maritalStatusMaster.maritalStatusId?if_exists}' == '${registrationDetailList.maritalStatusId?if_exists}'>${maritalStatusMaster.maritalStatus?if_exists}</#if></#list></#if></td>
                        <td class="label">${uiLabelMap.fatherName}</td>
                         <td>${registrationDetailList.fatherName?if_exists}</td>
                     </tr>
            
                    <tr>   
                        <td class="label">${uiLabelMap.motherName}</td>
                         <td>${registrationDetailList.motherName?if_exists}</td>
                        
                        <td class="label">${uiLabelMap.aadharCardNo}</td>
                         <td>${registrationDetailList.aadharCardNo?if_exists}</td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.cummunity}</td>
                        <td><#if communityList?has_content><#list communityList as communityList><#if '${communityList.communityId?if_exists}' == '${registrationDetailList.cummunityNameId?if_exists}'>${communityList.communityname?if_exists}</#if></#list></#if></td>
                        <td class="label">${uiLabelMap.caste}</td>
                        <td><#if casteMaster?has_content><#list casteMaster as casteMaster><#if '${casteMaster.casteId?if_exists}' == '${registrationDetailList.consumerCastId?if_exists}'>${casteMaster.castename?if_exists}</#if></#list></#if></td>
                    </tr>
                    
                    <tr>
                      <td class="label">${uiLabelMap.nationality}</td>
                        <td>${registrationDetailList.nationality?if_exists}</td>
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
                        <td>${registrationDetailList.address?if_exists}</td>
                        <td class="label">${uiLabelMap.houseNo}</td>
                       <td>${registrationDetailList.houseNo?if_exists}</td>
                    </tr>
                    
                    <tr>
                    <td class="label">${uiLabelMap.wardNo}</td>
                        <td>${registrationDetailList.wardNo?if_exists}</td>
                        <td class="label">${uiLabelMap.mohalla}</td>
                       <td>${registrationDetailList.mohalla?if_exists}</td>
                         </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.landMark}</td>
                        <td>${registrationDetailList.landMark?if_exists}</td>
                        <td class="label">${uiLabelMap.village}</td>
                        <td>${registrationDetailList.village?if_exists}</td>
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
                  	</#list>
                    </#if>
                    
                   <tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.connectionDetail}</font></td></tr>
                   
                  <#if viewConnectionList?exists>
                   <#list viewConnectionList as viewConnectionList>
                   <tr>
                        <td class="label">${uiLabelMap.connectionType}</td>
                        <td><#if connectionCategoryName?has_content><#list connectionCategoryName as CategoryList><#if '${CategoryList.ConnectionTypeId?if_exists}' == '${viewConnectionList.connectionCategory?if_exists}'> ${CategoryList.connectionType?if_exists}</#if></#list></#if></td>
                        <td class="label">${uiLabelMap.applicationType}</td>
                       <td><#if applicationTypeName?has_content><#list applicationTypeName as applicationTypeName><#if '${applicationTypeName.applicationTypeeId?if_exists}' == '${viewConnectionList.applicationType?if_exists}'> ${applicationTypeName.applicationType?if_exists}</#if></#list></#if></td>
                    </tr>
                    
                    <tr>
                    	<td class="label">${uiLabelMap.typeOfBuilding}</td>
                        <td><#if buildingTypeName?has_content><#list buildingTypeName as buildingTypeName><#if '${buildingTypeName.buildingId?if_exists}' == '${viewConnectionList.typeOfBuilding?if_exists}'> ${buildingTypeName.buildingType?if_exists}</#if></#list></#if></td>
                        <td class="label">${uiLabelMap.applicationDate}</td>
                        <td>${viewConnectionList.applicationDate?if_exists}</td>
                    </tr>
                    
                    <tr>
                    
                        <td class="label">${uiLabelMap.assentialDoccument}</td>
                        <td></td>
                        <td class="label">${uiLabelMap.feeForConnection}</td>
                        <td>${viewConnectionList.feeForConnection?if_exists}</td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.feeStatus}</td>
                        <td>${viewConnectionList.paymentStatus?if_exists}</td>
                    </tr>
                    
           			<tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.connectionActionDetail}</font></td></tr>
                    
						<tr>
							<td class="label">${uiLabelMap.dMANo}</td>  
							<td><input name="dmaNo"  type="text" maxlength="60" value="${viewConnectionList.dmaNo?if_exists}"></td>
							<td class="label"> ${uiLabelMap.connectionDate}</td>  
							<td><@htmlTemplate.renderDateTimeField name="connectionDate" event="" action="" className="" alert="" title="" value="${viewConnectionList.connectionDate?if_exists}" size="15" maxlength="30" id="connectionDate" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/></td>
						</tr>  
						
						<tr>
							<td class="label">${uiLabelMap.MeterNo}</td>  
							<td><input name="meterNo"  type="text" maxlength="60" value="${viewConnectionList.meterNo?if_exists}"></td>
							<td class="label">${uiLabelMap.refFileNo}</td>  
							<td><input name="refFileNo"  type="text" maxlength="60" value="${viewConnectionList.refFileNo?if_exists}"></td>
						</tr>  
						
						<tr>	
							<td class="label">${uiLabelMap.bookNo}</td>  
							<td><input name="bookNo"  type="text" maxlength="60" value="${viewConnectionList.bookNo?if_exists}"></td>
							<td class="label">${uiLabelMap.leafNo}</td>  
							<td><input name="leafNo"  type="text" maxlength="60" value="${viewConnectionList.leafNo?if_exists}"></td>
						</tr> 
						
						<tr>
							<td class="label">${uiLabelMap.pipeSize}</td>  
							<td><input name="pipeSize"  type="text" maxlength="60" value="${viewConnectionList.pipeSize?if_exists}"></td>
							<td class="label">${uiLabelMap.drinkingWater}</td>  
							<td><input name="drinkingWater"  type="text" maxlength="60" value="${viewConnectionList.drinkingWater?if_exists}"></td>
						</tr> 
						
						<tr>
							<td class="label">${uiLabelMap.constituency}</td>  
							<td><input name="constituency"  type="text" maxlength="60" value="${viewConnectionList.constituency?if_exists}"></td>
							<td class="label"> ${uiLabelMap.zone}</td>  
							<td><input name="zone"  type="text" maxlength="60" value="${viewConnectionList.zone?if_exists}"></td>
						</tr> 
						
						<tr>	
							<td class="label"> ${uiLabelMap.mccZone}</td>  
							<td><input name="mccZone"  type="text" maxlength="60" value="${viewConnectionList.mccZone?if_exists}"></td>
							<td class="label">${uiLabelMap.division}</td>  
							<td><input name="division"  type="text" maxlength="60" value="${viewConnectionList.division?if_exists}"></td>
						</tr> 
						
						<tr>
							<td class="label">${uiLabelMap.surveyNumber}</td>  
							<td><input name="surveyNumber"  type="text" maxlength="60" value="${viewConnectionList.surveyNumber?if_exists}"></td>
							<td class="label">${uiLabelMap.eeName}</td>  
							<td><input name="eeName"  type="text" maxlength="60" value="${viewConnectionList.eeName?if_exists}"></td>
						</tr> 
						
						<tr>
							<td class="label">${uiLabelMap.oldWard}</td>  
							<td><input name="oldWard"  type="text" maxlength="60" value="${viewConnectionList.oldWard?if_exists}"></td>
							<td class="label">${uiLabelMap.refConsumerNo}</td>  
							<td><input name="refConsumerNo"  type="text" maxlength="60" value="${viewConnectionList.refConsumerNo?if_exists}"></td>
						</tr> 
						
						<tr>	
							<#--  <td class="label">Remark</td>  
							<td><input name="remark"  type="text" maxlength="60" value=""></td>-->
							<td class="label">${uiLabelMap.mrName}</td>  
							<td><input name="mrName"  type="text" maxlength="60" value="${viewConnectionList.mrName?if_exists}"></td>
							<td class="label">${uiLabelMap.areaCoordinator}</td>  
							<td><input name="areaCoordinator"  type="text" maxlength="60" value="${viewConnectionList.areaCoordinator?if_exists}"></td>
						</tr> 
						
						<tr>
							<td class="label">${uiLabelMap.lattitude}</td>  
							<td><input name="lattitude"  type="text" maxlength="60" value="${viewConnectionList.lattitude?if_exists}"></td>
							<td class="label">${uiLabelMap.logitude}</td>  
							<td><input name="logitude"  type="text" maxlength="60" value="${viewConnectionList.logitude?if_exists}"></td>
						</tr> 
						
						<tr>
							<td class="label">${uiLabelMap.commonOfficerName}</td>
                    		<td>${viewConnectionList.actionOfficerName?if_exists}</td>
							<td class="label">${uiLabelMap.actionStatus}</td>  
							<td>${viewConnectionList.actionStatus?if_exists}</td>
						</tr>
						
                		<tr>
                    		<td class="label">${uiLabelMap.actionDate}</td>
                    		<td>${viewConnectionList.actionDate?if_exists}</td>
                  			<td class="label">${uiLabelMap.designation}</td>
                    		<td>Designation</td>
                    	</tr>
                  		
                  		<tr>	
                    		
                    		<td class="label">${uiLabelMap.Remark}</td>
                    		<td>${viewConnectionList.remark?if_exists}</td>
                  		</tr>
                  	<input type="hidden" name="sequenceId" value="${viewConnectionList.sequenceId?if_exists}">	
                  		<tr>
                    	<td colspan="4">
                    	<center>
                    	<input name="Update"   type="button" value="${uiLabelMap.CommonUpdate}" onClick="javascript:editConnectionDetailFunc(editConnectionDetail);"/>
                    	<input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/>  
                     	</center>
                     	</td>
                    </tr>
                    </#list>
                    </#if> 	
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
                        		form.action = "<@ofbizUrl>updateConnectionDetails?</@ofbizUrl>";
			            		form.submit();
		                		disSubmit('disBttn');    
		                	 } 
    		}
    
    </script>