<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->

<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Siddhi Rajput   23/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to create meter reading -->

<#setting locale="en">
   
    <form method="post" name="createmeterreading" action="" class="basic-form">
    <div class="row">
	    <div class="alert alert-info">
		    <ul>
		     <li class="back"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
		     <div class="h3" align="center"><b>${uiLabelMap.createMeterReading}</b></div> 
			</ul>
		</div>
		<div class="screenlet-body">
            <table cellspacing="0" class="basic-table table-responsive">
                <tbody>
                	<tr>
	                	  <tr><td colspan="4"><h3 align="right"><i><b><font color="red">${uiLabelMap.CommonMandatoryNote}</font></b></i></a></td></tr>
                	</tr>
                <tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.connectionDetail}</font></td></tr>
                    <tr>
                        <td class="label">${uiLabelMap.connectionId}</td>
                        <td><@htmlTemplate.lookupField value='' formName="createmeterreading" name="connectionid" id="connectionid" fieldFormName=""/></td>
                        <td class="label">${uiLabelMap.connectionNo}</td>
                        <td><input type="text" name="connectionno" value="" readonly /></td>
                    </tr>
                    <tr>
                        <td class="label">${uiLabelMap.connectionType}</td>
                        <td><input type="text" name="connectiontype" value="" readonly /></td>
                        <td class="label">${uiLabelMap.applicationType}</td>
                        <td><input type="text" name="applicationtype" value="" readonly /></td>
                    </tr>
                    <tr>
                        <td class="label">${uiLabelMap.applicationDate}</td>
                        <td><input type="text" name="applicationdate" value="" readonly /></td>
                       
                    </tr>
                     <tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.customerDetail}</font></td></tr>
                    <tr>
                        <td class="label">${uiLabelMap.customerNo}</td>
                         <td><@htmlTemplate.lookupField value='' formName="createmeterreading" name="customerno" id="customerno" fieldFormName=""/></td>
                   
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
                    <tr><td colspan="4" align="left"><font color="blue">${uiLabelMap.readingDetail}</font></td></tr>
                    <tr>
                        <td class="label">${uiLabelMap.previousReading}</td>
                        <td><input type="text" name="prevreading" value="" /></td>
                        <td class="label">${uiLabelMap.currentReading}</td>
                        <td><input type="text" name="currentreading" value=""/></td>
                    </tr>
                    <tr>
                        <td class="label">${uiLabelMap.totalpayableUnit}</td>
                        <td><input type="text" name="totalunit" value="" readonly/></td>
                        <td class="label">${uiLabelMap.previousBalance}</td>
                        <td><input type="text" name="prevbal" value=""readonly/></td>
                    </tr>
                     <tr>
                        <td class="label">${uiLabelMap.surcharges}</td>
                        <td><input type="text" name="surcharges" value="" readonly/></td>
                        <td class="label">${uiLabelMap.tariffTaxDetails}</td>
                        <td><select name="tarifftax" style="">
                        <option value="">Select</option></td>
                    </tr>
                     <tr>
                        <td class="label">${uiLabelMap.totalPayableAmount}</td>
                        <td><input type="text" name="totalpayamt" value="" readonly/></td>
                        <td class="label">${uiLabelMap.billgenerationDate}</td>
                        <td><input type="text" name="billgenerate" value=""readonly/></td>
                    </tr>
                    <tr>
                        <td class="label">${uiLabelMap.lastDateSubmission}</td>
                        <td><input type="text" name="lastdatesubmission" value="" readonly/></td>
                        <td class="label">${uiLabelMap.amountAftDueDate}</td>
                        <td><input type="text" name="amtaftduedate" value=""readonly/></td>
                    </tr>
                    <tr>
                        <td class="label">${uiLabelMap.readingDate}</td>
                        <td><@htmlTemplate.renderDateTimeField name="readingdate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="date3" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/></td>
                        <td class="label">${uiLabelMap.remark}</td>
                        <td><textarea name="remark" maxlength="500"></textarea></td>
                    </tr>
                      <tr>
                    	 <td colspan="4"><center>
                    	 <div id ="saveBtn">
                    	 <input name="save"   type="button" value="${uiLabelMap.CommonSave}" onClick="javascript:saveMeterReading();"/>
                    	 <input type="button" name="cancel" value="${uiLabelMap.CommonCancel}" onclick="javascript:validateConfirmBack();"/> 
                     	 </center>
                     	 </td>
                     </tr>
               </tbody>
          </table>
     </div>
     
  
 </form>

  <script type="text/javascript" language="javascript">

  function saveMeterReading()
   {
		   var form=document['createmeterreading'];
		      
		      var sure = confirm("Are you sure, you want to Save the Form ?");
                    if( sure == true )
                    {
                        form.action = "<@ofbizUrl>main</@ofbizUrl>";
			            form.submit();
		                disSubmit('disBttn');    
		            } 
    }
    </script>
  