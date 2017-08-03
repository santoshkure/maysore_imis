<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: searchKhataChangeRequest.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to Search Khata Change Request -->

<#setting locale="en">
<form method="post" name="searchKhataChangeRequest" action="" class="basic-form">
<div class="row">
    <div class="alert alert-info">
  		<ul>
  		<div class="h3" align="center"><b>${uiLabelMap.searchKhataChangeRequesrDetail}</b></div> 
		</ul>
	</div>
	<div class="screenlet-body">
        <table class="basic-table" cellspacing="0">
        	 <tr>
              	<td class="label">${uiLabelMap.khataChangeId}</td>
             	<td><input type="text" name="nameOfCustomer" value="" style="width:240px;" maxlength="50"></td>
             	<td class="label">${uiLabelMap.khataChangeNo}</td>
             	<td><input type="text" name="customerId" value="" style="width:240px;" maxlength="50"></td>
			 </tr>
			 <tr>
			 	<td class="label">${uiLabelMap.consumerId}</td></td>
             	<td><input type="text" name="nameOfCustomer" value="" style="width:240px;" maxlength="50"></td>
              	<td class="label">${uiLabelMap.applyDate}</td>
             	<td>
                      <@htmlTemplate.renderDateTimeField name="applyDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="applyDate" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                </td>
             </tr>
        </table>
        <center><input type="submit" value="${uiLabelMap.CommonSearch}"></center>
    </div>
</div>
</form>

