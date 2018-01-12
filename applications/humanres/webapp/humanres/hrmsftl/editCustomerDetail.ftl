<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: editCustomerDetail.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to Edit Customer Detail -->

<#setting locale="en">
    
    <form method="post" name="editCustomerDetail" action="" class="basic-form">
    <div class="row">
    	<div class="alert alert-info">
  			<ul>
  				<li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
  				<div class="h3" align="center"><b>${uiLabelMap.updateCustomerDetail}</b></div> 
			</ul>
		</div>
        <table cellspacing="0" class="basic-table table-responsive">
             <tbody>
                  
                <tr>
	                	<td colspan="3"><font color="blue">${uiLabelMap.personalDetail}</font></td>
	                	<td colspan="1"><center><font color="blue"><u><i>${uiLabelMap.noteMandatoryAsterisk}</i></u></font color></center></td>
                	</tr>
                
                <#if editConsumerDetail?exists>
                <#list editConsumerDetail as editConsumerDetail>
                
                <tr>
                    <td class="label">${uiLabelMap.customerId}</td>
                    <td colspan="3"><b>${editConsumerDetail.customerId?if_exists}</b></td>
                    
                  </tr>
                  
                <tr>
                    <td class="label">${uiLabelMap.CommonTitle} <font color="red">*</td>
                    <td>
                    	<select name="title" style="width:90px;">
                   			<option value="">Select</option>
                   			<#if "${editConsumerDetail.title?if_exists}" == "mr">
                   			<option value="mr" selected>Mr.</option>
                   			<option value="ms">Ms.</option>
                   			<option value="miss">Miss</option>
                   			<option value="other">Other</option>
                   			<#elseif "${editConsumerDetail.title?if_exists}" == "mrs">
                   			<option value="mr">Mr.</option>
                   			<option value="ms" selected>Ms.</option>
                   			<option value="miss">Miss</option>
                   			<option value="other">Other</option>
                   			<#elseif "${editConsumerDetail.title?if_exists}" == "miss">
                   			<option value="mr">Mr.</option>
                   			<option value="ms">Ms.</option>
                   			<option value="miss" selected>Miss</option>
                   			<option value="other">Other</option>
                   			<#else>
                   			<option value="mr">Mr.</option>
                   			<option value="ms">Ms.</option>
                   			<option value="miss">Miss</option>
                   			<option value="other" selected >Other</option>
                   			</#if>
                   			
                 		</select>
             		</td>
             		<td class="label">${uiLabelMap.firstName} <font color="red">*</td>
                    <td><input name="firstName"  type="text" maxlength="60" value="${editConsumerDetail.firstName?if_exists}" placeholder="${uiLabelMap.enterFirstName}" onchange="javascript:trimFunction(this)"></td>
                  </tr>
                  
                  <tr>
                        <td class="label">${uiLabelMap.middleName}</td>
                        <td><input name="middleName"  type="text" maxlength="60" value="${editConsumerDetail.middleName?if_exists}" placeholder="${uiLabelMap.enterMiddleName}" onchange="javascript:trimFunction(this)"></td>
                        <td class="label">${uiLabelMap.lastName} <font color="red">*</td>
                        <td><input name="lastName"  type="text" maxlength="60" value="${editConsumerDetail.lastName?if_exists}" placeholder="${uiLabelMap.enterlastName}" onchange="javascript:trimFunction(this)"></td>
                   </tr>
                   
                   <tr>
                        <td class="label">${uiLabelMap.dateOfBirth} <font color="red">*</td>
                        <td><@htmlTemplate.renderDateTimeField name="dateOfBirth" event="" action="" className="" alert="" title="Format: dd/mm/yyyy" value="${editConsumerDetail.dateOfBirth?if_exists}" size="15" maxlength="30" id="dateOfBirth" dateType="date" shortDateInput=true timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/></td></td>
                        
                        <td class="label">${uiLabelMap.gender} <font color="red">*</td>
                        <td>
   							<select name="gender" style="width:90px;">
                   				<option value="">${uiLabelMap.CommonSelect}</option>
                   				<#assign genderId  = "${editConsumerDetail.genderId?if_exists}">
                   				<#if genderMasterList?has_content>
                            		<#list genderMasterList as genderMasterList>
                             		<#if "${genderMasterList.genderId?if_exists}" == "${genderId?if_exists}">
                               			<option value="${genderMasterList.genderId?if_exists}" selected>${genderMasterList.genderName?if_exists}</option>
                            		<#else>
                                		<option value="${genderMasterList.genderId?if_exists}">${genderMasterList.genderName?if_exists}</option>
                              		</#if>
                            	</#list>
                            	</#if>
                   			</select>
                   		</td>
   					</tr>
            
                    <tr>
                    	<td class="label">${uiLabelMap.maritalStatusOption} <font color="red">*</td>
   						<td>
   							<select name="maritalStatus" style="width:90px;">
                   				<option value="">${uiLabelMap.CommonSelect}</option>
                   				<#assign maritalStatusId  = "${editConsumerDetail.maritalStatusId?if_exists}">
                   				<#if maritalMasterList?has_content>
                            		<#list maritalMasterList as maritalMasterList>
                             		<#if "${maritalMasterList.maritalStatusId?if_exists}" == "${maritalStatusId?if_exists}">
                               			<option value="${maritalMasterList.maritalStatusId?if_exists}" selected>${maritalMasterList.maritalStatus?if_exists}</option>
                            		<#else>
                                		<option value="${maritalMasterList.maritalStatusId?if_exists}">${maritalMasterList.maritalStatus?if_exists}</option>
                              		</#if>
                            	</#list>
                            	</#if>
                   			</select>
                   			</td>  
                   		
                        <td class="label">${uiLabelMap.fatherName} <font color="red">*</td>
                        <td><input name="fatherName"  type="text" maxlength="60" value="${editConsumerDetail.fatherName?if_exists}" placeholder="${uiLabelMap.enterFatherName}" onchange="javascript:trimFunction(this)"></td>
                     </tr>
            
                    <tr>   
                        <td class="label">${uiLabelMap.motherName} <font color="red">*</td>
                        <td><input name="motherName"  type="text" maxlength="60" value="${editConsumerDetail.motherName?if_exists}" placeholder="${uiLabelMap.enterMotherName}" onchange="javascript:trimFunction(this)"></td>
                        
                        <td class="label">${uiLabelMap.aadharCardNo} <font color="red">*</td>
                        <td><input name="aadharCardNo"  type="text" maxlength="60" value="${editConsumerDetail.aadharCardNo?if_exists}" placeholder="${uiLabelMap.EnterAadharCard}" onchange="javascript:allnumeric(this,'${uiLabelMap.aadharCardNo} ${uiLabelMap.shouldBeNumericMsg}')" onKeyUp="javascript:trimFunction(this)"></td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.cummunity} <font color="red">*</td>
                        <td>
   							<select name="cummunityName" style="width:90px;">
                   				<option value="">${uiLabelMap.CommonSelect}</option>
                   				<#assign communityId  = "${editConsumerDetail.cummunityNameId?if_exists}">
                   				<#if communityMasterList?has_content>
                            		<#list communityMasterList as communityMasterList>
                             		<#if "${communityMasterList.communityId?if_exists}" == "${communityId?if_exists}">
                               			<option value="${communityMasterList.communityId?if_exists}" selected>${communityMasterList.communityname?if_exists}</option>
                            		<#else>
                                		<option value="${communityMasterList.communityId?if_exists}">${communityMasterList.communityname?if_exists}</option>
                              		</#if>
                            	</#list>
                            	</#if>
                   			</select>
                   			</td> 
                        
                        <td class="label">${uiLabelMap.caste} <font color="red">*</td>
                        <td>
   							<select name="consumerCast" style="width:90px;">
                   				<option value="">${uiLabelMap.CommonSelect}</option>
                   				<#assign cast  = "${editConsumerDetail.consumerCastId?if_exists}">
                   				<#if casteMasterList?has_content>
                            		<#list casteMasterList as casteMasterList>
                             		<#if "${casteMasterList.casteId?if_exists}" == "${cast?if_exists}">
                               			<option value="${casteMasterList.casteId?if_exists}" selected>${casteMasterList.castename?if_exists}</option>
                            		<#else>
                                		<option value="${casteMasterList.casteId?if_exists}">${casteMasterList.castename?if_exists}</option>
                              		</#if>
                            	</#list>
                            	</#if>
                   			</select>
                   			</td> 
                    </tr>
                    
                    <tr>
                    <td class="label">${uiLabelMap.nationality} <font color="red">*</td>
                        <td>
                        <input name="nationality"  type="text" maxlength="60" value="${editConsumerDetail.nationality?if_exists}" placeholder="${uiLabelMap.yourNationality}" onchange="javascript:trimFunction(this)">
                        </td>
                        <td class="label">${uiLabelMap.mobileNo}(+91) <font color="red">*</td>
                        <td>
                        <input name="contactNo" type="text" maxlength="10" value="${editConsumerDetail.mobileNumber?if_exists}" placeholder="${uiLabelMap.yourMobile}" onchange="javascript:allnumeric(this,'${uiLabelMap.mobileNo} ${uiLabelMap.shouldBeNumericMsg}')" onKeyUp="javascript:trimFunction(this)"></td>
                        </td>
                     </tr>
                     
                      <tr>
                        <td class="label">${uiLabelMap.resContactNo} <font color="red">*</td>
                        <td>
                        <input name="resContactNo" id="ddd" type="text" maxlength="15" value="${editConsumerDetail.resContactNo?if_exists}" onchange="javascript:allnumeric(this,'${uiLabelMap.resContactNo} ${uiLabelMap.shouldBeNumericMsg}')" onKeyUp="javascript:trimFunction(this)"></td>
                        </td>
                        <td class="label">${uiLabelMap.CommonEmail} <font color="red">*</td>
                        <td>
                        <input name="eMail" type="text" maxlength="40" value="${editConsumerDetail.eMail?if_exists}" placeholder="${uiLabelMap.yourEMail}" onKeyUp="javascript:trimFunction(this)">
                        </td>
                    </tr>
                       
                    <tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.currentAddress}</font></td></tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.Address} <font color="red">*</td>
                        <td>
                        <textarea name="address" onchange="javascript:trimFunction(this)">${editConsumerDetail.address?if_exists}</textarea>
                        </td>
                        <td class="label">${uiLabelMap.houseNo}</td>
                        <td>
                        <input name="houseNo" type="text" maxlength="60" value="${editConsumerDetail.houseNo?if_exists}" placeholder="${uiLabelMap.enterHouseNo}" onchange="javascript:trimFunction(this)">
                        </td>
                    </tr>
                    
                    <tr>
                    	<td class="label">${uiLabelMap.wardNo} <font color="red">*</td>
                        <td>
                        <input name="wardNo"  type="text" maxlength="60" value="${editConsumerDetail.wardNo?if_exists}" placeholder="${uiLabelMap.yourWard}" onchange="javascript:trimFunction(this)">
                        </td>
                        <td class="label">${uiLabelMap.mohalla} <font color="red">*</td>
                        <td>
                        <input name="mohalla" type="text" maxlength="60" value="${editConsumerDetail.mohalla?if_exists}" placeholder="${uiLabelMap.enterMohalla}" onchange="javascript:trimFunction(this)">
                        </td>
                   
                   </tr>
                   
                   <tr>     
                        <td class="label">${uiLabelMap.landMark}</td>
                        <td>
                        <input name="landMark" type="text" maxlength="60" value="${editConsumerDetail.landMark?if_exists}" placeholder="${uiLabelMap.enterLandMark}" onchange="javascript:trimFunction(this)">
                        </td>
                        <td class="label">${uiLabelMap.village}</td>
                        <td>
                        <input name="village"  type="text" maxlength="60" value="${editConsumerDetail.village?if_exists}" placeholder="${uiLabelMap.yourVillage}" onchange="javascript:trimFunction(this)">
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.CommonCity}</td>
                         <td><b>Mysore</b></td>
                        <td class="label">${uiLabelMap.CommonState}</td>
                       <td><b>Karnataka</b></td>
                    </tr>
                    
                    <tr>
                    	<td class="label">${uiLabelMap.CommonCountry}</td>
                        <td><b>India</b></td>
                    </tr>
                        
                   <tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.actionDetail}</font></td></tr>
                    
                    <tr>
                         <td class="label">${uiLabelMap.actionDate}</td>
                    	 <td>${editConsumerDetail.actionDate?if_exists}</td>
                         <td class="label">${uiLabelMap.actionByOfficer}</td>
                         <td> Kailash Nath Trivedi </td>
                    </tr>
                    
                    <tr>
                    	
                    	 <td class="label">${uiLabelMap.designation}</td>
                         <td> EE </td>
                         
                         <td class="label">${uiLabelMap.CommonStatus}</td>
                    	 <td>${editConsumerDetail.actionStatus?if_exists}</td>
                     </tr>
                     <input name="seqId" type="hidden" value="${editConsumerDetail.sequenceId?if_exists}">
                     <input name="partyId" type="hidden" value="${editConsumerDetail.partyId?if_exists}">
                    </#list>
                    </#if>
                      
                    <tr>
                    	<td colspan="4">
                    	<center>
                    	<input name="Update"   type="button" value="${uiLabelMap.CommonUpdate}" onClick="javascript:editCustomerDetailFunction();"/>
                    	<input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/> 
                     	</center>
                     	</td>
                    </tr>
                    
            </tbody>
        </table>
    </div>
</form>

<script type="text/javascript" language="javascript">

function editCustomerDetailFunction()
   {
   
		      var form=document['editCustomerDetail'];
		      
		      var title = form.title.value;
		      var firstName =   form.firstName.value;
		      var lastName = form.lastName.value;
		      var dateOfBirth =   form.dateOfBirth.value;
		      var gender =   form.gender.value;
		      var maritalStatus =   form.maritalStatus.value;
		      var fatherName =   form.fatherName.value;
		      var motherName =   form.motherName.value;
		      var aadharCardNo =   form.aadharCardNo.value;
		      var cummunityName =   form.cummunityName.value;
		      var consumerCast =   form.consumerCast.value;
		      var nationality =   form.nationality.value;
		      var address =   form.address.value;
		      var wardNo =   form.wardNo.value;
		      var contactNo =   form.contactNo.value;
		      var eMail =   form.eMail.value;
		      var mohalla =   form.mohalla.value;
		      
		      if(notEmptyField(title,"${uiLabelMap.CommonSelect} ${uiLabelMap.CommonTitle}"))
     				{
     			if((notEmptyField(firstName,"${uiLabelMap.firstName} ${uiLabelMap.notEmpty}")) && (alphabhetValidation1(firstName,"${uiLabelMap.firstName} ${uiLabelMap.alphabetical}")))
     				{
     			if((notEmptyField(lastName,"${uiLabelMap.lastName} ${uiLabelMap.notEmpty}")) && (alphabhetValidation1(lastName,"${uiLabelMap.lastName} ${uiLabelMap.alphabetical}")))
     				{	
     			if(notEmptyField(dateOfBirth,"${uiLabelMap.dateOfBirth} ${uiLabelMap.notEmpty}"))
     				{	
     			if(notEmptyField(gender,"${uiLabelMap.CommonSelect} ${uiLabelMap.gender}"))
     				{
     			if(notEmptyField(maritalStatus,"${uiLabelMap.maritalStatusOption} ${uiLabelMap.notEmpty}"))
     				{	
     			if((notEmptyField(fatherName,"${uiLabelMap.fatherName} ${uiLabelMap.notEmpty}")) && (alphabhetValidation1(fatherName,"${uiLabelMap.fatherName} ${uiLabelMap.alphabetical}")))
     				{	
     			if((notEmptyField(motherName,"${uiLabelMap.motherName} ${uiLabelMap.notEmpty}")) && (alphabhetValidation1(motherName,"${uiLabelMap.motherName} ${uiLabelMap.alphabetical}")))
     				{
     			if(notEmptyField(aadharCardNo,"${uiLabelMap.aadharCardNo} ${uiLabelMap.notEmpty}"))
     				{
     			if(notEmptyField(cummunityName,"${uiLabelMap.cummunityName} ${uiLabelMap.notEmpty}"))
     				{
     			if((notEmptyField(nationality,"${uiLabelMap.nationality} ${uiLabelMap.notEmpty}")) && (alphabhetValidation1(nationality,"${uiLabelMap.nationality} ${uiLabelMap.alphabetical}")))
     				{	
     			if(notEmptyField(consumerCast,"${uiLabelMap.cast} ${uiLabelMap.notEmpty}"))
     				{
     			if(notEmptyField(address,"${uiLabelMap.address} ${uiLabelMap.notEmpty}"))
     				{
     			if(notEmptyField(wardNo,"${uiLabelMap.wardNo} ${uiLabelMap.notEmpty}"))
     				{
     			if(notEmptyField(mohalla,"${uiLabelMap.mohalla} ${uiLabelMap.notEmpty}"))
     				{	
     			if(notEmptyField(contactNo,"${uiLabelMap.mobileNo} ${uiLabelMap.notEmpty}"))
     				{
     			if(notEmptyField(eMail,"${uiLabelMap.CommonEmail} ${uiLabelMap.notEmpty}"))
     				{
     				
     						var sure = confirm("Are you sure, you want to Update the Form ?");
                              if( sure == true )
                             {
                        form.action = "<@ofbizUrl>editCostomerDetail</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn'); 
		                	}
		                		
		           	}
		           	}
		           	}
		           	}
		           	}
		           	}
		           	}
		           	}
		           	}
		           	}
		           	}
		           	}
		           	}
		           	}
		           	}
		           	}
		           	}
    		}
    
    </script>