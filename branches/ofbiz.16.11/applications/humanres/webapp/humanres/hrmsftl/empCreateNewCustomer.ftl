<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: empCreateNewCustomer.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to Register New Customer By Department Person .-->

<#setting locale="en">

<div class=""><span style="color: #2f87c6;font-size: 25px;padding: 5px 10px 5px 10px;">Register New Customer</span></div>
<form method="post" name="RegisterPerson" action="" class="basic-form">
    <div class="row">
	    <div class="alert alert-info">
		    <ul>
		    	<li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
		    	<div class="h3" align="center"><b>${uiLabelMap.registerationDetail}</b></div> 
			</ul>
		</div>
		<div class="screenlet-body">
            <table cellspacing="0" class="basic-table table-responsive">
                <tbody>
                	<tr>
	                	<td colspan="3"><font color="blue">${uiLabelMap.personalDetail}</font></td>
	                	<td colspan="1"><center><font color="blue"><u><i>${uiLabelMap.noteMandatoryAsterisk}</i></u></font color></center></td>
                	</tr>
                    <tr>
                        <td class="label">${uiLabelMap.CommonTitle}</td>
                        <td colspan="4">
	                        <select name="tital">
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
                        <td>
                        <input name="firstName"  type="text" maxlength="60" value="" placeholder="${uiLabelMap.enterFirstName}">
                        </td>
                        <td class="label">${uiLabelMap.middleName}</td>
                        <td>
                        <input name="middleName"  type="text" maxlength="60" value="" placeholder="${uiLabelMap.enterMiddleName}">
                        </td>
                    </tr>
                    <tr>
                    	<td class="label">${uiLabelMap.lastName}</td>
                        <td>
                        <input name="lastName"  type="text" maxlength="60" value="" placeholder="${uiLabelMap.enterlastName}">
                        </td>
                        <td class="label">${uiLabelMap.dateOfBirth}</td>
                        <td>
                      	<@htmlTemplate.renderDateTimeField name="dateOfBirth" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="fromDate_2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                    	</td>
				   </tr>
                   <tr>
                        <td class="label">${uiLabelMap.gender}</td>
                        <td>
                        <input type="radio" name="gender" value="male"> ${uiLabelMap.CommonMale} <input type="radio" name="gender" value="female"> ${uiLabelMap.CommonFemale} <input type="radio" name="gender" value="other"> Other  
				   		</td>
				   		<td class="label">${uiLabelMap.maritalStatusOption}</td>
				   		<td>
				   			<select name="maritalStatus" >
				                   <option value="">Select</option>
				                   <option value="single">${uiLabelMap.PartyMaritalStatusSingle}</option>
				                   <option value="married">${uiLabelMap.PartyMaritalStatusMarried}</option>
				        	</select>
				        </td>
				    <tr>
                         <td class="label">${uiLabelMap.fatherName}</td>
                       	 <td>
                         <input name="fatherName"  type="text" maxlength="60" value="" placeholder="${uiLabelMap.enterFatherName}">
                         </td>
                         <td class="label">${uiLabelMap.motherName}</td>
                         <td>
                         <input name="motherName"  type="text" maxlength="60" value="" placeholder="${uiLabelMap.enterMotherName}">
                         </td>
                     </tr>
                     
                     <tr>
                    
                         <td class="label">${uiLabelMap.cummunity}</td>
                         <td>
                         <input name="cummunity"  type="text" maxlength="25" value="" placeholder="${uiLabelMap.yourCummunity}">
                         </td>
                         
                         <td class="label">${uiLabelMap.aadharCardNo}</td>
                         <td>
                         <input name="aadharCardNo"  type="text" maxlength="60" value="" placeholder="${uiLabelMap.EnterAadharCard}">
                         </td>
                         
                       </tr>
                      
                       <tr>
                         <td class="label">${uiLabelMap.cast}</td>
                         <td>
                         <input name="cast"  type="text" maxlength="60" value="" placeholder="${uiLabelMap.yourCast}">
                         </td>
                     
                         <td class="label">${uiLabelMap.nationality}</td>
                         <td>
                         <input name="nationality"  type="text" maxlength="60" value="" placeholder="${uiLabelMap.yourNationality}">
                         </td>
                    </tr>  
                    
                    <tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.currentAddress}</font></td></tr>
                    
                    <tr>
                         <td class="label">${uiLabelMap.OrderAddress}</td>
                         <td>
                         <input name="address" type="text" maxlength="60" value="" placeholder="${uiLabelMap.enterAddress}">
                         </td>
                         <td class="label">${uiLabelMap.houseNo}</td>
                         <td>
                         <input name="houseNo" type="text" maxlength="60" value="" placeholder="${uiLabelMap.enterHouseNo}">
                         </td>
                     </tr>
                     
                     <tr>
                         <td class="label">${uiLabelMap.wardNo}</td>
                         <td>
                         <input name="wardNo"  type="text" maxlength="60" value="" placeholder="${uiLabelMap.yourWard}">
                         </td>
                         <td class="label">${uiLabelMap.mohalla}</td>
                         <td>
                         <input name="mohalla" type="text" maxlength="60" value="" placeholder="${uiLabelMap.enterMohalla}">
                         </td>
                      </tr>
                      
                      <tr>
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
                     </tr>
                        <tr>
                        <td class="label">${uiLabelMap.CommonCountry}</td>
                        <td>
                        <input name="country" type="text" maxlength="25" value="India" readonly>
                        </td>
                        <td class="label">${uiLabelMap.mobileNo}</td>
                        <td>
                        <input name="mobileNo" type="text" maxlength="25" value="" placeholder="${uiLabelMap.yourMobile}">
                        </td>
                      </tr>
                      
                      <tr>
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
                    	<td colspan="4">
                    		<center>
                    			<input name="save"   type="button" value="Save" onClick="javascript:saveRegistrationDetail(RegisterPerson);"/>
                    			<input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/> 
                      		</center>
                      	</td>
                       </tr>
                    
                </tbody>
             </table>
        </div>
        </div>
    </div>
    </form>

    <script type="text/javascript" language="javascript">

function saveRegistrationDetail(RegisterPerson)
   {
		      var form=document['RegisterPerson'];
		      var tital =   form.tital.value;
		      var firstName =   form.firstName.value;
		      var middleName =   form.middleName.value;
		      var dateOfBirth =   form.dateOfBirth.value;
		      var gender =   form.gender.value;
		      var maritalStatus =   form.maritalStatus.value;
		      var fatherName =   form.fatherName.value;
		      var motherName =   form.motherName.value;
		      var aadharCardNo =   form.aadharCardNo.value;
		      var cummunity =   form.cummunity.value;
		      var cast =   form.cast.value;
		      var nationality =   form.nationality.value;
		      var cast =   form.cast.value;
		      var address =   form.address.value;
		      var mobileNo =   form.mobileNo.value;
		      var eMail =   form.eMail.value;
		      
		      var sure = confirm("Are you sure, you want to Save the Form ?");
                              if( sure == true )
                             {
                        form.action = "<@ofbizUrl>main</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		                } 
    }
    
    </script>