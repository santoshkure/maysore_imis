<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: viewCustomerConnectionDetail.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to view Customer Regi Approve Detail -->

<#setting locale="en">
    
    <form method="post" name="viewCustomerConnectionDetail" action="" class="basic-form">
    <div class="row">
    	<div class="alert alert-info">
  			<ul>
  				<li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
  				<div class="h3" align="center"><b>${uiLabelMap.viewConnectionDetail}</b></div> 
			</ul>
		</div>
        <table cellspacing="0" class="basic-table table-responsive">
             <tbody>
             <#if registrationDetailList?exists>
             <#list registrationDetailList as registrationDetailList>
             
                <tr>
                    <td class="label">${uiLabelMap.customerId}</td>
                    <td colspan="5">${registrationDetailList.customerId?if_exists}</td>
                  </tr>
                  
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
                    	<td class="label">${uiLabelMap.mobileNo}</td>
                        <td>${registrationDetailList.mobileNumber?if_exists}</td>
                        <td class="label">${uiLabelMap.CommonEmail}</td>
                        <td>${registrationDetailList.eMail?if_exists}</td>
                     </tr>
                        
                     <tr>
                        <td class="label">${uiLabelMap.resContactNo}</td>
                        <td>${registrationDetailList.resContactNo?if_exists}</td>
                         <td class="label">${uiLabelMap.nationality}</td>
                        <td>Indian</td>
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
                    
                   <tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.registrationDetail}</font></td></tr>
                    
                    <tr>
                     	<td class="label">${uiLabelMap.registrationDate}</td>
                    	<td>${registrationDetailList.submittedDate?if_exists}</td>
                    	<td class="label">${uiLabelMap.approveDate}</td>
                    	<td>${registrationDetailList.actionDate?if_exists}</td>
                    </tr>
                    
                     <tr>
                    <td class="label">${uiLabelMap.actionByOfficer}</td>
                    <td>${registrationDetailList.actionByOfficerName?if_exists}</td>
                     </tr>
                  </#list>
                    </#if>	 
    
                   <tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.connectionDetail}</font></td></tr>
                   <#if viewConnectionDetail?exists>
              <#list viewConnectionDetail as viewConnectionDetail>
                   <tr>
                        <td class="label">${uiLabelMap.connectionType}</td>
                        <td><#if connectionCategoryName?has_content><#list connectionCategoryName as CategoryList><#if '${CategoryList.ConnectionTypeId?if_exists}' == '${viewConnectionDetail.connectionCategory?if_exists}'> ${CategoryList.connectionType?if_exists}</#if></#list></#if></td>
                        <td class="label">${uiLabelMap.applicationType}</td>
                       <td><#if applicationTypeName?has_content><#list applicationTypeName as applicationTypeName><#if '${applicationTypeName.applicationTypeeId?if_exists}' == '${viewConnectionDetail.applicationType?if_exists}'> ${applicationTypeName.applicationType?if_exists}</#if></#list></#if></td>
                    </tr>
                    
                    <tr>
                    <td class="label">${uiLabelMap.typeOfBuilding}</td>
                        <td><#if buildingTypeName?has_content><#list buildingTypeName as buildingTypeName><#if '${buildingTypeName.buildingId?if_exists}' == '${viewConnectionDetail.typeOfBuilding?if_exists}'> ${buildingTypeName.buildingType?if_exists}</#if></#list></#if></td>
                        <td class="label">${uiLabelMap.applicationDate}</td>
                        <td>${viewConnectionDetail.applicationDate?if_exists}</td>
                        
                        </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.assentialDoccument}</td>
                        <td>Example.Doc</td>
                        <td class="label">${uiLabelMap.feeForConnection}</td>
                        <td>500</td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.feeStatus}</td>
                        <td colspan="5">Paid</td>
                    </tr>
                    </#list>
                    </#if>	 
            </tbody>
        </table>
    </div>
</form>