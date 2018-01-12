<#--Addition by Mechatronics Private Limited.It runs with Apache Ofbiz and distributed along with it or separately as needed-->
<#---Program Name: customerSearchLookup.ftl----->
		
<#--------------------------------------------Description: -------------------------------------------------> 
<#-- #####################################################################################################-->
<#---Version Number		Author 		 Date Created 		Date Modified   --->
<#---1.0			Shubham malviya   02/11/2017         
<#-- #####################################################################################################-->
<#--This ftl is used to show All Customer list on lookup -->

<#setting locale="en">
<form method="post" name="customerSearchLookup" action="searchLookValue" class="basic-form">
<div class="row">
    <div class="alert alert-info">
  		<ul>
  		<div class="h3" align="center"><b>${uiLabelMap.searchCustomer}</b></div> 
		</ul>
	</div>
	<div class="screenlet-body">
        <table class="basic-table" cellspacing="0">
        	 <tr>
              	<td class="label">${uiLabelMap.customerId}</td>
             	<td><input type="text" name="customerId" value="" style="width:240px;" maxlength="15"></td>
             	</tr>
             	<tr>
             	<td class="label">${uiLabelMap.customerName}</td>
             	<td><input type="text" name="nameOfCustomer" value="" style="width:240px;" maxlength="50"></td>
			 </tr>
        </table>
        <center><input type="submit" value="${uiLabelMap.CommonSearch}"></center>
    </div>
</div>
</form>

