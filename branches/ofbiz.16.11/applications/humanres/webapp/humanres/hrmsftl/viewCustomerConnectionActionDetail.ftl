<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: viewCustomerConnectionActionDetail.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to view Customer Regi Approve Detail -->

<#setting locale="en">
    
    <form method="post" name="viewCustomerConnectionActionDetail" action="" class="basic-form">
    <div class="row">
    	<div class="alert alert-info">
  			<ul>
  				<li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
  				<div class="h3" align="center"><b>${uiLabelMap.viewConnectionDetail}</b></div> 
			</ul>
			<div class="basic-nav" style="margin-top: -37px;">
  				<ul>
    				<li>
							<a title="Create Zone Master" href="<@ofbizUrl>connectionApply</@ofbizUrl>">
								<a href="javascript:commonPS('printId1');" title="${uiLabelMap.CommonPrint}"><align="right"><img src="/images/img/Print.ico" width="25px" height="25px" width="25px" height="25px"/></a>
							</a>
    				</li>
  				</ul>
 			 
  			</div>  
		</div>
		  <div id="printId1">
        <table cellspacing="0" class="basic-table table-responsive">
             <tbody>
              <#if registrationDetailList?exists>
              <#list registrationDetailList as registrationDetailList>
                <tr>
                    <td class="label">${uiLabelMap.customerId}</td>
                    <td colspan="3">${registrationDetailList.customerId?if_exists}</td>
                  </tr>
                  
                <tr>
	               <td colspan="4"><font color="blue">${uiLabelMap.personalDetail}</font></td>
                </tr>
               
                <tr>
                    <td class="label">${uiLabelMap.CommonTitle}</td>
                    <td>${registrationDetailList.title?if_exists}</td>
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
                         <td>${registrationDetailList.genderId?if_exists}</td>
                        
   					</tr>
            
                    <tr>
                    <td class="label">${uiLabelMap.maritalStatus}</td>
   						 <td>${registrationDetailList.maritalStatusId?if_exists}</td>
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
                        <td>${registrationDetailList.cummunityNameId?if_exists}</td>
                        <td class="label">${uiLabelMap.caste}</td>
                        <td>${registrationDetailList.consumerCastId?if_exists}</td>
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
                        <td>${viewConnectionList.connectionCategory?if_exists}</td>
                        <td class="label">${uiLabelMap.applicationType}</td>
                        <td>${viewConnectionList.applicationType?if_exists}</td>
                    </tr>
                    
                    <tr>
                    	<td class="label">${uiLabelMap.typeOfBuilding}</td>
                        <td>${viewConnectionList.typeOfBuilding?if_exists}</td>
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
                        <td class="label">${uiLabelMap.dmaNo}</td>
                        <td>${viewConnectionList.dmaNo?if_exists}</td>
                        <td class="label">${uiLabelMap.meterNo}</td>
                        <td>${viewConnectionList.meterNo?if_exists}</td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.refFileNo}</td>
                        <td>${viewConnectionList.refFileNo?if_exists}</td>
                        <td class="label">${uiLabelMap.bookNo}</td>
                        <td>${viewConnectionList.bookNo?if_exists}</td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.pipeSize}</td>
                        <td>${viewConnectionList.pipeSize?if_exists}</td>
                        <td class="label">${uiLabelMap.constituency}</td>
                        <td>${viewConnectionList.constituency?if_exists}</td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.zone}</td>
                        <td>${viewConnectionList.zone?if_exists}</td>
                        <td class="label">${uiLabelMap.surveyNumber}</td>
                        <td>${viewConnectionList.surveyNumber?if_exists}</td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.eeName}</td>
                        <td>${viewConnectionList.eeName?if_exists}</td>
                        <td class="label">${uiLabelMap.oldWard}</td>
                        <td>${viewConnectionList.oldWard?if_exists}</td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.mrName}</td>
                        <td>${viewConnectionList.mrName?if_exists}</td>
                        <td class="label">${uiLabelMap.areaCoordinator}</td>
                        <td>${viewConnectionList.areaCoordinator?if_exists}</td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.logitude}</td>
                        <td>${viewConnectionList.logitude?if_exists}</td>
                        <td class="label">${uiLabelMap.lattitude}</td>
                        <td>${viewConnectionList.lattitude?if_exists}</td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.connectionStatus}</td>
                        <td>${viewConnectionList.connectionStatus?if_exists}</td>
                        <td class="label">${uiLabelMap.refConsumerNo}</td>
                        <td>${viewConnectionList.refConsumerNo?if_exists}</td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.actionDate}</td>
                        <td>${viewConnectionList.actionDate?if_exists}</td>
                        <td class="label">${uiLabelMap.actionByOfficer}</td>
                        <td>${viewConnectionList.actionOfficerName?if_exists}</td>
                    </tr>
                    
                    <tr>
                    	<td class="label">${uiLabelMap.designation}</td>
                        <td>EE</td>
                        
                        <td class="label">${uiLabelMap.remark}</td>
                        <td>${viewConnectionList.remark?if_exists}</td>
                    </tr>
                    
                    </#list>
                    </#if>
            </tbody>
        </table>
    </div></div>
</form>