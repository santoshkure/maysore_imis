<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: searchRequestCompliant.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to Search Request Compliant Detail -->

<#setting locale="en">
<form method="post" name="searchRequestCompliant" action="" class="basic-form">
<div class="row">
    <div class="alert alert-info">
  		<ul>
  		<li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
  		<div class="h3" align="center"><b>${uiLabelMap.searchRequestCompliant}</b></div> 
		</ul>
	</div>
	<div class="screenlet-body">
        <table class="basic-table" cellspacing="0">
        	 <tr>
              	<td class="label">${uiLabelMap.complaintNo}</td>
             	<td><input type="text" name="compiantNo" value="" style="width:240px;" maxlength="50"></td>
             	<td class="label">${uiLabelMap.customerNo}</td>
             	<td><input type="text" name="customerNo" value="" style="width:240px;" maxlength="50"></td>
			 </tr>
			 <tr>
              	<td class="label">${uiLabelMap.compliantApplyDate}</td>
             	<td>
                      <@htmlTemplate.renderDateTimeField name="applyDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="applyDate" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                    </td>
             	<td class="label">${uiLabelMap.complaintType}</td>
                <td>
                	<select name="complaintType" style="width:90px;">
                   			<option value="">Select</option>
                   			<option value="meterCompliant">Meter</option>
                   			<option value="billCompliant">Bill</option>
                   			<option value="pipeDamage">Pipe Damage</option>
                   			<option value="other">Other</option>
                   	</select>
                </td>
                </tr>
        </table>
        <center><input type="submit" value="${uiLabelMap.CommonSearch}"></center>
    </div>
</div>
</form>

