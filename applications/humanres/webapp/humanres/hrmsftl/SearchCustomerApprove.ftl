<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: SearchCustomerApprove.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   01/08/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to show Requested for connection Customer Search  -->

<#setting locale="en">
<form method="post" name="customerDeatil" action="" class="basic-form">
   <div class="row">
    <div class="alert alert-info">
  		<ul>
  			<li class="back" text-align="left"><a href = "javascript:history.go(-1);">${uiLabelMap.CommonBack}</a></li>
  			<div class="h3" align="center"><b>${uiLabelMap.searchCustomer}</b></div> 
		</ul>
	</div>
	<div class="screenlet-body">
        <table class="basic-table" cellspacing="0">
        	 <tr>
              	<td class="label">${uiLabelMap.registrationNo}</td>
             	<td><input type="text" name="registrationNo" value="" style="width:240px;" maxlength="50"></td>
             	<td class="label">${uiLabelMap.customerName}</td>
             	<td><input type="text" name="nameOfCustomer" value="" style="width:240px;" maxlength="50"></td>
			 </tr>
			 <tr>
              	<td class="label">${uiLabelMap.fromDate}</td>
             	<td><@htmlTemplate.renderDateTimeField name="fromDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="fromDate_2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                </td>
                    
             	<td class="label">${uiLabelMap.toDate}</td>
             	<td><@htmlTemplate.renderDateTimeField name="toDate" event="" action="" className="" alert="" title="" value="" size="15" maxlength="30" id="toDate_2" dateType="date" shortDateInput=false timeDropdownParamName="" defaultDateTimeString="" localizedIconTitle="" timeDropdown="" timeHourName="" classString="" hour1="" hour2="" timeMinutesName="" minutes="" isTwelveHour="" ampmName="" amSelected="" pmSelected="" compositeType="" formName=""/>
                </td>
			 </tr>
        </table>
        <center><input type="submit" value="${uiLabelMap.CommonSearch}"></center>
    </div>
   </div>
</form>