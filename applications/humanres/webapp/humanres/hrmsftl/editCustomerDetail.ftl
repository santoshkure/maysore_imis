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
  				<div class="h3" align="center"><b>${uiLabelMap.updateCustomerDetail}</b></div> 
			</ul>
		</div>
        <table cellspacing="0" class="basic-table table-responsive">
             <tbody>
                  
                <tr>
	               <td colspan="4"><font color="blue">${uiLabelMap.personalDetail}</font></td>
	               <td colspan="2"><font color="blue"><u><i>${uiLabelMap.noteMandatoryAsterisk}</i></u></font color></td>
                </tr>
                
                <tr>
                    <td class="label">${uiLabelMap.customerId}</td>
                    <td colspan="2">10001</td>
                    
                    <td class="label">Approve Date</td>
                    <td colspan="2">02/08/2017</td>
                  </tr>
                  
                <tr>
                    <td class="label">${uiLabelMap.CommonTitle}</td>
                    <td>
                    	<select name="tital" style="width:90px;">
                   			<option value="">Select</option>
                   			<option value="mr">Mr.</option>
                   			<option value="ms">Ms.</option>
                   			<option value="miss">Miss</option>
                   			<option value="other">Other</option>
                 		</select>
             		</td>
                  </tr>
                  
                  <tr>
                      	<td class="label">${uiLabelMap.firstName}</td>
                        <td><input name="firstName"  type="text" maxlength="60" value="" placeholder="${uiLabelMap.enterFirstName}"></td>
                        <td class="label">${uiLabelMap.middleName}</td>
                        <td><input name="middleName"  type="text" maxlength="60" value="" placeholder="${uiLabelMap.enterMiddleName}"></td>
                        <td class="label">${uiLabelMap.lastName}</td>
                        <td><input name="lastName"  type="text" maxlength="60" value="" placeholder="${uiLabelMap.enterlastName}"></td>
                   </tr>
                   
                   <tr>
                        <td class="label">${uiLabelMap.dateOfBirth}</td>
                        <td><@htmlTemplate.renderDateTimeField name="dateOfBirth" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="fromDate_2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/></td>
                        
                        <td class="label">${uiLabelMap.gender}</td>
                        <td><input type="radio" name="gender" value="male"> Male <input type="radio" name="gender" value="female"> Female <input type="radio" name="gender" value="other"> Other</td>
   
   						<td class="label">${uiLabelMap.maritalStatus}</td>
   						<td>
   							<select name="maritalStatus" style="width:90px;">
                   				<option value="">Select</option>
                   				<option value="Select">Single</option>
                   				<option value="Married">Married</option>
                   			</select>
                   		</td>
   					</tr>
            
                    <tr>
                        <td class="label">${uiLabelMap.fatherName}</td>
                        <td><input name="fatherName"  type="text" maxlength="60" value="" placeholder="${uiLabelMap.enterFatherName}"></td>
                        
                        <td class="label">${uiLabelMap.motherName}</td>
                        <td><input name="motherName"  type="text" maxlength="60" value="" placeholder="${uiLabelMap.enterMotherName}"></td>
                        
                        <td class="label">${uiLabelMap.aadharCardNo}</td>
                        <td><input name="aadharCardNo"  type="text" maxlength="60" value="" placeholder="${uiLabelMap.EnterAadharCard}"></td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.cummunity}</td>
                        <td>
                        <input name="cummunity"  type="text" maxlength="25" value="" placeholder="${uiLabelMap.yourCummunity}">
                        </td>
                        <td class="label">${uiLabelMap.cast}</td>
                        <td>
                        <input name="cast"  type="text" maxlength="60" value="" placeholder="${uiLabelMap.yourCast}">
                        </td>
                        <td class="label">${uiLabelMap.nationality}</td>
                        <td>
                        <input name="nationality"  type="text" maxlength="60" value="" placeholder="${uiLabelMap.yourNationality}">
                        </td>
                    </tr>
                    
                    <tr><td colspan="6" align="left"><font color="blue">${uiLabelMap.currentAddress}</font></td></tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.Address}</td>
                        <td>
                        <input name="address" type="text" maxlength="60" value="" placeholder="${uiLabelMap.enterAddress}">
                        </td>
                        <td class="label">${uiLabelMap.houseNo}</td>
                        <td>
                        <input name="houseNo" type="text" maxlength="60" value="" placeholder="${uiLabelMap.enterHouseNo}">
                        </td>
                        <td class="label">${uiLabelMap.wardNo}</td>
                        <td>
                        <input name="wardNo"  type="text" maxlength="60" value="" placeholder="${uiLabelMap.yourWard}">
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.mohalla}</td>
                        <td>
                        <input name="mohalla" type="text" maxlength="60" value="" placeholder="${uiLabelMap.enterMohalla}">
                        </td>
                        <td class="label">${uiLabelMap.landMark}</td>
                        <td>
                        <input name="landMark" type="text" maxlength="60" value="" placeholder="${uiLabelMap.enterLandMark}">
                        </td>
                        <td class="label">${uiLabelMap.village}</td>
                        <td>
                        <input name="village"  type="text" maxlength="60" value="" placeholder="${uiLabelMap.yourVillage}">
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.CommonCity}</td>
                        <td>
                        <input name="city" type="text" maxlength="25" value="Mysore" readonly>
                        </td>
                        <td class="label">${uiLabelMap.CommonState}</td>
                        <td>
                        <input name="state" type="text" maxlength="25" value="Karnataka" readonly>
                        </td>
                        <td class="label">${uiLabelMap.CommonCountry}</td>
                        <td>
                        <input name="country" type="text" maxlength="25" value="India" readonly>
                        </td>
                    </tr>
                    
                        <tr>
                        <td class="label">${uiLabelMap.mobileNo}</td>
                        <td>
                        <input name="mobileNo" type="text" maxlength="25" value="" placeholder="${uiLabelMap.yourMobile}">
                        </td>
                        <td class="label">${uiLabelMap.resContactNo}</td>
                        <td>
                        <input name="resContactNo" id="ddd" type="text" maxlength="25" value="" >
                        </td>
                        <td class="label">${uiLabelMap.CommonEmail}</td>
                        <td>
                        <input name="eMail" type="text" maxlength="40" value="" placeholder="${uiLabelMap.yourEMail}">
                        </td>
                    </tr>
                   
                    <tr>
                    	<td colspan="6">
                    	<center>
                    	<input name="Update"   type="submit" value="${uiLabelMap.CommonSearch}"/>
                    	<input type="submit" name="cancel" value="${uiLabelMap.CommonCancel}"/> 
                     	</center>
                     	</td>
                    </tr>
                    
            </tbody>
        </table>
    </div>
</form>
