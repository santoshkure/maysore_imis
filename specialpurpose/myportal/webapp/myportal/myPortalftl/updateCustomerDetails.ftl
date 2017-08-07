<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->

<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			    Siddhi  03/08/2017		
<#-- #####################################################################################################-->

<#setting locale="en">
    <script language="javascript" src="/images/jquery/plugins/validate/additional-methods.js"  type="text/javascript"></script>
<form name="updateCustomerdetails" class="basic-form" method="post" action="">
   		    <div class="col-md-12"> 
               <div class="alert alert-info">
                 <ul>
                    <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
	                <div align="center" style="font-size:12px"><b>${uiLabelMap.updatePersonalDetails}</b></div>
                 </ul>
            </div>
   	 <div class="screenlet-body">
 	  <table cellspacing="0" class="basic-table">
                <tbody>
                	<tr>
	                	<td colspan="4"><font color="blue">${uiLabelMap.PersonalDetail}</font></td>
	                	<td colspan="2"><font color="red"><u><i>${uiLabelMap.noteMandatoryAsterisk}</i></u></font color></td>
                	</tr>
                    <tr>
                        <td class="label">${uiLabelMap.CommonTitle}</td>
                        <td colspan="5">
	                        <select name="tital">
		                   		<option value="">Select</option>
		                  		<option value="mr" selected="true">Mr.</option>
		                   		<option value="ms">Ms.</option>
		                   		<option value="miss">Miss</option>
		                   		<option value="other">Other</option>
	                 		</select>
             			</td>
                   </tr>
                   <tr>
                        <td class="label">${uiLabelMap.firstName}</td>
                        <td>
                        <input name="firstName"  type="text" maxlength="60" value="ravi" placeholder="${uiLabelMap.enterFirstName}">
                        </td>
                        <td class="label">${uiLabelMap.middleName}</td>
                        <td>
                        <input name="middleName"  type="text" maxlength="60" value="kumar" placeholder="${uiLabelMap.enterMiddleName}">
                        </td>
                        <td class="label">${uiLabelMap.lastName}</td>
                        <td>
                        <input name="lastName"  type="text" maxlength="60" value="sharma" placeholder="${uiLabelMap.enterlastName}">
                        </td>
                    </tr>
                    <tr>
                        <td class="label">${uiLabelMap.dateOfBirth}</td>
                        <td>
                      <@htmlTemplate.renderDateTimeField name="dateOfBirth" event="" action="" className="" alert="" title="" value="24/03/1990" size="15" maxlength="30" id="fromDate_2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                    </td>
                        <td class="label">${uiLabelMap.gender}</td>
                         <td>
                         <input type="radio" name="gender" value="male" selected="true"> ${uiLabelMap.CommonMale} <input type="radio" name="gender" value="female"> ${uiLabelMap.CommonFemale} <input type="radio" name="gender" value="other"> Other  
				   </td>
				   <td class="label">${uiLabelMap.maritalStatus}</td>
				   <td><select name="maritalStatus" >
				                   <option value="">Select</option>
				                  <option value="single" selected="true">${uiLabelMap.PartyMaritalStatusSingle}</option>
				                   <option value="married">${uiLabelMap.PartyMaritalStatusMarried}</option>
				                   </select>
				                   </td>
				   </tr>
                        <tr>
                        <td class="label">${uiLabelMap.fatherName}</td>
                        <td>
                        <input name="fatherName"  type="text" maxlength="60" value="sisir" placeholder="${uiLabelMap.enterFatherName}">
                        </td>
                        <td class="label">${uiLabelMap.motherName}</td>
                        <td>
                        <input name="motherName"  type="text" maxlength="60" value="kumar" placeholder="${uiLabelMap.enterMotherName}">
                        </td>
                        <td class="label">${uiLabelMap.aadharCardNo}</td>
                        <td>
                        <input name="aadharCardNo"  type="text" maxlength="60" value="sharma" placeholder="${uiLabelMap.EnterAadharCard}">
                        </td>
                    </tr>
                    <tr>
                        <td class="label">${uiLabelMap.cummunity}</td>
                        <td>
                        <input name="cummunity"  type="text" maxlength="25" value="mysure" placeholder="${uiLabelMap.yourCummunity}">
                        </td>
                        <td class="label">${uiLabelMap.cast}</td>
                        <td>
                        <input name="cast"  type="text" maxlength="60" value="genaral" placeholder="${uiLabelMap.yourCast}">
                        </td>
                        <td class="label">${uiLabelMap.nationality}</td>
                        <td>
                        <input name="nationality"  type="text" maxlength="60" value="indian" placeholder="${uiLabelMap.yourNationality}">
                        </td>
                    </tr>
                    
                    <tr><td colspan="6" align="left"><font color="blue">${uiLabelMap.CurrentAddress}</font></td></tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.OrderAddress}</td>
                        <td>
                        <input name="address" type="text" maxlength="60" value="karan plaza" placeholder="${uiLabelMap.enterAddress}">
                        </td>
                        <td class="label">${uiLabelMap.houseNo}</td>
                        <td>
                        <input name="houseNo" type="text" maxlength="60" value="251" placeholder="${uiLabelMap.enterHouseNo}">
                        </td>
                        <td class="label">${uiLabelMap.wardNo}</td>
                        <td>
                        <input name="wardNo"  type="text" maxlength="60" value="12" placeholder="${uiLabelMap.yourWard}">
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.mohalla}</td>
                        <td>
                        <input name="mohalla" type="text" maxlength="60" value="" placeholder="${uiLabelMap.enterMohalla}">
                        </td>
                        <td class="label">${uiLabelMap.landMark}</td>
                        <td>
                        <input name="landMark" type="text" maxlength="60" value="RMD" placeholder="${uiLabelMap.enterLandMark}">
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
                        <input name="mobileNo" type="text" maxlength="25" value="89568978" placeholder="${uiLabelMap.yourMobile}">
                        </td>
                        <td class="label">${uiLabelMap.resContactNo}</td>
                        <td>
                        <input name="resContactNo" id="resContactNo" type="text" maxlength="25" value="">
                        </td>
                        <td class="label">${uiLabelMap.CommonEmail}</td>
                        <td>
                        <input name="eMail" type="text" maxlength="40" value="" placeholder="${uiLabelMap.yourEMail}">
                        </td>
                    </tr>
                    <tr>
                    	<td colspan="6"><center>
                    	<input name="save" type="button" value="${uiLabelMap.update}" onClick="javascript:updateRegistrationDetail();"/>
                    	<input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/> 
                     </center></td>
                    </tr>
                    
                </tbody>
             </table>
     </div>  
   	</div>	
   		  
</form>

 <script type="text/javascript" language="javascript">

  function updateRegistrationDetail()
   {
		   var form=document['updateCustomerdetails'];
		      
		      var sure = confirm("Are you sure, you want to Update the Form ?");
                              if( sure == true )
                             {
                        form.action = "<@ofbizUrl>main</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		                } 
    }
    </script>