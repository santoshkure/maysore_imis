<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: viewCustomerRegiApproveDetail.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to view Customer Regi Approve Detail -->

<#setting locale="en">
    
    <form method="post" name="viewCustomerRegiApproveDetail" action="" class="basic-form">
    <div class="row">
    	<div class="alert alert-info">
  			<ul>
  				<li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
  				<div class="h3" align="center"><b>${uiLabelMap.viewRegistrationDetail}</b></div> 
			</ul>
			<div class="basic-nav" style="margin-top: -37px;">
  						<ul>
    					<li>
							<a>
								<a href="javascript:commonPS('printId1');" title="${uiLabelMap.CommonPrint}"><align="right"><img src="/images/img/Print.ico" width="25px" height="25px" width="25px" height="25px"/></a>
							</a>
    					</li>
  						</ul>
 			 </div>  
		</div>
		<div id="printId1">
        <table cellspacing="0" class="basic-table table-responsive">
             <tbody>
              <#if viewActionConsumerList?exists>
              <#list viewActionConsumerList as viewActionConsumerList>
                <tr>
                    <td class="label">${uiLabelMap.customerNo}</td>
                    <td colspan="2">${viewActionConsumerList.customerId?if_exists}</td>
                    
                  </tr>
                  
                <tr>
	               <td colspan="4"><font color="blue">${uiLabelMap.personalDetail}</font></td>
                </tr>
               
                <tr>
                    <td class="label">${uiLabelMap.CommonTitle}</td>
                    <td>${viewActionConsumerList.title?if_exists}</td>
                    <td class="label">${uiLabelMap.firstName}</td>
                        <td>${viewActionConsumerList.firstName?if_exists}</td>
                  </tr>
                  
                  <tr>
                        <td class="label">${uiLabelMap.middleName}</td>
                        <td>${viewActionConsumerList.middleName?if_exists}</td>
                        <td class="label">${uiLabelMap.lastName}</td>
                        <td>${viewActionConsumerList.lastName?if_exists}</td>
                   </tr>
                   
                   <tr>
                        <td class="label">${uiLabelMap.dateOfBirth}</td>
                        <td>${viewActionConsumerList.dateOfBirth?if_exists}</td>
                        
                        <td class="label">${uiLabelMap.gender}</td>
                        <td>
                        <#if genderMasterList?exists>
                        <#list genderMasterList as genderMasterList>
                       	<#if '${genderMasterList.genderId?if_exists}' == '${viewActionConsumerList.genderId?if_exists}'>${genderMasterList.genderName?if_exists}
                        </#if>
                        </#list>
                        </#if>
                        </td>
   					</tr>
            
                    <tr>
                    
   						<td class="label">${uiLabelMap.maritalStatusOption}</td>
   						<td>
   						<#if maritalMasterList?exists>
                        <#list maritalMasterList as maritalMasterList>
                       	<#if '${maritalMasterList.maritalStatusId?if_exists}' == '${viewActionConsumerList.maritalStatusId?if_exists}'>${maritalMasterList.maritalStatus?if_exists}
                        </#if>
                        </#list>
                        </#if>
                        </td>
                        <td class="label">${uiLabelMap.fatherName}</td>
                        <td>${viewActionConsumerList.fatherName?if_exists}</td>
                      </tr>
            
                    <tr>  
                        <td class="label">${uiLabelMap.motherName}</td>
                        <td>${viewActionConsumerList.motherName?if_exists}</td>
                        
                        <td class="label">${uiLabelMap.aadharCardNo}</td>
                        <td>${viewActionConsumerList.aadharCardNo?if_exists}</td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.cummunity}</td>
                        <td>
                        <#if communityMasterList?exists>
                        <#list communityMasterList as communityMasterList>
                       	<#if '${communityMasterList.communityId?if_exists}' == '${viewActionConsumerList.cummunityNameId?if_exists}'>${communityMasterList.communityname?if_exists}
                        </#if>
                        </#list>
                        </#if>
                        </td>
                        <td class="label">${uiLabelMap.caste}</td>
                        <td>
                        <#if casteMasterList?exists>
                        <#list casteMasterList as casteMasterList>
                       	<#if '${casteMasterList.casteId?if_exists}' == '${viewActionConsumerList.consumerCastId?if_exists}'>${casteMasterList.castename?if_exists}
                        </#if>
                        </#list>
                        </#if>
                        </td>
                    </tr>
                    
                     <tr>
                      <td class="label">${uiLabelMap.nationality}</td>
                        <td>${viewActionConsumerList.nationality?if_exists}</td>
                        
                        <td class="label">${uiLabelMap.mobileNo}</td>
                        <td>${viewActionConsumerList.mobileNumber?if_exists}</td>
                        </tr>
                    
                     <tr>
                        <td class="label">${uiLabelMap.resContactNo}</td>
                       <td>${viewActionConsumerList.resContactNo?if_exists}</td>
                        <td class="label">${uiLabelMap.CommonEmail}</td>
                        <td>${viewActionConsumerList.eMail?if_exists}</td>
                    </tr>
                    
                    <tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.currentAddress}</font></td></tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.OrderAddress}</td>
                        <td>${viewActionConsumerList.address?if_exists}</td>
                        <td class="label">${uiLabelMap.houseNo}</td>
                        <td>${viewActionConsumerList.houseNo?if_exists}</td>
                    </tr>
                    
                    <tr>
                    <td class="label">${uiLabelMap.wardNo}</td>
                        <td>${viewActionConsumerList.wardNo?if_exists}</td>
                        <td class="label">${uiLabelMap.mohalla}</td>
                        <td>${viewActionConsumerList.mohalla?if_exists}</td>
                         </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.landMark}</td>
                        <td>${viewActionConsumerList.landMark?if_exists}</td>
                        <td class="label">${uiLabelMap.village}</td>
                        <td>${viewActionConsumerList.village?if_exists}</td>
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
                   <tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.actionDetail}</font></td></tr>
                    
                    <tr>
                         <td class="label">${uiLabelMap.actionDate}</td>
                    	 <td>${viewActionConsumerList.actionDate?if_exists}</td>
                         <td class="label">${uiLabelMap.actionByOfficer}</td>
                         <td>${viewActionConsumerList.actionDate?if_exists}</td>
                    </tr>
                    
                     <tr>
                     <td class="label">${uiLabelMap.designation}</td>
                         <td>${viewActionConsumerList.actionDate?if_exists}</td>
                     	 <td class="label">${uiLabelMap.AppRejremark}</td>
                     	 <td>${viewActionConsumerList.appRejRemark?if_exists}</td>
                     	  </tr>
                    
                     <tr>
                         <td class="label">${uiLabelMap.CommonStatus}</td>
                    	 <td>${viewActionConsumerList.actionStatus?if_exists}</td>
                     </tr>
                    </#list>
                    </#if>	 
            </tbody>
        </table>
    </div></div>
</form>