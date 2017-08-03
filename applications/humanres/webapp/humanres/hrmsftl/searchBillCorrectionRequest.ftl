<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: searchBillCorrectionRequest.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to Search Request Compliant Detail -->

<#setting locale="en">
<form method="post" name="searchBillCorrectionRequest" action="" class="basic-form">
<div class="row">
    <div class="alert alert-info">
  		<ul>
  		<div class="h3" align="center"><b>${uiLabelMap.searchBillCorrectionRequest}</b></div> 
		</ul>
	</div>
	<div class="screenlet-body">
        <table class="basic-table" cellspacing="0">
        	 <tr>
              	<td class="label">${uiLabelMap.billCorrectionId}</td>
             	<td><input type="text" name="billCorrectionId" value="" style="width:240px;" maxlength="50"></td>
             	<td class="label">${uiLabelMap.billCorrectionNo}</td>
             	<td><input type="text" name="billCorrectionNo" value="" style="width:240px;" maxlength="50"></td>
			 </tr>
			 <tr>
			 <td class="label">${uiLabelMap.customerId}</td>
             	<td><input type="text" name="consumerId" value="" style="width:240px;" maxlength="50"></td>
              	<td class="label">${uiLabelMap.applyDate}</td>
             	<td>
                      <@htmlTemplate.renderDateTimeField name="CorrectionApplyDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="applyDate" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                </td>
             </tr>
        </table>
        <center><input type="submit" value="${uiLabelMap.CommonSearch}"></center>
    </div>
</div>
</form>

