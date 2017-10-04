<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: viewCustomerRegisDetail.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to Show Customer Regis. Detail -->

<#setting locale="en">
    
    <form method="post" name="viewCustomerRegisDetail" action="" class="basic-form">
    <div class="row">
    	<div class="alert alert-info">
  			<ul>
  				<li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
  				<div class="h3" align="center"><b>View Registration Detail</b></div> 
			</ul>
		</div>
        <table cellspacing="0" class="basic-table table-responsive">
             <tbody>
             <#if registrationDetailList?exists>
             <#list registrationDetailList as registrationDetailList>
                <tr>
	               <td colspan="4"><font color="blue">${uiLabelMap.personalDetail}</font></td>
                </tr>
                <tr>
                    <td class="label">${uiLabelMap.CommonTitle}</td>
                    <td>${registrationDetailList.title?if_exists}</td>
                  </tr>
                  
                  <tr>
                      	<td class="label">${uiLabelMap.firstName}</td>
                        <td>${registrationDetailList.firstName?if_exists}</td>
                        <td class="label">${uiLabelMap.middleName}</td>
                        <td>${registrationDetailList.middleName?if_exists}</td>
                   </tr>
                   
                   <tr>
                   		<td class="label">${uiLabelMap.lastName}</td>
                        <td>${registrationDetailList.lastName?if_exists}</td>
                        <td class="label">${uiLabelMap.dateOfBirth}</td>
                        <td>${registrationDetailList.dateOfBirth?if_exists}</td>
                   </tr>   
 
                   <tr>
                        <td class="label">${uiLabelMap.gender}</td>
                        <td>
                        <#if genderMasterList?exists>
                        <#list genderMasterList as genderMasterList>
                       	<#if '${genderMasterList.genderId?if_exists}' == '${registrationDetailList.genderId?if_exists}'>${genderMasterList.genderName?if_exists}
                        </#if>
                        </#list>
                        </#if>
                        </td>
                        
   						<td class="label">${uiLabelMap.maritalStatusOption}</td>
   						<td>
   						<#if maritalMasterList?exists>
                        <#list maritalMasterList as maritalMasterList>
                       	<#if '${maritalMasterList.maritalStatusId?if_exists}' == '${registrationDetailList.maritalStatusId?if_exists}'>${maritalMasterList.maritalStatus?if_exists}
                        </#if>
                        </#list>
                        </#if>
                        </td>
   					</tr>
            
                    <tr>
                        <td class="label">${uiLabelMap.fatherName}</td>
                        <td>${registrationDetailList.fatherName?if_exists}</td>
                        
                        <td class="label">${uiLabelMap.motherName}</td>
                        <td>${registrationDetailList.motherName?if_exists}</td>
                    </tr>
                    
                    <tr>
                    	<td class="label">${uiLabelMap.aadharCardNo}</td>
                        <td>${registrationDetailList.aadharCardNo?if_exists}</td>
                        <td class="label">${uiLabelMap.cummunity}</td>
                        <td>
                        <#if communityMasterList?exists>
                        <#list communityMasterList as communityMasterList>
                       	<#if '${communityMasterList.communityId?if_exists}' == '${registrationDetailList.cummunityNameId?if_exists}'>${communityMasterList.communityname?if_exists}
                        </#if>
                        </#list>
                        </#if>
                        </td>
                     </tr>   
                     
                     <tr>   
                        <td class="label">${uiLabelMap.caste}</td>
                        <td>
                        <#if casteMasterList?exists>
                        <#list casteMasterList as casteMasterList>
                       	<#if '${casteMasterList.casteId?if_exists}' == '${registrationDetailList.consumerCastId?if_exists}'>${casteMasterList.castename?if_exists}
                        </#if>
                        </#list>
                        </#if>
                        </td>
                        <td class="label">${uiLabelMap.nationality}</td>
                        <td>${registrationDetailList.nationality?if_exists}</td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.mobileNo}</td>
                        <td>${registrationDetailList.mobileNumber?if_exists}</td>
                        <td class="label">${uiLabelMap.resContactNo}</td>
                        <td>${registrationDetailList.resContactNo?if_exists}</td>
                      </tr>
                   
                   	  <tr>
                    	<td class="label">${uiLabelMap.CommonEmail}</td>
                        <td>${registrationDetailList.eMail?if_exists}</td>
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
                        
            </tbody>
        </table>
    </div>
</form>