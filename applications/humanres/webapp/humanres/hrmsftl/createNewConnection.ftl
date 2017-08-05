<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: createNewConnection.ftl----->
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		Date Created 		Date Modified   --->
<#---1.0			Shubham Malviya   01/08/2017		
<#-- #####################################################################################################-->
<#--This ftl is used to Register/Approve new connection by Department person -->

<#setting locale="en">

    <div class=""><span style="color: #2f87c6;font-size: 25px;padding: 5px 10px 5px 10px;">${uiLabelMap.registerNewConnection} </span></div>
    	<form method="post" name="connectionCreate" action="" class="basic-form">
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
                		<td colspan="2"><font color="blue"></font></td>
	                	<td colspan="2"><font color="blue"><u><i>${uiLabelMap.noteMandatoryAsterisk}</i></u></font color></td>
                	</tr>
                	<tr>
                	<td class='label'>${uiLabelMap.customerNo} *</td>
                    	<td colspan="3">
                      	<@htmlTemplate.lookupField value='' formName="connectionCreate" name="customerDeatil" id="customerDeatil" fieldFormName="customerDeatil"/>
                    	</td>
                    </tr>
                    <tr>
                        <td class="label">${uiLabelMap.CommonTitle}</td>
                        <td>
                        	<input name="firstName"  type="text" maxlength="60" value="" readonly>
                        </td>
                        <td class="label">${uiLabelMap.firstName}</td>
                        <td>
                        <input name="firstName"  type="text" maxlength="60" value="" readonly>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">${uiLabelMap.middleName}</td>
                        <td>
                        <input name="middleName"  type="text" maxlength="60" value="" readonly>
                        </td>
                        <td class="label">${uiLabelMap.lastName}</td>
                        <td>
                        <input name="lastName"  type="text" maxlength="60" value="" readonly>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">${uiLabelMap.dateOfBirth}</td>
                        <td>
                      	<@htmlTemplate.renderDateTimeField name="dateOfBirth" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="fromDate_2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                    	</td>
                        <td class="label">${uiLabelMap.gender}</td>
                        <td>
                        <input type="radio" name="gender" value="male"> Male <input type="radio" name="gender" value="female"> Female <input type="radio" name="gender" value="other"> Other  
   						</td>
                      </tr>
                        
                      <tr>
                      	<td class="label">${uiLabelMap.maritalStatus}</td>
   						<td>
   							<select name="maritalStatus" style="width:90px;">
                   				<option value="">Select</option>
                   				<option value="Select">Single</option>
                   				<option value="Married">Married</option>
                   			</select>
                   		</td>
                        <td class="label">${uiLabelMap.fatherName}</td>
                        <td>
                        <input name="fatherName"  type="text" maxlength="60" value="" readonly>
                        </td>
                        
                     <tr>   
                        <td class="label">${uiLabelMap.motherName}</td>
                        <td>
                        <input name="motherName"  type="text" maxlength="60" value="" readonly>
                        </td>
                        <td class="label">${uiLabelMap.aadharCardNo}</td>
                        <td>
                        <input name="aadharCardNo"  type="text" maxlength="60" value="" readonly>
                        </td>
                     </tr>
                     
                     <tr>
                        <td class="label">${uiLabelMap.cummunity}</td>
                        <td>
                        <input name="cummunity"  type="text" maxlength="25" value="" readonly>
                        </td>
                        <td class="label">${uiLabelMap.cast}</td>
                        <td>
                        <input name="cast"  type="text" maxlength="60" value="" readonly>
                        </td>
                     </tr>
                     
                     <tr>   
                        <td class="label">${uiLabelMap.nationality}</td>
                        <td>
                        <input name="nationality"  type="text" maxlength="60" value="" readonly>
                        </td>
                        <td class="label">${uiLabelMap.Address}</td>
                        <td>
                        <input name="address" type="text" maxlength="60" value="" readonly>
                        </td>
                     </tr>
                    
                     <tr>
                        <td class="label">${uiLabelMap.houseNo}</td>
                        <td>
                        <input name="houseNo" type="text" maxlength="60" value="" readonly>
                        </td>
                        <td class="label">${uiLabelMap.wardNo}</td>
                        <td>
                        <input name="wardNo"  type="text" maxlength="60" value="" readonly>
                        </td>
                     </tr>
                    
                     <tr>
                        <td class="label">${uiLabelMap.mohalla}</td>
                        <td>
                        <input name="mohalla" type="text" maxlength="60" value="" readonly>
                        </td>
                        <td class="label">${uiLabelMap.landMark}</td>
                        <td>
                        <input name="landMark" type="text" maxlength="60" value="" readonly>
                        </td>
                     </tr>
                    
                     <tr>
                     	<td class="label">${uiLabelMap.village}</td>
                        <td>
                        <input name="village"  type="text" maxlength="60" value="" readonly>
                        </td>
                        <td class="label">${uiLabelMap.CommonCity}</td>
                        <td>
                        <input name="city" type="text" maxlength="25" value="Mysore" readonly>
                        </td>
                    </tr>
                    
                    <tr>    
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
                        <input name="mobileNo" type="text" maxlength="25" value="" readonly>
                        </td>
                        <td class="label">${uiLabelMap.resContactNo}</td>
                        <td>
                        <input name="resContactNo" id="ddd" type="text" maxlength="25" value="" >
                        </td>
                     </tr>
                     
                     <tr>
                     <td class="label">${uiLabelMap.CommonEmail}</td>
                        <td>
                        <input name="eMail" type="text" maxlength="40" value="" readonly>
                        </td>
                     </tr>
                        
                    <tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.connectionDetail}</font></td></tr>
                    
                    <tr>
                        <td class="label">${uiLabelMap.connectionType}</td>
                        <td><select name="maritalStatus" style="width:90px;">
                   				<option value="">Select</option>
                   				<option value="Domestic">Domestic</option>
                   				<option value="Commercial">Commercial</option>
                    			<option value="Industrial">Industrial</option>
                    			<option value="Institutional">Institutional</option>
                   			</select>
                   		</td>
                        <td class="label">${uiLabelMap.applicationType}</td>
                        <td><select name="maritalStatus" style="width:90px;">
                   			<option value="">Select</option>
                   			<option value="Permanent">Permanent</option>
                   			<option value="Temporary">Temporary</option>
                   			</select>
                   		</td>
                   	 </tr>
                    
                    <tr>
                    	<td class="label">${uiLabelMap.typeOfBuilding}</td>
                        <td><select name="maritalStatus" style="width:90px;">
                   			<option value="">Select</option>
                   			<option value="residentialBuildings">Residential buildings etc.</option>
                   			</select>
                   		</td>
                        <td class="label">${uiLabelMap.applicationDate}</td>
                        <td>
                      <@htmlTemplate.renderDateTimeField name="applicationDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="applicationDate" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                    </td>
                    </tr>
                    
                    <tr>
                    <td class="label">${uiLabelMap.assentialDoccument}</td>
                        <td>
                        <input type="file" name="assentialDoccument" id="ddd" type="text" maxlength="25" value="" >
                        </td>
                        <td class="label">${uiLabelMap.feeForConnection}</td>
                        <td>
                        <input name="feeForConnection" type="text" maxlength="40" value="" readonly>
                        </td>
                    </tr>
                        
                    <tr>
                        <td class="label">${uiLabelMap.feeStatus}</td>
                        <td>
                      <input name="status" id="ddd" type="text" maxlength="25" value="" >
                      </td>
                     </tr>
                    <tr>
                    	<td colspan="4"><center>
                    	<input name="save"   type="button" value="${uiLabelMap.CommonSave}" onClick="javascript:saveConnectionDetail(connectionCreate);"/>
                    	<input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/> 
                     </center></td>
                    </tr>
                    
                </tbody>
             </table>
        </div>
        </div>
    </form>
    
    <script type="text/javascript" language="javascript">

function saveConnectionDetail(connectionCreate)
   {
		      var form=document['connectionCreate'];
		      
		      var sure = confirm("Are you sure, you want to Save the Form ?");
                              if( sure == true )
                             {
                        form.action = "<@ofbizUrl>main</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		                } 
    }
    
    </script>