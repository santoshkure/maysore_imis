<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: empCreateNewCustomer.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to Register New Customer By Department Person .-->

<#setting locale="en">
    
    <div class=""><span style="color: #2f87c6;font-size: 25px;padding: 5px 10px 5px 10px;">${uiLabelMap.registerNewCustomer}</span></div>
    <form method="post" name="RegisterPerson" action="" class="basic-form">
    <div class="row">
    	<div class="alert alert-info">
  			<ul>
  				<li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
  				<div class="h3" align="center"><b>${uiLabelMap.registerationDetail}</b></div> 
			</ul>
		</div>
        <table cellspacing="0" class="basic-table table-responsive">
             <tbody>
                <tr>
	               <td colspan="3"><font color="blue">${uiLabelMap.personalDetail}</font></td>
	               <td colspan="1"><h4 align="right"><i><b><font color="blue">${uiLabelMap.noteMandatoryAsterisk}</font></b></i></a></td></tr>
                </tr>
                
                <tr>
                    <td class="label">${uiLabelMap.CommonTitle} <font color="red">*</td>
                    <td>
                    	<select name="title" style="width:90px;">
                   			<option value="">Select</option>
                   			<option value="mr">Mr.</option>
                   			<option value="ms">Ms.</option>
                   			<option value="miss">Miss</option>
                   			<option value="other">Other</option>
                 		</select>
             		</td>
             		<td class="label">${uiLabelMap.firstName} <font color="red">*</td>
                    <td><input name="firstName"  type="text" maxlength="60" value="" title="First Name should be alphabatic." placeholder="${uiLabelMap.enterFirstName}" onchange="javascript:trimFunction(this)">(${uiLabelMap.inEnglish})
                    <br> 
               		<input type="text" maxlength="60" name="firstNameInKn" id="firstNameInKn" value="" onkeydown="return processFnn(this, event);" placeholder="${uiLabelMap.enterFirstName}" onkeypress="return Geechi(this, event);" />(${uiLabelMap.inKannada})<br></td>
                  </tr>
                  
                  <tr>
                        <td class="label">${uiLabelMap.middleName}</td>
                        <td><input name="middleName"  type="text" maxlength="60" value="" placeholder="${uiLabelMap.enterMiddleName}" onchange="javascript:trimFunction(this)">(${uiLabelMap.inEnglish})
                    	<br> 
               			<input type="text" maxlength="60" name="middleNameInKn" id="middleNameInKn" value="" onkeydown="return processFnn(this, event);" placeholder="${uiLabelMap.enterMiddleName}" onkeypress="return Geechi(this, event);" />(${uiLabelMap.inKannada})<br></td>
                        
                        <td class="label">${uiLabelMap.lastName} <font color="red">*</td>
                        <td><input name="lastName"  type="text" maxlength="60" value="" placeholder="${uiLabelMap.enterlastName}" onchange="javascript:trimFunction(this)">(${uiLabelMap.inEnglish})
                    	<br> 
               			<input type="text" maxlength="60" name="lastNameInKn" id="lastNameInKn" value="" onkeydown="return processFnn(this, event);" placeholder="${uiLabelMap.enterlastName}" onkeypress="return Geechi(this, event);" />(${uiLabelMap.inKannada})<br></td>
                   </tr>
                   
                   <tr>
                        <td class="label">${uiLabelMap.dateOfBirth} <font color="red">*</td>
                        <td><@htmlTemplate.renderDateTimeField name="dateOfBirth" event="" action="" className="" alert="" title="Format: dd/mm/yyyy" value="" size="15" maxlength="30" id="dateOfBirth" dateType="date" shortDateInput=true timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/></td>
                        
                        <td class="label">${uiLabelMap.gender} <font color="red">*</td>
   						<td>
   							<select name="gender" style="width:90px;">
                   				<option value="">Select</option>
                   				<#if genderMasterList?has_content>
                            		<#list genderMasterList as genderMasterList>
                                		<option value="${genderMasterList.genderId?if_exists}">${genderMasterList.genderName?if_exists}</option>
                            		</#list>
                            	</#if>
                   			</select>
                   		</td>
   					</tr>
            
                    <tr>
                    
                    	<td class="label">${uiLabelMap.maritalStatusOption} <font color="red">*</td>
   						<td>
   							<select name="maritalStatus" style="width:90px;">
                   				<option value="">Select</option>
                   				<#if maritalMasterList?has_content>
                            		<#list maritalMasterList as maritalMasterList>
                                		<option value="${maritalMasterList.maritalStatusId?if_exists}">${maritalMasterList.maritalStatus?if_exists}</option>
                            		</#list>
                            	</#if>
                   			</select>
                   		</td>
                        <td class="label">${uiLabelMap.fatherName} <font color="red">*</td>
                        <td><input name="fatherName"  type="text" maxlength="60" value="" placeholder="${uiLabelMap.enterFatherName}" onchange="javascript:trimFunction(this)">(${uiLabelMap.inEnglish})
						<br> 
               			<input type="text" maxlength="60" name="fatherNameInKn" id="fatherNameKn" value="" onkeydown="return processFnn(this, event);" placeholder="${uiLabelMap.enterFatherName}" onkeypress="return Geechi(this, event);" />(${uiLabelMap.inKannada})<br>
                     
                    </tr>
            
                    <tr>   
                        <td class="label">${uiLabelMap.motherName} <font color="red">*</td>
                        <td><input name="motherName"  type="text" maxlength="60" value="" placeholder="${uiLabelMap.enterMotherName}" onchange="javascript:trimFunction(this)">(${uiLabelMap.inEnglish})
                        <br> 
               			<input type="text" maxlength="60" name="motherNameInKn" id="motherNameKn" value="" onkeydown="return processFnn(this, event);" placeholder="${uiLabelMap.enterMotherName}" onkeypress="return Geechi(this, event);" />(${uiLabelMap.inKannada})<br>
                     
                        <td class="label">${uiLabelMap.aadharCardNo} <font color="red">*</td>
                        <td><input name="aadharCardNo"  type="text" maxlength="16" value="" placeholder="${uiLabelMap.EnterAadharCard}" onchange="javascript:allnumeric(this,'${uiLabelMap.aadharCardNo} ${uiLabelMap.shouldBeNumericMsg}')" onKeyUp="javascript:trimFunction(this)"></td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.cummunity} <font color="red">*</td>
                        <td>
                        <select name="cummunityName" style="width:90px;">
                   				<option value="">Select</option>
                   				<#if communityMasterList?has_content>
                            		<#list communityMasterList as communityMasterList>
                                		<option value="${communityMasterList.communityId?if_exists}">${communityMasterList.communityname?if_exists}</option>
                            		</#list>
                            	</#if>
                   			</select>
                        </td>
                        <td class="label">${uiLabelMap.caste} <font color="red">*</td>
                        <td>
                        	<select name="consumerCast" style="width:90px;">
                   				<option value="">Select</option>
                   				<#if casteMasterList?has_content>
                            		<#list casteMasterList as casteMasterList>
                                		<option value="${casteMasterList.casteId?if_exists}">${casteMasterList.castename?if_exists}</option>
                            		</#list>
                            	</#if>
                   			</select>
                        </td>
                        
                      </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.nationality} <font color="red">*</td>
                        <td>
                        <input name="nationality"  type="text" maxlength="60" value="" placeholder="${uiLabelMap.yourNationality}" onchange="javascript:trimFunction(this)">
                        </td>
                        
                        <td class="label">${uiLabelMap.mobileNo} (+91) <font color="red">*</td>
                        <td>
                        <input name="contactNo" type="text" maxlength="10" value="" placeholder="${uiLabelMap.yourMobile}" onchange="javascript:allnumeric(this,'${uiLabelMap.mobileNo} ${uiLabelMap.shouldBeNumericMsg}')" onKeyUp="javascript:trimFunction(this)"></td>
                        </td>
                    </tr>
                    
                    <tr>    
                        <td class="label">${uiLabelMap.resContactNo}</td>
                        <td>
                        <input name="resContactNo" type="text" maxlength="25" value="" >
                        </td>
                        <td class="label">${uiLabelMap.CommonEmail} <font color="red">*</td>
                        <td>
                        <input name="eMail" type="email" maxlength="40" value="" placeholder="${uiLabelMap.yourEMail}">
                        </td>
                    </tr>
                   
                    <tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.currentAddress}</font></td></tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.OrderAddress} <font color="red">*</td>
                        <td>
                        <textarea name="address" type="text" maxlength="150" value="" placeholder="${uiLabelMap.enterAddress}" onchange="javascript:trimFunction(this)"></textarea><br>
                        <textarea name="addressInKn" type="text" maxlength="150" value="" placeholder="${uiLabelMap.enterAddress} In Kannada" onchange="javascript:trimFunction(this)" onkeydown="return processFnn(this, event);" onkeypress="return Geechi(this, event);"></textarea><br>
                        </td>
                        <td class="label">${uiLabelMap.houseNo}</td>
                        <td>
                        <input name="houseNo" type="text" maxlength="60" value="" placeholder="${uiLabelMap.enterHouseNo}" onchange="javascript:trimFunction(this)">
                        </td>
                    </tr>
                    
                    <tr>
                    	<td class="label">${uiLabelMap.wardNo} <font color="red">*</td>
                        <td>
                        <input name="wardNo"  type="text" maxlength="60" value="" placeholder="${uiLabelMap.yourWard}" onchange="javascript:trimFunction(this)">
                        </td>
                        <td class="label">${uiLabelMap.mohalla} <font color="red">*</td>
                        <td>
                        <input name="mohalla" type="text" maxlength="60" value="" placeholder="${uiLabelMap.enterMohalla}" onchange="javascript:trimFunction(this)">(${uiLabelMap.inEnglish})
						<br> 
               			<input type="text" maxlength="60" name="mohallaInKn" id="mohallaInKn" value="" onkeydown="return processFnn(this, event);" placeholder="${uiLabelMap.enterMohalla}" onkeypress="return Geechi(this, event);" />(${uiLabelMap.inKannada})<br>
                        </td>
                   </tr>
                    
                    <tr>     
                        <td class="label">${uiLabelMap.landMark}</td>
                        <td>
                        <input name="landMark" type="text" maxlength="60" value="" placeholder="${uiLabelMap.enterLandMark}" onchange="javascript:trimFunction(this)">
                        </td>
                        <td class="label">${uiLabelMap.village}</td>
                        <td>
                        <input name="village"  type="text" maxlength="60" value="" placeholder="${uiLabelMap.yourVillage}" onchange="javascript:trimFunction(this)">
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
                    
                    <tr>
                    	<td colspan="4">
                    	<center>
                    	<input name="save"   type="button" value="${uiLabelMap.CommonSave}" onClick="javascript:saveRegistrationDetail();"/>
                    	<input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();" >
                     	</center>
                     	</td>
                    </tr>
                    
            </tbody>
        </table>
    </div>
    <input name="registerdBy"  type="hidden" value="${person.firstName} ${person.lastName}">
</form>

<script type="text/javascript" language="javascript">

	function saveRegistrationDetail()
   			{
		      var form = document['RegisterPerson'];
		      
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
     				
     						var sure = confirm("${uiLabelMap.saveConfirmMsg} ?");
                              if( sure == true )
                             	{
                        			form.action = "<@ofbizUrl>empCreateConsRegistration</@ofbizUrl>";
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